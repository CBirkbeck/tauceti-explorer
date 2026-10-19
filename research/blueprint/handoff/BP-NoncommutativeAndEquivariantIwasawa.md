# BP-NoncommutativeAndEquivariantIwasawa — completed target-level pass

Codex, session `codex-pjS4kZ`, 19 October 2026. Refs #1015. The bot confirmed the claim in comment 6256747262, following claim comment 6256745945. This continues the nine checkpoints of Claude Code `cc-39fac3`; it is a completed planning pass, not a checkpoint or a claim of gap-free closure.

## Result and scope

The packet has status **complete**. All eight stages NE.0–NE.7 are **planned**; none is closed. Every implementation status remains unchecked, and no independent-review object has been added. At target-level granularity, every stage target is represented and its prerequisite chains end in the checked baseline, exact existing nodes, supplier contracts or explicit gaps. The pass stops here as PROTOCOL §0 requires once every stage is planned; its 135 nodes are below the 300-node budget.

There are **135 nodes**: 22 definitions, 28 constructions, 26 lemmas, 53 theorems, 4 comparisons and 2 applications. They contain **239 API items**, **179 planned unit tests**, **33 planets**, and **35 pinned baseline declarations**. There are **16 recorded gaps** and **27 supplier contracts**, of which two document existing current-upstream supplies. These are mathematical specifications and source obligations, not implementation claims or executable test totals.

The inherited 108-node plan was continued rather than replaced: two duplicated generic nodes were removed, 29 targets were added, and surviving stable node ids were retained. The reader now contains every target statement, hypothesis, proof step, API item, unit test, acceptance check, prerequisite and source locator, organized by mathematical layer. The old checkpoint chronology is replaced by the present coverage and obligations.

## Mathematical changes a reviewer should check

- **NE.0:** Fu’s ordered coordinates, p-valuations, integral ordered series and bounded-denominator rationalization, Auslander regularity, rational global dimension, homology with diagonal algebraic twists, and the CDT/Lazard exterior-cohomology computation are explicit targets. Absence of p-torsion remains necessary for the finite-global-dimension theorems. At 2 the valuation weight is 2 plus the lower-series depth, satisfying the strict Lazard bound.
- **Filtrations:** the mod-p augmentation grading is polynomial for a uniform group. The integral maximal-ideal grading requires the stronger commutator condition stated at its target; it is not asserted polynomial for every uniform group. The uniform semidirect example with aba⁻¹=b^(1+p) gives AB−BA=P B in degree two. Ramified coefficients and the filtered Auslander transfer have explicit proof-leaf obligations.
- **NE.1–NE.2:** retain the canonical denominator set, rather than replacing it by all nonzero elements or Fu’s microlocal set. Relative perfect complexes and the localization sequence remain meaningful with p-torsion. Identification with all finitely generated torsion modules requires the extra finite-global-dimension hypothesis. Boundary surjectivity with p-torsion uses perfect-complex/relative-triple arguments, never a finite projective resolution of every module.
- **Signs:** use ∂[s]=[Λ/Λs]. For the two-term complex in degrees −1,0, the identity determinant trivialization gives the Burns–Venjakob characteristic function f⁻¹ and boundary −[C]. The totally real dual complex has class [Z_p]−[X_Σ]. The finite-value leading-term check gives f(0)⁻¹ without an unspecified sign. Evaluation versus Euler characteristic uses the contragredient and the coefficient-field degree consistently.
- **NE.3:** separate total-quotient semisimplicity, the generic reduced-norm supplier, finite-level integral SK₁, total-quotient SK₁, full determinant functions and isolated Artin evaluations. No assertion that SK₁ always vanishes, always fails to vanish, or that interpolation universally gives uniqueness is made.
- **NE.4–NE.5:** add equivariant compact support and perfect base change, an explicit real-place two-primary correction contract, normalized interpolation/functoriality, and abelian comparison. A conjectural predicate supplies no existence theorem. The arithmetic perfection theorem with p-torsion and the p=2 correction remain obligations.
- **NE.6:** retain the full Kakde route and add the separate Ritter–Weiss logarithmic pseudomeasure, Möbius congruence, integrality and existence route. The 2010 theorem keeps odd p and μ=0 and leaves uniqueness open. The 2026 Theorem 1A is a conditional reduction to the explicit division-algebra SK₁ family, not a theorem that all those groups vanish. The Gambheera–Popescu result is an unconditional abelian CM minus, S,T-smoothed Selmer Fitting formula; its Tate-module comparison still requires μ=0. The reader has a source-qualified comparison table.
- **Kakde carry cocycle:** normalization at the identity does not make τ(g,g⁻¹) equal to 1. The cyclic carry example forces an inverse factor. Changing a section or a generator changes the presentation by the appropriate cocycle equivalence. This is source finding E15; E1–E14 retain Claude’s credit and are paraphrased in our own words. All findings require independent review; none is presented as a published erratum.
- **NE.7:** add Fitting orders, integrality rings, denominator ideals, maximal noncommutative Fitting invariants, the one-way relative-characteristic comparison, annihilation and an exceptional-factor leading-term identity. Maximize over presentations; apply the denominator ideal before claiming an integral central annihilator. The Burns–Venjakob semisimple category is closed under the corrected direct-sum condition, not arbitrary extensions. Arithmetic semisimplicity and local factorization remain hypotheses.

