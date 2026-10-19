# DESIGN-LocalLanglandsCorrespondenceForG2

Worker: Codex, session `codex-hPiMjp`; issue #3458. The claim bot confirmed this session on 19 October 2026. This submission completes the target-level design pass, not the mathematical proofs. It is ready for an independent blueprint review, not for packaging as a proof-closed roadmap.

## Delivered

The new roadmap has 11 layers, LG.0–LG.10. All 75 items routed here by `PAPER-GAN-SAVIN-23-B` have explicit `inputCoverage` mappings. There are 79 targets: 12 constructions, 7 definitions and 60 theorems; 71 API items, 58 discriminating unit tests, 50 planets and 4 pinned baseline declarations. Every definition/construction has uses, API and at least three tests. Every target remains `implementationStatus: unchecked`.

The reader states the targets, hypotheses, dependencies, proof routes, tests, acceptance conditions and source locators in mathematical dependency order. Its worked examples distinguish the A₂ spin line, the selfdual subregular packet, a quadratic twist stabilizer and the finite-group obstruction to Spin₇ acceptability. The packet includes 21 source issues in our own words. E1–E17 reassess the input extraction's findings; E18–E21 identify further proof obligations, not independently proved counterexamples to the published endpoints. The bounded correction search found no primary published correction for these findings.

All layers are **planned**; none is **closed**. The packet is `complete` because every target in scope has been planned and every unresolved chain is recorded. Its 14 gaps and 17 requests are substantive. They must not be interpreted as assumptions that close the endpoint theorems.

## Verification and Lean scope

`python3 scripts/check_blueprint.py research/blueprint/packets/LocalLanglandsCorrespondenceForG2.json` passed with **0 errors and 0 warnings**. The submission file checks, source/route/API consistency checks, dependency acyclicity and whitespace checks also passed.

`lean-check research/blueprint/suggested/LocalLanglandsCorrespondenceForG2.lean` elaborated successfully at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Its only warnings were the 11 expected theorem/example `sorry` warnings. The 84-line file has four real-bodied lightweight definitions on existing complex-unit, finite-matrix and polynomial carriers, five milestone theorems and six examples. It contains no data-valued placeholder. Heavy parameter, representation and automorphic targets live in the README, following the newer WORKERS shape rule; no compilation of their absent carriers is claimed.

The four pinned declaration statements were read: `Matrix.diagonal`, `Matrix.charpoly`, `Matrix.charpoly_diagonal` and `spinGroup`. In particular, pinned `spinGroup` supplies a Clifford submonoid, not the complete dual-group parameter API.

## Reuse and ownership

Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read-only. ReductiveGroups and RepresentationTheory/ClassicalGroups were read, together with the relevant SpinRepresentations and OrthogonalSpinGroups targets. Reuse the integral `TauCeti.D4Tripled.trialityAutomorphism` and its root-subgroup/order-three API, the G₂ short-root carrier, and the existing Clifford/spinor-norm plans. This roadmap owns only the comparison with octonion/central-quotient models, rational triality descent and its LLC applications. No upstream roadmap was edited or internally reviewed here.

The reviewed AL.3–AL.4 and MP.3 library audits were read; no reviewed audit exists for this new roadmap. Missing audit entries under other current ids were not treated as absence evidence. Existing ML.4 Arthur/Xu nodes, AL.3 Rankin–Selberg nodes and SRU isolation/Fell-closure nodes are imported by their exact addresses. The old proposed UnitaryDual direction has already been absorbed into SmoothRepresentationsOfLocalGroupsPartII.

Two routed suppliers have no roadmap/packet/reserved stage in this checkout: ExceptionalThetaCorrespondencesForG2 and MetaplecticAutomorphicFormsPartIIShimuraWaldspurger. Their exact contract gaps are explicit; no fictional addresses were added. Proposed ownership adjustments in `restructure` keep general theta, Galois and density proofs with their existing directions or extensions. No higher-tier notion was moved into this roadmap.

The ML.4 trace-formula-input register retains unclosed stabilization/twisted-weighted-fundamental-lemma inputs. All dependent Arthur/Xu endpoints inherit those gates. Source-gated Chenevier, Kret–Shin, gamma-characterization and Shin theorems have explicit statements and ownership gaps; they are not claimed as supplied by merely related stage titles.

## Layer status and resumption


- **LG.0 — planned.** Discharge exceptional parameter and group-model contracts, Griess/Gross–Savin conjugacy and component-group inputs, and both Chenevier source gates.

