# Independent review: EDC.6 operation comparison

**Job:** REV-EtaleDualityAndPerverseSheaves--EDC.6, issue #9381.
**Reviewer:** Codex, session codex-wi4tyk, 2026-10-13.
**Input author:** Codex, session codex-KQ06rl; this reviewer did not write that
planning pass.
**Verdict:** accepted after corrections in place. This is a complete review,
not a checkpoint. The packet is a complete target-level pass with EDC.6
**planned**, not closed. Four explicit gaps and four supplier requests remain;
no formalization is claimed.

## Inventory and baseline

| Item | Reviewed result |
| --- | --- |
| Nodes | 7: six theorems and one construction; all seven corrected; none added, removed or unverifiable |
| Construction API and tests | Eight API items after adding extensionality; four discriminating tests |
| Planets | Four new; retain the two inherited EDC.6 planets for six at assembly |
| Baseline declarations | Four confirmed; none removed or replaced |
| Coverage | One planned stage, no closed stages; four gaps and four requests |
| Restructuring records | Five, including the added realization-owner extension |
| Suggested Lean | 86 lines, two categorical end theorems and five examples; no data definitions |
| Source issues | Empty; no published-source mistake established at the checked locators |

The actual statements of all four baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Module and verified boundary |
| --- | --- |
| `AlgebraicGeometry.Scheme.smallEtaleTopology` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean`: the topology on the category of étale schemes over X, supplying the finite-level site. |
| `AlgebraicGeometry.Scheme.ellAdicSheaf` | `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`: for a prime ℓ, continuous Z_ℓ-valued maps on the small pro-étale site. This is a sheaf, not the constructible adic six-operation package. |
| `AlgebraicGeometry.Scheme.EllAdicCohomology` | The same module: sheaf cohomology of that sheaf, with its universe lift. No compact-support or duality theorem is inferred. |
| `CategoryTheory.Adjunction.isIso_counit_app_iff_mem_essImage` | `Mathlib/CategoryTheory/Adjunction/FullyFaithful.lean`: L ⊣ R with L full and faithful; the counit at B is invertible iff B lies in L's essential image. The ambient full-faithfulness hypotheses are retained in the first Lean milestone. |

The packet also retains Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`; it cites no Tau Ceti declaration
as a baseline entry. The reviewed library audit, especially
`EtaleDualityAndPerverseSheaves:EDC.6` and the L3/L4/L6 ownership entries of
AUDIT-18, was read. The operation comparisons are imported from their owners;
this packet specifies compatibility of duality and class maps, rather than
replanning those operation functors.

## Per-node findings and changes

All suffixes below have prefix `EtaleDualityAndPerverseSheaves:EDC.6/`.
Each has verdict **corrected** in the packet's review object.

1. **`operation-reduction-comparisons`.** Read Bhatt–Scholze Lemma 6.5.11,
   p.51; Proposition 6.6.11, p.54; §6.7, pp.55–58, including the
   exceptional-reduction proof in 6.7.18 and internal-Hom dévissage in
   6.7.13. The statements retain finite relative cohomological dimension,
   derived completeness, common finite strata and actual finite-Tor bounds.
   Corrected the proper-support proof locator from 6.7.9–10 to 6.7.6–10:
   the earlier paragraphs construct Rf_! by compactification, while 6.7.9–10
   explain the failure of a naive derived H⁰f_!. Corrected the PR196 match
   and proof input to distinguish its Z_ℓ/Q_ℓ realization from the requested
   finite O/E enhanced constructible interface.

2. **`mapping-limit-and-integral-class-transport`.** Read Bhatt–Scholze
   6.6.2, p.52, 6.7.13, p.57 and 6.8.14–15, pp.61–62; BBD §2.2,
   pp.72–73, especially 2.2.16. The derived mapping equivalence and Milnor
   lim¹ kernel are compatible; finite shifted Hom groups over a separably
   closed field give ML by stabilization of images. No arithmetic-field
   reduction-only uniqueness claim is made. Added the p.72 locator for the
   derived coefficient Tor sequence and clarified the enhanced finite O/E
   category input. The point test retains both Tor and Ext rather than
   rationalizing away integral torsion.