## Ownership and current upstream

The current Tau Ceti library and current TauCetiRoadmap were read in place. No build was run in those checkouts. The roadmap snapshot is commit `0d144d044dacebca17b654695b6f1ad58f159b27`, additional to the recorded pins. ProfiniteArithmetic and InductionRestriction were read in full for style and boundaries; ProfiniteProPGroups, LocalGaloisGroups and IntegralHeckeAndGaloisDeterminants were also checked.

- Removed `NE.0/lower-p-series`: current ProfiniteArithmetic already owns `TauCeti.pLowerCentralSeries` and `TauCeti.IsProP.padicPow`. Our P_i is its zero-based λ_(i−1). These are post-pin inputs, not claimed baseline declarations.
- Current ProfiniteProPGroups Layer 9 owns the completed Z_p group-algebra carrier and cyclic coordinate. Its exact registered stage is a supplied-current-main contract. PadicMeasuresIwasawaAlgebras L1 supplies the additional coefficient/module interfaces.
- Removed `NE.2/determinant-functor`: import GeneralAlgebraicKTheory K.4. Generic localized determinant and perfect-category interfaces remain supplier contracts.
- Generic twisted group algebras come from current InductionRestriction Layer 7; NE.6 owns only the Iwasawa-specific carry and comparisons. Its existing Clifford and Brauer layers supply the induction arguments.
- Generic reduced norms come from the exact existing node `IntegralHeckeAndGaloisDeterminants:IHG.0/azumaya-determinant`, consistent with its current upstream Layer 0. NE.3 only applies that theory to the stated Iwasawa quotient.
- The stable id `NE.3/twisted-module` now has parent stage NE.0 and realizes both NE.0 and NE.3. Fu needs the diagonal twist before localization. The M_H-preservation theorem stays in NE.2. This removes a forward-layer dependency without renaming the existing node.
- NE.0 owns group-side uniform coordinates, p-valuations and homology. NoncommutativeAnalyticDistributions owns L_G, log/exp and the analytic-structure equivalence, as routed by PAPER-FU-24. That name has no registered stage here; its exact need is a gap, with no invented supplier id.
- The `restructure` proposal extends **KTheoryLowDegrees, Part II** for finite p-adic group orders, Whitehead kernels and logarithms, and **GeneralAlgebraicKTheory, Part II** for determinant Picard/localized characteristic interfaces. Current U.3/U.5 and K.4 references are exact requests for those extensions, not claims that the existing scope already proves them. The maintainer assigns the new ids and redirects consumers.

## Remaining work by stage

An independent reviewer should check the completed target pass first. Refinement jobs then discharge the explicit obligations below and update their affected targets. Do not resume the old checkpoint sequence or claim that all gaps are closed.

