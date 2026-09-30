# FIX-RT-AREA-etale~2 — scoped blueprint fixes

Issue: [#5155](https://github.com/CBirkbeck/tauceti-explorer/issues/5155). Agent: Codex. Session: `codex-rtOQ9t`. Base: `10b68f9`. Date: 2026-09-30. Claim comment `5918386319` was confirmed by the bot in `5918388751`; the issue was reread after confirmation.

This completes the changes authorized in the two finished Habiro blueprints. It does not install draft roadmaps or edit the atlas. Both packets remain partial, and all proposed mathematics remains unchecked. The independent fix review must decide acceptance; the earlier packet review records have been preserved as history.

## Result and current ownership

The HQ packet has 122 nodes, 212 API items, 129 planned tests and 30 planets; the relative-ring packet retains its 50 nodes, 164 API items, 81 planned tests and 13 planets. The HQ reader previously described only 66 nodes. Both readers are regenerated from every packet node and its hypotheses, proof steps, acceptance conditions, prerequisites, sources, API, tests and uses, with the complete gap/request/source-issue and historical review records. Their reconstruction also removes stale statements that the Meyer–Wagner source was unobtained or RS-10 was unaccepted.

**RS-10 round 2 is accepted**, with independent review dated 2026-09-29. The assembled atlas at this base nevertheless has zero stages for `QWittVectors` and `AnalyticHabiroStack`. Acceptance of a restructuring does not install those stages. Its accepted interim owners therefore remain active:

| Current supplier | Transfer only on promotion | Work retained by the current supplier |
| --- | --- | --- |
| HR.1 | Λ/Adams/perfect-cover material → QW.1 | Étale p-complete Frobenius lifts, relative Frobenius and completed base change |
| HR.4 | Big/q-Witt degree zero, ghosts, F/V, restriction obstruction and étale base change → QW.2–4 | Finite Habiro quotients, staticity, complete étale lifts, transitions |
| HQ.1 | Complete framed q-de Rham/q-Hodge differential prefix → QW.6:framings | Global gluing, rational and p-complete comparisons, q-connection modules |
| HQ.4 | Positive-degree q-de Rham–Witt, ordinary CR.4 comparison, smooth animation and ghosts → QW.5/QW.7 | Raw uncompleted framed Habiro ring/Koszul construction |
| HQ.4 twisted branch | → HQ.2 in the same transaction as the q-Witt imports | HQ.3 keeps the twisted q-Hodge descent and its comparisons |

Move nodes, supplier requests and consumers together. In particular, do not turn the absence of QW stages into a missing current supplier, delete dependencies to conceal work, or plan the same theory twice. PR.6 retains its q-PD site/envelope and p-complete q-crystalline/prismatic theorem; the shared frame calculus is distinct. The q-PD pair ideal `(q−1)` and prism ideal `([p]_q)` remain distinct.

The new raw HQ.4 construction feeds HQ.3. The latter owns the identification with its descent object and Corollary 3.54. No HQ.3 → HQ.4 prerequisite was introduced. This follows the current accepted RS-10 correction, superseding the reverse-edge proposal in the earlier fix report. Likewise the new derived-descent supplier request goes to draft `AnalyticStacks:AS.3`; HS.1 is a downstream consumer of HQ.1, not a prerequisite imposed back on it.

## New mathematics and retained proof boundaries

Four nodes were added:

1. `HQ.1/modules-with-framed-q-connection`: a finite-projective module over `R⟦h⟧` with commuting coefficient-linear operators satisfying the twisted Leibniz rule. It records horizontal morphisms, the unit, reduction at `h=0`, API and four tests. Scholze Definition 7.3 supports the framed definition; Conjecture 7.5 is not upgraded to a theorem.
2. `HQ.1/modified-q-connections-on-a-torus`: commuting invertible semilinear automorphisms Γ_i over a Laurent torus with q a unit. The normalized operator is `x_i⁻¹(Γ_i−id)`, so Γ_i = id + x_i∇̃_i. No division by q−1 occurs. Tensor products use Γ_i⊗Γ_i. Arbitrary modified connections need not be congruent to identity modulo h; the example Γ=2σ over Q gives a constant obstruction to division by h. The ordinary-to-modified comparison states completeness and continuity/regularity requirements separately.
3. `HQ.1/torus-descent-for-modified-q-connections`: outlines the inverse correspondence between the semilinear module data, Z^d-equivariant modules and modules over the skew group ring, including negative powers and morphisms. The derived QCoh equivalence requires homotopy-coherent descent and remains a specific supplier gap. The quotient is the action-groupoid stack, with no assertion that the action is free. V5A4 was not obtained; none of its printed claims is certified.
4. `HQ.4/the-uncompleted-framed-habiro-koszul-complex`: imports the relative ring from HR.5, specifies lifted scalings, divisibility/regularity and commuting divided operators, and applies the existing Koszul construction. Its toric rescaling has no q−1 denominator. HQ.3 consumes the model for the unproved identification; it no longer owns its raw construction.

The generic framed prefix now explicitly covers I-completely étale framings for I=(q−1) and I=(p,q−1), the flatness/regularity needed to divide by `(q−1)T_i`, and completed-base-change compatibility. The prefix is independent of positive-degree q-Witt theory. The Theorem 3.11(b) object remains the **uncompleted Habiro–Hodge complex modulo q^m−1**; completing at q−1 is a different comparison.

The perfectness gap now lists four actual obligations: compatibility of RΓ with derived reduction/base change; finite-level proper-cohomology perfectness; uniform Tor-amplitude/finite presentation through the tower; and a suitable complete perfectness criterion. Appendix B's completeness and vanishing detection does not prove the latter. The source claim is over the **Habiro completion of H[1/N]**, with every prime at most the relative dimension inverted, and remains an introduction-only assertion. The old Lean signature expressed `IsFinitelyPresentable` in an arbitrary category, which does not express this perfectness theorem; it has been removed, with the missing typed interface explained.

The two Lean files retain their existing scaffolding and explicitly mark the current version uncompiled. New signatures reuse native projective/finite modules, semilinear equivalences, adic completeness and the existing Koszul differential. They include the expressible API/tests. The derived quotient-stack comparison and the raw Habiro-versus-completion non-example cannot yet be stated against the imported interfaces; they are explicitly documented rather than encoded by opaque propositions. No new theorem is claimed formalized.

## Disposition of every finding

“Handoff” below means the issue explicitly excludes that owner's files, or the required change is an atlas/paper/plan mutation outside the seven deliverables. It is not a claim that the other job is completed. The earlier `RT-AREA-etale.fixes.md` remains the detailed specification for those mutations; this report preserves the verifier's corrections and does not reproduce the original attack as an accepted theorem.

| Finding | Disposition |
| --- | --- |
| /1 | Handoff to BP-DeligneWeightsAndPurity--DWP.0 and the LPV Part II design: separate equidistribution and geometric monodromy from spectral bookkeeping; keep the moduli-family passage and scalar normalization explicit. No paper-route file is authorized here. |
| /2 | Handoff to BP-SchemeAndStackFoundations and EDC Part II: one general-base regular-pair absolute-purity theorem, with its supported-cohomology imports; do not identify it with smooth-pair purity. |
| /3 | Handoff to BP-EtaleDualityAndPerverseSheaves--EDC.0 and --EDC.4: shared stack coefficient extension with actual finite-type/stabilizer/representability/coefficient hypotheses. Arbitrary Artin-stack operations do not automatically preserve bounded constructibility. |
| /4 | Handoff to BP-AdicCoefficientsAndComparisons and StableReduction Part II: pointed stable range 2g−2+n>0, finite covers and compactification needed by the scheme-alteration prefix. |
| /5 | Handoff to BP-ClassicalAdicEtaleCohomology--H4: relative smooth pure-dimensional duality beyond curves, with tautness, separation, quasi-separated target and prime-to-residue-characteristic torsion hypotheses. |
| /6 | HQ packet already distinguishes Theorem 4.22(a) from the spherical-lift (b) node at HQ.5-trace; retained and reflected in the rebuilt reader. MW v4 Lemma 3.16 remains the divided-power lift supplier, 3.17 auxiliary. RT.4:q-Hodge request now explicitly includes ku Theorems 4.14/4.16/4.17, including p=2 in the E1 case; preserve the separate 2-inverted E2 theorem. R∞ is the p-completed base change and is the object that must lift. RT/PLAN file mutations remain maintainer handoffs. |
| /7 | Handoff to BP-FiniteFieldsAndCharacterSums: uniform quasi-projective estimates with bounded model/boundary data and geometric Chebotarev, keeping constant-field and permissible-class restrictions. |
| /8 | Paper-record handoff under the earlier report: supplier corrections must preserve arithmetic adapters, including Eichler–Shimura, and the distinction between accepted and proposed routes. None of those paper files is authorized here. |
| /9 | Handoff to BP-DeligneWeightsAndPurity--DWP.0 and BP-PadicDifferentialEquationsAndRigidCohomology: import generic weight predicates into the p-adic application; retain the p-adic estimates and isocrystal-specific theory. |
| /10 | Rejected. Retain RS-17's arithmetic pencil adapter and independent early prefixes. |
| /11 | EDC/RelativeTraces design and paper-record handoff: one general-base regular-immersion class before its purity-isomorphism theorem; do not assert purity in a singular ambient scheme. |
| /12 | Characteristic-zero microlocal Part II handoff: conormal/index/Gauss-map foundation and coefficient comparison, retaining application-specific convolution criteria. Positive-characteristic Saito theory does not by itself supply this branch. |
| /13 | Yun–Zhang paper-record handoff: import Mathlib's existing Serre-class quotient machinery, retaining Ind-category universe and constructible-perverse obligations. This issue does not edit that extraction. |
| /14 | Handoff to BP-FiniteFieldsAndCharacterSums and Fourier consumers: one finite-étale-torsor/isotypic Artin–Schreier construction with trace/scalar-pullback conventions; preserve Kloosterman and local Fourier applications. |
| /15 | Handoff to BP-AdicCoefficientsAndComparisons and BP-ClassicalAdicEtaleCohomology--H0: distinguish general coherent-scheme continuity, valuation-base Huber specializations, and the broader ULA/oriented-topos theorem. |
| /16 | Handoff to BP-EtaleDualityAndPerverseSheaves--EDC.0 and --EDC.4: explicit pfp-perfect-space and equivariant extension, importing Witt geometry and invariance; retain the G_m-monodromic condition for hyperbolic localization. |
| /17 | Handoff to BP-AdicCoefficientsAndComparisons and BP-EtaleDualityAndPerverseSheaves--EDC.4: reconcile the coarse L3→EDC.6 dependency with the already identified fine suppliers. This is graph integration, not a new proof of those comparisons. |
| /18 | Handoff to BP-LefschetzPencilsAndVanishingCycles--LPV.0: choose and source-close the topological comparison or algebraic semistable route. No blanket downstream LPV.7→LPV.2 edge. |
| /19 | Queue-generator handoff: merge shared design briefs/provenance before assigning one job id. Both relevant paper reviews were revise in the verification, so do not describe the latent collision as an active accepted job. |
| /20 | Handoff to BP-ClassicalAdicEtaleCohomology--H0 and Arc consumers: share the matching proper GAGA comparison; retain the separate algebraic Gabber rigidity theorem and justify nonnoetherian variants. |
| /21 | Handoff to BP-AdicCoefficientsAndComparisons, BP-SchemeAndStackFoundations and BP-PadicDifferentialEquationsAndRigidCohomology: one scheme-alteration prefix, distinct from analytic and descent applications, with pointed-moduli input. |
| /22 | Prime-to-degree alteration Part II/paper-record handoff: preserve field and excellent regular one-dimensional-base scopes, log-modification/equivariant proof branch, degree control and projective DVR application. Ordinary de Jong alterations alone do not prove this. |
| /23 | Handoff to BP-AdicCoefficientsAndComparisons: SF.2's repleteness and left-completed étale/pro-étale comparison supplies L1, then L3; ordinary unbounded D(X_et) is not generally left complete. |
| /24 | Rejected. Preserve E4's generic coefficient reconstruction and L0's étale restriction/application handoff. |
| /25 | Handoff to BP-AlgebraicModuliForArithmeticGeometry--A0-extension and AnalyticStacks: shared classical coherent duality plus the explicitly broader universally coherent-base extension; retain AS's derived/solid realization. |
| /26 | Handoff to BP-ClassicalAdicEtaleCohomology--H0 and the precise P5 limit extension: finite-stage henselian comparison followed by a later perfectoid-limit suffix; no blanket perfectoid requirement on the early prefix. |
| /27 | Updated both packets/readers and the HR prototype's ownership notes to accepted RS-10 with the conditional table above. No premature transfer to absent QW stages. Historical HR warnings about already-removed reverse HR.6 dependencies and the already-imported degree-zero obstruction are corrected. |
| /28 | HQ.1's framed differential node now names the I-complete étale, flatness/regularity and completed-base-change obligations. The shared prefix is temporarily HQ.1, then QW.6:framings, independent of QW.5. PR.6 keeps its own comparison. BP-PrismaticCohomology--PR.0 carries the prismatic-side handoff named by this issue. |
| /29 | Added the four nodes above, API/tests and signatures. Split the raw model from the HQ.3 identification, with the latter still a gap. The twisted branch moves to HQ.2 only with its QW imports in one promotion transaction. Corrected the earlier shorthand Γ=id+∇̃: for normalized ∇̃=(Γ−id)/x, the formula is Γ=id+x∇̃. |
| /30 | Strengthened the HS.3 request with named draft SolidAnalyticRings, AnalyticStacks and RingStacksAndTransmutation suppliers. HQ.6 remains a comparison problem. Aoki's realization and the thesis's future-work remarks are inherited verification evidence, not a new proof or fresh full-source reading. Add HS.3→HQ.6 only when installed. |
| /31 | Retained the already-correct uncompleted Habiro–Hodge quotient in Theorem 3.11(b); reinforced the distinction in the HQ.3 coordinate comparison and new raw-model tests. Corollary 3.54 remains the graded/Bockstein comparison, not a theorem about the q−1-completed substitute. |
| /32 | Retained the real HR.1 Λ/perfect-cover request and made its interim role explicit. On promotion substitute QW.1, preserving the supplier path. No missing-owner gap is invented while HR.1 supplies it. |
| /33 | Added explicit maintainer handoff: HQ.5-trace feeds HQ.7, with no reverse dependency, and algebraic acceptance does not wait for analytic HQ.6. Current atlas edges are outside the issue's files. |
| /34 | Preserved DD.1/DD.2 imports and the actual DD.3 request used by local derived q-de Rham/staticity. Added maintainer handoff for removing the blanket DD.6 log edge without losing those real inputs. |
| /35 | Expanded the scheme perfectness gap and withdrew the misleading Lean signature, as detailed above. Kept the Z-base, small-prime inversion and completed-localization scope. The introduction-only assertion is not classified as a false theorem. |
| /36 | Rejected. Preserve HQ's generic cohomology/completion construction and HR.6's independently built coefficient-ring identification; clarify the handoff without deleting either. |
| /37 | WC.2/EDC.8 packet and atlas handoff under the earlier report: import the trace formula and add the actual determinant/Poincaré functional-equation derivation, with Δ²=q^{dχ}, rational descent and signs. Those files are outside this issue. |
| /38 | DWP.5 atlas handoff: remove the blanket DWP.4 prerequisite while retaining the real weight-zero/spectral, L-function, duality, monodromy and positivity suppliers. No Tau Ceti roadmap or upstream link is edited here. |
| /39 | Shared Part II metadata/design handoff: correct nonexistent galaxy `cohomology` and the Microlocal title; preserve valid arithmeticgeometry/algebraicgeometry classifications. The arbitrary-dimensional semistable consumer still needs a genuine higher-dimensional supplier beyond the curve prefix. |
| /40 | Readers now render HQ.5 and HQ.5-trace as separate stage blocks from their distinct packet nodes. HQ.5 owns general existence and coefficient export; HQ.5-trace owns the exact spherical E1-lift theorem and p=2 refinement. HR.6 retains its degree-zero identification. Live duplicated campaign descriptions require the orchestrator's accepted-packet integration. |

## Evidence and validation

Read the issue, verifier, relevant original findings and first-round correction sections, accepted RS-10 result/review, the two packets/prototypes, and their reviewed library-coverage records. New baseline references were checked by reading declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: `LinearEquiv`, `Module.Projective`, `Module.Finite`; `IsAdicComplete` was also inspected for the proposed comparison signature. Targeted full-tree searches at that Mathlib pin and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` did not find q-connection, Habiro, Λ-ring or q-Hodge carriers; incidental `q.derivative` variable occurrences do not supply them. Existing module/equivalence/completion theory is reused.

Fresh PDFs and their targeted reading ranges are recorded in the packets, separately from historical source/archive records:

| Source | Fresh inspection | SHA-256 |
| --- | --- | --- |
| Scholze [1606.01796](https://arxiv.org/pdf/1606.01796) | §7 pp.15–16, Definition 7.3, Remark 7.4, Conjecture 7.5 | `ce060b41e28fef16c011d3d3455c53a8bdc11cd8c98dc4dc6c2be178e1567273` |
| Wagner [2510.04782v2](https://arxiv.org/pdf/2510.04782v2) | §1.16–1.17 p.8; Theorem 3.11/Example 3.12 pp.25–26; Corollary 3.54 pp.51–52 | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| Wagner [2410.23078v5](https://arxiv.org/pdf/2410.23078v5) | Version/locator recheck only; no new complete reading claimed | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |
| Wagner [2510.06057v1](https://arxiv.org/pdf/2510.06057v1) | Theorems 4.14/4.16/4.17 pp.43–45 | `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d` |
| Meyer–Wagner [2410.23115v4](https://arxiv.org/pdf/2410.23115v4) | §3.2 pp.38–40, Lemma 3.16 and auxiliary Lemma 3.17 | `4479788e04da71cfb76596b4375b6b1e4c9bcd940ad92e1ab7c8ededba446dd4` |

Validation performed:

- `scripts/check_blueprint.py` on both packets: zero errors and zero packet warnings. The declaration index is unavailable, so the tool checks baseline-reference form; the newly cited declarations were read manually at the pin.
- Assembled atlas stage graph: 2,840 vertices and 8,258 edges, acyclic. Compared old/new explicit prerequisites across both packets: seven added non-library edges, none introduces a cycle. The raw HQ.4 node has no HQ.3 prerequisite. This does not claim that all future draft-promotion edges are installed or that all inherited fine-grained supplier gaps are solved.
- 2,295 exact rational Laurent identities over q=2,3,1/2 test ordinary and modified twisted Leibniz, semilinear tensor balance, toric rescaling and positive/negative group powers. These are mathematical spot checks, not Lean proofs or a replacement for the planned unit tests.
- Seven-file intake check: zero problems. Source-version validation, reader/packet node and statement coverage, preserved review/source-issue records, new API/test name correspondence, and `git diff --check` passed. No `content/campaign`, `data`, paper record, plan, draft roadmap, or unrelated packet is edited.
- Lean was **not compiled**. The shared Mathlib checkout is at `30a58f795ae8c95b8299fe3c9ded1e6498a9e9fe`, not the required pin. No Lake build, dependency cache, manifest change or shared-source mutation was attempted. The prior independent review's elaboration result does not cover these new signatures.

The remaining gaps are named mathematical/provenance obligations of the blueprints, not silently proved results. Draft promotion and the explicitly excluded owner jobs remain the maintainer's separate integration work.
