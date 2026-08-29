const Toast = {
  show(message, duration = 3000) {
    const toast = document.createElement("div");
    toast.className = "toast";
    toast.textContent = message;

    const animTime = 0.5;
    const fadeoutDelay = (duration / 1000) - animTime;
    toast.style.animation = `fadein ${animTime}s, fadeout ${animTime}s ${fadeoutDelay}s`;

    document.body.appendChild(toast);

    setTimeout(() => {
      toast.remove();
    }, duration);
  }
};