| Stage | Status | Required refinement |
|---|---|---|
| NE.0 | planned | Check the primary uniform-basis criterion and filtered Auslander transfer; import current upstream foundations to the pinned environment. Register the analytic-distributions supplier for L_G and the analytic-structure equivalence; complete finite-free ramified coefficient comparison. |
| NE.1 | planned | Discharge the cross-roadmap completed coefficient and noncommutative perfect-category suppliers; the Ore proof itself is source-decomposed. Discharge noncommutative prime-radical nilpotence and finite p-group augmentation-ideal nilpotence, the proof leaves of CFKSV Lemma 2.5 and Proposition 2.6. |
| NE.2 | planned | Check the general semilocal K₁/unit theorem and idempotent-lifting source leaves; resolve Fukaya–Kato localized determinant input. |
| NE.3 | planned | Resolve finite-group SK₁/Whitehead suppliers, the exact arithmetic X₁(11) data and Conjecture 4.8 evidence; no universal uniqueness is claimed. |
| NE.4 | planned | Prove the cochain boundedness/finite-generation and arithmetic perfectness suppliers, especially when G has p-torsion. Supply the real-place two-primary correction before any p=2 specialization; resolve CFKSV Selmer-module arithmetic inputs. |
| NE.5 | planned | Establish normalized abelian comparison maps with the exact local factors and determinant trivializations; acquire the primary Fukaya–Kato formulation. Reproduce or source-audit the Dokchitser–Dokchitser data; interpolation and existence remain separate conjectural contracts. |
| NE.6 | planned | Audit Oliver/Wall, the earlier RW congruence inputs and the finite-p-extension μ transfer proof; retain every source hypothesis. Check the RW2026 division-algebra classification and GP minus-module comparison supplier; the conditional SK₁ vanishing is not established. |
| NE.7 | planned | Resolve determinant, local epsilon, Nekovář height and noncommutative Fitting-order proof leaves. Prove arithmetic semisimplicity/local factorization in each exceptional-zero application; no extra vanishing theorem is inferred. |


## Exact source and proof-leaf obligations

The packet and reader list the consuming node ids for every obligation. The following list is sufficient to resume without this run’s scratch files.


1. **Uniform-group criterion and analytic supplier boundary.** NE.0 owns the group-side powerful/uniform criterion, ordered coordinates and Iwasawa homology. Schneider §26 supplies ordered valued bases, and §§27–29 supply analytic comparison, but a primary proof that every finitely generated powerful torsion-free pro-p group has the required uniform basis remains to be checked; DDMS is not cleared and was not accessed. NoncommutativeAnalyticDistributions owns L_G, log/exp, and the analytic-structure equivalence routed by PAPER-FU-24. That owner has no registered stage here, so no guessed node id is used.

2. **Arithmetic inputs of CFKSV Proposition 3.11.** The Euler characteristic formula (77) (Coates–Howson, Theorem 1.1) and the Mordell–Weil and Tate–Shafarevich data of E = X₁(11) over ℚ(μ_5), F_1 and F_2 (CFKSV [12], [16]) are quoted, not proved; they belong to the Selmer and Euler-characteristic owners (SelmerIwasawaCohomology), which do not plan them.

3. **CFKSV §5's inputs from Coates–Howson, Venjakob, Schneps and the CM two-variable main conjecture are not planned.** Verified: the proofs of Lemmas 5.3–5.4, Corollary 5.5 and Proposition 5.6 (pp. 199–201) cite [8] and [9] (Coates–Howson; Proposition 2.13, Lemma 2.1, Lemma 2.5, Remark 2.6), [11] (finiteness of H¹(H_F, E_{p^∞})), Venjakob [26], Schneps [28], Rubin [27] and, for the example, [16] (X(E₁/ℚ(μ₅)^cyc) = 0). None is read or planned.

4. **The numerical data for X₁(11) at p = 5 are quoted from Dokchitser–Dokchitser.** CFKSV equations (108)–(115) attribute their numerical L-values and arithmetic data to Dokchitser–Dokchitser. Those computations have not been reproduced, so the node is a consistency check conditional on that table, not an independent numerical proof.