3. **`coefficient-extension-duality-and-classes`.** Read Bhatt–Scholze
   6.8.2, pp.58–59 and 6.8.14–15, pp.61–62; BBD 2.2.18, p.73 and
   6.1.2(C′), pp.150–151. Finite free extension, the ramified cofinal tower
   O′/λⁿO′ and canonical mate/evaluation identities have the asserted range.
   Corrected 6.8.2's pagination and the BBD match: BBD's rational Artin image
   has the stable-lattice condition; finite coefficient-subfield descent is
   provided by Bhatt–Scholze. Removed the direct prerequisite on the
   separably-closed-field mapping-limit theorem from this arbitrary-field
   result. Canonical enhanced exchanges establish its identities without
   that uniqueness argument. Corrected the PR196 source match: its Layers
   7–9 do not already supply general O/E or algebraic-closure finite-diagram
   descent. These are part of the exact owner extension request.

4. **`complex-tate-orientation-identification`.** Read BBD 6.1.4,
   pp.151–152 and the two PR196 child interfaces. The intrinsic Tate line,
   the positive (1,i) convention, product orientation, conjugation sign and
   root replacement by u all agree. Added `tateOrientation_ext`: stalkwise
   agreement on the Tate generator determines a coefficient-sheaf map,
   making the prescribed orientation map unique. The existing point, line,
   two-line product and changed-root tests discriminate identity, sign,
   product and unit errors. The construction now has eight API items.
   Clarified the requested O/E topological coefficient extension.

5. **`complex-supported-class-transport`.** Read BBD 6.1.2–4,
   pp.149–152, including the exceptional comparison proof on p.151. Replaced
   the unqualified appeal to right adjoints of a constructible equivalence
   by the finite-coefficient closed/smooth factorization argument: closed
   support uses localization and the smooth factor uses purity. The coherent
   exchanges then pass through normalized integral topological realization,
   strict reduction and completeness; the geometric mapping-limit theorem
   verifies the specified maps over C. Rationalization retains the
   stable-lattice Artin image. Supported Thom/Gysin and noncompact
   finite/integral sheaf duality remain an explicit topological owner gap.
   Checked the +1 trace on P¹, the open-curve diagonal boundary sequence,
   the supported divisor square and componentwise trace summation.

6. **`analytic-smooth-trace-comparison`.** Read Huber 3.7.2/3.8.1,
   pp.226–228, 5.7.2/5.7.5, pp.316–318, 7.3.4 and proof, pp.378–382,
   and 7.5.3/7.5.4(ii), including its proof through p.392. Added the
   nontrivial rank-one valuation hypothesis on k. Read the exact H3/H5/R1
   supplier statements and added direct prerequisites on
   `H3/general-analytic-smooth-trace` and `H3/analytic-first-chern-class`.
   H3 already plans a general shifted-constant trace and Kummer c₁;
   requesting a second all-dimensional trace would duplicate it. Narrowed
   the H3 request to proper-support comparison, compatibility of that
   existing trace with Huber's construction, and the full D⁺ adjunction.
   Its prime-to-residue restriction is distinct from the broader range of
   trace existence and of characteristic-zero direct-image comparison.
   Extended counit proof pagination through p.392. Actual analytifications,
   finite-Tor restrictions and the separate integral analytic realization
   gap remain explicit.

7. **`diamond-trace-mates-and-image-condition`.** Read ECD 27.1–7 and
   proofs, pp.163–168, and each exact L3/L4/L6 supplier statement. Checked
   the sources and targets in the mate/counit equation, the relative diamond
   base and the right-adjoint internal-Hom identity. Rc_* recovery supplies
   neither essential-image preservation nor an absolute diamond dualizing
   formula. Sharpened the DVR case: for the particular recovered eligible
   T=f^!A, with invertible unit, the canonical comparison to B is invertible
   iff B≃c_Y^*T. This uses an ambient adjunction and a pointwise unit, with
   actual constructibility/finite-Tor witnesses; it assumes neither ambient
   full faithfulness nor a right adjoint between bounded restrictions.
   Added the pointwise categorical Lean end milestone and a matching
   acceptance check. The fully faithful characteristic-p milestone and the
   zero-object/vector-space counterexample retain their hypotheses.

