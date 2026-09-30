# Verification of the Treumann–Venkatesh red-team findings

Job `REV-RT-PAPER-TREUMANN-VENKATESH-16`, issue #4119. Codex, session
`codex-rtOQ9t`, 30 September 2026. Base: `6aca82f`.

All thirteen findings are **confirmed**, with qualifications to the proposed
repairs recorded individually in
`research/blueprint/redteam/RT-PAPER-TREUMANN-VENKATESH-16.review.json`.
There are eight medium and five low findings. A confirmation here means that
the reported defect warrants a fix; it does not endorse every hypothesis,
ownership suggestion or source-issue classification in the original fix text.

The target extraction, its original review and the red team are by sessions
`cc-7b31c4`, `cc-39fac3` and `cc-f805bf`, respectively. This session authored
none of them. Checked their provenance before claiming. The bot confirmed this
session's claim on #4119 before the evidence review began. Only this verification
and its handoff are changed.

## Evidence read

This is a verification of the thirteen findings, not a second complete
extraction of the paper or a re-verification of all 53 existing source issues.
I read the complete red-team result and report; the target source record,
prerequisites, three routes and relevant items; the original review report;
and the exact source passages and library statements needed for these findings.

Fresh PDF downloads on 30 September 2026:

| Artifact | SHA-256 | Pages |
| --- | --- | --- |
| [Annals version of record](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf) | `15513caba4eed4f9b71c7d1ec791c0c406bb32e7a539ddf63d1a24d227863355` | 52 |
| [arXiv:1407.2346v1 PDF](https://arxiv.org/pdf/1407.2346v1) | `34e2416f08ba0dc4a4fb8369875ef3d9f5a5b2ef8290733545442801baec9ee8` | 55 |
| [Steinberg, Yale lecture notes, original scan](https://www.math.utah.edu/~ptrapa/math-library/steinberg/steinberg-yale-notes.pdf) | `5943b5571ab9815c45eaba206bcb35ed8b3efb3a7c3c45404ea9a9bbce7dbb50` | 284 |
| [Joyner, non-connected reductive groups](https://jolt.centre-mersenne.org/item/10.5802/jolt.203.pdf) | `4af36396687dd34571002a616672dab1f41f4eafec548a0bbd33b142435ac454` | 16 |
| [Reeder, torsion automorphisms](https://ems.press/content/serial-article-files/44197?nt=1) | `c4cecf96e9563b04c492809b73fed72352cb7a5900a2676ca2735127de6c36b3` | 45 |

Read the relevant published passages at printed pp. 181, 186–189, 197–200,
203, 205, 207, 209–210, 212, 220–224 and 227–228; the preprint counterparts at
PDF pp. 16, 23, 27–28, 30, 47–48 and 52. In particular, inspected the published
page images of pp. 209, 212 and 221 for the formulas and hypotheses; Steinberg
printed pp. 172–174 and 177 on images; and Joyner pp. 270 and 279 on images
because its local text extraction is corrupt. Reeder's Lemma 3.2 proof is on
printed p. 21 (PDF p. 19). The latter confirms the semisimple-automorphism
condition; I did not read Steinberg's entire 1968 memoir or independently
extract all of its Section 8.9. Its use and exact citation in TV are directly
visible on p. 212.

The [Annals landing page](https://annals.math.princeton.edu/2016/183-1/p04)
has no linked erratum, and the [arXiv listing](https://arxiv.org/abs/1407.2346)
lists only v1. This is a bounded correction search, not a claim that no
correction could exist elsewhere. Both downloaded TV PDFs open without
encryption in PyMuPDF. The original review's full-paper read is its own
provenance, not attributed to this session.

Repository evidence was read at the base commit: Feng items 65, 66, 68 and
route 1; Lipnowski–Tsimerman's `lang-theorem` and its source route; FKP item 88;
PQ items 81–82 and its Part II brief; EllipticCurves Layers 5 and 7;
ReductiveGroups Layers 7–9; and the complete stage descriptions AA.0, AA.1,
AA.3, AA.4, ALS.1, ALS.3, SR.1, SR.4, RG2.1, RG2.3, RG2.5 and AF.0. The
prerequisite search also found the Steinberg memoir in a different combined
prerequisite of Cadoret–Hui–Tamagawa; it does not supply the stable-pair theorem.

Library evidence uses the protocol pins, not the working checkout's HEAD:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:
  `NumberTheory/HeckeRing/Defs.lean`, declarations `IsHeckeTriple`,
  `HeckeCosetModule`, `HeckeRing`; and
  `CategoryTheory/Sites/NonabelianCohomology/H1.lean`, whose presheaf input and
  cocycle quotient do not give continuous nonabelian group cohomology.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:
  `NumberTheory/HeckeRing/Associativity.lean:485`,
  `Commutativity.lean:98,478`, `LeftCosetModule/Basic.lean:296,314` and
  `LeftCosetModule/Action.lean:383`. The last declaration gives a module over
  the opposite Hecke ring on the free left-coset module, not arbitrary `X/K`.

## Corrections the fixer must preserve

| Finding | Verified defect and repair boundary |
| --- | --- |
| 1 | Import the general Tate diagonal/Frobenius construction from Feng's named owner; keep the topological Smith work here. A proposed route is not yet a library theorem. |
| 2 | Import nonabelian H1 from EllipticCurves Layer 5, with a finite-cyclic adapter. Do not duplicate that prerequisite because its classification is a stretch milestone. |
| 3 | Add the three actual supplier obligations. Keep characteristic zero/semisimplicity for the stable pair and closed orbit. Lang already has an RG2.3 source route, which still needs integration at theorem granularity. |
| 4 | Split the general modules from the library algebra and the library `X = G` case. SR.1 already includes integral finite-correspondence operators where averaging fails. |
| 5 | Cite actual planned statements, not adjacent topics; coordinate the missing algebra, quotient-properness and chain-comparison obligations with AF.0/SR.1, AA.3 and ALS.3. |
| 6 | Theorem 5.8 has reductive G. When removing its extra semisimplicity condition, add semisimple G explicitly to the brief's Theorem 6.5. |
| 7 | Invert the prime-to-p ideal character, with a global reciprocity definition and an explicit Frobenius convention. Do not reduce the real idelic norm modulo p at all places. |
| 8 | Require `n >= 2`; retain each local construction and global consequence with a dependency between them, rather than repeating the construction. |
| 9 | The proof uses normal levels. Record the gap in the unrestricted statement; normal refinement alone is not descent to an arbitrary intermediate level. |
| 10 | The Yale replacement is now verified: Theorem 32, proof steps (3) and (5), pp. 173–174; root-class corollary p. 177 with its hypotheses. |
| 11 | Share canonical-torus/C-group foundations without deleting the deformation applications. TV's mod-p torus correspondence is not directly PQ's p-adic coefficient theorem. |
| 12 | Correct current version provenance while preserving dated history. Pair each hash with the actual PDF or source-archive URL that produced it. |
| 13 | Add the three theorem-specific prerequisites; another paper's mention of the Steinberg memoir is not extraction of this input. |

Two small computations make the mathematical defects reproducible without
Lean. For finding 7, in `SL2`, the positive root on `diag(a,a^-1)` is `a^2`,
so at `a = 3` the modular character is `3^-2`. Modulo 7 this is 4. The printed
norm character pulled back by the half-root has value 3 and square 2; its
inverse has square 4. This concerns the asserted canonical construction and
deserves `affects: a stated result`, even though it does not invalidate the
examples where inversion agrees. With arithmetic reciprocity, the corrected
character is `cyclo^-1 o rec`, so the parameter of its inverse has the positive
cyclotomic exponent in published (9.3.1).

For finding 8, if `g = [[a,b],[c,d]]` and `ad-bc = 1`, then
`(g^T)^-1 = [[d,-c],[-b,a]]`; conjugating by
`J = [[0,1],[-1,0]]` gives `g`. This proves that the purported involution is
trivial for `n = 1`. The characteristic-zero base field of the algebraic
groups must not be confused with the characteristic-2 coefficient field.

The overly broad proposed supplier in finding 3 has a similarly concrete
failure: in characteristic p, a nontrivial unipotent element of `SL2` can
have order p, while membership in the common normalizer of a Borel and its
maximal torus would force it into that torus. The finite-order condition must
therefore not replace semisimplicity in arbitrary characteristic.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-TREUMANN-VENKATESH-16.review.json`
- `python3 research/blueprint/intake.py check-files` with the three submitted paths.
- Exact equality of finding IDs between result and review: thirteen distinct
  IDs, no omissions or extras, all with nonempty reasons.
- `git diff --check`.

No Lean file was added or compiled. Source reading, pinned declaration
inspection and the explicit arithmetic/matrix checks supply the verification;
schema checks alone are not mathematical validation.
