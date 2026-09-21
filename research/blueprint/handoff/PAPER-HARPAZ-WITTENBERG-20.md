# PAPER-HARPAZ-WITTENBERG-20 checkpoint

Codex — codex-c83e7a; issue #1426; 21 September 2026.

Read all 31 author pages and compared arXiv v2. The result has 144 items (7 library, 12 planned, 125 missing), twelve source routes and two Part II routes. Routes cover 123 missing and 10 planned items exactly once. APIs and three tests accompany every definition/construction. Status remains partial.

Resume at these two unrouted proof interfaces:

1. `PAPER-HARPAZ-WITTENBERG-20/75`: Remark 4.5 asserts open-to-proper universal-torsor weak approximation without the rational-connectedness hypothesis of its cited Theorem 4.2(i). Wit18 Remark 3.9 has the same general assertion. Acquire Sko90 Theorem 1 and check whether a broader fibration theorem supplies the argument. No counterexample is claimed; this remark is not needed by the RC applications.
2. `PAPER-HARPAZ-WITTENBERG-20/115`: DLA19 Definition 5.1 uses ambient G=G^ssu, whereas HW20 Definition 7.1 states its ascent axiom for semisimple simply connected groups. Both public DLA versions were checked. Supply the unipotent reduction, or prove ascent for the broader fibres, before closing the Theorem A dependency chain.

Then audit prerequisite proof closure: CTS87 type/universal-torsor theory; CTS00's stronger finite-quotient argument; HS13 open descent; Sko90/Sko96/Har97 fibration theorems; GHS/Kollár RC inputs; Wit12/CT05 cycle finiteness; PR94/Borovoi Hasse and approximation. Targeted HW16, Har08, DLA19, Dem10, LA19 and DLAN17 interfaces have been read; these prerequisites were not all read completely. Preserve this distinction.

The homogeneous route reuses the pending `HeightsRationalPointsPartIIHomogeneousMassey` candidate from PAPER-HARPAZ-WITTENBERG-23. It is not an accepted planned owner. Its HW20 theorem and Picard/Brauer foundations must be implemented once, retaining the Massey continuation. The zero-cycle candidate imports this foundation. Use stage order RC geometry → homogeneous geometry → E⁺ arithmetic to avoid a cycle.

Keep all finite extensions in E⁺, closed-point fibre hypotheses, modified infinite Chow groups, nonconstant outer stabilizer actions, full unramified Brauer groups, and the conjectural premise of Theorem 6.1. Theorem A and the supersolvable theorem remain unconditional source statements. Finite-extension reinterpretation is not Weil restriction. Coprime realization degrees mean collective gcd 1. Quaternion indexing is normalized to m≥3, recording the source convention.

Source hash and precise version, library pins, all routes and the seven read library declarations are in the report/result. Finite boundary checks and schema/intake/custom validation were run. No Lean deliverable or compilation; no claim of formalization.
