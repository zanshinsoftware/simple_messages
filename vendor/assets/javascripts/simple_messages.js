var SimpleMessages = {
  alert: function (data) {
    var msg = "",
      i;

    for (i = 0; i < data.length; i += 1) {
      msg = msg + data[i] + "\n";
    }

    alert(msg);
  },

  flash: function (data, settings) {
    if (settings === undefined) {
      settings = {};
    }

    $.extend(settings, {
      context: '#content'
    });

    if (typeof(data) === 'object' && data.success !== undefined && (data.notice !== undefined || data.alert !== undefined)) {
      if (data.notice !== undefined) {
        SimpleMessages.flash_notice(data.notice);
      } else {
        SimpleMessages.flash_alert(data.alert);
      }
    } else if ($.isArray(data)) {
      SimpleMessages.flash_alert(data.join('<br>'));
    } else {
      $(settings.context).before(data).show();
      $.goTo('body');
    }
  },

  flash_notice: function (data) {
    SimpleMessages.flash($('<div />', { 'class' : "alert alert-success", 'text' : data }));
  },

  flash_alert: function (data) {
    SimpleMessages.flash($('<div />', { 'class' : "alert alert-danger", 'text' : data }));
  },

  show: function (data, type) {
    if (type === undefined) {
      type = 'alert';
    }
    SimpleMessages[type](data);
  },

  hide: function () {
    return $(".alert").alert();
  }
};
