/*
const {Schema,model} = require ('mongoose');
const userSchema = new Schema(
    {
        name:  {
            type: String,
            require: [true, 'Name is required']
        }, // String is shorthand for {type: String}
        lastName: {
            type: String,
            require: [true, 'lastName is required']
        },
        email: {
            type: String,
            require: [true, 'Email is required'],
            unique: true,
            validate:{
                validator: function(email){
                    const regexEmail = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/;
                    return regexEmail.test(email);
                },
                message: props=>`${props.value} is not a valid email!`
            }
        },
        password: {
            type: String,
            require: [true, 'Password is required']
        },
    }
);
module.exports = model('User',userSchema, 'user');*/
