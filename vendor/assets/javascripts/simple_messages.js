var SimpleMessages = {
  alert: function (data) {
    var msg = "",
      i;

    for (i = 0; i < data.length; i += 1) {
      msg = msg + data[i] + "\n";
    }

    alert(msg);
  },

  flash: function (data) {
    if (typeof(data) === 'object' && data.success !== undefined && (data.notice !== undefined || data.alert !== undefined)) {
      if (data.notice !== undefined) {
        Message.flash_notice(data.notice);
      } else {
        Message.flash_alert(data.alert);
      }
    } else if ($.isArray(data)) {
      Message.flash_alert(data.join('<br>'));
    } else {
      $('#content').before(data).show();
      $.goTo('body');
    }
  },

  flash_notice: function (data) {
    Message.flash($('<div />', { 'class' : "alert alert-success", 'text' : data }));
  },

  flash_alert: function (data) {
    Message.flash($('<div />', { 'class' : "alert alert-danger", 'text' : data }));
  },

  show: function (data, type) {
    if (type === undefined) {
      type = 'alert';
    }
    Message[type](data);
  }
};
