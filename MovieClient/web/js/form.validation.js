$(document).ready(function() {
    $('.registerForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 5,
                        max: 8,
                        message: 'The username must be more than 5 and less than 8 characters long'
                    }
                }
            },
            title: {
                message: 'The title is not valid',
                validators: {
                    notEmpty: {
                        message: 'The title is required and cannot be empty'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: 'The title must be more than 1 and less than 30 characters long'
                    }
                }
            },
            director: {
                message: 'The director is not valid',
                validators: {
                    notEmpty: {
                        message: 'The director is required and cannot be empty'
                    },
                    stringLength: {
                        min: 2,
                        max: 20,
                        message: 'The director must be more than 2 and less than 20 characters long'
                    }
                }
            },
            type: {
                message: 'The type is not valid',
                validators: {
                    notEmpty: {
                        message: 'The type is required and cannot be empty'
                    },
                    stringLength: {
                        min: 4,
                        max: 20,
                        message: 'The type must be more than 4 and less than 20 characters long'
                    }
                }
            },
            description: {
                message: 'The description is not valid',
                validators: {
                    notEmpty: {
                        message: 'The description is required and cannot be empty'
                    },
                    stringLength: {
                        min: 10,
                        max: 200,
                        message: 'The description must be more than 10 and less than 200 characters long'
                    }
                }
            },
        }
    });
});