- **LG.1 — planned.** Supply local exceptional period/nonvanishing inputs, exact Poincaré weak containment and relative generic/archimedean isolation exports.

- **LG.2 — planned.** Compare and descend current integral triality, supply classical theta/complex matching and analytic spin factors, and control the extra globalization place in the gamma proof.

- **LG.3 — planned.** Discharge the exceptional carrier/classification and Chenevier/gamma source gates; supply full-WD local converse and all-places Galois compatibility, including coefficient-prime places.

- **LG.4 — planned.** Complete the separate selfdual S₃ enhancement argument and check division-lift nonvanishing at the stated residue characteristics.

- **LG.5 — planned.** Discharge Kret–Shin and isobaric-summand local compatibility; prove the explicit club Siegel spin bridge.

- **LG.6 — planned.** Supply exact Xu two-place cancellation, archimedean matching and the exceptional global spin-pole converse; propagate classification gates.

- **LG.7 — planned.** Close the dependent A₂ and diamond packet proofs, the club spin identity and all-places compatibility before asserting unconditional endpoints.

- **LG.8 — planned.** Discharge Shin’s theorem and spin-regular weight-cone refinement, Rallis/tower input and Kret–Shin isobaric comparison.

- **LG.9 — planned.** Compute all proper C₃ Levi and overlap cases and close the discrete heart and lower-tower source/supplier inputs.

- **LG.10 — planned.** Prove weak discreteness invariance, lower-tower twisting/packet identities and the full induction/Langlands quotient fibre reduction.


Start the independent review with the exact target statements and the route mapping, then check the supplier contracts against their owning packets. For proof-closure follow-ups, first assign addressable exceptional-theta and Rallis/tower owners and the source-gated theorem proofs. The highest-risk internal arguments are the separate selfdual S₃ enhancement proof, the generic-discrete club Siegel spin bridge, and the seven proper C₃ Levi/lower-tower cases. Do not try to discharge these by invoking Proposition 5.2 outside its discrete-PGSp₆ hypothesis.

The generic G₂ discrete-series spin diagram has a generic **tempered** PGSp₆ intermediate; the subregular generic member is an induced Siegel constituent. The main enhanced PGSp₆ theta assertion is restricted to diamond discrete parameters. Discrete A₂ packet bijectivity retains the possible residue-characteristic-three exception; the subregular example is complete. The weak PGSp₆ parameter is unique only in the joint standard/spin quotient. The finite compact-group counterexample is not asserted to produce an actual WD or Kret–Shin ambiguity. Retain monodromy, central-character normalizations and the coefficient-prime compatibility request throughout.

## Exact gap register


1. **Exceptional theta and parameter supplier has no addressable stages.** ExceptionalThetaCorrespondencesForG2 is a routed candidate, but no roadmap, packet or reserved stage is present in this checkout. Import its intended ownership of admissible exceptional parameters, irreducible smooth representation loci ♠/♥/♣/♦, exceptional Howe duality/dichotomy, explicit induction formulas, local quaternion-period lemmas 10.1–10.4, global theta kernels and local–global matching, auxiliary depth-zero examples, and GS20 Theorem 1.1 (spin pole ⇒ nonzero global theta to some G₂ form) with its exact hypotheses. These are not new definitions of this roadmap. No fictitious candidate stage is used as a prerequisite. The exceptional supplier must expose contracts and proof closure before these targets are closed.

2. **Exceptional conjugacy and component-group comparison.** The source cites Griess and Gross–Savin for injectivity, normalizers, invariant-spinor detection and Sφ≅S_{iφ}/image μ₂. The cited primary proofs were not audited here in full; the targets state their exact required conclusions. A proof owner must supply the complex admissible-WD versions, the nonisotropic-spinor argument, and the special centralizer computations, using the current group models. Reading a compact-group statement or counting eigenvalues is not a proof of these parameter theorems.

3. **Current-library group-model comparison.** Current Tau Ceti contains the integral D₄ triality automorphism and explicit G₂ short-root carriers. These are absent or less complete at the formal baseline. Import the current declarations when available at the consuming pin, and prove their comparison with octonion G₂, the simply connected D₄ model and the central quotients used here. Do not redevelop triality, spin groups or general reductive group schemes.

