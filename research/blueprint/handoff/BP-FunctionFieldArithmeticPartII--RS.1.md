# BP-FunctionFieldArithmeticPartII--RS.1 — completed planning pass

Issue #8917. Agent: Codex, session `codex-iB2fkG`. Bot confirmed claim comment
6243775620 in reply 6243776762. Branch: `codex-iB2fkG-finite-root-stacks`.
This run took one job and submits its four permitted deliverables.

## Result and scope

The packet is **complete** and RS.1 is **planned**, with 11 new targets:
3 constructions, 5 theorems, 2 comparisons and 1 application. The constructions
have 18 API items and 12 discriminating unit tests in total. Five planets and
12 exact-pinned baseline declarations are recorded. The reader is about 7,500
words; the compact suggested file has 115 lines, two real-bodied light
abbreviations, three end-condition/milestone theorems and five examples.
All implementation statuses remain unchecked.

The accepted parent, RS.0 and RS.2 files are unchanged. The canonical reserved
`FunctionFieldArithmeticPartII:key/root-stacks` owner and the accepted parent
Hopf-coaction invariant algebra are imports. The coverage table maps every
parent RS.1 target to its exact existing supplier or new native comparison.

## Ownership decisions for assembly

Current upstream Scheme and stack foundations §1.21 already owns finite roots,
the 2-pullback, universal line, affine chart, base change, index one, complement
and invertible-index DM theorem. Its §§1.1, 1.18–1.23 and 3.4 own generic QCoh
descent, stacks, quotients, algebraicity, Picard groupoids and coarse/tame
infrastructure. The packet imports the exact corresponding SF.1/SF.3 nodes;
it does not re-plan those subjects. AVB L0A/L0B supplies the native monoidal
module/section interfaces through existing RS.0 and Picard suppliers.

The provided read-only upstream checkout is commit `0d144d0`, predating the
Scheme and stack foundations merge. Its current public README and
Suggested.lean were therefore read at immutable main commit
`350e970ce49f707a327909beac0b7b7c782cc7ee`. The source record includes the
README URL/hash and exact reading scope. No repository was cloned or copied,
and nothing was built in either upstream checkout. Current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was screened separately from the
atlas compilation pins.

Assembly should point the old STACK-GEOM, JAC-A, ORDINARY-STACKS and
ROOT-ALGEBRAIC requests to these current owners. The older ROOT-COARSE request
becomes the single narrower request below. The packet proposes narrowing RS.1
to native comparisons and root-specific geometry, without modifying an upstream
roadmap, another packet or an atlas definition.

## Mathematical distinctions preserved

- Effective fpqc descent restricts the full QCoh equivalence, including all
  maps, then descends rank one, the section, the power identification and its
  inverse. Faithfulness checks every equation and coherence comparison.
- Over stack bases the native equivalence retains the base arrow and the
  isomorphism in the 2-pullback. Base change is arbitrary, including nonflat.
- The affine quotient uses actual torsors. A normalized frame has right action
  e·ζ=ζe, so its coordinate changes by ζ inverse. The full root cover of the
  base is not asserted to be a torsor.
- The smooth presentation is V=Spec A[z,q,q⁻¹]/(z^n−qf), with G_m action
  λ·(z,q)=(λz,λ^nq). The power-identification coefficient is q inverse.
  V→R is smooth in wild characteristic; a μ_p chart need not be smooth.
- The full zero fibre retains its nilpotents. Only its zero-section gerbe is
  its reduction Bμ_n after choosing a frame. Even Bμ_p is reduced as a stack,
  although its stabilizer group scheme is nonreduced.
- Regularity of the root of a regular Cartier divisor holds for arbitrary
  positive n, using the smooth G_m atlas and a regular local parameter.
- The exact DM condition is invertibility of n along V(s), not necessarily on
  all X. The empty divisor and Spec Z with s=2,n=3 are explicit checks.
- Finite inertia and coarse/DM conclusions are relative over a stack base;
  BG_m with a unit section detects accidental absolute assertions.

## Exact remaining work

1. **RS1-DIAGONALIZABLE-COARSE** (one request and the first gap). The present
   upstream §1.23 affine coarse theorem is stated for finite groups. Its tame
   base-change theorem presupposes a coarse space. Supply the finite
   diagonalizable group-scheme extension: for H finite abelian and B an
   H-graded finite locally free A-algebra with A≅B₀,
   [Spec B/D_A(H)]→Spec A is coarse for arbitrary algebraic-space targets,
   has the geometric-class property, has exact degree-zero QCoh pushforward
   and commutes with every coefficient base change. No invertible-order or
   Noetherian condition. Include compatibility with the existing constant
   étale-group case. The packet proposes this general addition as
   **Scheme and stack foundations, Part II: finite diagonalizable coarse
   quotients**, with that existing roadmap as first prerequisite. This run
   edits no extension files. The consumer is only native-coarse-space.
2. **RS1-NATIVE-SIGNATURES** (second gap). Actual geometric root, quotient,
   algebraic-stack and coarse carriers and their coherent monoidal interfaces
   are absent at the compilation pins. The reader specifies all domains,
   codomains, APIs and tests. Its omission ledger and the suggested file's
   ledger cover every geometric target and all 18 API/12 construction-test
   names. Once these suppliers are implemented, integrate these signatures
   over the actual carriers and check their comparisons. Do not introduce
   predicate-field surrogates or admitted data definitions.

These are the only remaining boundaries of this target-level pass. They do not
ask another worker to finish reading or decomposing an unstated target. No
implementation is claimed; stage closure awaits these exact inputs.

## Sources and verification

Read AGV08 arXiv v2 Appendix B.1–B.2 pp.52–54; Talpo–Vistoli arXiv v2
§3–§3.1 pp.12–16; AOV08 version of record Proposition 2.7 p.1067,
Definition 3.1/Theorem 3.2 pp.1077–1078 and Corollaries 3.3–3.5 with the
base-change proof pp.1078–1079. Read Stacks 023T, 05B2, 00NN, 07NF and
04YE/04YG at their stated locators. Read the relevant current SSF sections,
the two nearby AVB/JacobianChallenge READMEs, the accepted parent and both
adjacent follow-ups, exact supplier-node statements, the reviewed audit and
actual baseline declarations. No cleared restricted book was needed and no
source is missing. The finite-diagonalizable supplier statement is a library
planning gap, not an inaccessible-source claim.

Inherited source finding E12 is preserved with its accepted provenance. The
selected AGV preprint passage was reread; this run claims no new erratum
search, version-of-record collation or source-error discovery.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--RS.1.json`: zero errors, zero warnings, with the pinned declaration index.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--RS.1.lean`: elaborated successfully at the atlas pins; exactly five proof-admission warnings and no other diagnostics. Available memory was 84 GB before the successful run. No language server or library build was started.
- Intake file/path validation, admitted-data scan and final whitespace/scope checks are recorded with the submission.

The initial Lean check found a required noncomputable annotation and two
finite-ring example reductions; these were corrected before the successful
check. The two light definitions have real bodies. No compiler process remains
running. Scratch holds only disposable public sources, generation notes and
logs; everything a reviewer or subsequent worker needs is in the four
submitted files and immutable source URLs.