5. **Finite p-adic group-ring Whitehead and logarithm inputs.** The exact finite-group prerequisites used by Kakde are Oliver Theorems 2.5, 2.8–2.10, 6.6, 6.8, 7.4, 11.2, 12.3(4) and Proposition 12.7, with Wall norm and torsion comparisons. The book is not cleared and was not read; the statements are supported only by Kakde’s explicit citations. KTheoryLowDegrees U.3/U.5 must extend its existing scope to these p-adic group-order theorems. Kakde’s Iwasawa-specific proofs of Lemma 66 and Proposition 67 are planned here, not substituted for the finite-level inputs.

6. **Fukaya–Kato's §1 results on Iwasawa algebras and the complex C(F_∞/F) are not freely available.** A cleared primary copy of Fukaya–Kato was not established. Required inputs are Propositions 1.5.1 and 1.5.3 (K₁ continuity and pro-p kernel), Proposition 1.3.7 (localized characteristic isomorphism), and the perfection/base-change theorem for the dual arithmetic complex with possible p-torsion. The zeta statement is taken as a conjectural contract from Burns–Venjakob Conjecture 4.1; it never supplies existence. Noncommutative finite generation plus no p-torsion gives the separate finite-global-dimension route in NE.4, but does not discharge the p-torsion case.

7. **BV §6 rests on unread Fukaya–Kato and Nekovář results.** The local epsilon-isomorphism contract uses Fukaya–Kato Propositions 3.3.5, 1.6.5 and 4.2.17, Conjecture 3.4.3 and Theorem 4.2.26 as restated in Burns–Venjakob §6. The arithmetic height comparison uses Nekovář Theorem 11.3.9. These originals were not read; SelmerIwasawaCohomology L2 supplies the requested Selmer/height constructions. The statement retains all local, semisimplicity and height assumptions.

8. **Current upstream foundations postdate the pinned baseline.** Current Tau Ceti and ProfiniteArithmetic already own pLowerCentralSeries and IsProP.padicPow; current ProfiniteProPGroups Layer 9 owns the completed Z_p group algebra and cyclic coordinate. These were read in the current checkout, not asserted present at f790474. Formal work at that pin needs an upstream update or a port of the existing declarations, never a duplicate definition. The current library/roadmap source identities are recorded under upstreamSnapshot.

9. **Filtered Auslander transfer and ramified coefficient proof leaves.** Venjakob Theorems 3.19–3.22 and 3.26–3.30 provide the precise filtered and Iwasawa statements. The general Björk filtered Auslander transfer cited there was not read independently, nor was the Brumer coefficient generalization. For ramified O, prove the finite-free coefficient comparison and run the DVR filtered argument; do not deduce regularity merely from module finiteness or quote a commutative flatness instance.

10. **Real two-primary arithmetic complex.** No p=2 main theorem is supplied by the odd-prime sources. An admitted two-primary extension needs real-place complete Tate cochains, duality and a bounded perfect replacement with explicit correction terms. Ordinary real-place cohomology is unbounded 2-periodic and is not silently discarded. The comparison node is the exact input contract, not a constructed perfect complex at 2.

11. **Ritter–Weiss earlier-paper congruences and SK₁ classification.** RW2010 Propositions 5–6 import Möbius–Wall and abelian pseudomeasure congruences from earlier papers, and its support reduction uses the listed trace and logarithm inputs. Those originals need a proof-leaf audit. RW2026 Theorem 1A imports Lau’s classification of the explicit division-algebra components; only the introduction and reduction theorem were read, not every classification proof or later case calculation. Its D_(r,s,F) SK₁-vanishing hypothesis remains a hypothesis, not a theorem.

12. **Unconditional abelian minus comparison and local hypotheses.** Gambheera–Popescu Theorem 6.30 is stated with its published S,T hypotheses and its minus Selmer/1-motive module. Supplier exact sequences and the covariant Z_p-dual action must be formalized before identifying it with another complex. Their Proposition 7.10 comparison to the Tate module invokes μ=0, so that comparison cannot be used to remove μ=0 in a different statement.

