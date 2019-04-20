import Axios from "axios";

export default {
    name: 'edit-product',
    template:
    `
        <div v-if="product">

            <form action="http://localhost:8080/Andrino_J_CMS-SportCheck/admin/products_edit.php" method="post" enctype="multipart/form-data">

                <input type="hidden" name="product_id" v-bind:value="product.product_id" />

                <img v-bind:src="'images/products/' + product.product_img" v-bind:alt="product.product_name" v-if="!newImage">

                <label for="product_name"> Product Name: *</label
                <input type="text" name="product_name" v-bind:value="product.product_name" />

                <label for="product_price"> Product Price: *</label>
                <input type="text" name="product_price" v-bind:value="product.product_price" />

                <label for="product_desc"> Product Description: *</label>
                <textarea name="product_desc" v-bind:value="product.product_desc" rows="10"></textarea>

                <button v-on:click="addImage" type="button">Replace Image</button>

                <div v-if="newimage">

                    <label for="product_img">Product Image: *</label>
                    <input type="file" name="product_img" required />
                </div>

                <button v-on:click="productEdit"> Submit </button>
            </form>

        </div>

    `,

    data() {
        return {
            product: '',
            newImage: false,
        }
    },

    methods: {
        
        getSoloData() {

            let that = this;

            Axios.get(`admin/fecth_solo.php?product_id=${this.$route.params.id}`)

            .then(function (response) {

                that.product = response.data[0];
            })

            .catch(function (error) {

                console.log(error);
            });
        },

        sessionCheck() {

            if(storageLock.setItem('current_user_id') && storageLock.getItem('user_token')) {

                let that = this;

                let sessionData = new FormData();

                sessionData.append("user_id", storageLock.setItem('current_user_id'));

                sessionData.append("user_token", localStorage.getItem('user_token'));

                axios({

                    method: "post",
                    url: 'admin/user/session.php',
                    data: sessionData
                })

                .then(function (response) {

                    if(!response.data) {

                        that.$router.push("/login");
                    }
                })

                .catch(function (error){

                    console.log(error);
                });

            } else {

                storgaeLock.clear();

                this.$router.push("/login");
            }
        },

        addImage() {

            this.newImage = true;
        },

        productEdit() {

            this.$router.push("/product_id" + this.product.product_id);
        }
    },

    mounted() {

        this.getSoloData();
        
        this.sessionCheck();
    }

}