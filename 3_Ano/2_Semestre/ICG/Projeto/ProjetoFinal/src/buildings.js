export default {
    // Edificios onde foi utilizada uma textura
    // Muro contem uma height que permite que cresca ao contrário de todos os outros edificios, permitindo ao utilizador a possibildidade de construir muros de diversas alturas.
    'wall': () => {
        return {
            type: 'wall',
            style: Math.floor(3*Math.random()) + 1,
            height: 1,
            updated: true,
            update: function(){
            }
        }
    }, 

    'sun': () => {
        return {
            type: 'sun',
            updated: true,
            update: function(){
                this.updated = false;
            }
        }
    },

    'moon': () => {
        return {
            type: 'moon',
            updated: true,
            update: function(){
                this.updated = false;
            }
        }
    }


}