13. **Noncommutative Fitting-order and reduced-norm foundations.** IntegralHeckeAndGaloisDeterminants supplies the generic reduced norm; its current roadmap is already upstream. Nickel’s checked survey supplies Fitting-order, integrality-ring, denominator-ideal and annihilation proofs at target level. The survey’s original references for existence of maximal orders, reduced Cayley–Hamilton and maximal Fitting invariants require a primary proof-leaf check. No higher-dimensional noncentral Iwasawa order or arbitrary converse from Fitting equality is asserted.

14. **Arithmetic semisimplicity and exceptional-zero factorization.** The scalar Laurent-factor identity is elementary; its arithmetic application needs the stated local Euler-factor factorization and the source’s nondegenerate height/regulator and semisimplicity hypotheses. A global main-conjecture equality or interpolation at nonzero values does not prove those hypotheses. BV’s Tate/critical-motive comparisons are conditional as specified at their nodes.

15. **Semilocal K₁ and integrality-evidence proof leaves.** CFKSV cites the semilocal units-surject-K₁ theorem of Vaserstein and invokes supporting cases for Conjecture 4.8, including Kato Proposition 8.19. Their precise primary proofs were not checked here. The former is requested from KTheoryLowDegrees U.3; the latter remains evidence for a conjectural predicate, not a claimed general theorem.

16. **Noncommutative radical and finite-group augmentation leaves.** CFKSV Proposition 2.6 uses the two-sided prime radical’s nilpotence for a noetherian ring and compatibility with the central total quotient, citing [24] §§0.2.6 and 2.3.7. The commutative nilradical does not supply this. Lemma 2.5 also needs nilpotence of the augmentation ideal of F_p[Δ] for a finite p-group Δ. No matching statement was found in the pinned libraries by augmentation/nilpotence search. Both statements are precise proof leaves; complete their finite-dimensional/group-ring arguments or import a verified supplier before closing NE.1.


## Supplier contracts

All 27 contracts record exact statements and consuming nodes in the packet and reader; repeated supplier stages represent different interfaces. Existing exact blueprint nodes are cited directly and are not counted here. The two supplied contracts are explicit availability records; the other 25 remain requests.


1. `PadicMeasuresIwasawaAlgebras:L1` — open. Beyond the Z_p completed group algebra and cyclic-coordinate carrier already provided by current ProfiniteProPGroups Layer 9: F_p and finite-free O coefficient comparison, continuous compact-module universal property, augmentation, and closed-subgroup induction/restriction maps, compatible with finite quotient projections. Do not reconstruct the current completed Z_p carrier.

2. `GeneralAlgebraicKTheory:K.4` — open. The category C^p(R) of bounded complexes of finitely generated projective modules over a (noncommutative) ring R with quasi-isomorphisms and degreewise split cofibrations, as K.4 states for the Gillet–Waldhausen comparison; NE.1 defines the subcategory Σ_S of it.

3. `GeneralAlgebraicKTheory:K.5` — open. Noncommutative Ore localization via the category of S-acyclic bounded perfect complexes: exact sequence K₁(A)→K₁(A_S)→K₀(A,A_S)→K₀(A)→K₀(A_S), natural for denominator-preserving ring maps, with ∂[s]=[A/As]. A torsion-module description requires its separate resolution/finite-projective-dimension hypotheses; it is not automatic for all modules when p-torsion is allowed.

4. `GeneralAlgebraicKTheory:K.3` — open. Invariance K₀(A)≅K₀(A/I) for a complete separated ring and an ideal I⊆Jac(A), by lifting idempotents and their conjugacies. The separate resolution-theorem input is cited by its exact K.3 node.

5. `PadicMeasuresIwasawaAlgebras:L4` — open. Characteristic power series/ideals of finitely generated torsion Λ(Γ)-modules with the structure theorem up to pseudo-isomorphism. Also the norm of characteristic series under Λ_𝒪(Γ) → Λ(Γ) (Bourbaki VII §4.8, Prop. 18).

6. `GeneralAlgebraicKTheory:K.7` — open. Morita invariance K_i(M_n(A)) ≅ K_i(A) (i = 0, 1), compatible with the connecting maps of the localisation sequence, and K₁(F) = F^× via the determinant for a field F.

