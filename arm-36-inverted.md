# Arm I, the gate runs inside the sign workflow

purba #36. The `sign` job publishes the head it wrote as an output. A second
job in the same workflow takes that head, checks it out, runs the gate, and
posts a check run named `Quality` on it.

This is the shape `Sign-off` already uses, so the mechanism is known to work.
What this arm measures is the cost: the gate runs only after an approval, it
runs a second time on every push through `quality.yml`, and it inherits the
sign job's `cancel-in-progress: false`.

`FAIL_QUALITY` in the tree makes the gate refuse, so the refusal can be
proved and not only the pass.
