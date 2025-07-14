<?php

namespace App\Services;

use Google_Client;
use Illuminate\Support\Facades\Http;

class FCMServiceV1
{
    protected string $projectId;
    protected string $credentialsPath;

    public function __construct()
    {
        $this->projectId = env('FIREBASE_PROJECT_ID');
        $this->credentialsPath = storage_path('app/firebase/worklinker-6de71-firebase-adminsdk-fbsvc-286cc08a0c.json');
    }

    protected function getAccessToken(): string
    {
        $client = new Google_Client();
        $client->setAuthConfig($this->credentialsPath);
        $client->addScope('https://www.googleapis.com/auth/firebase.messaging');
        $client->useApplicationDefaultCredentials();

        return $client->fetchAccessTokenWithAssertion()['access_token'];
    }

    public function sendToDevice(string $deviceToken, string $title, string $body, array $data = []): array
    {
        $accessToken = $this->getAccessToken();

        $stringData = [];
        foreach ($data as $key => $value) {
            $stringData[$key] = (string) $value;
        }

        $message = [
            'message' => [
                'token' => $deviceToken,
                'notification' => [
                    'title' => $title,
                    'body' => $body,
                ],
                'android' => [
                    'priority' => 'HIGH',
                ],
            ],
        ];

        if (!empty($stringData)) {
            $message['message']['data'] = $stringData;
        }

        $response = Http::withToken($accessToken)->post(
            "https://fcm.googleapis.com/v1/projects/{$this->projectId}/messages:send",
            $message
        );

        return $response->json();
    }


    public function sendFCMRequest(array $payload)
    {
        $response = Http::withHeaders([
            'Authorization' => 'key=' . $this->serverKey,
            'Content-Type' => 'application/json',
        ])->post('https://fcm.googleapis.com/fcm/send', $payload);

        return $response->json();
    }

}
