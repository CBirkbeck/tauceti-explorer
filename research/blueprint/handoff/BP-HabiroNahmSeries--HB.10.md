# Handoff — BP-HabiroNahmSeries--HB.10

Issue #6505. Agent Codex, session `codex-1lQhT3`. The bot confirmed the claim on 6 October 2026 at 04:23:13 UTC. Submission branch: `codex-1lQhT3-habiro-hb10`. This is a completed target-level planning pass, with packet status `complete` and the sole stage `HabiroNahmSeries:HB.10` marked `planned`. It is not a checkpoint and does not claim formalisation or a closed stage.

## Deliverables and counts

The packet adds 14 nodes: 2 definitions, 5 theorems, 4 applications and 3 comparisons. The two definitions have 9 API items and 9 unit tests, all present under matching names in the reader and suggested file. There are 4 new planets, which join the parent's 2 for a total of 6 at HB.10. There are 12 recorded baseline declarations, 5 gaps and 3 requests. Every implementation status is `unchecked`.

The reader is about 4,200 words and covers all stage targets. The accepted parent packet is imported and unchanged. The concrete additions are the positive-order Gauss Taylor family, odd-prime gluing with its obstruction at 2, the selected quartic coordinate vector, exact Nahm/Hessian certificates and integral basis, the cubic Laurent formula and corrected root constant, and explicit degree-zero exports. The quartic module, Picard transport and geometric comparison carry their exact restrictions and outstanding inputs.

## Disposition of the parent coverage

| Parent open item | This pass |
| --- | --- |
| Rational-example rescope | Retained R1. The rational example is the Gauss family over ℤ[1/2]. The figure-eight example is abelian over ℚ(√−3); the cubic and D₄ quartic are separate fields. No rational Nahm solution is asserted. |
| Wagner thesis not read | The actual public thesis was fetched and Part I §2 and §3.2 read in full; §9.3 was screened. Its étale comparisons supply the degree-zero export. No matching all-descendant small-prime proof was identified. The unread-source gap is resolved without treating the missing proof as supplied. |
| Cubic Theorem 12 at 2 and 3 | Retained as an exact all-component integrality and Frobenius-gluing obligation for every independent shift. The unshifted GW route requires repair of equation (182) and proof of its higher Taylor and p-completion steps. |
| No export maps | Relative dimension zero is now specified by η_R=H⁰(d_R)⁻¹∘κ_R⁻¹ through HR.5, HR.6 and HQ.5, preserving all Taylor maps and completion. Global line transport inherits HB.7's gaps. The higher geometric naive-to-algebraic map remains an exact request. |

## Confirmed red-team finding

`RT-AREA-topology/11` is handled in the packet and reader. HB.10 imports formal knot-derived Nahm matrices. QT.6 owns knot-invariant identification, Neumann–Zagier topological content, presentation/triangulation independence and state-integral comparison. The packet proposes HB.4→QT.6 and HB.8→QT.6 for the analytic estimates and formal Gaussian integration. It states no topological identification and therefore adds no QT.6→HB.10 edge. Applying those owner edits belongs to the orchestrator or a QT.6 job; this submission edits no QT.6 deliverable.

## Source issues requiring independent verification

**E64, error in an auxiliary proof formula.** In Garoufalidis–Wheeler, arXiv:2505.19885v1, §3.2 equation (182), also retained in the author copy, take A=3 and m=2. Proposition 1.14 gives the T² coefficient at q=−1 as the Gaussian polynomial [8 choose 2] evaluated at −1, namely 4. The printed root constant is (1+T)/δ(T²), where z=1+T²z³ and δ=z⁻³(3−2z), whose T² coefficient is 5. The corrected scalar expression is (z⁻¹+T)/δ, starting 1+T+4T²+5T³+21T⁴+28T⁵. The general corrected scalar numerator is stated in the reader with a_ℓ=floor((3ℓ+2)/m), b_ℓ=(3ℓ+2) mod m and the factor z^{a_ℓ−2}. No corrected arbitrary-rank formula is claimed, and the finding does not disprove Theorem 1.13.

To reproduce the arithmetic, compute Gaussian polynomials by the finite recurrence [n choose k]_q=[n−1 choose k]_q+q^{n−k}[n−1 choose k−1]_q and evaluate at −1. Separately iterate z=1+t z³ modulo t¹⁰ and verify z^{a+1}/(3−2z)=Σ_h binom(3h+a,h)t^h for a=0,1,2. Thirty Gaussian specializations and ten coefficients in each profile were checked with exact integers/rationals. These finite computations check the counterexample and the derived formulas, not all-prime Habiro membership.

