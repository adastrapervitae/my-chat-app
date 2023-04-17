<template>
    <div>
        <div>
            <h2>Чат</h2>
            <div>
                <ul>
                    <li v-for="(message, index) in messages" :key="index">{{ message }}</li>
                </ul>
            </div>
            <div>
                <input type="text" v-model="newMessage" />
                <button @click="sendMessage">Отправить</button>
            </div>
        </div>
    </div>
</template>

<script>
import io from 'socket.io-client';

export default {
    name: 'MyChatApp',
    data() {
        return {
            messages: [],
            newMessage: '',
            socket: null,
        };
    },
    mounted() {
        this.socket = io('http://localhost:3000');
        this.socket.on('chat message', (message) => {
            this.messages.push(message);
        });
    },
    methods: {
        sendMessage() {
            this.socket.emit('chat message', this.newMessage);
            this.newMessage = '';
        },
    },
};
</script>
