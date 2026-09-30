# FIX-RT-AREA-ktheory-2~2 — packet boundaries and supplier maps

Agent: Codex. Session: `codex-rtOQ9t`. Date: 2026-09-30.
Issue: [#5158](https://github.com/CBirkbeck/tauceti-explorer/issues/5158).
Starting commit: `915ccd7`. The claim bot confirmed this session’s claim before work.

This continuation implements the permitted packet changes for confirmed findings
RT-AREA-ktheory-2/1–46, excluding rejected /34. It preserves the independent
verification and all earlier packet reviews and source issues. Earlier reviews
are historical; this revision needs its own independent review. It does not
claim that the mathematical theorems or the proposed Lean interfaces are built.

Only this report and the packet, reader and suggested-Lean files for
EllipticKTheory, HabiroNumberFields, EllipticRegulators, Polylogarithms,
K3BlochGroups, K2SymbolsBrauer--T.1 and ArithmeticKTheory--N.1 are changed.
Campaign files, integrated decompositions, reserved IDs, upstream roadmaps and
the excluded packets are unchanged. Findings /47–52 are not enumerated by this
continuation issue and are not added to its scope.

## What changed

There are seven new mathematical nodes:

| Node | Contract and proof boundary |
| --- | --- |
| `ArithmeticKTheory:N.3:finite-generation/function-field-steinberg-finiteness` | The affine function-field input to Quillen’s criterion, with the original [GQ82] integral Steinberg-homology proof explicitly unread. |
| `ArithmeticKTheory:N.3:finite-generation/affine-curve-finite-generation` | Apply the existing criterion with the function-field hypotheses. The number-field arithmetic-group theorem is not substituted. |
| `ArithmeticKTheory:N.3:finite-generation/proper-curve-finite-generation` | Pass from an affine complement to the proper curve using a finite closed boundary and S.3 localization. This gives finite generation, without claiming finiteness or prime-to-characteristic order. |
| `ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection` | The twisted **coinvariant** Picard injection used by CGZ Lemma 3.5; the original Keune proof and exact finite-module translation remain source/proof gaps. |
| `EllipticKTheory:E.5/harder-finiteness` | Separate low-degree reciprocity/tame-kernel inputs from higher-degree Bass–Tate, Geisser–Levine, localization and finite generation. |
| `K3BlochGroups:V.5/finite-field-bloch-comparison` | Hutchinson’s actual stabilization/Hurewicz map with the characteristic inverted, and its finite-field Bloch–Wigner exact sequence. |
| `K3BlochGroups:V.5/nonsplit-cartan-mod-n` | The norm-one Cartan homology map and its cyclic bar-generator comparison, in CGZ’s odd-prime scope. |

The stable `HabiroNumberFields:HB.2/hutchinson-refinement` ID now states the
**conditional algebraic implication** from compatible evaluations of η. Its old
unconditional conclusion was accompanied only by a prose caveat about a cyclic
dependency. The actual Nahm evaluation is already planned in the accepted
`HabiroNahmSeries:HB.4/acceptance-andrews-gordon`; assembling the unconditional
conclusion must occur after HB.4. The definition ε_m=c_m² remains early and valid
for every m. The published Chern-sign discrepancy remains open.

Regulator changes name C5/C6, CM.1/CM.4, Kato’s early unit/symbol interfaces,
Coleman D.1 and the early I.2 completed-unit proposition precisely. The generic
finite-Chern and real-Deligne interfaces are requested as **early parts of M.8**.
The current unsplit M.8 is not inserted as a prerequisite of its own earlier
consumers. P.5’s concrete Goncharov complex, ER’s elliptic applications and all
the existing weak/strong/abelian Leopoldt distinctions remain.

All seven readers are regenerated from the complete packets, including every
node statement, hypothesis, proof step, acceptance condition, API item, test,
use, source, request, gap and historical review. This accounts for most of the
Markdown diff. Existing node IDs are retained. The Lean files record the changed
supplier boundaries and the interfaces that cannot yet be honestly stated.
They are unchecked and **not compiled**; earlier compilation statements refer
only to their earlier revisions and environments.

## Finding dispositions

“Handoff” below means a specific required change outside the issue’s file
allowlist, not a claim that the external file has been corrected. Dependencies
are written supplier → consumer.

| Finding | Disposition |
| --- | --- |
| /1 | Added the N.3 function-field branch and E.5 Harder node. E.5 now explicitly concerns an elliptic curve over its full finite constant field. It imports T.2:symbols global Milnor vanishing, requests all three Geisser–Levine conclusions from M.5d and names M.6/M.7 plus the existing Tau elliptic Jacobian/Tate-module interface for the geometric/Frobenius calculation. Low-degree tame-kernel finiteness is a separate T.4 request. |
| /2 | HB.2 keeps the unknown-power comparison, the Chern η calculation, CRT and ε=c². The stable refinement node is conditional on the two η-evaluations and their compatibility. The unconditional comparison belongs downstream of the accepted HB.4 evaluation; see the exact HB.9 handoff below. No HB.4→HB.2 edge is added. |
| /3 | **BP-RefinedTraceMethods--RT.1:** expose Devalapurkar thesis Theorems 6.1.4 and 6.4.1, the image-of-J object j_{p,0} (Notation 6.2.8), the relative THH base S[[q^(1/p)−1]], the Frobenius twist and S¹×ℤ_p× equivariance for p>2. Keep Wagner’s p=2 argument separate. This is an upstream input or an explicit source gap, not a proof from the phrase “underlying comparison.” |
| /4 | E.3 rational injectivity already existed. It now names N.2 localization/even-degree injectivity and records that every closed residue field is a number field. A direct sum of torsion groups is torsion without a common exponent. The finite-field integral injectivity node already imports T.2/k2-finite-field and is retained. |
| /5 | ER.5 already imported CM.4 and AL.1. Added CM.1’s CM-curve interface and retained Bloch’s maximal-order, class-number-one E/ℚ specialization, conductor, bad Euler factors, finite character/Fourier data and U. Generic CM theory is not rebuilt. |
| /6 | ER.7 already imported Kato L0 modular units. Added the precise early L1 K₂-symbol request with norm/descent compatibility; retained character-specific boundary, Manin–Drinfeld, regulator, Rankin–Selberg and pushforward work. The whole late Euler-system stage is not introduced as a prerequisite. |
| /7 | ER.2 already imports P.5’s η-form and symbol regulator. Removed its unqualified whole-M.8 dependency in favor of the requested early real-Deligne interface; retained elliptic dimension, embeddings/conjugation, periods, orientation and torsion-lift work. Generic norm compatibility remains an import. |
| /8 | C5 was already requested. Added canonical current `ComplexComparisonPartII:C6` for Hodge/conjugation compatibility, retaining oriented lattice and period tests. The obsolete AlgebraicCurvesC spelling from the earlier report is not reused. |
| /9 | ER.6 already imports R29.6 and states the functional-equation comparison conditionally. Recorded the exact scalar L*(E,0)=wN(2π)^(-2d)L(E,2) for the stated completion and d=[F:ℚ]. R29.6 supplies E/ℚ; a general number-field functional equation remains a hypothesis, with the CM Hecke route separate. |
| /10 | ER.8 already imported ER.5’s class U and L-value theorem. Added the E.6 regular-model dependency and an explicit requirement for vertical certificates before claiming arithmetic integrality. |
| /11 | ER.8 already imported Coleman L1, D.5 and modular-symbol L1/L2. Retained them and made period normalization, exceptional factors and ordinary/supersingular scope explicit in acceptance. No p-adic L-function construction is duplicated. |
| /12 | E.7 integral-certificates already depends on E.6’s regular proper model and vertical residues; preserved it. Added those explicit prerequisites to the E.8 worked arithmetic certificates. ER.6’s potential-good-reduction argument is a genuine application, so it remains alongside the generic E.6 import. |
| /13 | Replaced the finite-field application of the infinite-field Suslin proof by the new V.5 finite-field map and Cartan nodes. HB.2 local maps now name both. Preserve characteristic-primary exceptions, q≥4, odd coefficients and CGZ’s specific q≡−1 mod n scope. Group orders alone do not identify the maps. |
| /14 | Added the N.6 Keune supplier contract and HB.1 import. Preserve Pic/p^m twisted coinvariants versus Pic[p^m] invariants, Kummer p-units versus ordinary units, and total-ramification valuation descent. Original Keune proof remains unread; the new node does not advertise a completed proof. |
| /15 | Added D.1 directly to HB.7’s section constructions and requested the exact Coleman D_p=Li₂+(1/2)log(z)log(1−z) normalization. **D.1/L3 owner handoff:** D.1→D.2 and V.4→D.2; do not replace regulator comparison by a five-term relation alone. |
| /16 | HB.6 already imports HR.1’s étale Frobenius lift and has no M.1 prerequisite in its packet. Preserve HC.3/HC.4 substitutions, completion and Frobenius gluing. **Maintainer:** remove the coarse M.1→HB.6 and unrelated KU-existing/KU-continuous links; redirect the RS-08 forwarded finite-Chern/Galois dependencies to HB.1. RS-10 is now accepted, not pending. |
| /17 | HB.1 already imports V.3’s CGZ/Suslin convention comparison. Retain its explicit 2-/6-primary and odd-coefficient qualifications; do not rebuild the comparison. **Maintainer:** update the HABIRO plan’s supplier pointer to V.3. |
| /18 | HB.1/HB.2 now request an early finite-coefficient Chern interface, with Soulé products, twists, Kummer normalization and base change. Removed whole-M.8 prerequisites. **M.5d and D.1 owners:** preserve the early finite-Chern route and audit trace-dependent M.7 pieces individually; no global assertion that all M.7 is an early foundation. The sign issue is retained. |
| /19 | Current T.2:symbols already has the general number-field and positive-characteristic global-field Milnor nodes, with its Bass–Tate proof gap. Added consumer contracts; V.2 now imports the actual number-field node and E.5 the actual function-field node. Do not create the second T.4 proof suggested before this newer packet existed. |
| /20 | V.2’s existing T.2:graded-map request remains the owner of the graded product map. V.2 keeps the degree-three specialization, decomposable image and indecomposable cokernel. No redundant product construction was added. |
| /21 | V.5/finite-field-transfer already specializes L.1’s all-degree theorem with injectivity/invariants and both composites; preserved it. **BP-KTheoryFiniteLocalFields:** supply the common theorem. The integration direction is **L.1→V.5**, correcting the verifier’s reversed arrow. |
| /22 | V.5 already requests N.5/N.8 for the ℚ, ℤ and ℚ(i) computations; preserve noncanonical free-generator warnings. **Maintainer:** N.5/N.8→V.5 integration and forwarded copies, without asserting N.8 lies in this issue’s N.1 packet scope. |
| /23 | V.6 already transports P.2’s real comparison and requests D.2’s p-adic one. Corrected its stale claim that P.2 fixes an exact scalar: P.2 gives nonzero rational proportionality; exact scalar/sign belongs to R.7. Keep early algebraic V.6 quotients/certificates separate from late formula nodes, so P.2 can import the former without a pair of opposite whole-stage edges. |
| /24 | P.5 now requests the early real-Deligne complex, products, conjugation and generic regulator definition before late R.7/D.2 comparisons. Its Goncharov current complex and comparison theorem are retained as distinct constructions. **M.8 maintainer split remains required.** |
| /25 | P.2’s current Tau geometric-topology request already imports hyperbolic geometry while retaining the oriented tetrahedron-volume/Bloch–Wigner theorem. **BP-ArithmeticQuantumTopology:** QT.5 imports that theorem and retains manifold triangulation/gluing and regulator-volume assembly; do not replan Tau Ceti’s geometry. |
| /26 | Added the early I.2 completed-unit map/strong-Leopoldt request to P.6, retaining the regulator matrix/equivalence/tests and abelian L4 result. Corrected the statement about the kernel of the uncompleted diagonal map: that map is injective; prime-to-p torsion is killed on passage to pro-p completion. **BP-IntegralIwasawaTheory--I.1 and BP-AutomorphicPadicLFunctions:** use the same early map and distinguish weak cyclotomic Leopoldt, the strong conjecture and Baker–Brumer. |
| /27 | Both P and V already record the analytic ownership correction. Retain V.3’s torsion-sensitive pointer/comparison nodes. **Maintainer only:** reserved-ID reconciliation and incoming references, detailed below; reserved-ids.json is outside the allowlist. |
| /28 | **BP-RefinedTraceMethods--RT.5:** import RT.4:q-Hodge and RT.4:Habiro-comparison before the Meyer–Wagner computation; HQ.3 enters through them. Theorem 3.14 uses Wagner 4.27 and 5.63. |
| /29 | **BP-StableHomotopyKTheory and BP-RefinedTraceMethods--RT.5:** H.6 must supply Burklund’s multiplicative Moore-spectrum/tower input with the actual E₁/E₂ hypotheses and coherences. An underlying cofibre E/m does not provide these structures; do not assert every S/m is E∞. |
| /30 | **BP-RefinedTraceMethods--RT.1:** name the solid-spectra extension of VS.2 and the Pstrągowski/Hahn–Raksit–Wilson even-filtration input; supply the actual étale E∞ lift and its hypotheses. Solid modules alone do not establish it. |
| /31 | **BP-RefinedTraceMethods--RT.1:** HR.6→RT.4:Habiro-comparison; import the Habiro-ring interface and correct the Wagner reference to Corollary 3.13, not 3.12. |
| /32 | **BP-RefinedTraceMethods--RT.1:** use the now-accepted RS-33 early `H.5:spectra` concrete smash/pairing/operadic interface, reexported through `H.5:S-delooping`. The old report’s pending-restructure assumption is stale. Keep K.7’s actual K-product downstream and never require the late EDS comparison to construct the early spectrum model. |
| /33 | **BP-RefinedTraceMethods--RT.1 and BP-KTheoryFiniteLocalFields:** RT.2 owns the genuine equivariant TC/TR comparison; L.4 imports it for fields/DVRs and keeps its arithmetic specialization. Do not duplicate the cyclotomic comparison in L.4. |
| /34 | **Rejected by verification; not applied.** Bökstedt’s THH construction and the finite-field periodicity computation are distinct. L.5 periodicity is not deleted. |
| /35 | **BP-RefinedTraceMethods--RT.1:** narrow RT.3’s early relative comparison to its proved scope; move henselian-pair rigidity to the later CMM/Part II supplier. Do not introduce a reverse dependency from early RT.3 to the late theorem that uses it. |
| /36 | **BP-RefinedTraceMethods--RT.5:** PR.4’s syntomic interface→RT.6, retaining the required completeness/base hypotheses and the actual comparison, rather than identifying syntomic objects by name. |
| /37 | **BP-RefinedTraceMethods--RT.1:** DD.0 exterior algebra and DD.2 de Rham→RT.1’s HKR comparison. RT.1 retains the HKR theorem and hypotheses; the imported de Rham complex is not already the full HKR equivalence. |
| /38 | **BP-SchemeAndStackFoundations and BP-SchemeKTheoryOperations:** SF.2 supplies generic Nisnevich topology/distinguished-square descent criteria, with empty-object and noetherian/dimension hypotheses. Scheme K-theory proves its own descent using that criterion. |
| /39 | **BP-SchemeKTheoryOperations:** R09.1 projective/flag geometry→S.5; R09.7a blowup geometry→S.7. Keep K-theory projective-bundle and blowup formulas as applications, not generic geometric reconstructions. |
| /40 | **BP-SchemeKTheoryOperations:** import Tau StableReduction layer 2 and JacobianChallenge C coherent pushforward/base change only on their actual curve/proper-flat scope. State additional general-scheme hypotheses and gaps; do not silently generalize a curve theorem. |
| /41 | **BP-KTheoryLowDegrees--Z.3, BP-MotivicEtaleKTheory--M.1 and BP-SchemeKTheoryOperations:** remove S.6→M.4 in favor of the later S.6→M.6b; remove S.6→Z.5 in favor of Z.3/S.2 inputs; remove S.7→Z.6 in favor of S.2/S.5. Apply to forwarded copies too. These are false dependencies, not missing proofs to schedule. |
| /42 | N.2 now imports S.3’s scheme localization. It retains arithmetic finite support, residue fields, extension compatibility, the three classical rows and even-degree injectivity. **BP-SchemeKTheoryOperations:** provide the shared localization interface rather than duplicating it in N.2. |
| /43 | **BP-RefinedTraceMethods--RT.1:** distinguish unstable integral BU/K₀ Adams operations from stable multiplicative operations after inverting k, or ℓ-completion with k an ℓ-adic unit. A unital integral periodic-KU ring map cannot send the invertible Bott element β to kβ for nonunit k>1. Preserve this obstruction in the proposed interface. |
| /44 | **BP-RefinedTraceMethods--RT.1:** import Tau DGAInfinity layer 8 Hochschild chains/derived Morita and layer 9 Chern character. RT retains cyclic operators, face/degeneracy compatibility, Connes B, mixed complexes, sum/product totalizations, SBI and its additional comparison work. Do not delete the cyclic construction as if Hochschild chains already supplied it. |
| /45 | **BP-SchemeKTheoryOperations:** import Tau DGAInfinity layer 5’s module Perf(A) and its compact/thick/retract characterizations for the actual base hypotheses. S.1 retains scheme-local perfectness and Perf(Spec A)≃Perf(A), comparing P7 on overlap. |
| /46 | **BP-RefinedTraceMethods--RT.1:** K.2:plus, K.5 and K.7→RT.3 for ring K-theory, relative fibres and products. Its multiplicative trace must use those actual functors, with an E∞ refinement only where supplied. |

## Exact integration handoffs

### Habiro comparison and the changed early contract

The accepted HabiroNahmSeries packet contains
`HB.4/andrews-gordon-radial-constant` and `HB.4/acceptance-andrews-gordon`.
CGZ Theorem 7.4 is therefore neither an unowned theorem nor a reason to duplicate
Andrews–Gordon/Nahm analysis in HB.2. HB.4 uses early HB.2 objects, so it cannot
become a prerequisite of HB.2.

The excluded packet’s `HabiroNahmSeries:HB.9/constant-term-is-the-unit` currently
depends on `HabiroNumberFields:HB.2/hutchinson-refinement`. This is the external
packet consumer found by the repository search. It must now either supply every
evaluation/CRT/normalization premise of that conditional implication, or import a
new unconditional comparison assembled at HB.5 after HB.4. Preserve its existing
δ^(-1/2) correction and source issue E46. No unconditional ε=R proof is claimed
for the existing dependency until this follow-up is integrated. HB.2 ε=c² and
root-line consumers that do not use R remain early.

### Foundation prefixes

M.8’s requested early finite-Chern prefix must export finite coefficients,
Kummer normalization, cup/product formula, twists, reduction and base change
before HB.1/HB.2 and D.2. Its early real-Deligne prefix must export the complex,
hypercohomology exact sequence, products and real conjugation before P.5/ER.2
and R.7. These are requests for a maintainer-approved split, not invented stage
IDs. Whole-stage M.8→R.7 or M.8→D.2 would reverse existing late dependencies.

Likewise, identify the early Kato L1 symbol export before adding an edge from the
whole Euler-system stage to ER.7. In I.2 place the completed-unit map before
the regulator/Leopoldt-defect applications; weak cyclotomic Leopoldt and the
abelian theorem are separate results and are retained.

RS-33 is already accepted: the concrete smash/pairing/operadic realization is
early `H.5:spectra`, reexported by `H.5:S-delooping`; K.7 owns the actual external
K-product. The earlier report’s fallback location must not override this route.

### Reserved IDs and coarse graph

The maintainer should reconcile the old V.3 analytic reservations with the
existing `Polylogarithms:P.1/bloch-wigner-dilogarithm`,
`Polylogarithms:P.1/bloch-wigner-five-term` and
`Polylogarithms:P.2/bloch-wigner-descent`. V.3 keeps the algebraic convention and
torsion-sensitive pointer comparisons. V.6’s regulator transport uses P.2’s
comparison, with exact normalization requested from R.7. The computation of the
order of the rational Bloch element c uses the **Rogers** argument, not the
Bloch–Wigner function, which vanishes at real points. Keep aliases/consumer
references until the reservations can be migrated together.

Coarse graph changes listed in /16, /21, /22, /28 and /41 remain maintainer/owner
work, including forwarded plan copies. This submission validates its actual
packet additions and does not advertise all those external changes as applied.
Existing Tau Ceti roadmaps are suppliers only; their files are not rewritten.

## Source and library evidence

The relevant reviewed library-coverage entries were read, including N.2/N.3/N.6,
E.3/E.5, ER.1/2/5/6/7/8, HB.1/2/6/7, V.2/3/5/6, T.2:symbols and P.2/5/6.
At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, full-tree searches for Keune,
Bass–Tate/Milnor K-theory, Harder and Geisser–Levine found no relevant
declarations. No new baseline declaration citation is introduced by this fix.

Freshly inspected primary texts:

| Text | Inspected scope | SHA-256 |
| --- | --- | --- |
| [Weibel chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) | PDF pp.61–62, III.7.2–7.3 global Milnor statements | `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307` |
| [Weibel chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) | PDF p.59, IV.6.8–6.9 and the two distinct arithmetic inputs | `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248` |
| [Weibel chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) | PDF p.20, VI.4.7; pp.23–24, finite/infinite Bloch scope; pp.37–39, Harder and geometric/descent formulas | `efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1` |
| [CGZ v3](https://arxiv.org/pdf/1712.04887v3) | p.20 Lemma 3.5, pp.23–24 §4.2, pp.37–39 Theorem 7.4 with proof | `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5` |
| [Hutchinson 2013 preprint v2](https://arxiv.org/pdf/1107.0264v2) | pp.14–15 Corollaries 3.6–3.9; p.33 cyclic bar formula; pp.34–36 Lemmas 7.1–7.4 and Corollary 7.5 with proof | `057ce8a6ae5548fd9f6279514adfa3afa5a6554ad1e58f9ca34bb4c62df52e94` |
| [Hutchinson Chern preprint v4](https://arxiv.org/pdf/2104.14413v4) | pp.5–8 Soulé formula, Theorem 3.1, Bott/Hurewicz proof and references | `e7a358154bf29701afcb1feb2308287f90e0fe405813d9548879dd5b2f2f30bf` |
| [GSWZ v2](https://arxiv.org/pdf/2412.04241v2) | pp.3–6 compatible roots/coefficient context; p.9 Definition 1.3; pp.37–38 Coleman normalization and unramified p>3 integral scope | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |

These are the specific author/preprint versions, not claims of inspecting the
published editions. Previous published/version records are preserved as
historical evidence. New sourceVersions entries distinguish the chapter PDFs
from the older combined K-book PDF.

A material version distinction emerged in /13: the separately hosted chapter VI
Theorem 5.2 states **infinite field**, while the combined 29 August 2013 draft
(checksum `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`)
states |F|≥4. The combined draft was freshly rechecked at PDF pp.495 and 507;
the older packet quotation is accurate for that version. Historical source
issue E18 concerns its finite-field **proof** gap and is preserved. V.5 and V.6
now use Hutchinson Corollary 7.5 for the finite-field route. The natural kernel
is the enhanced Tor term; its abstract μ̃ identification is not made natural by
fiat. The characteristic must be inverted in unstable H₃: integral
H₃(SL₂(F₅),ℤ) cannot simply be replaced by ℤ/24.

Open proof work is explicit: the original [GQ82] and Bass–Tate proofs, Keune’s
injection/finite-module translation, the refined Bloch–Wigner complex underlying
Hutchinson’s finite-field corollary, and the existing Chern-sign comparison.
The selected Hutchinson corollary proofs were read; its full Theorem 4.3 proof
was not claimed as decomposed. No inherited source issue was deleted or
self-accepted.

## Validation

- All seven packets pass `scripts/check_blueprint.py`: zero errors. The four
  existing Polylogarithms warnings concern reserved Borel nodes not yet written.
  No declaration index is available, so that tool checks baseline reference
  form; new baseline citations were not added.
- Source-version validation passes for all seven packets. Old review,
  sourceIssues and baseline objects are unchanged; every original node ID
  remains. Every string in every node appears in its reader, including APIs,
  tests and mathematical hypotheses.
- The freshly assembled atlas has 2,891 dependency vertices and 8,258 stage
  edges and is acyclic. Adding all 33 new cross-stage packet prerequisites
  together remains acyclic. Requests for uninstalled early prefixes are not
  misrepresented as graph edges.
- Exact arithmetic checks: 934 finite-cyclic reductions under the odd and
  coprimality hypotheses; the q=7,n=3 failure when those hypotheses are dropped;
  172 CRT exponent-compatibility cases; the retained E/F₂ Frobenius-order
  examples 13 and 41. These check arithmetic and scope, not the unbuilt
  K-theoretic or analytic theorems.
- All 22 changed deliverables pass the worker file rules and `git diff --check`.
  No Lean/Lake build, cache fetch or LSP process was started. There is no
  matching pinned build in this workspace, so compilation is not claimed.

All 45 confirmed findings enumerated by #5158 have an implementation,
verified already-present correction, or the exact excluded-owner handoff above.
Rejected /34 is untouched. The integration and mathematical proof gaps remain
visible for the independent reviewer and the named owners.