7. `SelmerIwasawaCohomology:L3` — open. For Γ≅Z_p and a finitely generated torsion O[[Γ]]-module N with characteristic series f, finiteness of Γ-Euler characteristic is equivalent to f(0)≠0 and χ(Γ,N)=|f(0)|_p^(−[L:Q_p]); also the Hochschild–Serre Euler-product formula over 1→H→G→Γ→1, under finite homology and Euler-characteristic hypotheses. RS-16 moves these general Iwasawa cohomology inputs from IntegralIwasawaTheory I.4 to this owner.

8. `ArithmeticGaloisDuality:R02.4` — open. Selmer groups of an elliptic curve over algebraic extensions L/ℚ, 𝒮(E/L) = ker(H¹(L, E_{p^∞}) → Π_w H¹(L_w, E)), their Pontryagin duals X(E/L) with the Λ(Gal(L/F))-action, and the restriction maps between layers (CFKSV §5); later, the Poitou–Tate duality behind equivariant Selmer complexes (NE.4). Also: the cohomological dimension and weak Leopoldt inputs for H²(Gal(F_Σ/F_∞), ℚ_p/ℤ_p) = 0 in the complex C(F_∞/F) (cohomological-dimension-bound is cited).

9. `AutomorphicPadicLFunctions:L3` — open. The Deligne–Ribet (Cassou-Noguès, Barsky) p-adic L-functions G_ψ ∈ 𝒪_ψ⟦T⟧ of a totally real field and the pseudomeasure ζ ∈ Q(Λ(H × Γ)) for H finite abelian, with the interpolation G_ψ(u^n − 1) = L_Σ(ψ, 1 − n) and G₁(u^n − 1)/(u^n − 1) = L_Σ(1, 1 − n) (Kakde §3).

10. `IntegralIwasawaTheory:I.5` — open. Wiles's main conjecture for totally real fields at odd p (Annals 1990, Theorems 1.3–1.4): h_ψ(T) and G*_ψ(T) generate the same ideal, and μ_ψ = 0 when p ∤ #Gal(F_ψ/F).

11. `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction` — open. Brauer's induction theorem, for the p-adic L-functions of nonabelian Artin characters and for interpolation in the reductions (Kakde §§3–4).

12. `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup` — open. Clifford's dichotomy for a normal subgroup A (Serre, Linear representations of finite groups, Proposition 24: an irreducible ρ either restricts to an isotypic representation of A or is induced from a proper subgroup containing A), and its consequence that irreducible representations of supersolvable, in particular finite p-, groups are monomial (Serre, Theorem 16). Kakde's Lemma 92 and Proposition 93 use both.

13. `AnalyticNumberTheory:AN.4` — open. Inductivity of Σ-truncated Artin L-functions, L_{Σ_K}(Ind_K^F ρ, s) = L_{Σ_F}(ρ, s) for Σ_K the primes of K above Σ, at the negative integers s = 1 − r, for the interpolation in Kakde §6.1 (Propositions 93 and 95).

14. `AutomorphicPadicLFunctions:L3` — open. The Deligne–Ribet toolkit behind Kakde §6: rationality and continuation of partial zeta values ζ(δ(x), 1 − k) (Klingen, Siegel); the Hilbert Eisenstein series G_{k,ε} with its standard q-expansion and constant terms at the cusps (Deligne–Ribet Proposition 6.1 and 2.22); the q-expansion principle (Deligne–Ribet 0.3, 5.13–5.15); and the congruences of Deligne–Ribet Theorem 0.4.

15. `GeneralAlgebraicKTheory:K.4` — open. Deligne's Picard category of virtual objects of P(R) for a noncommutative ring R and the determinant functor d_R on (C^p(R), quasi-isomorphisms) with Burns–Venjakob's properties d)–i): additivity on short exact sequences, acyclicity trivialisations, shifts, extension to D^p(R), Knudsen's description of d_R(C) ≅ ∏ d_R(H^i(C))^{(−1)^i}, and base change; Aut(1_R) = K_1(R).

