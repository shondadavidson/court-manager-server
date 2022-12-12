update tournament
set delay = now(),
    delay_message = ${delayMessage}
    where tid = ${tid};