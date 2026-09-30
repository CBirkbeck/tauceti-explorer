# Independent verification: EVW16 red-team findings

Codex — codex-rtOQ9t; issue #4123; 30 September 2026.

All 16 findings are confirmed: 9 medium and 7 low. Several proposed fixes
need the qualifications below. The verdicts verify actionable defects in the
extraction; they do not accept every phrase of the red-team report or amount
to a new review of the entire paper. No target extraction was edited.

## Independence and evidence scope

The extraction records codex-a71f92, codex-c83e7a and cc-442dc5; its prior
review is cc-7b31c4 and its red team cc-f805bf. This session did none of those
jobs. I read the complete red-team finding set, all targeted item statements
and dependencies, the three routes, the relevant prior review corrections,
source-issue metadata and the current errata-register entries.

A fresh [published EVW PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf)
was retrieved on 30 September at 10:22 UTC: 58 pages, SHA-256
`6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6`.
The current bounded reading covered printed pp.729–731,733,738–740,743–745,
754,757–759,767–770,772–776 and777–782, including the pertinent proofs.
Printed pp.729,754,757 were also inspected as rendered page images. This is
not a claim to have freshly read the whole paper or all recursive suppliers.
The [current arXiv listing](https://arxiv.org/abs/0912.0325) and
[publisher record](https://annals.math.princeton.edu/2016/183-3/p01) were
checked for the abstract/version discrepancy; a bounded title/correction
search found no correction to that discrepancy. Novelty is not established.

The [Katz–Lang author-hosted published scan](https://web.math.princeton.edu/~nmk/old/AbsFinThm.pdf)
was retrieved at 10:24 UTC, SHA-256
`ca9c988993f724d2b6a3da4c38bda4c2fcaf3b45735d40503c290315ef77a201`.
Printed pp.295–296 (PDF12–13) were read, including displayed (2.4), as
rendered images because the extracted text omitted formulas. The source
identifies abelian torsors with homomorphisms from Jacobian torsion; its
connected case retains the chosen coefficient-group action.

For the tame-boundary overlap, the [KP25 journal PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01357-6.pdf)
was retrieved at 10:26 UTC, SHA-256
`0691a57a2aae841419ee97b8fac68aa8f3d499ed884933422a388106febab576`.
Printed pp.312–314 were read, including footnote3. The
[initial preprint](https://arxiv.org/pdf/2303.03863v1), SHA-256
`ed38bd1baf9d052dc8ef767a5d959e332233087c4f003774e8b8cb6ec651be7b`,
was read at PDF7, including Remark2.2 and its valuation argument.

Repository evidence includes WOOD-19/86,/134,/255,/259 and their routes;
LWZB24's IG routes; LL24/51,/113 and their mapping-class owner;
KP25/015,/016,/019; IG.0/IG.1/IG.3/IG.5, ST.5, SF.2 and C4 stage
contracts; the relevant reviewed coverage entries; the partial IG and ST
packets; AlgebraicCurves Layers3/10, GeometricTopology Layer3,
UniversalCovers Stage4, and JacobianChallenge LayerF. The external PR196
comparison contract records SF.2 as integration owner and still requires
supplier verification. C4 does not itself promise general Riemann existence.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` I read the actual
statements and proofs in `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean`
and `Covering.lean`. Finding6's generic declarations exist with the required
hypotheses. There is no new Mathlib library claim; the programme baseline
remains `082e2d37e8b0463410cdb532e111cd43d5a66174`. No Lean file was
required or compiled.

## Verdicts and corrected fixes

The review JSON contains the complete reason for each exact finding ID.

| Finding | Verified defect | Required qualification |
| --- | --- | --- |
| 1 | IG and its stability extension depend on each other. | Move shared foundations, then remove the residual /22→/18 back-edge. |
| 2 | IG /137 imports statistical /100 while statistics imports IG. | Move the application-specific multiplier quotient to ST.5 and register its incoming stage contracts. |
| 3 | Hurwitz tuple/monoid foundations have two owners. | Share arbitrary-tuple foundations; distinguish Wood's product stabilizer from EVW's sum U_D. |
| 4 | /69 bundles the shared ordered-to-unordered comparison. | Reference the IG.5 comparison; retain the n-uniform stability assembly in the Part II. |
| 5 | Mapping-class/diffeomorphism inputs lack their existing owners. | Distinguish pure from full groups, compact marked discs from noncompact punctured surfaces, and the small-n cases. |
| 6 | Generic asphericity carriers and transfer theorem are uncited. | Only the generic supplier is library; the concrete Hurwitz adapter remains unbuilt. |
| 7 | Class-group and genus foundations are replanned. | Import AlgebraicCurves and the scheme/Picard dictionary; keep only the family-specific adapter. |
| 8 | Artin and Riemann-existence comparison contracts are absent. | Use exact owners and hypotheses; C4's Chow/GAGA scope does not imply the full cover equivalence. |
| 9 | Jacobian torsion does not yet classify the fibre in the dependency graph. | Preserve the specified A-action; Aut(A)-orbits are the wrong counting object. |
| 10 | Finite-level fixed-multiplier lifting is left implicit. | Supply the coset argument from Sp reduction and factorization through T/ell^k. |
| 11 | The abstract's all-q consequence exceeds the written moment-one proof. | Record a proof-scope gap, not a false positivity theorem or a fixed-q limit. |
| 12 | Proposition4.13 lacks a closing max parenthesis. | Record the typographical error; the extracted bound is already the intended one. |
| 13 | The review's replacement locator still names the wrong statement. | Connectivity is the unnumbered proposition and Proposition5.6; the differential is Lemma5.4. |
| 14 | Horizontal boundary tameness is assigned twice. | Put the shared lemma below both consumers; do not add an IG-to-Part-II back-edge. |
| 15 | Version records are absent and supplier errors are grouped under EVW. | Preserve historical reading attribution and distinguish preprints/author copies from publisher collation. |
| 16 | Report locators and exhaustive-coverage claims are stale. | Also qualify the JSON summary; a conjecture must never become a proved dependency. |

## Dependency and arithmetic checks

With edges directed from consumer route to supplier route, the current JSON
gives 2→1, 1→2, 3→1, 3→2 and 2→3. For example,
2→1 includes /15→/12 and /16→/10,/14; 1→2 includes /18→/15,/16;
2→3 is /137→/100; 3→2 includes /99→/137. These are recorded edges,
not inferences from subject names. Acyclicity of the item graph is compatible
with this cyclic grouping of its items.

After relocating /22 to IG.3, its present dependency on topological gluing
/18 must also change. Concatenation of words respects the two block braid
actions directly. It therefore supplies the orbit-monoid operation before
one constructs the compatible gluing of topological covers. Similarly, the
shared horizontal-tameness lemma belongs below both specialization consumers.
Merely cross-referencing the KP extension from its parent is not a repair.

For finding11 let ell be odd, g≥2 and A=F_ell². A surjection is an ordered
independent pair in the dual symplectic space. Its alternating pairing a is
invariant under Sp. All a occur: use an isotropic pair for zero and a
rescaled hyperbolic pair otherwise. Witt extension gives transitivity at each
fixed a. There are exactly ell orbits; −I preserves them. When q≡1 mod ell,
the multiplier-q coset at this level equals Sp, so all are Frobenius-stable.
This invalidates use of the single-component step in that congruence class.
It is consistent with a different distribution having positive masses.

An independent finite diagnostic enumerated all 6,240 ordered independent
pairs in F₃⁴. Acting by the symplectic transvections
x↦x+ω(x,a)a gave three orbits, with pairing values and sizes
(0,1920), (1,2160), (2,2160); each was stable under simultaneous negation.
The general argument above is the justification, while the enumeration is a
check on the proposed witness. The error estimate in EVW is a large-q
estimate: these computations assert no fixed-q limiting distribution.

For finding9, the appropriate generic contract is an A-equivariant torsor
classification. Connectedness selects surjections. Dividing by all
Aut(A) would forget data used in the moment; only the later hyperelliptic
involution gives the existing /±1 quotient. For finding10, choose the
integral multiplier-q element diag(qI,I), translate the finite-level coset
to Sp, lift there, then translate back. This gives the precise short adapter
missing between /135 and /106.

## Validation and handoff

The red-team review validator passes. Intake accepts the review JSON, this
report and the handoff with zero problems. All 16 finding IDs occur once,
with nonempty reasons; none was added or silently omitted. Whitespace checks
pass. This review authorizes only the stated corrections and qualifications;
it does not reclassify the whole extraction or re-verify supporting-source
errors E15–E19. No scratch file is needed to resume the fix work.
