$(document).ready(function () {
    // openHome();
    window.addEventListener('message', function (event) {
        var item = event.data;
        if (item.open) {
            $("body .box").fadeIn();
            KSBank.open();
        }

        if (item.close) {
            $("body .box").fadeOut();
            KSBank.closeNUI();
        }

        if (item.openBalance) {
            $(".money-amount").html("R$" + item.balance);
        }

        if (item.notification) {

            if (item.notification_type == "success") {
                alertify.success(item.notification_desc);
            } else {
                alertify.error(item.notification_desc);
            }
        }
        if (item.showName) {
            $(".name-person").html(`Bem-vind@ ${item.lastname} ${item.firstname}`);
        }
    });
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://vrp_vlbank/close', JSON.stringify({}));
        }
    };
});
var KSBank = {};

KSBank.init = function() {
    alertify.set('notifier','position', 'top-center');
    KSBank.Menu();
}

KSBank.Loading = function(static) {
    if (static) {
        $(".loading").show();
        $(".workspace .right").animate({ opacity: 0.50 }, 200);
    } else {
        $(".loading").hide();
        $(".workspace .right").animate({ opacity: 1 }, 200);
    }
}

KSBank.Menu = function() {
    $(".left .menu .button").click(function() {
        var dataref = $(this).data('ref');
        if (dataref == "close") {
            KSBank.closeNUI();
        } else {
            $(".content-item").slideUp(200);
            setTimeout(function() {
                $("."+dataref).slideDown(100);
            }, 200);
        }
    });
};

KSBank.TransactionSuccess = function() {
    KSBank.Loading(false);
}

KSBank.Withdraw = function() {
    var amount = Number($("#input-withdraw").val());
    if (amount && amount > 0 && amount != 0) {
        KSBank.Loading(true);
        $.post('http://vrp_vlbank/withdrawMoney', JSON.stringify({
            amount: amount
        })).done(KSBank.TransactionSuccess);
    } else {
        alertify.error("Digite um valor numérico válido.");
    }
};

KSBank.Deposit = function() {
    var amount = Number($("#input-deposit").val());
    if (amount && amount > 0 && amount != 0) {
        KSBank.Loading(true);
        $.post('http://vrp_vlbank/depositMoney', JSON.stringify({
            amount: amount
        })).done(KSBank.TransactionSuccess);
    } else {
        alertify.error("Digite um valor numérico válido.");
    }
};

KSBank.Transfer = function() {
    var userid = Number($("#input-transfer-id").val());
    var amount = Number($("#input-transfer-value").val());
    if (userid && userid > 0 && amount && amount > 0) {
        KSBank.Loading(true);
        $.post('http://vrp_vlbank/transferMoney', JSON.stringify({
            userid: userid,
            amount: amount
        })).done(KSBank.TransactionSuccess);
    } else {
        alertify.error("Digite um valor numérico válido.");
    }
};

KSBank.open = function() {
    KSBank.Loading(false);
    $(".content-item").slideUp(200);
    setTimeout(function() {
        $(".home").slideDown(100);
    }, 200);
    $.post('http://vrp_vlbank/showName', JSON.stringify({}));
}

KSBank.closeNUI = function() {
    $(".back, .home, .deposit, .withdraw, .balance, .transfer").css("display", "none");
    $("#loadingscreen").fadeOut(200);
    $.post('http://vrp_vlbank/close', JSON.stringify({}));
}

KSBank.init();
