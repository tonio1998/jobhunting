<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Chats;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Events\MessageSent;

class ChatController extends Controller
{
    public function listConversations()
    {
        $userId = Auth::id();

        $latestMessages = Chats::where(function ($query) use ($userId) {
            $query->where('sender_id', $userId)
                ->orWhere('receiver_id', $userId);
        })
            ->orderBy('created_at', 'desc')
            ->get()
            ->unique(function ($item) {
                $pair = [$item->sender_id, $item->receiver_id];
                sort($pair);
                return implode('-', $pair); // Unique conversation pair
            })
            ->values();

        $formattedConversations = $latestMessages->map(function ($chat) use ($userId) {
            $otherUserId = $chat->sender_id == $userId ? $chat->receiver_id : $chat->sender_id;

            $otherUser = User::find($otherUserId);
            if (!$otherUser) return null;

            $unreadCount = Chats::where('sender_id', $otherUserId)
                ->where('receiver_id', $userId)
                ->where('is_read', false)
                ->count();

            return [
                'chat_id' => $chat->id,
                'last_message' => $chat->message,
                'timestamp' => $chat->created_at,
                'unread_count' => $unreadCount,
                'other_user' => [
                    'id' => $otherUser->id,
                    'name' => $otherUser->name,
                    'avatar' => $otherUser->avatar ?? null,
                ],
            ];
        })->filter()->values();

        return response()->json($formattedConversations);
    }


    public function listMessages($userId)
    {
        $authId = Auth::id();

        $messages = Chats::where(function ($q) use ($authId, $userId) {
            $q->where('sender_id', $authId)->where('receiver_id', $userId);
        })
            ->orWhere(function ($q) use ($authId, $userId) {
                $q->where('sender_id', $userId)->where('receiver_id', $authId);
            })
            ->orderBy('created_at', 'asc')
            ->get();

        return response()->json($messages);
    }

    public function sendMessage(Request $request)
    {
        $validateData = $request->validate([
            'receiver_id' => 'required|integer|exists:users,id',
            'message' => 'nullable|string',
            'attachment_url' => 'nullable|url',
            'attachment_type' => 'nullable|in:image,file,video,audio',
        ]);

        $message = Chats::create([
            'sender_id' => Auth::id(),
            'receiver_id' => $validateData['receiver_id'],
            'message' => $validateData['message'] ?? '',
            'attachment_url' => $validateData['attachment_url'] ?? null,
            'attachment_type' => $validateData['attachment_type'] ?? null,
        ]);

//        event(new MessageSent($message));

        broadcast(new MessageSent($message));

        return response()->json(['message' => 'Message sent.', 'data' => $message], 201);
    }

    public function updateMessage(Request $request, $id)
    {
        $message = Chats::where('id', $id)
            ->where('sender_id', Auth::id())
            ->firstOrFail();

        $request->validate([
            'message' => 'required|string'
        ]);

        $message->message = $request->message;
        $message->save();

        return response()->json(['message' => 'Message updated.', 'data' => $message]);
    }

    public function deleteMessage($id)
    {
        $message = Chats::where('id', $id)
            ->where('sender_id', Auth::id())
            ->firstOrFail();

        $message->delete();

        return response()->json(['message' => 'Message deleted.']);
    }

    // ✅ Mark as read
    public function markAsRead($id)
    {
        $message = Chats::where('id', $id)
            ->where('receiver_id', Auth::id())
            ->firstOrFail();

        $message->is_read = 1;
        $message->save();

        return response()->json(['message' => 'Marked as read.']);
    }
}