**E65, harmless cross-reference misprint.** The §3.1 proof of Theorem 1.11 says “To prove Theorem 1.13”; it concerns f_A and should reference Theorem 1.11. The separate symmetrisation proof is §3.2. Both the preprint and author copy retain this text.

The packet imports the parent's existing corrections and the HR.5 cyclotomic-algebra corrections. In particular it does not rely on Wagner's false irreducibility assertion after reduction at a coprime prime, and it keeps the quartic polynomial discriminant distinct from the field discriminant. No owner packet was edited.

## Sources and reading scope

All public PDFs were fetched on 6 October 2026; URLs and full hashes are in the packet.

- GSWZ, arXiv:2412.04241v2, 27 August 2025, 73 pages: §§1.4–1.9, §3.3, §§4.1–4.3 and the target-relevant §4.7 examples. The general proof machinery is imported from the parent.
- Wagner, *q-Hodge filtrations, Habiro cohomology, and ku*, author thesis, 230 pages: Part I §2, printed pages 27–33, and §3.2, pages 39–41, in full; §9.3 screened for the claimed Nahm application. This is the actual thesis, not the q-Witt preprint arXiv:2410.23078.
- Wagner, *q-Hodge complexes over the Habiro ring*, author copy dated 14 January 2026, 82 pages: §2.2 Lemma 2.12 and Corollary 2.13; §3.2 Corollary 3.13.
- Garoufalidis–Wheeler, arXiv:2505.19885v1, 26 May 2025, 47 pages: §§1.1–1.3, §§1.5–1.6 and §§3.1–3.3. The author's 21 May copy was checked for the affected formulas. The arXiv history and author-page searches located no erratum.

Two nearby upstream documents were read completely before writing: GlobalNumberFields and ArithmeticDirichletSeries. The reviewed library audit, the complete issue, the parent HB.10 nodes, the relevant link records, and exact supplier-node statements were read. Missing mathematical sources are an exact quartic five-term/K₃ certificate, a certified tame-kernel computation, and a geometric naive-to-algebraic comparison; no citation is invented for any of them.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.10.json`: **0 errors, 0 warnings**.
- The suggested file was checked with `lean-check` in the shared build at exactly Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: **exit 0, only 28 declaration-uses-`sorry` warnings**. It imports individual Mathlib modules and no Tau Ceti module, so elaboration does not depend on the shared checkout's newer Tau Ceti working commit. No language server or package build was started. Available memory was over 100 GB before the final check.
- All 12 baseline statements were read at the recorded pins; the Tau Ceti integral-basis discriminant statement was read from commit `f790474821cf4256814db967cb154e7af3d0c369`.
- Exact rational polynomial-quotient arithmetic checked both quartic Nahm equations, the Hessian identity, δ inverse, all basis products, the trace Gram matrix and determinant, all five norms, the cubic δ inverse and its alternative degree-two coefficient. The integral-basis theorem uses the imported field discriminant and the determinant-square comparison; the arithmetic script does not assert a new number-field discriminant theorem.
- A consistency check matched every short source excerpt to whitespace-normalized PDF text and every API/test name to both the reader and prototype. The document contains no scope-deferral labels or Lean code. No source PDF, extracted text or private path is committed.

The direct errata-job checker is for the separate `errata-v1` schema, so it is not a checker for this part packet. Source-issue fields and version records are validated with its helpers against roadmap id HabiroNahmSeries.

## Exact continuation

A follow-up must prove the cubic local inputs at 2 and 3 for all components and shifts, starting with the scalar repair of GW (182), finite cyclotomic Taylor jets, and the uniqueness argument in the correct completed coefficient algebra. QM.0 is the requested supplier for q-Lucas and those finite jets.

For the quartic, provide an exact five-term certificate for 60([u]+[v]), then check the K₃ lift fibre before any 60th-power ring conclusion. ArithmeticKTheory N.6 must compute |K₂(O_F)| and all its prime divisors; the symbolic excluded integer already includes it. The current restricted membership theorem does not require the claimed exact torsion order.

For the line export, supply the finite étale scalar-change interface already requested by the parent HB.9 membership node, and close the HB.7 addition/nonzero/tensor-bijectivity gaps recorded as HabiroNumberFields/E23 and prove an extension of any selected restricted series. For geometric exports, supply X/B and ω, the required convergence and Frobenius conditions, and the naive-to-algebraic comparison through the proposed cohomology Part II, then compose the separately qualified HQ.8 realizations. Preserve the concrete degree-zero map and its completion squares.

The worker stops after opening this pull request and does not claim a second issue. Its scratch computations and downloads are removed after submission; all information needed for review or continuation is in these deliverables.
