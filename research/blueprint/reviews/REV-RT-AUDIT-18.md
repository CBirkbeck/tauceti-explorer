# Independent verification of RT-AUDIT-18

**Complete: 40/40 findings checked; 35 confirmed (13 medium, 22 low), 5 rejected (7, 10, 26, 35, 40).**

Agent: Codex, session `codex-7e92bd`. This session did none of AUDIT-18, REV-AUDIT-18 or RT-AUDIT-18. [Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/1585#issuecomment-5805688705). Input snapshot: `443f0908889df6c59287ffe16725579138240183`; RT result blob `b8d99cfb0ad527516b2c7a9fa53da90e63d839be`. This review changes no audit, roadmap, decomposition or library coverage result. Subsequent fixes must follow each reason's narrowed scope, not mechanically apply the red-teamer's proposed fix.

## Method and limitations

Read the full issue after the bot confirmed this session's claim, PROTOCOL §17, the audit specification, the accepted audit, its first review, both red-team deliverables, the five audited roadmaps/decompositions, and the relevant stage descriptions from the atlas sweep. Compared target strings and declarations with the actual pinned statements and section variables, including source proofs where the advertised scope depended on their construction. The H1 parent/child check independently found nine equal target strings; repetition follows the declared parent structure and is not itself a duplicate construction.

Library pins: [Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174) and [Tau Ceti f790474](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369). The source register below records byte-checked public files. This is statement/source verification, **not Lean compilation**: the red-teamer's elaboration experiments were not reproduced, and no new formalization is claimed. Negative statements are kept at the missing application/API scope; a failed name search is not proof of mathematical impossibility.

Public mathematical cross-checks: [Stacks 032N](https://stacks.math.columbia.edu/tag/032N) separates purely inseparable and separable integral-closure finiteness; [Stacks 032O](https://stacks.math.columbia.edu/tag/032O) treats polynomial-ring passage. [Stacks 03DH](https://stacks.math.columbia.edu/tag/03DH), especially [03DI](https://stacks.math.columbia.edu/tag/03DI), identifies the left adjoint to slice-site restriction as extension by zero for module sheaves. These confirm the proof routes in 12 and 22; they do not assert that all their proofs are present in Lean. Source theorem numbers from other books/papers are not claimed newly checked merely because a roadmap cites them.

## Fix boundaries

The important changes restore finite-field and separability hypotheses; replace absolute absence claims by existing sheaf/derived/cohomology ingredients; retain missing geometric comparisons; and restore shared-owner routes without creating false duplicate flags. In particular:

- 11 changes L5's generic-smoothness target to partial and its current aggregate to not built.
- 21 retains partial and the triangulated/comparison obligations; 22 and 34 recognize existing components as partial, not completed geometric or sheaf duality.
- 2, 9, 13, 14, 19, 21–23, 27–29, 31, 34, 36–39 require the qualifications in their reasons. Respect the audit's five-declaration cap.
- 24, 25, 32 and 38 remove false duplicate flags. 35 is rejected for the same supplier–consumer distinction.
- Preserve parent copies when applying actual changes (notably 23, 25 and 34); do not delete H1's target list under 26.

## Verdicts

### RT-AUDIT-18/1 — confirmed (medium)

Confirmed. GaussSum.lean:188 is in the finite-field section, with nontrivial multiplicative character, primitive additive character and domain-valued coefficients; the quadratic square identity at :222 also retains the nontrivial-character hypothesis. JacobiSum/Basic.lean:197 and :328 likewise use a finite source field and their explicit character/coefficient hypotheses. Replace the arbitrary-finite-ring claim by these finite-field statements. Do not shorten the square case to just “quadratic”: a trivial character is not covered by the nontrivial-character theorem. The broader character-sum target remains partial.

### RT-AUDIT-18/2 — confirmed (low)

Confirmed, with restricted scope. Tau Ceti's CandidateGenusField/Relative/Artin.lean statements at :345–351 and :400–414 supply the ideal Artin map and square-class kernel under their squarefree/nonsquare and excluded-prime hypotheses; :509 supplies surjectivity for the specified genusFieldArtinExcludedPrimes, not an arbitrary enlarged excluded set. Cyclotomic/Frobenius.lean:133 supplies the unramified Frobenius action on roots of unity. These refute the blanket absence note. Cite them as existing genus reciprocity and an explicit cyclotomic Frobenius ingredient; the latter formula alone is not a general cyclotomic Artin reciprocity theorem with kernel and surjectivity. Retain partial coverage of the broader target.

### RT-AUDIT-18/3 — confirmed (low)

Confirmed. LinearRecurrence.tupleSucc is a linear state-transition operator on Fin order → R, over a commutative semiring (LinearRecurrence.lean:178), and charPoly is defined at :209. Thus “no companion operator” omits an existing construction. Record the state operator and the remaining specialized matrix/characteristic-polynomial identification, spectral formulas and recurrence application API. It has order coordinates, not order+1; generic linear-map-to-matrix infrastructure does not itself prove the requested companion characteristic-polynomial theorem.

### RT-AUDIT-18/4 — confirmed (low)

Confirmed. Polynomial/Dickson.lean:59–78 defines the recurrence D_(n+2)=X D_(n+1)−a D_n with D_0=3−k and D_1=X. Evaluation of dickson 1 Q gives V_n(P,Q); evaluation of dickson 2 Q gives U_(n+1)(P,Q), with U_0 added separately. These are reusable polynomial recurrences, even without a named Lucas-sequence API. Record them as related and retain the missing arithmetic/divisibility results with their parameter hypotheses; strong divisibility is not true for arbitrary P,Q (P=Q=2 already gives gcd(U_2,U_3)=2≠U_1).

### RT-AUDIT-18/5 — confirmed (low)

Confirmed. The cyclotomic irreducibility results in Tau Ceti's Cyclotomic/IrreducibleOfUnramified.lean:239,258 have prime-power/prime and unramified hypotheses, so do not subsume arbitrary-n cyclotomic irreducibility. Resultant/AdjoinRoot.lean:284 identifies a resultant with a norm for a monic quotient polynomial, rather than subsuming the complete target. Height/NumberField.lean:411 is Northcott finiteness inside a fixed number field, not the bounded-degree statement over varying algebraic fields. Replace the three “more general” fits by related/special-case descriptions with these scopes; do not infer a change to the entire polynomial/height target solely from one citation.

### RT-AUDIT-18/6 — confirmed (low)

Confirmed. Tau Ceti's Smith-normal-form existence theorem at SmithNormalForm.lean:743 applies to arbitrary nonsingular square integer matrices, not just Gram matrices. Its uniqueness theorem at :836 compares normalized nonnegative divisibility-chain diagonals and does not need nonsingularity. Broaden the note to the actual nonsingular-integer existence and normalized uniqueness coverage; keep rectangular, singular-existence, general-PID and algorithmic obligations distinct.

### RT-AUDIT-18/7 — rejected (low)

Rejected. CA.7's partly-built verdict follows the audit's per-target rule: rational normal bases and the explicitly imported K₀ target are covered, while integral Galois-module, local-freeness and normal-integral-basis targets are explicitly absent. Its notes already distinguish rational normal bases from integral bases. A layer can be partly built through covered prerequisites in its listed targets; the finding supplies no false declaration or hidden integral theorem. Repartitioning the target list to obtain another headline would be an editorial preference, not this claimed coverage correction.

### RT-AUDIT-18/8 — confirmed (medium)

Confirmed, with ownership correction. GlobalNumberFields Layer 11 explicitly plans orders, conductor/Picard/narrow-Picard and noninvertible-ideal distinctions; CA.7's orders target must record that commutative number-field case and use it when extending to semisimple group algebras. The owner is already designated (ClassFieldTheory Layer 13 routes orders there), so absence of a library carrier does not make its ownership undecided. Do not identify a noncommutative locally free class group with the commutative Picard or narrow class group.

### RT-AUDIT-18/9 — confirmed (low)

Confirmed only for the missing Smith-normal-form overlap/reuse route. ModularForms Layer 2 explicitly plans integral matrix Smith form, overlapping CA.3's invariant-factor/SNF work; cite that existing owner and scope. The proposed CA.5–Multiquadratic Layer 1 duplicate is not established: CA.5 explicitly reuses the splitting-law work and develops its reciprocity applications, and the upstream layer supplies the prime-splitting statement. Record that dependency/provenance if useful, rather than adding a duplicate construction simply because it is consumed.

### RT-AUDIT-18/10 — rejected (low)

Rejected. The required short roadmap summary is not an exhaustive catalogue of every missing target. The detailed CA.2/CA.4 and other target notes already expose the named sequence and Diophantine gaps; their omission from a two-to-four-sentence overview does not falsify the audit. The substantive companion-operator correction is covered independently by finding 3. No extra headline gap list is required by this finding.

### RT-AUDIT-18/11 — confirmed (medium)

Confirmed. Smooth.lean:352 proves density of the absolute smooth locus of a reduced scheme locally of finite presentation over a perfect field. It does not supply the relative generic-smoothness input of the curve-fibration/alteration argument over K(Y), which may be imperfect in positive characteristic. Change this target from mathlib/exact to partial with the absolute theorem as a special case, and identify the precise relative separability and finite-presentation hypotheses still required. Generic separability must not be replaced by a claim that all generic fibres, or all fibres over a dense base open, are automatically smooth. As this was L5's only wholly covered target, recompute its layer verdict as not built under the current target list.

### RT-AUDIT-18/12 — confirmed (medium)

Confirmed. The normalization note omits substantial finiteness ingredients: DedekindDomain/IntegralClosure.lean:147,175 (finite separable extension over a noetherian normal domain), NoetherNormalization.lean:265–294, and Tau Ceti's purely-inseparable polynomial-ring and finite-integral-closure transfer results. Stacks 032N–032O explains why separating the inseparable and separable cases matters. Record these routes without claiming excellence or a general finite-normalization theorem is already formalized. Tau Ceti's NormalizationFinite.lean:394–403 is Krull–Akizuki noetherianity of the integral closure, not module finiteness; do not use it as that missing theorem. Retain partial, and select at most five declarations rather than appending every candidate.

### RT-AUDIT-18/13 — confirmed (medium)

Confirmed with narrower overlap notes. M.5 explicitly develops geometric existence/alteration results, RD.5 invokes alterations/descent without the geometric L5 route, and EDC.3 constructs smooth-pair étale purity also used by L5. Record common geometric alterations and the smooth-pair purity component. RD.5's rigid-cohomology/F-isocrystal descent is not identical to L5's étale coefficient descent, so share the geometry while keeping those comparisons separate. StableReduction Layer 9 supplies the marked curve case and should be cited as the existing supplier L5 says it consumes; do not label that already-declared import a second construction or equate stable reduction of curves with arbitrary-dimensional alterations.

### RT-AUDIT-18/14 — confirmed (medium)

Confirmed as a missing upstream reuse route, not as two new duplicate constructions. LocalFieldsRamification Layer 4 explicitly owns the tame quotient, roots-of-unity inverse limit and cyclotomic equivariance. L6's calculation should name that supplier and isolate any extension to the perfect-residue-field scope actually needed. Its finite-residue-field Iwasawa presentation must not be transported without hypotheses. LPV.1 itself requires UPSTREAM:LocalFieldsRamification and builds variation/monodromy on top of the tame character; it is a compatibility/reuse partner, not evidence that L6 independently constructs the same theorem. Add the owner route in the target note, not the proposed unqualified duplicate pair.

### RT-AUDIT-18/15 — confirmed (low)

Confirmed. L4 requires ClassicalAdicEtaleCohomology:H5, and H5 explicitly owns the relevant Hub96 proper algebraic/analytic comparisons. Reword the L4 target to the comparison maps, coefficient scope and compatibility needed for its application, using H5's theorem. Do not add H5 as a duplicate owner of the imported theorem.

### RT-AUDIT-18/16 — confirmed (low)

Confirmed. RF2:untilts classifies untilts through primitive theta kernels/Cartier divisors on the relative Fargues–Fontaine curve; L1 constructs scheme-valued marked-untilt data with a locally ringed-space map and relative representability. These are not the same target. Remove the RF2 duplicate. PerfectoidSpaces:P1 supplies tilting/untilting foundations used by L1; name it as a supplier if needed, not as a replacement duplicate. Keep the genuinely overlapping marked-untilt construction in D6 distinguished from both.

### RT-AUDIT-18/17 — confirmed (low)

Confirmed. Extension/Presentation/Core.lean:39–79 defines the coefficient-generated subalgebra Algebra.Presentation.Core, finite type over ℤ for finitely many relations; :87–115 gives HasCoeffs, and :142–148,207–219 construct the descended model and its base-change comparison. It is a concrete algebraic starting point for affine finite-presentation approximation. Add it as related and retain the missing finite-stage descent/compatibility for schemes, morphisms and diagrams; a presentation alone is not the whole approximation theorem.

### RT-AUDIT-18/18 — confirmed (low)

Confirmed, with the finiteness qualified. TauCeti.FiniteDVRExtension (StableReduction/DVRExtension/Basic.lean:85–104) packages a finite separable fraction-field extension and a chosen local integral-closure place; :163 gives the DVR property and :295 supplies existence. This is relevant finite-base-extension infrastructure omitted from the stable-reduction target. “Finite” here describes the fraction-field extension: do not infer that every chosen localized DVR is module-finite over the original DVR from this structure. It does not prove stable/semistable reduction or the alteration theorem.

### RT-AUDIT-18/19 — confirmed (low)

Confirmed, with degree scope. Mathlib's Homological/ContCohomology/Basic.lean:131 defines continuous cohomology of topological representations from homogeneous cochains. Tau Ceti's DiscreteShortExact at ShortExact.lean:181 and LongExact.lean's explicitLongExact_H0A through explicitLongExact_H2B supply the explicit low-degree exact sequence for discrete modules, with the topological/action hypotheses in their sections. Cite these as related infrastructure; the displayed files do not by themselves justify an unrestricted all-degree comparison with Mathlib's cohomology carrier. The tame-inertia cohomology computation is still missing. Replace weaker existing citations if necessary to respect the five-declaration cap.

### RT-AUDIT-18/20 — confirmed (low)

Confirmed. ElladicCohomology.lean:71 and :83 contain zero-coefficient and empty-scheme vanishing instances, in addition to the definitions. “No theorems” is literally inaccurate. Name the degenerate vanishing cases and retain the substantive missing comparisons, finiteness and Frobenius results; neither vanishing case establishes them.

### RT-AUDIT-18/21 — confirmed (medium)

Confirmed with explicit applicability conditions. GlobalSections.lean:64 defines Γ when its adjoint exists (for example, a suitably sheafifiable small site with terminal object); Sites/Abelian.lean:51 and Adjunction/Additive.lean:38 give its additivity. RightDerivedFunctorPlus.lean:29–53 constructs the bounded-below right derived functor for additive functors between abelian categories with chosen derived categories and enough injectives in the source. Continuous.lean:362 describes sheaf pushforward by precomposition, whose additivity can be supplied from the underlying pointwise maps; RightDerived.lean:109 gives degreewise derived functors using injective resolutions. Thus the abstract constructions are reusable instantiations. Keep partial: triangulated structure is an explicit TODO, and the Sheaf.H comparison, geometric functor packaging and Leray/composition comparisons remain obligations. Γ alone is related to the compound target, not “more general” than all of it. No compilation of the red-teamer's examples was reproduced here; do not promote H0 to built on that assertion.

### RT-AUDIT-18/22 — confirmed (medium)

Confirmed. Over.lean:273,279 supplies restriction to J.over X, and Pullback.lean:55–82 supplies its left adjoint, with the right-adjoint existence / Kan-extension and sheafification hypotheses. For abelian coefficients this is the slice-site extension-by-zero construction (also checked against Stacks 03DH/03DI). It is a real component of the compound supports target, so partial is appropriate. The adic slice-site equivalence, geometric stalk/support description, closed-support functors and constructible/Tate-twist theory remain missing. Use related/special-case fits for this component, not “more general” than the whole compound target; it is not an arbitrary Rf_! construction.

### RT-AUDIT-18/23 — confirmed (medium)

Confirmed. smallEtaleTopology (Etale.lean:50) applies to every scheme, including a spectrum over any valuation ring. AffineEtale.lean:149–156 gives Grothendieck-abelian abelian/module sheaves, so the absence of étale sheaves is false. Replace that clause in both parent and child copies. State the remaining debt as the packaged geometric small-site morphisms and their derived functors/actions/comparisons for this nearby-cycle construction, not a blanket absence of every functor between over-categories: generic categorical base-change machinery must still be considered. Keep the nearby-cycle target absent and distinguish existing sheaf carriers from the missing theorem.

### RT-AUDIT-18/24 — confirmed (medium)

Confirmed. C6 explicitly requires H4 and uses its annulus/open-ball calculation to prove a diamond invariance theorem; it does not reconstruct H4. H3 explicitly imports EDC.2's scheme trace/pairing and proves its analytic-curve transfer. Their carriers and conclusions differ, and both supplier edges are already stated. Remove C6 from H4.duplicates and EDC.2 from H3.duplicates; retain provenance in target notes.

### RT-AUDIT-18/25 — confirmed (low)

Confirmed. A2 explicitly assigns formal schemes/generic fibres to AdicSpacesPartII and the cohomological specialization to H1; H1:formal-adic-comparison requires F0 and starts with a formal scheme. H0 starts from A1's site, while the geometric-stalk construction is an actual shared interface. H1 explicitly consumes LPV.0–2 and proves the valuation-base extension and trait compatibility. Reword the targets as constructions on these imported objects, remove the A2/R2/F0 false duplicate flags, restrict A1's overlap to the stalk work, and put LPV.0 in the supplier/compatibility note rather than reporting a second trait theory. Apply corresponding wording changes to the parent copies.

### RT-AUDIT-18/26 — rejected (low)

Rejected as a duplication error. The nine repeated targets are exactly the aggregate of H1's four explicitly parented substages; the roadmap itself presents that parent together with its children. The audit specification requires entries for all listed layers and does not require parent targets to be disjoint from child targets or headline totals to count unique strings. A parent duplicates list is not specified to be the exact union of child lists. In particular, propagating R2/F0 would preserve the false positives corrected by 25, and deleting all parent targets in favour of a note would violate the target-list contract. Keep the copies synchronized when applying actual content fixes; the optional display/aggregation redesign is not an independently established audit error.

### RT-AUDIT-18/27 — confirmed (medium)

Confirmed. Etale.lean:50, AffineEtale.lean:149 and SheafCohomology/Basic.lean:55–60 provide the small étale site, Grothendieck-abelian sheaves and Sheaf.H (with sheafification/Ext instances); EtalePoint.lean:64 gives geometric site points. Tau Ceti's SheafCohomology/LongExactSequence.lean:75,82,89,95 supplies the connecting map and all three exactness positions. Correct the absolute absence claims in DWP.1/4/6/8 and its summary. The sites and ordinary/derived sheaf carriers do not prove curve comparisons, constructibility, Frobenius purity or Leray. Also narrow “no j_*” to missing packaged geometric functors for the application, rather than denying the generic pushforward. Retain the target verdicts.

### RT-AUDIT-18/28 — confirmed (low)

Confirmed as a reusable proof route, not a ready-made power-series theorem. For an integer q≥2 and nonnegative real c_k with finite positive power-series radius R, define a(q^k)=c_k and a(n)=0 otherwise (including n=0). Reindexing gives L(a,s)=P(exp(−s log q)); absolute-convergence equivalence gives σ=−log R/log q. An analytic extension at R would compose to one at σ, contradicting Landau.lean:290. For the meromorphic pole form (:335), the local change of variable has derivative −R log q≠0, preserving pole order. These reindexing, abscissa and local analytic/meromorphic transport lemmas still need formalization; do not promise their Lean proof is a one-line instantiation. Keep partial and the independent later meromorphic-pole obligations.

### RT-AUDIT-18/29 — confirmed (low)

Confirmed. Matrix.charpoly_transpose (:167) proves the matrix dual component, not the whole tensor/dual spectrum target; use special case. Matrix.spectrum_transpose (Charpoly/Eigs.lean:88) gives the spectrum statement over a field. Tau Ceti's Lie/Weights/TensorProduct.lean:96,215 gives additive generalized eigenvalues/weight spaces for the Lie action x⊗1+1⊗x; it is related proof infrastructure, not the multiplicative f⊗g result. Retain its finite-dimensional triangularizable and nilpotent-Lie hypotheses where the full weight decomposition is cited. Keep partial and at most five declarations: replace a weaker determinant/trace citation if adding both new candidates.

### RT-AUDIT-18/30 — confirmed (low)

Confirmed. AbelJacobi/Basic.lean:53 defines weightedAbelJacobiClass for an abstract order system, with weighted-degree-zero principal divisors and a chosen point of weight one; :90 identifies equality with linear equivalence. This is the map x↦[x−w(x)x₀] into the order-system Pic⁰, not a Picard scheme, Jacobian morphism or Tate realization. Add as related under exactly that scope; retain absent for the H¹/Jacobian comparison target.

### RT-AUDIT-18/31 — confirmed (low)

Confirmed as missing reuse/specialization provenance. A4 constructs the étale Tate module local system, and upstream EllipticCurves Layers 1–2 explicitly plan dual isogenies/Verschiebung, degree positivity and the prime-to-characteristic Tate module/Weil pairing. DWP.1 should name these established owners when its audit target includes the underlying objects. Specify the elliptic case with its principal polarization and realization comparison; it does not supply arbitrary-dimensional Rosati positivity or H¹ of every curve. DWP.1's stage uses the Tate realization and imports generic A6 results, so do not infer three independent duplicate constructions merely from shared inputs. Reword the target/reuse notes and record only genuinely shared theorem subtargets as overlaps.

### RT-AUDIT-18/32 — confirmed (low)

Confirmed. FF.2 imports DWP.7's estimates; EDC.7 imports DWP.9's absolute hard Lefschetz; LPV.7:invariant-cycles supplies 6.2.8–6.2.12 for DWP.9's 6.2.13 argument; R34.6 consumes DWP.10; LPV.7:semistable-curves computes geometric monodromy before weights. These are explicit directed handoffs with different outputs. Remove the five named duplicate entries and retain their dependency/provenance notes outside the duplicates arrays. Prefixing “not a duplicate” inside a duplicates entry would leave a misleading machine-readable overlap.

### RT-AUDIT-18/33 — confirmed (low)

Confirmed. DWP.4's actual export is Weil I 1.7, and WC.3 explicitly owns the deduction 1.7⇒1.6 with integral factors and ℓ-independence. Reword the audited DWP.4 target to 1.7 and name WC.3 as the consumer proving 1.6. This follows the two stage descriptions and the audit's own handoff note; no new ownership decision is needed.

### RT-AUDIT-18/34 — confirmed (medium)

Confirmed as partial finite-level duality, with a bridge still required. FiniteAbelian/Duality.lean:107 extends characters from any subgroup of a finite commutative group when the target has enough roots for its exponent; :151 gives the evaluation double-dual equivalence. For m=ℓ^n>0 choose a primitive m-th root in ℂ. Characters of an m-torsion group land in μ_m, and the identification μ_m≃(ℤ/m,+) transports these results to Hom_(ℤ/m). Additive maps of ℤ/m-modules are ℤ/m-linear because scalar multiplication comes from integer multiples. For self-injectivity apply extension to each ideal of ℤ/m as an additive subgroup of the ambient finite group ℤ/m, then Baer's criterion (Injective.lean:401); this addresses all modules via the criterion, not only finite modules. Record these as related, change both target copies to partial, and keep the linear transport/Baer instantiation, sheaf-complex duality and ℤ_ℓ-derived Ext statements as unformalized obligations. Do not claim the bridge compiled or has a proved line count.

### RT-AUDIT-18/35 — rejected (medium)

Rejected. The proposed new duplicate is a declared supplier–consumer relationship of the same kind correctly removed by 32 and 38. EDC.7 explicitly requires DWP.8 and imports its upper/lower-weight formalism, then proves perverse intermediate-extension, weight-filtration, decomposition and relative hard-Lefschetz results. The audited target names these perverse outputs; it does not state that EDC.7 reconstructs the six-operation weight formalism. A broad “BBD 5.1” locator does not establish that ownership claim. The existing DWP.9 prerequisite entry is not a precedent for adding another false duplicate. A more precise source/dependency note can be useful, but this duplicate finding is not established.

### RT-AUDIT-18/36 — confirmed (medium)

Confirmed, limited to the common correspondence API. GS.3's description establishes cohomological correspondences and adjunction maps with only GS.2 as an input, while EDC.8 explicitly owns the general correspondence/duality construction. Add the missing shared-owner route. GS.3 still owes stack/shtuka, truncation and filtered-colimit compatibility with coefficient/support control: EDC.8's scheme-level construction alone does not establish these. Its bounded-truncation action and transition proofs remain distinct work, and ET.5's already-declared import is not itself a duplicated construction.

### RT-AUDIT-18/37 — confirmed (low)

Confirmed, with coefficient and realization qualifications. M.4 constructs higher Chow groups, moving lemmas and pull/push operations; degree-zero higher Chow groups overlap EDC.3's classical Chow infrastructure in the common smooth-field scope. M.8 constructs étale Chern classes/regulators without naming EDC.3's geometric cycle-class supplier. Record reuse/compatibility of that cycle-class component as well, but do not identify all arithmetic/integral regulator constructions with EDC.3's map or assume the motivic (2r,r) comparison without its coefficient and Chow–motivic identifications. Both routes need a shared carrier; arithmetic-base and regulator-specific extensions remain at M.4/M.8.

### RT-AUDIT-18/38 — confirmed (low)

Confirmed. ET.2a explicitly calls its two prefixes re-exports of EDC, with the same source categories/operators and no new aliases; WC.2 uses EDC.2's actual pairing and has a requires edge to it. Remove the ten specified consumer entries from the EDC duplicate arrays. WC.2's further reciprocity derivation is separately stated and is outside this deletion; do not remove EDC.8's overlap by inference from the pairing import. Record consumers in prose rather than inventing an unapproved schema field.

### RT-AUDIT-18/39 — confirmed (low)

Confirmed. Sheaf/PullbackContinuous.lean:48–82 supplies a left adjoint to module-sheaf pushforward, with the right-adjoint-existence hypothesis and its presheaf/sheafification construction. For the identity site functor and a map of ring sheaves, this is underived scalar extension adjoint to restriction. Correct “only restriction” and cite the pullback as related; retain absent for the compound derived-tensor/reduction target. This does not remove the necessary sheafification/adjoint hypotheses or construct a derived tensor product.

### RT-AUDIT-18/40 — rejected (low)

Rejected. Plumbing/BlowUp.lean:552,586,593 proves an integer-lattice intersection-form identity for a modified plumbing graph. It does not construct a scheme blowup, its étale cohomology, exceptional Gysin map, restriction or trace, and the finding gives no bridge to those carriers. The audit's “Only the Rees algebra” is scoped to scheme-blowup infrastructure; L5 even explicitly acknowledges the separate plumbing-graph blowup. A suggestive surface analogy is not a missing reusable declaration for this target and is not “nearer” scheme geometry than the Rees algebra. The existing absent verdict and scheme-scoped note need no change for this finding.

## Pinned public source register

- [Mathlib/Algebra/Category/ModuleCat/Presheaf/Pullback.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Presheaf/Pullback.lean)
- [Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean)
- [Mathlib/Algebra/Homology/DerivedCategory/Basic.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean)
- [Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean)
- [Mathlib/Algebra/LinearRecurrence.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/LinearRecurrence.lean)
- [Mathlib/Algebra/Module/Injective.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Injective.lean)
- [Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean)
- [Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean)
- [Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean)
- [Mathlib/AlgebraicGeometry/Sites/Etale.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean)
- [Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean)
- [Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean)
- [Mathlib/CategoryTheory/Abelian/GrothendieckCategory/EnoughInjectives.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/GrothendieckCategory/EnoughInjectives.lean)
- [Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean)
- [Mathlib/CategoryTheory/Abelian/RightDerived.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/RightDerived.lean)
- [Mathlib/CategoryTheory/Adjunction/Additive.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Adjunction/Additive.lean)
- [Mathlib/CategoryTheory/Sites/Abelian.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Abelian.lean)
- [Mathlib/CategoryTheory/Sites/Continuous.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Continuous.lean)
- [Mathlib/CategoryTheory/Sites/GlobalSections.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/GlobalSections.lean)
- [Mathlib/CategoryTheory/Sites/Over.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Over.lean)
- [Mathlib/CategoryTheory/Sites/Pullback.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Pullback.lean)
- [Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean)
- [Mathlib/FieldTheory/Galois/NormalBasis.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Galois/NormalBasis.lean)
- [Mathlib/GroupTheory/FiniteAbelian/Duality.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FiniteAbelian/Duality.lean)
- [Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean)
- [Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean)
- [Mathlib/NumberTheory/DirichletCharacter/GaussSum.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/GaussSum.lean)
- [Mathlib/NumberTheory/GaussSum.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/GaussSum.lean)
- [Mathlib/NumberTheory/Height/NumberField.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/NumberField.lean)
- [Mathlib/NumberTheory/JacobiSum/Basic.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/JacobiSum/Basic.lean)
- [Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean)
- [Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean)
- [Mathlib/RingTheory/Extension/Presentation/Core.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Presentation/Core.lean)
- [Mathlib/RingTheory/NoetherNormalization.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/NoetherNormalization.lean)
- [Mathlib/RingTheory/Polynomial/Dickson.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Dickson.lean)
- [Mathlib/RingTheory/RootsOfUnity/AlgebraicallyClosed.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/AlgebraicallyClosed.lean)
- [Mathlib/RingTheory/Smooth/Locus.lean](https://raw.githubusercontent.com/leanprover-community/mathlib4/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Smooth/Locus.lean)
- [TauCeti/Algebra/Category/ModuleCat/CartanMap.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Category/ModuleCat/CartanMap.lean)
- [TauCeti/Algebra/Lie/Weights/TensorProduct.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Lie/Weights/TensorProduct.lean)
- [TauCeti/AlgebraicGeometry/Curves/StableReduction/DVRExtension/Basic.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/Curves/StableReduction/DVRExtension/Basic.lean)
- [TauCeti/AlgebraicGeometry/Group/Smooth.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/Group/Smooth.lean)
- [TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Basic.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Basic.lean)
- [TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean)
- [TauCeti/CategoryTheory/GrothendieckGroup/Split.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Split.lean)
- [TauCeti/CategoryTheory/Sites/SheafCohomology/LongExactSequence.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Sites/SheafCohomology/LongExactSequence.lean)
- [TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean)
- [TauCeti/LinearAlgebra/Matrix/SmithNormalForm.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/SmithNormalForm.lean)
- [TauCeti/LowDimTopology/Plumbing/BlowUp.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LowDimTopology/Plumbing/BlowUp.lean)
- [TauCeti/NumberTheory/LSeries/Landau.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LSeries/Landau.lean)
- [TauCeti/NumberTheory/Multiquadratic/CandidateGenusField/Relative/Artin.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Multiquadratic/CandidateGenusField/Relative/Artin.lean)
- [TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean)
- [TauCeti/NumberTheory/NumberField/Cyclotomic/IrreducibleOfUnramified.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Cyclotomic/IrreducibleOfUnramified.lean)
- [TauCeti/NumberTheory/NumberField/Quadratic/Splitting.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Quadratic/Splitting.lean)
- [TauCeti/RepresentationTheory/Homological/ContCohomology/LongExact.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/LongExact.lean)
- [TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/ShortExact.lean)
- [TauCeti/RingTheory/IntegralClosure/NormalizationFinite.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/IntegralClosure/NormalizationFinite.lean)
- [TauCeti/RingTheory/IntegralClosure/PurelyInseparable.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/IntegralClosure/PurelyInseparable.lean)
- [TauCeti/RingTheory/IntegralClosure/Transfer.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/IntegralClosure/Transfer.lean)
- [TauCeti/RingTheory/Polynomial/Resultant/AdjoinRoot.lean](https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Polynomial/Resultant/AdjoinRoot.lean)

## Validation

Final validation: **PASS** — red-team checker, exact 40-ID coverage, three-file intake (0 problems). At publication, 46 control blobs and all three deliverable guards matched fresh main `10e91cc8b4ea8f53c47371f38682334892cee3b0`; the bot-confirmed claim and issue instructions were unchanged. All 59 registered pinned source files matched their public pinned contents, with no sorry/axiom-declaration scan hits. No Lean compilation.
