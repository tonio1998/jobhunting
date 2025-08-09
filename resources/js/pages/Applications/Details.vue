<script setup>
import { ref, onMounted, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';

// Replace these with your actual API calls — mocked here as empty async functions
async function workersBidsApplications(id) {
    // fetch your application data by id
    // return dummy data or real API response
    return fetch(`/api/applications/${id}`).then(r => r.json());
}

async function getRequirementsData(requirements) {
    // fetch requirements data based on parsed JSON
    return fetch('/api/requirements', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({ requirements }),
    }).then(r => r.json());
}

async function getUserRequirementsFiles(jobId, userId) {
    // fetch user uploaded files
    return fetch(`/api/user-files?jobId=${jobId}&userId=${userId}`).then(r => r.json());
}

// utils (replace with your actual utils)
function handleApiError(err, context) {
    console.error(`Error in ${context}:`, err);
}

function formatPeso(value) {
    if (!value) return '0.00';
    return parseFloat(value).toLocaleString('en-PH', { style: 'currency', currency: 'PHP' });
}

function getFileSize(bytes) {
    if (bytes < 1024) return bytes + ' B';
    if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + ' KB';
    return (bytes / (1024 * 1024)).toFixed(1) + ' MB';
}

function viewFile(filePath, fileName) {
    window.open(filePath, '_blank');
}

// Route params
const route = useRoute();
const router = useRouter();
const id = route.params.id;

const applications = ref({});
const requirements = ref([]);
const uploadedFiles = ref({});
const loading = ref(false);
const refreshing = ref(false);

const fetchData = async () => {
    loading.value = true;
    try {
        const res = await workersBidsApplications(id);
        applications.value = res;
    } catch (error) {
        alert('Something went wrong fetching the data.');
        handleApiError(error, 'Fetch Application');
    } finally {
        loading.value = false;
        refreshing.value = false;
    }
};

onMounted(fetchData);

// Set document title based on application name
watch(
    () => applications.value.details?.name,
    (newName) => {
        if (newName) {
            document.title = `Application - ${newName}`;
        }
    }
);

// Parse requirements JSON and fetch details
watch(
    () => applications.value.job?.requirements,
    async (reqJson) => {
        if (reqJson) {
            try {
                const req = JSON.parse(reqJson);
                const reqData = await getRequirementsData(req);
                requirements.value = reqData;
            } catch (error) {
                handleApiError(error, 'Fetch Requirements');
            }
        }
    }
);

// Fetch uploaded files when requirements or user changes
// Assuming applications.details?.id is user id here
watch(
    [requirements, () => applications.value.details?.id],
    async ([reqs, userId]) => {
        if (reqs.length && userId) {
            try {
                const filesMap = {};
                const res = await getUserRequirementsFiles(applications.value.job.id, userId);
                for (const file of res.files) {
                    if (!filesMap[file.RequirementID]) {
                        filesMap[file.RequirementID] = { files: [] };
                    }
                    filesMap[file.RequirementID].files.push(file);
                }
                uploadedFiles.value = filesMap;
            } catch (error) {
                handleApiError(error, 'Fetch Files');
            }
        }
    }
);

const onRefresh = async () => {
    refreshing.value = true;
    await fetchData();
    refreshing.value = false;
};

const goToContractScreen = () => {
    router.push({
        name: 'ContractScreen',
        params: {
            id: applications.value.job.contract.id,
            BidID: id,
            jobId: applications.value.job.id,
            UserID: applications.value.details.id,
        },
    });
};
</script>

<template>
    <div class="safe-area">
        <div class="scroll-container">
            <button @click="onRefresh" :disabled="loading" class="refresh-btn">
                {{ loading ? 'Refreshing...' : 'Refresh' }}
            </button>

            <div v-if="applications.ApplicationStatus === 'Hired'" class="status-box hired">
                <span class="icon">✔️</span>
                <p class="status-text green">Congratulations! You have been hired.</p>
            </div>

            <div v-else-if="applications.ApplicationStatus === 'Rejected'" class="status-box rejected">
                <span class="icon">❌</span>
                <p class="status-text red">We regret to inform you that your application has been rejected.</p>
            </div>

            <div v-else-if="applications.ApplicationStatus === 'shortlisted'" class="status-box shortlisted">
                <span class="icon">⭐</span>
                <p class="status-text orange">Good news! You have been shortlisted for this position.</p>
            </div>

            <div class="card" v-if="applications.job">
                <h2>{{ applications.job.title }}</h2>
                <div class="card-row">
                    <span>Bid Amount:</span>
                    <strong>{{ formatPeso(applications.bid_amount) }}</strong>
                </div>
                <div class="card-row">
                    <span>Proposed Duration:</span>
                    <strong>{{ applications.proposed_duration }}</strong>
                </div>
            </div>

            <section
                v-if="requirements.length && requirements.some(r => r.type !== 'None')"
                class="requirements"
            >
                <h3>Requirements</h3>
                <div
                    v-for="(item, index) in requirements"
                    :key="index"
                    class="requirement-card"
                >
                    <div class="requirement-type">{{ item.type }}</div>
                    <div v-if="uploadedFiles[item.id]?.files" class="uploaded-files">
                        <div
                            v-for="file in uploadedFiles[item.id].files"
                            :key="file.id"
                            class="file-row"
                        >
                            <a href="#" @click.prevent="viewFile(file.FilePath, file.FileName)" class="file-link">
                                {{ file.FileName }}
                            </a>
                            <small>{{ getFileSize(file.size) }}</small>
                        </div>
                    </div>
                </div>
            </section>

            <button
                v-if="applications.job?.contract && applications.ApplicationStatus === 'Hired'"
                class="btn btn-success"
                @click="goToContractScreen"
            >
                View Contract
            </button>
        </div>
    </div>
</template>

<style scoped>
.safe-area {
    padding: 10px;
    max-width: 600px;
    margin: 0 auto;
}

.scroll-container {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.refresh-btn {
    padding: 8px 12px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    align-self: flex-start;
}

.refresh-btn[disabled] {
    opacity: 0.6;
    cursor: not-allowed;
}

.status-box {
    text-align: center;
    padding: 10px;
    border-radius: 6px;
}

.status-box .icon {
    font-size: 36px;
    display: block;
    margin-bottom: 6px;
}

.green {
    color: #28a745;
}

.red {
    color: #dc3545;
}

.orange {
    color: orange;
}

.card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 12px;
    box-shadow: 1px 1px 6px rgba(0, 0, 0, 0.1);
}

.card-row {
    display: flex;
    justify-content: space-between;
    margin-top: 6px;
    font-size: 14px;
}

.requirements {
    margin-top: 16px;
}

.requirement-card {
    border: 1px solid #ccc;
    border-radius: 6px;
    padding: 8px;
    margin-bottom: 10px;
}

.requirement-type {
    border-bottom: 1px solid #ccc;
    padding-bottom: 4px;
    margin-bottom: 6px;
    font-weight: 600;
}

.uploaded-files {
    padding-left: 4px;
}

.file-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 6px;
}

.file-link {
    color: #007bff;
    cursor: pointer;
    text-decoration: underline;
}

.btn {
    padding: 10px 14px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    font-weight: 600;
}

.btn-success {
    background-color: #28a745;
    color: white;
}
</style>