4. **Chenevier source-gated descent theorems.** LG.0/chenevier-local and LG.0/chenevier-galois record Theorem E and Theorem 6.4 with the published hypotheses, checked in the primary source. Their proofs and the W×SU₂-to-W×SL₂ convention bridge have no exact supplier node. Designate an owner for these descent results and discharge their Galois/group-theoretic dependencies; no G₂-valued global representation is inferred merely from a characteristic polynomial identity.

5. **Kret–Shin source gate and isobaric local comparison.** The exact (St) and (L-coh) theorem is recorded from the primary paper. Its proof is not supplied by the existing AG2 endpoints. An owner must establish the GSpin-valued theorem, central-trivial specialization, the local WD lift, and local–global comparison for each regular algebraic isobaric GL₈ summand with its shift. Spin regularity must justify the regularity needed; an unsupported claim that GL₈ is cuspidal does not replace that comparison.

6. **Independent analytic gamma-factor source gate.** GF Theorem 2.4 is recorded with its restricted global family and all four multiplicativity formulas. Its analytic existence/uniqueness proof still needs an owner and the exceptional globalization contracts; it is not assumed as an unrestricted global functional equation or a consequence of defining an arbitrary family from a proposed LLC.

7. **Selfdual S₃ enhancement argument.** The projective μ₃-centralizer construction in GS Proposition 3.2 does not apply when the normalizer enlarges the component group to S₃. Prove the separate split ± extension and division-lift argument in LG.4/selfdual-packet, with the 2-dimensional restriction χ⊕χ⁻¹, including p=2. Its expected result is a target, not a claimed repair already proved by the μ₃ argument.

8. **Club spin bridge through explicit Siegel constituents.** For a generic discrete G₂ club member, compute the full WD parameter of the classical theta/triality lift of I₃(τ) or I₃(τ)_gen and obtain φτ⊕φτ∨⊕1⊕1. Proposition 5.2 assumes a discrete PGSp₆ partner and cannot prove this. The explicit MP.3 extension request records the required input, and LG.5/club-spin-bridge records the exceptional comparison.

9. **Functional-equation globalization at the extra place.** GS Proposition 10.7 permits one further finite place where sphericity is not controlled, whereas the proof of Proposition 4.1 cancels every finite place except its stated Steinberg, supercuspidal and repeated σ places. Prove a stronger globalization, show that the remaining place contributes a known matching factor, or modify the comparison argument to eliminate it. Until this is done the cancellation argument is not closed.

10. **Rallis and lower-tower supplier is pending.** The proposed MetaplecticAutomorphicFormsPartIIShimuraWaldspurger has no addressable stages here. The heart-global-theta proof needs the second-term-range Rallis inner product formula (GQT Theorem 1.4(ii)), all-place nonvanishing and the tower cuspidality implication with PGSp₆–PGSO₈ similitude normalizations. These are imported classical-theta results, not planned again as exceptional results.

11. **Shin source gate and archimedean spin-regular refinement.** Theorem 5.8 itself supplies discrete series at infinity but does not specify an arbitrary chosen spin-regular infinity type. Supply its proof ownership and the argument from its weight-aspect density proof selecting a cohomological weight cone avoiding every equality among the eight spin weights. Check both Plancherel atoms at v₀,v₁ and the subsequent global quadratic correction.

12. **Appendix C omitted proper-Levi and lower-tower cases.** Fill the exact tables/proofs in LG.9/heart-levi-parameters, the split/quaternionic twisting calculation in LG.10/lower-tower-twist, the lower-tower packet comparison in LG.10/lower-tower-fibres and the normalized induction/Langlands quotient reduction in LG.10/levi-fibres. Imported Howe duality alone does not prove these LLC, twist or Xu-packet identities.

13. **Weak spectral predicates require proof.** Theorem 12.6 uses boundedness and discreteness on weak classes. Faithfulness of spin detects boundedness, but discreteness requires showing that joint standard/spin equivalence preserves the relevant centralizer/Levi condition for Spin₇ WD parameters. Supply this comparison explicitly before descending discreteness to Φw.

14. **Classical classification proof gates propagate.** The imported ML.4 trace-formula-inputs-register explicitly retains the twisted weighted fundamental lemma and stabilization proof boundaries. Its local/global Arthur and Xu statements are therefore used with those supplier gates, not represented as independently proved by this roadmap. The global transfers, packet substitutions and enhanced endpoints inherit that status.


## Supplier requests

The requests are recorded in the packet, not posted to other issues. Their `neededBy` fields identify the consuming targets.