16. `AutomorphicPadicLFunctions:L3` — open. Greenberg's S-truncated p-adic Artin L-functions L_{p,S}(s, ρ) for totally real fields (Brauer induction from the Deligne–Ribet and Cassou-Noguès p-adic L-functions), with the interpolation L_{p,S}(n, ρ) = L_S(n, ρω^{n−1}) for n < 0; and Colmez's p-adic class number formula for the residue at s = 1 of the p-adic zeta function of a totally real field. Used for BV Conjecture 5.2 and Remark 5.4.

17. `SelmerIwasawaCohomology:L2` — open. Nekovář's Selmer complexes as mapping fibres RΓ(U, W) → ⊕_v RΓ(ℚ_v, W)/U_v^+ with explicit local conditions (Greenberg-type at p), their base change along Λ → O^n and Nekovář's p-adic height pairing (Selmer Complexes §11) with its Bockstein description; used for BV §6.

18. `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs` — supplied-current-main. Current upstream completed Z_p group algebra, its finite quotient projections and cyclic power-series equivalence. These are supplied on current main but postdate f790474, so using them at the pin needs the recorded foundational port, without a new plan of the same objects.

19. `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier` — supplied-current-roadmap. Generic normalized central twisted group algebras, their basis multiplication and change-of-section equivalence; NE.6 instantiates the central carry cocycle only.

20. `SelmerIwasawaCohomology:L0` — open. Continuous compact group homology via completed bar resolutions, the comparison with completed Tor for finitely generated pseudocompact Iwasawa modules, and continuous mod-p cohomology identified with Ext. Keep compact and discrete coefficient conventions separate.

21. `KTheoryLowDegrees:U.3` — open. Reduced Whitehead kernels and functorial reduced determinants for semisimple algebras and p-adic finite group orders; state integral-kernel images separately from SK₁ of a total quotient. Oliver/Wall finite-group inputs and the specific division algebras of RW Theorem 1A require an extension of the existing number-ring scope.

22. `KTheoryLowDegrees:U.5` — open. Oliver–Taylor integral logarithms for p-adic group orders, their kernel and norm compatibility, additive conjugacy-class targets and passage to completed one-dimensional Iwasawa rings; this extends the existing K-theory/logarithm scope and has the precise source-access gap recorded below.

23. `PadicMeasuresIwasawaAlgebras:L5` — open. Pseudocompact inverse limits, derived completed coefficient base change and norm-compatible abelian pseudomeasures, including smoothed minus S,T complexes at the cyclotomic level. These supply coefficient/limit comparisons, not a general noncommutative main conjecture.

24. `IntegralIwasawaTheory:I.9` — open. The normalized abelian zeta determinant contract with exact Euler factors, period trivializations and conventions, and the real-place two-primary correction in any admitted p=2 comparison. Equality of characteristic ideals alone is insufficient; ordinary compact support at real places is not a bounded perfect model at 2.

25. `PadicMeasuresIwasawaAlgebras:L3` — open. Normalized cyclotomic/abelian p-adic measures and pseudomeasures, with distribution relations and specializations matching the chosen cyclotomic coordinate, local factors and coefficient norm.

26. `IntegralIwasawaTheory:I.6` — open. The RW abelian pseudomeasure/norm congruence inputs and finite p-extension transfer of μ=0; for the GP comparison provide the abelian CM S,T minus Selmer and 1-motive exact sequences with the stated covariant dual action, without presupposing μ=0. Generic RW group-presentation/logarithm work moved by RS-16 remains in NE.6.

27. `KTheoryLowDegrees:U.3` — open. For a possibly noncommutative semilocal ring A, the natural units map A^×→K₁(A) is surjective. Combine with the admitted localization’s semilocality; do not infer an isomorphism with units or apply this to arbitrary S*-localizations.


## Sources and provenance

The packet records exact titles, editions, locators, public URLs, download SHA-256 hashes and access dates. The reader gives the bibliography and the corresponding target locators. Everything in these deliverables is stated in our own words; all inherited `excerpt` fields were removed. There are no copied source passages or source-by-source section summaries.

