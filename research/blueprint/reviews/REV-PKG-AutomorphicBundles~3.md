# Independent package review: AutomorphicBundles, round 3

**Verdict: accepted with the corrections below.** Codex, session `codex-kQ5lyr`,
reviewed issue #9883 on 16 October 2026. I did none of the three package jobs.
The bot confirmed the claim in
[comment 6214251380](https://github.com/CBirkbeck/tauceti-explorer/issues/9883#issuecomment-6214251380).
This is a completed fixing review. The package is ready for the maintainer's
draft TauCetiRoadmap PR; acceptance is of a roadmap, not a formalization.

## Inputs and scope

I read the complete package, both accepted input packets, the previous review
and the round-3 package handoff. The packets contain 96 nodes between them,
including 24 recorded gaps and 50 supplier requests. Their acceptance alone
does not establish prerequisite closure. I checked the package's mathematical
contracts against those inputs and the actual suppliers, rather than treating
packet status as a theorem.

The README has 114 targets: all 94 targets retained by round 2 and 20 new
prerequisite targets. The new targets address both repair families identified
by that review. Definitions retain their intended APIs and at least three
discriminating Checks. The opening summary, ownership boundaries, conventions,
supplier contracts, layer order, worked examples and downstream consumers are
present. Metadata is exactly `topic = "math.NT"`.

I used the current AlgebraicVectorBundles and ReductiveGroups READMEs and
Suggested files as the two upstream models, with relevant ModularForms and
ModularCurves material for comparison. The binding 12 October shape governs
the Lean file: heavy constructions remain fully specified in the README,
while the representative file contains light definitions over existing
carriers, theorem signatures and proved examples. There is no requirement to
invent a Lean carrier for each README target.

Only the package README, Suggested file, review status, this report and the
review handoff are changed. No packet, other package, atlas data or upstream
checkout is changed.

## Corrections applied

1. **The Siegel BGG dictionary had the wrong half-sum and degree order.**
   B3.BGG.3 previously used `2ρ_M` and assigned the coherent terms in increasing
   BCGP Weyl length. With BCGP's simple roots `e₁−e₂, −2e₁`, the calculation is
   `ρ_G=(−1,−2)`, `ρ_L=(1/2,−1/2)`, `2ρ_U=2(ρ_G−ρ_L)=(−3,−3)`.
   The coherent label is `−w₀,M(w·κ+2ρ_U)`. The minimal left representatives
   `1,s₂,s₂s₁,s₂s₁s₂` give `λ₃,λ₂,λ₁,λ₀`; their coherent degrees are
   `3−ℓ(w)`. For `κ=0`, the identity gives `(3,3;0)` in degree three.
   Substitution of `2ρ_L` gives `(1,−1;0)`, and degree zero is also wrong.
   The README now makes all these choices explicit. A proved Lean example
   detects both errors. The existing nonzero central-weight example remains.
2. **The finite-cover extension assertion needed a density hypothesis.**
   B3.HT.3 now excludes irreducible components mapping entirely into the
   boundary. A disjoint normal component over the boundary satisfies
   étaleness away from it but contributes functions lost by restriction.
   This is now a negative-control Check. The actual normalizations of open
   level covers satisfy the added restriction; their construction is unaffected.
3. **Several source statement kinds were inaccurate.** Corrected Scholze
   III.2.1/2.2, III.2.15/2.19, II.3.12, III.3.1/3.4/3.12/3.17/3.18,
   and replaced mixed ranges by neutral numbered-result references. Corrected
   Pilloni–Stroh A.15–A.19 to three lemmas, a proposition and a corollary,
   and DLLZ 6.3.6 to a lemma. Added DLLZ Theorem 5.4.4, p.81, for the
   finite-projective descent assertion in B3.log.1.
4. **Connection wording was stronger than the construction.** A parabolic-only
   coefficient does not obtain a flat connection by the full-group
   construction. The introduction and example now say that precisely, without
   asserting that such a bundle can never admit any flat connection.
5. **Made the inherited coefficient-supplier boundary explicit.** The earlier
   handoff flagged partner C5.15's pushforward-then-tensor expression for
   arbitrary modules. This package already tensors on the abelian torsor.
   Its supplier contract now explicitly consumes the formal restriction and
   homogeneous decomposition there, leaving the left-exact functors and vector
   extension to its named B5 targets. It does not assume a nonflat
   tensor/pushforward interchange. The partner text is outside this job's edits.

No target, hypothesis, API or Check was removed to shorten the package.

## Source verification

All passages below were read directly. Public manuscripts are the editions
linked in the package bibliography: BCGP arXiv:2502.20645v1, Diamond21
arXiv:2011.14128v2, Diamond22 arXiv:2211.06922v1, DLLZRH
arXiv:1803.05786v4 and Rodríguez Camargo arXiv:2209.01057v4, together with
the cited author-hosted DLLZ, LLZ, Pilloni–Stroh and Lan manuscripts.
Faltings–Chai, Scholze's torsion manuscript and Conrad's notes were read only
in the maintainer-cleared copies. No cleared file or extracted passage was
copied. Statements here and in the package are in my own words.

The prior review's unresolved items were construction gaps, not merely
unverified page numbers. I therefore checked each of the 20 new targets,
including the proof ingredients that replace the old conditional inputs.

| Target | Source passages checked | Assessment |
|---|---|---|
| B3.Hilbert.1 | Diamond22 §§2.3–2.10, pp.3–8, especially §2.7 and footnote 4. | Ordinary gluing is accompanied by the projective flag construction and finite polarized moduli maps; properness is not inferred from gluing alone. |
| B3.Hilbert.2 | Diamond21 §7.1, equations (17)–(20), pp.31–34, and (26), p.37. | Exponent lattice, different, invariant differential and determinant lines match the completed Tate chart. |
| B3.Hilbert.3 | Diamond21 equations (21)–(25), Proposition 7.2.1 and proof, pp.34–37. | Stabilizer phases, completion and line coefficients are retained; flat base change precedes invariants. |
| B3.Hilbert.4 | Diamond22 §§2.7–2.10, pp.6–8, Proposition 6.2.1 and following warning, p.25; Stacks 0AY8, Lemma 37.53.6. | Smooth proper component closures and generic global functions give the required residue-component detection; the Iwahori counterexample is excluded. |
| B3.log.1 | DLLZ §§2–3, pp.7–39, Theorems 5.4.3–5.4.4, pp.79–81; DLLZRH §2.3, pp.14–20. | Root-chart acyclicity and finite-projective descent are separate supplied assertions; locator extended to p.81. |
| B3.log.2 | DLLZ Theorem 4.6.1/Corollary 4.6.7, pp.68–69, Corollaries 6.3.4–6.3.5/Lemma 6.3.6, pp.88–89; DLLZRH §5.2, pp.52–57. | Finite Kummer extension and geometric unipotence have the stated restricted scopes; no arithmetic-unipotence assertion. |
| B3.log.3 | DLLZRH Proposition 2.3.15, pp.18–19, §2.4, pp.20–22, Theorem 3.2.7, pp.26–27, proof of 3.2.12, pp.38–39, §§5.3/5.5. | Structural logarithmic periods and nilpotent-residue tensor comparison supply the missing horizontal construction. |
| B3.log.4 | DLLZ Theorem 6.2.1, pp.85–87; DLLZRH Theorem 3.2.7(3), pp.26–27; LLZ Theorem 5.5, p.49. | Primitive and filtered comparisons are distinct steps; degeneration is a target, not a consequence of a bare derived-completion interface. |
| B3.log.5 | LLZ §§2.4–2.5, pp.12–16, Definition 3.1.1/Theorem 3.1.10, pp.17–18, Theorems 5.5/5.10, pp.49–50. | Supported periods require all fractional boundary roots, alternating strata and the displayed compact-support trace/twist. |
| B3.BGG.1 | FC90 VI §5, Proposition 5.3 and construction, pp.230–232; LLZ Theorem 6.1.7, pp.51–53. | Relative resolution and Kostant calculation go beyond the imported PBW/Verma theory. |
| B3.BGG.2 | FC90 VI Proposition 5.4, p.233; LLZ Theorem 6.1.7/Remark 6.1.9, pp.51–53. | Differential operators are maps of abelian sheaves; boundary twisting uses the induced connection. |
| B3.BGG.3 | FC90 VI Theorem 5.5, pp.233–234, Theorem 6.2(i), p.241; LLZ Theorems 6.1.10/6.2.3/6.2.9, pp.53–55; BCGP §4.8, pp.101–102. | Ordinary and compact comparisons are supported. Corrected the root half-sum and reversed BCGP Weyl-length order. |
| B3.HT.1 | Scholze15 III.2.1–III.2.8, pp.31–35, polarized argument p.40. | Weak/strong Hasse exponents, test-point precision and quotient identities agree, including p=2. |
| B3.HT.2 | Scholze15 III.2.10–III.2.20, pp.36–43. | Actual anticanonical rings, Frobenius bounds and affinoid perfectoid limit are constructed, rather than delegated to a missing generic criterion. |
| B3.HT.3 | Scholze15 II.3.6–II.3.12, pp.20–26, III.2.21–III.2.28, pp.44–50. | Good triples, finite-cover extension, normalized traces and density are distinct steps. Added the necessary no-boundary-component restriction. |
| B3.HT.4 | Scholze15 III.2.29–III.2.36, pp.50–53, III §§3.1–3.18, pp.54–62. | Full-level cover, continuous then analytic period map, translates and boundary extension have explicit construction targets. |
| B3.HT.5 | Pilloni–Stroh Appendix A, A.15–A.19, pp.28–30; Scholze15 III.3.18, pp.61–62. | Modified integral toroidal rings include the abelian and monoid directions, not just a torus with roots. |
| B3.HT.6 | Lan22 Propositions 4.9–4.10, p.14, Proposition 6.1/proof, pp.19–20. | Strict fan compatibility gives the closed immersions used in the perfectoid closed-limit argument. |
| B3.HT.7 | Rodríguez Camargo equation (4.1)/Theorem 4.2.1, pp.22–23; BCGP end of §4.5, p.78. | Levi torsor comparison retains cyclotomic grading and faithful tensor frames. |
| B3.HT.8 | BCGP Proposition 4.3.1, p.71, end of §4.5, p.78, §§4.6.1–4.6.2, pp.81–82. | Arithmetic function descent, finite-algebraic exactness and finite-level cohomology are supported; general locally analytic exactness is not asserted. |

For the required independent sample, I enumerated the 94 retained target IDs
in README order and selected 15 with Python `random.Random(9883).sample`.
This selection was made before reading their sources; the table retains its
selection order.

| Sampled target | Exact locators read | Result |
|---|---|---|
| B3.general.3 | HarrisLoc Theorem 1.4.2/(1.4.3), pp.10–11; Milne90 V §6, p.91. | Boundary extension and transported rational structure agree. Harris's poorly extracted formula was also read in the rendered page. |
| B3.1 | HLTT Appendix B.8, pp.270–271; LanIntro §4.2.7, pp.49–50. | Semi-abelian chart coefficient has the required invariant-differential normalization. |
| B2.9 | BCGP Remarks 3.2.19/4.8.1, pp.45/101. | Exact tautological sequence, ranks and dual labels agree; no splitting is claimed. |
| B0.3 | CS §2.3, pp.669–671; BCGP §§3.2.13–3.2.16, p.44 and §4.8, p.101; Conrad Theorem 4.1.7, pp.112–113. | Hodge versus opposite dynamic parabolic and pointwise intersection are consistent. |
| B1.general.3 | Milne88 §9, Lemmas 9.1–9.5, pp.33–34. | Rank-one algebraic generation, rational points and the locally isotropic auxiliary group remain separate obligations. |
| B2.general.3 | Milne90 III Theorem 6.2, p.62. | Rational-weight restriction remains necessary for conjugating rational realizations. |
| B5.22 | BCGP Theorem 4.8.2, pp.101–102; FC90 VI Proposition 5.4(2)/Theorem 5.5(ii), pp.233–234 and Theorem 6.2(i), p.241. | Compact support has the boundary twist on every coherent summand. |
| B1.1 | Deligne §3 Proposition 3.1(a–c), pp.22–23; CS §2.3, p.667. | Reductivity permits finitely many fixed tensors; similitude data must retain its Tate line. |
| B4.8 | LanIntro §4.2.7, p.49. | Recovering a scalar cocycle by cancellation requires the section value to be nonzero. The shifted identity is stated correctly. |
| B5.21 | BCGP §4.8/Theorem 4.8.2, pp.101–102; FC90 VI Theorems 5.5(i)/6.2(i), pp.233–234/241. | The four coherent weights, shifts and single Tate twists agree. |
| B3.general.1 | Milne90 V Theorems 6.1–6.2, pp.90–91; LanIntro §4.2.7, pp.49–50. | General canonical extension retains its normalization and coefficient field. |
| B2.2 | Milne90 III Proposition 3.5, pp.58–59, Theorem 5.1, p.61. | Canonical algebraic/analytic association matches the chosen parabolic coefficient convention. |
| B4.9 | LanIntro §4.2.7, pp.49–50; HarrisLog p.3. | Uses the degree-zero kernels only; no reliance on the problematic higher-degree display. |
| B4.11 | Milne90 III §8, pp.63–64; LanIntro §4.2.7, pp.49–50; Diamond21 Definition 3.2.1 and weight formula, p.12. | Parity and determinant exponent `(w−kτ)/2` match; negative exponents are allowed. |
| B4.21 | BCGP end of proof in §4.5, p.78. | The algebraic bundle comparison includes its one cyclotomic twist. |

The sampled retained locators required no further mathematical correction.
The new-target corrections are recorded above. No remaining source gap was
found in the required sample or the two repair families.

## Closure, ownership and current-library duplication

The source-backed paths replacing the old missing inputs are:

- B3.Hilbert.1–4 → B4.15 and B5.16–B5.19: actual ramified splitting-model
  compactifications, ordered coefficient lines, completed stabilizer descent
  and geometric residue-component detection.
- B3.log.1–5 and B3.BGG.1–3 → B5.21–B5.22: horizontal logarithmic sites,
  coefficients, ordinary/compact periods and comparisons, followed by the
  relative and geometric dual BGG constructions. This finite-level route
  does not depend on the perfectoid tower.
- B3.HT.1–8 → B4.21 and B5.20: small-Hasse subgroups, actual Siegel
  estimates, boundary extension, minimal/toroidal towers, closed Hodge-type
  limits, rational Levi torsors and finite-algebraic coefficient descent.

I checked the named lower-tier/partner contracts in the package against the
upstream tier order, including the proper algebraic/analytic comparison in
ClassicalAdicEtaleCohomology Layer 8 §8.2, the PadicHodgeTheory P8 relative
and filtered interfaces, the ShimuraCompactifications C2–C5 bundle contracts,
and PerfectoidSpaces P8.21. The last explicitly supplies the compatible
algebraic closed-locus limit used by Lan's construction. No appeal is made to
P8.18's missing unrestricted continuous Tate-pair universal property or to
the arbitrary Frobenius criterion left open at P7.13.

The internal Needs references, including numeric ranges, have no missing
target IDs and no directed cycle. B3.HT.3's B5.1 trace input and B3.HT.8's
B4.19 section-colimit input are independent helpers: neither depends on the
tower. The general connected reduction and boundary gluing also have explicit
acyclic construction routes despite forward numbering. No upward citation,
`FoundationsAndLibraryIntegration` or `UPSTREAM:` supplier remains.

The current read-only checkouts were TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched all current roadmaps
and Completed roadmaps by the objects involved, including each of the nine
post-snapshot roadmaps and ContourIntegration, EffectiveBounds,
OrthogonalL2Bases and RestrictedProducts. I separately searched the current
library for tensor stabilizers, parabolics/Levis, associated bundles,
logarithmic and Hodge–Tate objects, traces, weights, slash actions and expansion
coefficients. Current declarations were not silently substituted for the pins.

No additional target needs removal. AlgebraicVectorBundles L0A–L0C already
supplies generic sheaf tensor/dual/determinant/pullback operations; these are
imports. ReductiveGroups supplies generic quotients and dynamic parabolic
representability/Levi theory; B0.1 retains the specific ineffective central
quotient and B0.3 the Hodge identification. The current
`Submodule.stabilizerHopfIdeal` stabilizes a subspace, rather than fixing a
specified finite family of tensors pointwise. The Tannaka reconstruction
through all finite comodules also does not supply B1.1's fixed-faithful-space,
finite-tensor theorem. Existing analytic modular forms and Hecke formulas are
used through convention comparisons; they do not construct the geometric
coefficient towers planned here. The earlier removal of the duplicated minimal
Hodge positivity target remains in force: its owner is partner C5.

Both packet target families are represented, allowing the documented owner
imports and replacements rather than duplicating generic constructions.
The packet's old conditional input names and higher-roadmap ownership pointers
need the coordination updates recorded in the package handoff and this
review's handoff; these are outside the permitted packet edits. They do not
leave a missing construction in this package.

## Adversarial mathematics pass

This table records a pass through every target, its hypotheses, definition,
formulas, API and Checks. The selected instances emphasize cases that could
invalidate the promised interface. “Retained” means no further change was
needed after the stated challenge; it does not mean Lean proves the target.

| Target | Instances and mathematical challenge | Result or correction |
|---|---|---|
| B0.1 | Over Q, GL₂ has no excess real-split central torus; Res of a totally real degree-d field has dimension d−1. | Retained the specific quotient, which preserves more characters than the adjoint quotient. |
| B0.2 | A sign line at a tame μ₂ point versus its square; infinite central units in a neat Hilbert group. | Coarse descent retains the fibre-triviality and tameness tests; neatness alone is insufficient. |
| B0.3 | For diag(2,1), a lower shear acquires lower entry 1/2; a trivial cocharacter has both parabolics equal to the group. | Hodge uses the inverse dynamic cocharacter; pointwise Levi intersection has the proper commutative Hopf scope. |
| B0.4 | Frame torsor of O(1): character +1 gives O(1), character −1 its dual; rank zero gives zero. | Inverse in the contracted-product relation is essential and retained. |
| B0.5 | The tautological GL₂ flag line and its dual differ in degree; a nonsplit unipotent P-module differs from its Levi graded object. | Retained full parabolic coefficients and their actual action. |
| B0.6 | Two filtered frames differing by a unipotent shear have identical graded frames. | The filtration torsor is a P-torsor, not just a Levi-frame torsor. |
| B0.7 | Trivial representation versus odd weight with surviving −1; a two-dimensional coefficient. | Analytic quotient descent checks the ineffective action on fibres, not merely on the base. |
| B0.8 | Compose the two noncommuting elementary shears on a vector. | Equivariant section evaluation uses inverse fibre action with the required order. |
| B0.9 | Swap the two real-quadratic embeddings twice; unequal weights are not fixed by one swap. | Semilinear descent datum is required; a field label alone is insufficient. |
| B0.10 | Weight-one line versus dual under analytic association; identity field extension. | Comparison remains filtered/holomorphic, not an arbitrary smooth bundle identification. |
| B1.1 | An alternating form fixed without its similitude line yields Sp rather than GSp. | Finite pointwise tensor-stabilizer theorem retains all tensor data and characteristic-zero reductivity. |
| B1.2 | CM endomorphism tensor, polarization and zero tensor; disconnected family would not propagate from one component. | Absolute-Hodge propagation retains its connected-family hypotheses. |
| B1.3 | Realize the zero tensor, an endomorphism and a Tate-valued polarization. | Betti, étale and de Rham tensors use consistent homology/dual conventions. |
| B1.4 | Equal-rank constant tensor modules admit identity frames; unequal ranks do not. | Isomorphism and tensor-preservation conditions are both needed for the frame torsor. |
| B1.5 | The Siegel Hodge subspace is Lagrangian; the quaternion algebra (−1,3) has a nonsplit rational flag conic. | A rational map from the torsor is not a chosen rational point of the compact dual. |
| B1.6 | Standard Siegel homology gives the dual of relative H¹dR; unit gives O with d. | Hodge-type principal model includes connection and special-point normalization; no all-prime integral claim. |
| B1.7 | Repeat an embedding, add a second faithful representation, and compare three embeddings. | Identity and comparison cocycle control the torsor, beyond ranks of associated modules. |
| B1.8 | Unit character and a nontrivial CM character; reverse the Artin convention. | Period torsor is normalized compatibly, without choosing its frame or a numerical period. |
| B1.9 | A central order-two kernel acts nontrivially on the sign coefficient and trivially on its square. | Only the latter descends; finite central quotient does not automatically descend all coefficients. |
| B1.10 | Identity level map and two composable level/translation maps. | Pullbacks compose; degree multiplication belongs to later trace, not this isomorphism. |
| B1.general.1 | Identity conjugation and a transported special point with changed datum. | Connected conjugation retains the CM comparison, not merely the new scalar field. |
| B1.general.2 | Adjoint tangent representation at first versus second jet order. | Second-jet realization is retained as the specific automorphism-detection input. |
| B1.general.3 | Type A₁ reduction; an adjoint identity can still leave a central discrepancy. | Simple-adjoint/restriction-of-scalars and local-isotropy hypotheses are explicit; algebraic and rational-point generation are distinct. |
| B1.general.4 | Unit coefficient of a general datum without a universal abelian family. | General principal model uses effective continuous descent; no motivic or integral shortcut. |
| B1.general.5 | Nonsplit quaternion conic again has no rational base point. | Descending the compact-dual map does not assert a rational flag. |
| B1.general.6 | Compose identity and two nontrivial conjugations while transporting fields/groups. | Cocycle is between transported objects, not three maps on a falsely fixed datum. |
| B2.1 | Upper-Borel character a is not detⁿ restricted from GL₂; tensor unit. | Flat connection wording narrowed to what the full-group construction supplies. |
| B2.2 | GL₂ invariant differential versus its inverse character. | Algebraic/analytic comparison keeps the Hodge line rather than exchanging it with its dual. |
| B2.3 | The standard Siegel parabolic module has two graded pieces but need not split. | Highest-weight convention identifies coefficients without asserting a P-splitting. |
| B2.4 | Rational homology, unit and a Levi character which does not extend to G. | Betti local system requires a full-group representation and the stated rational weight. |
| B2.5 | Qℓ versus Qℓ(1) over a point; rescale a stable lattice before inversion. | Arithmetic action is retained even when geometric local systems agree. |
| B2.6 | Unit connection and the actual Gauss–Manin/Hodge filtration of an abelian family. | Integrability/transversality apply to full-group coefficients; no extra connection on arbitrary Levi coefficients. |
| B2.7 | H¹ comparison followed by a tensor projector and duality. | Projectors and filtrations are part of the realization comparison, not just dimensions. |
| B2.8 | Tensor a Hodge line with its inverse; identity Hecke pullback. | Specific coefficient coherence uses imported generic sheaf operations. |
| B2.9 | Genus two gives ranks 2→4→2 with the displayed Levi labels. | Exact sequence retained; splitting is neither needed nor asserted. |
| B2.general.1 | Unit and a general pure datum lacking an abelian realization. | Association uses the general canonical torsor, not an unavailable universal family. |
| B2.general.2 | Full-group unit versus nonextending parabolic character. | Only the full-group coefficient receives all flat realizations. |
| B2.general.3 | Equal complex de Rham lines can have distinct rational Betti structures. | Rational conjugation hypothesis remains explicit. |
| B3.1 | Tate invariant differential du/u is relative; dq/q lies on the base. | Degeneration chart uses the former for its coefficient, with correct tensor ranks. |
| B3.2 | Twist the candidate extension by a nonempty boundary divisor without changing its open restriction. | Canonical chart normalization distinguishes the false extension. |
| B3.3 | Compose transitions on a triple overlap; change one chart by a boundary twist. | Gluing uses normalized extension maps, not equality on the open alone. |
| B3.4 | At a crossing, reduced boundary ideal is (q₁q₂), not (q₁,q₂); empty boundary gives the canonical bundle. | Reduced divisor and tensor twist are correct. |
| B3.5 | Blow up a boundary crossing: pullback boundary has exceptional multiplicity two, reduced new boundary one. | Canonical pullback is separated from subcanonical pushforward/cohomology. |
| B3.6 | Identity refinement and a common refinement of two fans. | Canonical comparisons avoid a nonexistent globally Hecke-stable fan. |
| B3.7 | Unit residue zero; nodal elliptic monodromy has nonzero nilpotent residue; scalar −1 is not unipotent. | Generic log extension is imported; automorphic identification has the correct monodromy range. |
| B3.8 | A rank-one coherent ideal (x,y) has a two-dimensional fibre at its origin. | Minimal pushforward is coherent; local freeness is not inferred from generic rank. |
| B3.9 | Representation defined over L properly containing the reflex field E. | Canonical descent keeps the actual coefficient field L. |
| B3.10 | Unit coefficient and a good-prime PEL cotangent coefficient; arbitrary boundary twist fails normalization. | Integral extension is model-specific and uses the actual formal coefficient. |
| B3.general.1 | Restrict general extension to a Hodge-type subdatum; tensor unit. | Canonical normalization and rational field survive the general route. |
| B3.general.2 | General coefficient without an abelian family; unit residue. | Imported regular-singular machinery is used without inventing a motivic realization. |
| B3.general.3 | Identity conjugation; transport both the fan and coefficient field. | Boundary compatibility compares the transported models. |
| B3.Hilbert.1 | Ramified prime, p=2, and ordinary cusp overlap of DP and PR models. | Actual ordinary splitting glues; projectivity has its own proof ingredients. |
| B3.Hilbert.2 | In rank one, ω=I⁻¹ while determinant line is different·(IJ)⁻¹ and exponent lattice is inverse-different·I⁻¹J. | Different factors and ordered ramified graded lines remain distinct. |
| B3.Hilbert.3 | Unit stabilizer translating a monomial; an infinite completed series; nonflat coefficient change. | Full phase/character descent is retained; only the justified flat base change commutes with invariants. |
| B3.Hilbert.4 | One cusp on each determinant component versus a cusp-free Iwahori component; smooth proper DVR closure. | Fine-level geometric residue coverage is proved in its stated range, not extrapolated to Iwahori level. |
| B3.log.1 | Empty divisor gives the ordinary site; two crossing coordinates require two root directions. | Log charts and induced log structures on strata preserve all directions; not just the open pro-étale site. |
| B3.log.2 | Unit and Tate coefficient; geometric inertia versus arithmetic cyclotomic action. | Unipotence is geometric, and lattice-independent rationalization follows the finite systems. |
| B3.log.3 | Residues 0 and a nonzero nilpotent; two exponents 1/2 produce a carry under tensoring. | Tensor comparison uses nilpotent residues, avoiding the false arbitrary-normalized-residue assertion. |
| B3.log.4 | Point and Gm: ordinary H¹ of Gm has twist −1. | Proper logarithmic comparison gives ordinary cohomology of the complement, with the expected twist. |
| B3.log.5 | Modding out by T alone leaves fractional-root nilpotents; on Gm, compact H¹ has twist 0 and H² twist −1. | All root ideals, alternating intersections and compact trace Qp(−d)[−2d] are retained. |
| B3.BGG.1 | Trivial type-C₂ representation gives ranks 1,3,3,1; verify the length direction of induced maps. | Relative resolution is explicitly constructed rather than assumed from generic Verma modules. |
| B3.BGG.2 | Differentiating a function is not O-linear; ∇(Tf)=T(df+f dlog T). | Differential-operator and boundary-connection conventions are correct. |
| B3.BGG.3 | κ=0, identity Weyl element; κ=(0,−2;2) tests the central sign and Hodge degrees. | Corrected to 2ρ_U=(−3,−3), coherent degree 3−length; added Lean negative control. |
| B3.HT.1 | m=1 and m=2, p=2, ordinary Hasse unit, rank p^g. | Weak exponent (p^m−1)/(p−1), strong exponent p^m and precision 1−ε>ε agree. |
| B3.HT.2 | g=2 gives Frobenius degree p³, whereas subgroup rank is p²; relation fu=p^ε. | Actual completed root tower and Frobenius estimates are needed; localization at f would lose part of the region. |
| B3.HT.3 | t=0, codimension-one failure, open ramification, and a disjoint boundary-only component. | Added component-density restriction; normalized trace uses p³ in genus two and bounds C_m→0. |
| B3.HT.4 | Ordinary and translated charts; boundary flag; cyclotomic Galois action. | Continuous period map is subsequently proved analytic; ordinary classification alone does not provide it. |
| B3.HT.5 | No toric direction versus a rooted toric chart over a nontrivial abelian base. | Modified integral model retains both directions; finite root level is not perfectoid. |
| B3.HT.6 | Identity Siegel embedding versus a genuine closed Hodge-type locus; merely compatible fans. | Strict fan refinement and actual closed-limit theorem are required, not arbitrary closed-subspace perfectoidization. |
| B3.HT.7 | Tate Gm(−1), degree-zero unit and a nontrivial graded tensor. | Levi frames retain their cyclotomic character and the correct dual/opposite conversion. |
| B3.HT.8 | Unit, finite algebraic exact sequence and boundary ideal; compare with merely left-exact locally analytic VB. | Exactness and smooth admissible cohomology are restricted to the supplied finite-algebraic setting. |
| B4.1 | Zero coefficient; proper connected scalar coefficient gives constants; affine line has arbitrarily high powers of t. | Finite dimensionality retains properness/coherence, not just smoothness. |
| B4.2 | Empty boundary, nonzero constant at a cusp, and a two-coordinate crossing. | Cusp sections use O(−D), requiring vanishing on the whole reduced boundary. |
| B4.3 | Two elementary shears fail to commute; modular inversion at 2i has denominator −1 for S². | Shifted left cocycle and frame-change order remain correct; unshifted source formula is not copied. |
| B4.4 | Slash constant vector (0,1) by an upper shear gives (−1,1); determinant-negative real GL₂ changes scalar action. | Inverse fibre map and right slash order are correct; semilinear real GL₂ action is excluded from the linear adapter. |
| B4.5 | Evaluate at zero vector and arbitrary x. | Formula uses f(gx) and J(g,x)⁻¹; no nonvanishing restriction. |
| B4.6 | Zero section transforms and is invariant; nonzero section need not be nowhere zero. | Cancellation is of an invertible linear map, not the section value. |
| B4.7 | For noncommuting g,h, (gh)⁻¹=h⁻¹g⁻¹. | Inverse-base right cocycle is distinct from the right action on functions. |
| B4.8 | A normalized C₂ factor with nonidentity value 2 transforms the zero section but has 2²≠1. | Nonzero scalar value and field cancellation are explicitly required. |
| B4.9 | Change a boundary frame by a singular power of q. | Growth is measured in the canonical extension frame; proper GAGA alone does not fix growth. |
| B4.10 | Weight zero and odd weight with surviving −1. | Hodge-line comparison retains the coarse-descent restriction and analytic cusp condition. |
| B4.11 | k=4,w=2 gives m=−1; k=3,w=2 is invalid; add two negative determinant exponents. | Integer parity prevents truncated division; arbitrary Lean index type matches the integer-data statement. |
| B4.12 | F=Q; k=0,w=2 gives a determinant line, k=4,w=2 its inverse factor. | Split coefficient formula retains negative powers and central weight. |
| B4.13 | Scalar t has exponent k+2m=w; a norm −1 unit can obstruct odd central weight. | Infinite central-unit descent is checked separately from neatness. |
| B4.14 | Galois interchanges unequal real-quadratic weights. | Unsplit coefficient needs descent data, not an automatic definition over Q. |
| B4.15 | Coincident residue embeddings at ramified p; parallel product; nonparallel norm-one unit character. | Ordered PR lines remain separate; determinant is over the base ring, not a rank-one OF-module determinant. |
| B4.16 | Symmetric/Schur standard weight gives rank g; all −1 gives determinant inverse. | Generic Schur theory is imported while the geometric Hodge/similitude identification is retained. |
| B4.17 | Unit, pure similitude and unequal conjugate-embedding weights. | Embedding labels cannot be collapsed; Tate and similitude conventions remain distinct. |
| B4.18 | Extend coefficient fields; contrast reduction modulo p, where new forms can appear. | Field base change uses flatness; no arbitrary coefficient base-change theorem is asserted. |
| B4.19 | Infinite direct sums on qcqs versus disjoint non-qc components giving products of sections. | Finite presentation and qcqs hypotheses justify the filtered-colimit statement. |
| B4.20 | M=0; multiplication by p when H¹ has p-torsion; identity fan change. | Coefficients are tensored inside the sheaf; global sections are not claimed right exact. |
| B4.21 | Unit and standard BCGP weight (1,0;−1). | Standard bundle is ω_A(−1), with one Tate correction; the new tower/torsor chain now supplies the comparison. |
| B5.1 | Quadratic algebra R[t]/(t²−a): traces of 1,t,t² are 2,0,2a; degree-p trace in characteristic p. | Trace is not averaging and need not preserve 1. |
| B5.2 | Multiply by p before and after restriction to Spec Fp. | Flatness of the integral model/coefficient sheaf is essential for coefficient injections. |
| B5.3 | Cp unipotent shear on Fp² has invariants mapping to zero in its trivial one-dimensional quotient. | Invariants are left exact, not exact; no division by stabilizer order. |
| B5.4 | A chosen cusp misses one of two components; completion at unit ideal is zero; p=0 prime quotient. | Requires reduced fibrewise component detection and proper local ideals; no tensor/inverse-limit interchange. |
| B5.5 | N=0, Q=0 and the nonsplit Z/4 extension of Z/2 by Z/2. | Left-exact diagram chase proves injection without surjectivity at the last object. |
| B5.6 | Empty filtration of zero, length-two Z/4 filtration and a nonfree invertible ideal. | Prime subquotients are up to isomorphism; finite/noetherian assumptions remain. |
| B5.7 | A family with new basis directions in each degree need not lie in one finite coefficient submodule. | Section colimits and injections of invariant coefficient families are separate steps. |
| B5.8 | Submodule 0 and whole module; quotient of R[1/p] by R. | Recognition uses injectivity for the quotient coefficient module, including torsion. |
| B5.9 | At a disc, q divisibility is constant-term vanishing; deeper strata can hide higher boundary coefficients. | All boundary restrictions, rather than one scalar constant, define cuspidality. |
| B5.10 | Identity correspondence; raw trace on 1 equals degree; normalized prime-2 weight-zero value 3/2. | Pull–transport–trace order and multiplicative normalization are retained. |
| B5.11 | Identity double coset and addition; reciprocals of arbitrary coset degrees need not multiply. | Convolution uses a unit-valued character and the actual Cartesian level condition. |
| B5.12 | Trivial Cp invariants over Fp survive although the group sum is zero. | Non-neat descent uses equalizers/stacks, not averaging, and retains the span comparison hypothesis. |
| B5.13 | Tate(qⁿ) pulls du/u to n·du/u; monomial qʳ has one coefficient at r. | Invariant differential, analytic exponent and Hecke conventions agree. |
| B5.14 | Rank zero, a rank-two monomial and (1−q)⁻¹ with infinite support; a face localization can change units. | Completed line-valued coefficients and common completed comparison charts are necessary. |
| B5.15 | Rank-two direct sum, Z/4 coefficients and a component disjoint from the chosen boundary. | Vector expansion injectivity retains explicit geometric component coverage. |
| B5.16 | Zero coefficient ring; a single positive monomial moved by a unit. | Ramified cusp series use the actual lines and full stabilizer, now supplied by B3.Hilbert. |
| B5.17 | One cusp per determinant component versus the known Iwahori exception. | Joint principle is valid on the fine cover with proved residue-component detection. |
| B5.18 | Positive exponent versus constant; torsion can annihilate a nontrivial unit character. | All cusp constants are line-valued; flat and torsion coefficient behavior are distinguished. |
| B5.19 | n=0 produces (1+χ(ℓ)ℓ^(k−1))a₀; ℓ∤n removes the second term; mod p² with ℓ≠p. | Good-prime normalization and actual Hilbert coefficient transport are supplied. |
| B5.20 | Standard (1,0;−1), unit and finite-level boundary ideal. | Algebraic VB comparison is now supported; subcanonical sections are not replaced by arbitrary open sections. |
| B5.21 | κ=0 gives twists 0,−1,−2,−3; i=0 leaves only degree zero; (0,0;1) fails parity. | Nonzero central-weight control retained; corrected BGG dictionary supplies all four terms without a tower dependency. |
| B5.22 | Empty D agrees with proper ordinary theory; nonempty D twists all coherent terms by −D. | Independent compact comparison, support map and duality are supplied by B3.log.5/B3.BGG. |

The 114 sections all have Source, Needs, Lean and Checks clauses. Every one
has at least three Checks; the BGG correction and finite-cover correction
increase their respective counts to four and five. The checks are specific
computations, comparisons or nonexamples, not assertions that the desired
theorem holds. Heavy target names remain individually listed in the Lean
closing inventory, including all 20 new constructions.
The final count is 381 Checks; the internal Needs audit expands 382 edges.

## Lean statement agreement and validation

I read the actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: dynamic parabolic/Levi
definitions, Laurent inversion and exponent negation, linear automorphism
composition, SlashAction and the modular scalar action, trace and base change,
the short-complex injection theorem, prime-filtration induction and local
Krull separation. These statements have their required hypotheses; in
particular the diagram-chase theorem needs the relevant monomorphisms, and
the trace/base-change formulas are used locally on finite free pieces.

The following explicit signature comparisons exceed the required ten:

| Lean declaration | Agreement with the README |
|---|---|
| `inverseCocharacter` | Laurent exponent negation is composed with the commutative Hopf cocharacter; no scheme representability claim. |
| `inverseCocharacter_inverseCocharacter` | Same Hopf/coefficient rings on both sides; double inversion fixes the map. |
| `levi_inverseCocharacter` | Same commutative evaluation algebra; inversion does not change the centralizer. |
| `hodgeParabolic_inf_hodgeTateParabolic` | Intersection of point subgroups equals the common Levi, in the stated generality. |
| `AutomorphyFactor.changeFrame` | Formula is u(gx) J(g,x) u(x)⁻¹, with normalization/cocycle structure laws proved. |
| `AutomorphyFactor.changeFrame_comp` | Change by u then v corresponds to v∘u, consistent with `LinearEquiv.trans`. |
| `slashActionOfAutomorphyFactor` | Only monoid, left base action, semiring and module are needed; factor law is not the asserted slash conclusion. |
| `slashActionOfAutomorphyFactor_map_apply` | Uses inverse J at x and f at g•x. |
| `slashActionOfAutomorphyFactor_invariant_iff` | Quantifies all g and x; allows zeros without cancelling them. |
| `slashActionOfAutomorphyFactor_map_smul` | R-linearity follows the linear fibre automorphism; no negative-determinant semilinear action is included. |
| `inverse_base_action_cocycle` | Requires groups and reverses inverses/order while changing the base action. |
| `cocycle_at_of_automorphy_of_ne_zero` | Field and nonzero value at the selected point support cancellation; it does not demand a nowhere-zero section. |
| `HilbertArithmeticWeight.two_mul_detExponent` | Arbitrary index type is intentional for integer data; the parity field justifies integer division. |
| `SiegelHT.twiceTateExponents_even` | The parity hypothesis makes all four doubled exponents even; geometry/dominance is not asserted by this integer identity. |

The numerical Hecke specialization also takes a prime, excluding division
at zero. Siegel coherent weight definitions are unrestricted integer data;
the actual decomposition retains dominance and parity in the README.
There are no sorry-defined data, fake carriers, `True` targets or auxiliary
theory chains. All 16 theorem declarations use the required `sorry` bodies;
structure laws and the discriminating concrete examples are proved.

- Final `lean-check` on `research/blueprint/packages/AutomorphicBundles/Suggested.lean`:
  exit 0, exactly 16 warnings, all declaration-uses-sorry, no errors or other
  warnings. The added BGG negative control elaborates. The file has 506 lines.
  Memory was checked first; one compiler ran in the shared pinned build and
  finished. No build, update, cache download or language server was started.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- `python3 scripts/check_blueprint.py` on each unchanged input packet:
  exit 0, zero errors and zero warnings. Their historical gap/request counts
  remain unchanged and are not mistaken for package defects repaired in JSON.
- Target inventory and explicit internal Needs audit: 114 targets, 94 retained
  plus 20 new, all with at least three Checks, no missing internal target and
  no directed cycle.
- `python3 research/blueprint/intake.py check-files` on the five changed
  deliverables/handoff: zero problems. `git diff --check`: clean.

No uncorrected package defect remains from this review. The durable handoff
records the downstream owner/import coordination, which does not require
editing any other roadmap or packet in this job.