1. `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`: Supply the split group models and identifications used for G₂, SL₃, PGSp₆ and D₄. Compare the current short-root G₂ representation carrier with octonion automorphisms and the integral tripled D₄ carrier with the Chevalley model. No reconstruction of pinned groups or triality is requested.

2. `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-5-the-fundamental-representations-of-bₗ-and-dₗ`: Export the B₃/D₄ fundamental-representation models, Spin₆=SL₄ normalization, and restrictions needed to prove vj=1+3+3∨, si=1+v and the Spin₈-to-Spin₇ branching. Reuse the current Clifford and spin library.

3. `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-8-triality-for-spin₈`: Provide the comparison between the existing integral pinned D₄ triality automorphism and the vector/half-spin central quotients. The present roadmap owns only its descent to the paper’s f₁,f₂,f₃ and their theta applications.

4. `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`: Export the local Brauer invariant and local duality pairing specialized to H¹(F,PGL₃)=(1/3)ℤ/ℤ, with the reciprocity sign; include the opposite-algebra inversion and Kottwitz μ₃-character convention.

5. `EndoscopicTransferAndUnitaryTraceComparison:ET.6`: Export char-zero local GL_n LLC (n=1,2,3,4,7,8), compatibility with direct sums, normalized induction, duality, determinants, quadratic twists and Rankin–Selberg gamma factors, retaining N. Export JL for GL₁(D₃) and GL₂(D₂), including trivial-centre descent and opposite/dual and reduced-norm-twist rules. Supply the full-WD tempered GL₇ local converse theorem for all GL_r twists; a converse only for irreducible Weil representations is insufficient.

6. `SmoothRepresentationsOfLocalGroups:SR.2`: Use normalized parabolic induction, Jacquet functors, induction in stages, the irreducible Langlands quotient and compatibility with smooth similitude restriction for the G₂, C₃ and D₄ Levis. Include the generic and nongeneric R-group constituents used by the explicit theta formulas.

7. `SmoothRepresentationsOfLocalGroups:SR.3`: Export the irreducible tempered and positive-standard-module classifications and exact hypotheses for admissibility/restriction to finite-index or derived subgroups. Include the Langlands quotient convention used on all proper C₃ Levis.

8. `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`: Extend the relative-isolation export to generic discrete series in the local support of globally generic cusp forms for symplectic similitude groups, in precisely ILM Proposition A.5 and Lemma A.2 form. Supply the real discrete-series far-from-walls isolation condition with an explicit root/weight inequality and its stability under the theta infinitesimal-character matching. Existing isolation in the tempered dual alone is not this relative-spectrum theorem.

9. `AutomorphicFormsOnReductiveGroups:AF.2`: Provide automorphic Hilbert sums and period selection, plus the Poincaré-series weak-containment statement used in GS Proposition 10.5 and 10.7 (SV Theorem 16.3.2 and Remark 16.4.1): specified local distinguished/generic embeddings, quotient measures, prescribed compact/hyperspecial vectors, and the one additional finite place. Also export the generic square-integrable summand in L²_ψ(U\G).

10. `AutomorphicFormsOnReductiveGroups:AF.3`: Supply the cuspidal spectral summands selected by global Whittaker nonvanishing and the supercuspidal local cuspidality criterion for the Poincaré construction.

11. `ModularityAndLanglandsExtensions:ML.4`: In addition to the exact imported local Arthur and Xu nodes, export global Sp₆ and SO₈ standard transfers with all local parameters, the generic-parameter multiplicity formula, the Steinberg criterion giving a generic parameter with trivial global component group, and the two-identical-place sign cancellation in Xu’s multiplicity formula. Preserve the supplier’s trace-formula-input gates rather than assuming its classification is already closed.

12. `MetaplecticAutomorphicForms:MP.3`: Export the all-residue-characteristic similitude theta correspondences PGSp₆–PGSO₈ and PGSp₆–(PGO₆,PGO₅,₁), their Howe duality, conservation/partition, restriction/outer-orbit behavior and lower-tower JL identification. Include the classical local LLC formulas on every proper C₃ Levi, the explicit generic Siegel spin formula φτ+φτ∨+1+1, lower-tower overlap, similitude/spinor-norm twist rules (including GL₂(D) reduced norm), generic split-tower nonvanishing, and Adams–Barbasch matching at complex places. The present work imports these classical correspondences and owns their exceptional comparison.

