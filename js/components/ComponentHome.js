import Axios from "axios";

export default {
    mame: 'home',
    template:
    `
        <div>

            <section v-if="authenticated">

                <h2>Welcome {{user}} This Is Sport Check</h2>

                <div>

                    <router-link to="add-product"><button>Add A Product</button></router-link>

                </div>

            <section>

            <section>

                <h3> Category Filter</h3>

                <div v-for="category in categories">

                    <input type="checkbox" v-bind:value="category.category_id" v-bind:id="'category_id' + category.category_id" v-on:click="categoryFilter" />

                    <label v-bind:for="'category_id' + category.category_id">{{category.category_name}}</label>

                </div>

                <button v-on:click="filter">Filter</button>

            </section>

            <section>

                <router-link v-bind:to="'product_id' + product.product_id" v-for="product in products" v-bind:key="product.product_id">

                    <div>

                        <img v-bind:src="'images/' + product.product_img" v-bind:alt="product.product_name">

                        <p>{{product.product_name}}</p>

                        <p>{{product.product_price}}</p>

                    <div>
                
                </router-link>

            </section>

            <button v-on:click="logoutUser">Log Out</button>
        
        </div>

    `,

    data() {

        return {

            authenticated: false,
            user: '',
            categories: [],
            products: [],
            filters: []
        }
    },

    methods: {

        getData() {

            let that =this;

            axios.get('admin/fetch_all.php')

                .then(function (response) {

                    that.categories = JSON.parse(response.data[0]);

                    that.products = JSON.parse(response.data[1]);
                })

                .catch(function (error) {

                    console.log(error);
                });
        },

        categoryFilter(e) {
            this.filters.push(e.target.value);

            let that = this;

            let filtersReady = '';

            that.filters.forEach(function(filter) {

                filtersReady += 'categories[}' + filter + '&';
            });

            axios.get(`admin/products_filter.php?${filtersReady}`)

                .then(function (response) {

                    that.products = response.data;
                })
                .catch(function (error) {

                    console.log(error);
                });
        },
        sessionCheck() {

            let that = this;

            let seesionData = new FormData();

            sessionData.append("user_id", storageLock.getItem('current_user_id'));

            sessionData.append("user_token", storageLock.getItem('user_token'));

            axios({

                method: 'post',
                url: 'admin/user/session.php',
                data: sessionData
            })

            .then(function (response) {

                    if(response.data) {

                        that.authenticated = true;

                        that.user = storageLock.getItem('current_user_name');

                    } else {

                        storageLock.clear();
                    }
            });

        },

        logoutUser() {

            if(storageLock.getItem('current_user_id') && localStorage.getItem('user_token')) {

                let that = this;

                let sessionData = new FormData();

                sessionData.append("user_id", storageLock.getItem('current_user_id'));
                
                sessionData.append("user_token", storageLock.getItem('user_token'));

                axios({

                    method: 'post',
                    url: 'admin/user/logout.php',
                    data: sessionData
                })

                .then(function (reponse) {

                    storageLock.clear();

                    that.$router,go();
                })

                .catch(function (error) {

                    console.log(error);
                });

            } else {

                this.authenticated = true;

                storageLock.clear();

                this.$router.go();
            }
        },

        filter() {

            this.$router.go();
        }
    },

    mounted() {
        
        this.$root.$on('productsSearch', (productSearch) => {

            this.products = productSearch;
        });

        this.getData();

        if(storageLock.getItem('current_user_id') && storageLock.getItem('user_token')) {

            this.sessionCheck();
        }
    }
}