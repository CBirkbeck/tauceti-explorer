# Confirmed Chebotarev consumer fixes

Issue: #5033. Agent: Codex. Session: `codex-rtOQ9t`. Date: 2026-09-30.

Both confirmed findings in `RT-LINK-tauceti_TauCetiRoadmap_Chebotarev.review.json` are addressed. The link map now has 18 links, three overlaps and 218 examined entries. The original fifteen link objects, overlaps and historical worker, screen, validation and review metadata are unchanged. The summary distinguishes the original screen from this follow-up; the two previously negative examined entries now record precisely what was read. This is a targeted correction, not a new catalogue-wide audit or a new independent acceptance of the expanded map.

## Finding /1: Habiro prime selection

Added inferred link **CH-L16**, Chebotarev Layer 10 → `HabiroNumberFields:HB.2`. It names both requesting nodes, `HabiroNumberFields:HB.2/chebotarev-detection` and `HabiroNumberFields:HB.2/local-R-is-an-isomorphism`. The Habiro packet remains **partial**, with an accepted independent review; acceptance does not make its remaining mathematics complete.

I read the full HB.2 and supplier endpoint descriptions, the relevant import request and both nodes' statements, hypotheses, proof outlines, prerequisites and sources. I independently checked Calegari–Garoufalidis–Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's Conjecture*, arXiv:1712.04887v3, pp. 22–23 (Proposition 4.2 proof) and pp. 26–27 (local construction and Lemma 5.4 proof). These use finite cyclotomic/Kummer extensions and Frobenius prime selection, with compatibility justified in the consumer argument.

The link imports infinitude in a realizable conjugacy class and removal of finitely many exceptional primes. The consumer supplies its finite Galois closure/compositum, the compatibility of simultaneous restrictions, and its odd-prime-power and root-of-unity hypotheses. In particular the local argument's congruence modulo `n` and its exclusion modulo `np` must be proved compatible with the selected Kummer action. The edge does not assert that arbitrary simultaneous splitting and congruence specifications can be imposed. Kummer detection, the local-R isomorphism and the finite-Chern-class comparison are still consumer work. No effective bound, new density theorem or unconditional scalar comparison is introduced.

## Finding /2: BMS prime-selection and cyclotomic interfaces

Added inferred links **CH-L17**, Chebotarev Layer 10 → `KTheoryLowDegrees:U.4`, and **CH-L18**, Chebotarev Layer 4 → that same layer. CH-L17 names `KTheoryLowDegrees:U.4/idelic-density-theorem` and `KTheoryLowDegrees:U.4/primes-with-norm-not-one`; CH-L18 names the latter.

I read the full U.4 and supplier endpoint descriptions, and the relevant import requests and two nodes' statements, hypotheses, proof outlines, prerequisites and sources in `KTheoryLowDegrees--U.1.json`. That packet is **partial and unreviewed**. Its requests are leads, not accepted authority. I independently read the scans of Bass–Milnor–Serre, *Solution of the congruence subgroup problem for SL_n (n >= 3) and Sp_2n (n >= 2)*, Appendix (A.5)–(A.8), printed pp. 82–83, PDF pp. 25–26.

For the number-field case, (A.5) provides reciprocity and existence, (A.6) gives infinitely many primes with a specified abelian Frobenius, and together they imply (A.7)'s prime idele classes in each coset of an open finite-index subgroup. Class-field existence and the ray-class/idele dictionary remain separate inputs; Chebotarev alone does not construct them. For (A.8), when a primitive m-th root is absent from K, choose a nonidentity element of Gal(K(ζ_m)/K), apply prime selection away from m, and use the arithmetic Frobenius formula and primitivity to deduce that the **absolute ideal norm** is not 1 modulo m. The linked contract explicitly retains `m >= 2`, the number-field hypothesis and the exclusion of primes dividing m. It neither substitutes the rational prime below the ideal nor reverses arithmetic Frobenius. Function-field (A.9), stable elementary generation and SK1 vanishing are outside these imports.

## Library and graph checks

I read the reviewed library-coverage entries for both supplier layers and both consumer layers. Layer 10's density interface and the relevant consumer conclusions remain planned. At Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`, I read the actual declarations and proofs in `TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean`:

- `AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one` (line 96) takes a number field K, an extension field F, an m-th root, a base prime not dividing m, an ideal of the extension's integers lying over that prime, and an arithmetic Frobenius. It gives the absolute-norm power formula.
- `AlgHom.IsArithFrobAt.autToPow_eq_absNorm` (line 133) packages the formula for a primitive root as the value of its cyclotomic character in `ZMod m`.

CH-L18 reuses those declarations; choosing the Frobenius and transporting its hypotheses remain consumer obligations. No replacement implementation is planned. This check does not claim every result in Chebotarev Layer 4 is built.

All three links quote both canonical endpoint descriptions and are marked inferred because the dependency argument uses the independently checked consumer sources. Against assembled main at `e7374e70f6c6a3ba9c3b7b92f5fda302259dd34d`, all four endpoints exist and each of the three proposed pairs has neither a forward nor a reverse path. `assemble(require_distances=False)` gives 2,840 stages and 8,252 edges; applying the actual `merge_links` function yields 8,255 edges, with source/target `consumers`/`requires` populated and its acyclicity check passing. Reapplying the packet leaves the edge count at 8,255. This uses the packet's existing historical acceptance to exercise production integration; it does not invent a fresh review.

Validation:

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_Chebotarev.json`: 18 links, three overlaps, 218 examined; zero errors or warnings.
- Programmatic preservation assertions: only summary, links and the two named examined entries changed; all fifteen old links and all overlaps are identical.
- Production graph integration, cycle checks, endpoint lists and repeated-merge edge count: passed.
- Intake validation and `git diff --check`: passed.
- No Lean file was changed or compiled. This issue delivers a link correction and its report; no Lake build, cache operation or Lean language server was used.

## Source provenance and handoff

Freshly checked source files:

- [CGZ arXiv v3](https://arxiv.org/pdf/1712.04887v3), SHA-256 `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5`.
- [BMS published scan](https://www.numdam.org/item/10.1007/BF02684586.pdf), SHA-256 `b455790cdaeba5e3a313f1bd4dddfe2892e8a2035067bcdef434ef717edfb996`.

The links and their verified source locators preserve the evidence needed after deleting downloaded PDFs and rendered pages from job scratch. Neither requesting blueprint was edited or newly certified. Both confirmed findings are fixed; no further deliverable is needed for this issue. Remaining proof and class-field interface obligations are explicitly assigned to the consumer nodes above.