## Closure, current owners and inherited findings

Read all twelve imported EDC.6 statements from the EDC.4 packet and the exact
EDC.0–3 finite-level suppliers used by these targets. Their ids are preserved.
The inherited normalized-system description needs its enhanced interpretation:
level maps in homotopy categories alone miss the lim¹ obstruction. The reader,
import note and SF.2 request now require homotopy-coherent towers and mapping
complexes. No second definition node is introduced. EDC.4's unrelated pending
semismall costalk correction is outside this review and is not a proof input
of the seven targets here.

Read both entire PR196 child readers and suggested files at head
`4bd72379658126cbe9be935656396f0c9dac4de0`. Its EllAdicRealization explicitly
has Z_ℓ/Q_ℓ scope. Corrected the claim that all required wider coefficient
targets already exist there, refined the SF.2 request and first gap, and added
the exact **Ell-adic realization, Part II: finite coefficient fields and
coherent constructible realization** routing. Existing generic constructions
stay with that owner; EDC.6 consumes their interfaces.

The duplication screen used current roadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, separately from the pins. Read
the complete AlgebraicTopology and AdicSpaces readers, their relevant suggested
statements, and the pertinent DifferentialGeometry and AlgebraicVectorBundles
boundaries. Checked actual current singular cochain, relative/twisted and
cup/cap declarations. Removed the reader's unsupported attribution of a
manifold orientation API to the current library. Also removed its attribution
of Chern classes to AlgebraicVectorBundles: those occur in successor
motivation, while the roadmap supplies vector-bundle infrastructure. The
requested topological extension preserves the actual Stage 6 and real de Rham
owners.

Rechecked RT-AREA-etale/3, /16 and /17 against their independent verification.
The reader and restructuring note now retain the boundedness/stabilizer/
representability/coefficient/support restrictions for stacks; common finite
models and finite-level equivariant descent for perfect pfp spaces; and
G_m-monodromicity with Zhu Appendix A.3's normalization/connected-kernel inputs
for Braden. They name both Yun–Zhang items and LAFFORGUE-18/48 explicitly.
The existing stacks/perfect-space Part II briefs remain the single owners.
The missing coarse L3→EDC.6 edge is recorded for the maintainer; the fine L3
operation nodes are already actual proof prerequisites. No atlas links or
other packet were changed.

All four stage target groups have nodes or original-id imports, and proof
chains terminate in pinned declarations, justified supplier nodes, exact
requested stages or recorded gaps. No target required an additional local
lemma node at this granularity. The reader was updated with every correction;
all implementation statuses stay unchecked. Source statements are paraphrased
with locators; no source passages or book files accompany the submission.

## Verification and orchestrator follow-ups

- `python3 scripts/check_blueprint.py` on the corrected packet: **0 errors,
  0 warnings**.
- `lean-check` on the corrected suggested file: **success** at pinned Mathlib;
  only the two `declaration uses sorry` warnings. The five examples elaborate.
- `scripts/check_sorry_data.py`: passed; no sorry-bodied data.
- Submission file rules and `git diff --check`: passed.

The orchestrator still needs to register/import the PR196 interfaces and route
the finite O/E owner extension; deliver the exact topological and H3 support/
adjunction requests; retain the analytic integral and strong diamond image
gaps; and apply the missing coarse L3 edge and inherited Part II routing.
During assembly, reconcile inherited strong diamond acceptance examples with
the image criterion, carry forward the enhanced normalized-system convention,
and retain exactly six EDC.6 planets. These obligations do not contradict
acceptance of the completed, honestly scoped planning pass.
