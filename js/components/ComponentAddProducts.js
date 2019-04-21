export default {
    name: 'add-product',
    template:
    `
        <div>
            <form method="post" enctype="multipart/form-data">
                <label for="product_img">Product Image: </label>
                <input type="file" name="product_img" required />

                <label for="product_name">Product Name: </label>
                <input type="text" name="product_name" required />

                <label for="product_price">Product Price: </label>
                <input type="text" name="product_price" required />

                <label for="product_desc">Description: </label>
                <textarea name="product_desc" required></textarea>

                <label for="category_id">Category: </label>
                <select name="category_id" required>
                    <option v-bind:value="category.category_id" v-for="category in categories>{{category.category_name}}</option>
                </select>

                <button v-on:click="addProduct" rows="10"> Submit </button>
            </form>
        </div>
    `,
    data() {
        return {
            categories: [],
        }
    },

    method: {
        sessionCheckup() {
            if(storageLock.setItem('current_user_id')  && storageLock.getItem('user_token')) {
                
                let that = this;

                let sessionData = new FormData();

                sessionData.append("user_id", storageLock.getItem('current_user_id'));
                sessionData.append("user_token", storageLock.getItem('user_token'));

                axios({
                    method: 'post',
                    url: 'admin/user/session.php',
                    data: sessionCheckup
                    })

                    .then(function (response) {
                        if(!response.data) {
                            that.$router.push("/login");
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            } else {
                storageLock.clear();
                this.$router.push("/login");
            }
        },

        addProduct() {
            this.$router.push("/");
        },

        catchCategories() {
            let that = this;  

            axios.get('admin/read-all.php')

                .then(function (response) {
                    that.categories = JSON.parse(response.data[0]);
                })

                .catch(function (error) {
                    console.log(error);
            });
        },
    },

    mounted() {
        this.sessionCheckup();
        this.catchCategories();
    },
}