The retained CFKSV, Kakde and Burns–Venjakob analyses and E1–E14 are credited to Claude Code `cc-39fac3`. Its dated `readSections` are retained as provenance, rather than misrepresented as this session’s reading. This session rechecked the relevant conventions and source statements and added the source work below:

- Ardakov–Brown §§2–4; Lazard III.2.1.2, V.2.2.6.3, V.2.2.7.2 and V.2.5.7.1; Venjakob §2 and Theorems 3.19–3.30 for the group/cohomological/filtered claims.
- Schneider, *p-Adic Lie Groups*, §26, pp. 181–192; Theorem 27.1, pp. 192–194; §28, pp. 195–201; §29 through Theorem 29.8, pp. 201–208. The authorized reference copy was read in place; no copy, extraction or passage was retained.
- Fu §§4 and 6, including Theorem 1.4, and CDT Lemmas 4.5.6 and 4.5.9, pp. 662–663.
- CFKSV’s Ore/localization and evaluation conventions; Kakde Lemma 5, the §5.1 carry formula and the retained congruence route; Burns–Venjakob’s characteristic and leading-term conventions. Schneider–Venjakob Proposition 2.3 and its full proof span pp. 11–12 and were rechecked, with the original PDF hash confirmed.
- Ritter–Weiss 2010 introduction and Propositions 1–6, Theorem 7 and the support-reduction proof in §5, pp. 17–22. Ritter–Weiss 2026 introduction and Theorem 1A, pp. 6–8; the other classification and case proofs are not claimed read.
- Gambheera–Popescu’s exact S,T and dual-action conventions, Theorems 6.28 and 6.30 and their proof, plus Proposition 7.10. The arXiv introduction numbers the main result 1.11; the published version numbers it 1.12. Stable internal Theorem 6.30 is used for the full statement.
- Nickel’s Fitting survey §§1–3, including Definitions 2.1 and 2.14, Theorem 2.13, Proposition 2.18, Remark 2.19 and Theorem 3.16.

DDMS, Oliver and Serre were not cleared and were not accessed. No cleared original Fukaya–Kato copy was established. The exact resulting source leaves, together with Nekovář, Brumer/Björk, the earlier RW papers and the arithmetic numerical inputs, remain recorded gaps. No unread original is claimed to have been checked merely because another paper cites it.

## Baseline and validation

The baseline remains Tau Ceti `f790474` and Mathlib `082e2d3` at the full hashes recorded in the packet. Each of the 35 cited declarations was checked in its pinned source statement. The current upstream ownership inventory is separate. The old commutative nilradical and commutative flatness near-misses were removed; noncommutative radical/augmentation nilpotence and the ramified coefficient comparison are explicit obligations.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/NoncommutativeAndEquivariantIwasawa.json`: **0 errors, 0 warnings**, all eight stages planned.
- The reader was mechanically checked against the packet for every target statement, hypothesis, proof step, API name/statement, test name/statement, acceptance check, prerequisite and source locator. Its internal target/source anchors resolve.
- `python3 research/blueprint/intake.py check-files` on the four authorized deliverables: **0 problems**. JSON parses; no excerpt keys, private paths or copied source files are present. `git diff --check` passes.
- `python3 scripts/check_sorry_data.py` on the suggested Lean file passes. The file is **114 lines**, with five light real-bodied definitions, two milestone theorem statements and eleven examples. It follows WORKERS’ current compact-shape rule; the full heavy-carrier inventory remains in the reader, not in fake carrier declarations.
- **The suggested file compiled successfully with `lean-check` at the pinned shared build, exit 0. Its only warnings were the eight expected declarations using `sorry`.** The four Gamma-factor computations and the small matrix determinant computation are proved by arithmetic tactics. Other prototype proofs remain honest placeholders and do not assert formalisation. Adequate memory was checked before compilation; no build, cache update or Lean server was started.

No application, data, content, queue, reserved-id or other roadmap file was edited. Only the issue’s four deliverables are submitted. Public source downloads and scratch work are removed after the pull request is open. No background compilation remains.

The next programme step is independent review of #1015’s complete pass, followed by the specific source/supplier refinements above. This session claims no second job.
