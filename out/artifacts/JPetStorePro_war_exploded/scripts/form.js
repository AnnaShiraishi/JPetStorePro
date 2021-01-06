$(function () {
console.log($('#shippingAddressRequired').is(':checked'));
if ($('#shippingAddressRequired').is(':checked')) {
    $('#shipAddressForm').addClass('show');
} else {
    $('#shipAddressForm').removeClass('show');
}
});

