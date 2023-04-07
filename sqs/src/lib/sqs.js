// AWS SQS
// Version : 1.0.2
// author: Sajjad Hussain

const createAQueue = () => {
  let queueName = "";
  queueName = document.getElementById("queue-name-value").value;

  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/queue.cfc?method=createQueue",
    method: "POST",
    data: {
      queueName: queueName,
    },
  };
  $.ajax(settings).done(function (response) {
    try {
      document.getElementById("queue-alert").classList.remove("d-none");
      document.getElementById("queue-alert").innerHTML = response;
      setTimeout(() => {
        document.getElementById("queue-alert").classList.add("d-none");
      }, 5000);
    } catch (e) {}
  });
};

const sendMessage = () => {
  let queueName = "";
  queueName = document.getElementById("queue-name-value").value;
  message = document.getElementById("message-value").value;

  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/message.cfc?method=sendMessage",
    method: "POST",
    data: {
      queueName: queueName,
      message: message,
    },
  };
  $.ajax(settings).done(function (response) {
    try {
      document.getElementById("message-alert").classList.remove("d-none");
      document.getElementById("message-alert").innerHTML = response;
      setTimeout(() => {
        document.getElementById("message-alert").classList.add("d-none");
      }, 5000);
    } catch (e) {}
  });
};

const readMessages = () => {
  let queueName = "";
  queueName = document.getElementById("queue-name-value-to-read").value;

  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/message.cfc?method=pollMessages",
    method: "POST",
    data: {
      queueName: queueName,
    },
  };
  $.ajax(settings).done(function (response) {
    try {
      document
        .getElementById("message-alert-read-list")
        .classList.remove("d-none");
      document.getElementById("message-alert-read-list").innerHTML = response;
    } catch (e) {}
  });
};
