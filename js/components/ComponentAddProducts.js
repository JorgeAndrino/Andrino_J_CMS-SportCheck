export default {
    name: 'add-product',
    template:
    `
        <div>
            <form>
                <label></label>
                <input/>

                <label></label>
                <input/>

                <label></label>
                <input/>

                <label></label>
                <select>
                    <option></option>
                    <option></option>
                </select>

                <label></label>
                <textarea></textarea>

                <label></label>
                <select>
                    <option>{{category.category_name}}</option>
                </select>

                <button> Submit </button>
            </form>
        </div>
    `,
    data() {
        return {
            categories: [],
        }
    }
}