13. `AutomorphicLFunctionsAndLocalFactors:AL.4`: Extend unramified Euler-factor operations to the Langlands–Shahidi spin factors for generic PGSp₆: local gamma and L normalizations, tempered holomorphy, global functional equation, quadratic twisting, and the pole-at-zero comparison used to recognize exceptional theta images. Supply the standard degree-seven nonvanishing at one for generic global Arthur parameters and the spin pole identity used with the exceptional Siegel–Weil converse. Rankin–Selberg input alone does not supply spin factors.

14. `AutomorphicGaloisRepresentationsPartII:AG2.2`: For rank seven and every algebraic cuspidal summand of the isobaric rank-eight transfer, supply the associated semisimple Galois representations in the precise L-algebraic/unitary normalization used here, with coefficient-field transport. Kret–Shin’s GSpin-valued representation and Chenevier’s G₂ descent remain separate source gates.

15. `AutomorphicGaloisRepresentationsPartII:AG2.5`: Supply prime-to-ℓ all-places local–global compatibility for the rank-seven transfer and algebraic cuspidal summands of rank eight, including potentially ramified places, Frobenius semisimplification with N retained, and direct sums with the correct shifts. Verify the exact Taylor–Yoshida/Caraiani hypotheses for these summands.

16. `AutomorphicGaloisRepresentationsPartII:AG2.6`: Supply potentially semistable WD local–global compatibility at places above the coefficient prime for the regular algebraic self-dual rank-seven transfer, with monodromy and the specified normalization. Chenevier’s global descent plus prime-to-ℓ comparison does not establish this case.

17. `AutomorphicSpectralTheory:AS.6`: Provide a proof owner for Shin Theorem 5.8 with all §5.2 assumptions, and its use of Proposition 4.12 for a chosen archimedean weight cone avoiding spin-weight coincidence hyperplanes. Preserve the Plancherel-regularity/positive-measure and centre assumptions.


## Sources read and missing proof audits

Public primary versions were read for the following exact results. URLs, version dates, SHA-256 hashes and page locators are preserved in the packet and reader; no source files or copied passages are committed.

- Gan–Savin, *The local Langlands conjecture for G₂*, Forum Math. Pi 11 (2023), e28: Main Theorem and the relevant proofs throughout §§2–9 and Appendices A–C, pp. 3–40.
- Chenevier, *Subgroups of Spin(7) or SO(7)...*, Doc. Math. 24 (2019): Theorem E, p. 100, and §§6.1–6.4, especially Theorem 6.4, pp. 146–150.
- Kret–Shin, *Galois representations for general symplectic groups*: Theorem A with (St), (L-coh), normalization and comparison qualifications, online-first pp. 2–4, journal pp. 76–78. The full proof of their global theorem was not audited here.
- Gan–Savin, *A theory of γ-factors for G₂ × GL_r*, arXiv:2308.12561v1: Definition 2.1, Proposition 2.3, Theorem 2.4 and its restricted global family, pp. 1–8.
- Chenevier–Gan, *Spin(7) is unacceptable*, arXiv:2303.15897v1: Lemma 3.10, Proposition 3.12, Example 1 and Corollary 4.8, pp. 9–14.
- Harris–Khare–Thorne, arXiv:1909.05933v3: Lemma 4.6 and its quadratic-twist/nonisotropic-spinor argument, pp. 21–22.
- Shin, *Automorphic Plancherel density theorem*: §5.2, Theorems 5.7–5.8 and their standing hypotheses, author PDF pp. 26–28. The spin-regular weight-cone refinement remains an explicit proof obligation.
- Gan–Savin, *Howe duality and dichotomy for exceptional theta correspondences*, arXiv:2102.00372v1: Theorems 8.2, 8.5, 15.2 and 15.3, pp. 25–29 and 52–53.

Griess and Gross–Savin's full conjugacy/component-group proofs were not read in full. Nor were the full primary proofs of Savin–Weissman spin-pole converse, Sakellaridis–Venkatesh Poincaré weak containment, ILM/Vogan relative isolation, GQT Rallis/tower inputs, Arthur/Xu classification or all local–global Galois comparison theorems. They are imported contracts or recorded source/supplier gaps, not silently certified proofs. Public/cleared-source availability is not mathematical proof closure. No private library book was needed for this run.

The next worker needs only the committed packet, reader, suggested file, roadmap and this handoff. Scratch source downloads, generator and local logs are disposable after submission; no dependency on them is retained.
