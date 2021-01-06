var isCheckUsername = false;
var isCheckPasswordMatched = false;
var isPINMatched = false;
var PIN1 = -1;

$(function () {
    $('#username').on('blur', function checkUsername() {
        var name = $('#username').val();
        $.post('/checkusername', {username:name}, function (data, status) {
            if (data == 1) {
                $("#check-username-span").html("<font color='red'>User name exists.</font>");
                isCheckUsername = false;
            } else {
                $("#check-username-span").html("");
                isCheckUsername = true;
            }
        })
    });

    $('#password').on('blur', function checkPasswordMatched() {
        var password = $('#password').val();
        var repeatedPassword = $('#repeatedPassword').val();

        if (password != repeatedPassword) {
            $("#check-password-span").html("<font color='red'>unmatched password.</font>");
            isCheckPasswordMatched = false;
        } else {
            $("#check-password-span").html("");
            isCheckPasswordMatched = true;
        }
    });

    $('#repeatedPassword').on('blur', function checkPasswordMatched() {
        var password = $('#password').val();
        var repeatedPassword = $('#repeatedPassword').val();

        if (password != repeatedPassword) {
            $("#check-password-span").html("<font color='red'>unmatched password.</font>");
            isCheckPasswordMatched = false;
        } else {
            $("#check-password-span").html("");
            isCheckPasswordMatched = true;
        }
    });

    $('#sendEmailBtn').on('click', function sendEmailPIN() {
        var inputEmail = $('#inputEmail').val();
        $.post('/emailPIN', {email:inputEmail}, function (data, status) {
            if (data != 0) {
                $("#check-email-span").html("");
                PIN1 = data;
            } else {
                $("#check-email-span").html("<font color='red'>Cannot send the email, pleas try again later.</font>");
            }
        })
    });

    $('#inputPIN').on('blur', function checkPIN() {
        var PIN = $('#inputPIN').val();
        console.log(PIN1);
        console.log(PIN);
        if (PIN * 1 != PIN1 * 1) {
            $("#check-PIN-span").html("<font color='red'>Unmatched PIN.</font>");
            isPINMatched = false;
        } else {
            $("#check-PIN-span").html("<font color='green'>Matched PIN.</font>");
            isPINMatched = true;
        }
    });

    $('#editAccount').on('click', function (e) {
        e.preventDefault();
        console.log(isCheckPasswordMatched);
        console.log(isCheckUsername);
        console.log(isPINMatched);

        if (isCheckPasswordMatched && isCheckUsername && isPINMatched) {
            $('#signup').submit();
        }
    })
});