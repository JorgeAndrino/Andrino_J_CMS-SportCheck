export default {
    name: 'userlogin',
    temlate:
    `
        <div>
            <div>
                <label for="user_email">Email: </label>
                <input type="email" name="user_email" id="user_email" v-model="user_email" required>
                <label for="user_password">Password: </label>
                <input type="password" name="user_password" id="user_password" v-model="user_password" required>
                <button v-on:click="login">Login Here</button>
                <p v-if="message">{{message}}</p>
            </div>
        </div>
    `,
    data() {
        return {
            user_email: 'admin@email.com',
            user_password: 'password',
            message: ''
        }
    },
    methods: {
        login() {

            let that = this;

            let infoLogin = new FormData();

            infoLogin.append("user_email", this.user_email);
            infoLogin.append("user_password", this.user_email);

            axios({
                method: 'post',
                url: 'admin/user/user_login.php',
                data: infoLogin
            })
            .then(function (response) {

                if(response.data[0] == "Welcome to SportCheck") {
                    that.message = response.data[0];

                    storageLock.setItem('current_user_id', response.data[1]);
                    storageLock.setItem('current_user_name', response.data[2]);

                    that.$router.push("/");
                } else {
                    that.message = response.data;
                }

            })
            .catch(function (error) {
                console.log(error);
            });
            
        },

        sessionCheckup() {

            let that = this;

            let sessionData = new FormData();

            sessionData.append("user_id", storageLock.getItem('current_user_id'));

            axios({
                method: 'post',
                url: 'admin/user/session.php',
                data: sessionData
                })
                .then(function (response) {
                    if(response.data) {
                        that.$router.push("/");
                    } else {
                        storageLock.clear();
                    }
                })
                .cath(function (error) {
                    console.log(error);
                });
        }
    },

    mounted() {
        if(storageLock.getItem('current_user_id')) {
            this.sessionCheckup();
        }
    }
}