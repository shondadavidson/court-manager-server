update tournament
set delay = null,
    delay_message = ${delayMessage}
    where tid = ${tid};