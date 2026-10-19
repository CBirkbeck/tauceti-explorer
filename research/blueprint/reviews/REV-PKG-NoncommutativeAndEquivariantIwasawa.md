# Independent package review: Noncommutative and equivariant Iwasawa theory

Job `REV-PKG-NoncommutativeAndEquivariantIwasawa`, issue #11084. Reviewer: Codex (GPT-6), session `codex-u8RLqt`, 19 October 2026. **Verdict: needs_changes.** This is a completed fixing review, with the unresolved defects identified below. It is not approval for the upstream draft.

The package being reviewed was written by Claude, session `claude-UIFV2H`, for #11082. This reviewer did none of that package job. Only this package's README, Suggested.lean and review.json, and this report, change. The accepted packet and other roadmaps are untouched. This report also serves as the handoff required by WORKERS.md, within PACKAGE_REVIEW.md's permitted paths.

## Defects that prevent acceptance

1. **The noncommutative K-theory foundation is not supplied.** The current GeneralAlgebraicKTheory roadmap has numerical layers, rather than the cited K.3–K.7 identifiers. Its general K-theory and localization work does not identify a target giving the Picard-valued determinant on perfect complexes with the Burns–Venjakob shift, acyclicity, base-change and cohomology comparisons, nor the identification of an Ore-localization fibre with the category of torsion perfect complexes and the specified boundary. Naming these contracts does not establish them. This blocks NE.1.14, NE.2.7–NE.2.10, the determinant-based functoriality of NE.5.7, and NE.7.1–NE.7.18. Complete-ideal K₀ invariance also needs an exact owner target: NE.2.1 gives the intended application and lifting argument but still names an unidentified generic input. Reconcile these contracts with GeneralAlgebraicKTheory and give actual earlier target numbers and proof chains. A spectrum-level localization theorem alone is insufficient for these comparisons.
2. **The homology, height and Euler-characteristic contracts are broader than the supplier.** SelmerIwasawaCohomology has finite-level mapping-fibre Selmer complexes (§2.21), Iwasawa cohomology and Shapiro (§§3.1–3.2), and an abelian Iwasawa-algebra scope (§3.0: ℤ_p^d×Δ). Its §§3.13–3.14 give amplitude and commutative determinant/divisor statements. These do not supply completed compact bar homology and the noncommutative Tor comparison for NE.0.16, the Γ-Euler-characteristic and Hochschild–Serre comparisons of NE.3.6–NE.3.8, or the precise cyclotomic height/Bockstein comparison of NE.7.17. Its later torsion Bockstein pairing is a different statement. The package needs those exact contracts at their owners, including coefficient actions, duals and finite-index compatibility; merely calling them L0/L2/L3 imports is not closure.
3. **Weak Leopoldt is not a cohomological dimension bound.** ArithmeticGaloisDuality §R02.4.4 supplies finiteness and cohomological bounds, not the asserted H²(Gal(F_Σ/F_cyc),ℚ_p/ℤ_p)=0 for a totally real cyclotomic tower. SelmerIwasawaCohomology §3.13 explicitly keeps global H²-torsion as an additional assertion; it does not repair this input. Supply the actual cyclotomic weak-Leopoldt theorem with its hypotheses and extend to the tower used in NE.4.4–NE.4.7 by the required Hochschild–Serre argument. The current contract does not justify the two-cohomology description and perfection/torsion conclusions by itself.
4. **The uniform smoothing proof is still missing.** NE.6.24 proves a congruence after choosing a conductor for ε and then a special element g. NE.6.25 requires a single g with nontrivial cyclotomic image for every even locally constant ε. Those quantifiers differ. I read Ritter–Weiss, Congruences II, the theorem on p.2, Proposition 4 on pp.5–6, Proposition 5 on pp.6–7, and the concluding calculation on pp.10–11. The theorem states the uniform conclusion; the explicit cusp construction uses the conductor. The package's own proof route has not supplied the additional uniform argument. Its subgroup/compactness observation correctly explains why taking conductor-dependent elements tending to 1 does not establish the required nontrivial g. This is now explicitly labelled a proof gap. Give a uniform special-cusp construction, a uniform estimate, or a fully located alternative argument. This review does not assert a counterexample to the published theorem. NE.6.25, NE.6.32–NE.6.34 and the independent completed route must retain their dependence on this input.
5. **Other named contracts and tier placement remain open.** The author's handoff already identifies the Deligne–Ribet/Eisenstein toolkit, Greenberg and Colmez inputs at AutomorphicPadicLFunctions L3; Wiles, pseudomeasure functoriality and normalized determinants at IntegralIwasawaTheory I.5/I.6/I.9; truncated Artin inductivity at AnalyticNumberTheory AN.4; and the Oliver/SK₁ inputs at KTheoryLowDegrees U.3. They remain requirements, not verified closed imports. Independently, the current InductionRestriction Layer 7 twisted algebra is over a field, whereas NE.6.7 needs O[[Z]] and its localizations/completions; PadicMeasures §1.7 supplies coefficient base change in the procyclic case, whereas this package needs arbitrary profinite G and subgroup squares. The precise extensions must be assigned and stated. NoncommutativeAndEquivariantIwasawa, GeneralAlgebraicKTheory, KTheoryLowDegrees, IntegralIwasawaTheory, LocallyAnalyticDistributionsPartII and Polylogarithms have no complete lower-tier/bundle assignment for these contracts in the current Caraiani–Newton order. An absent ordering is not permission to cite upward. Record the ownership and scheduling decision before declaring the package closed. I have not edited those owners in this review.
6. **Original-source verification remains qualified.** Brumer's original global-dimension theorem number and assumptions were not verified; CFKSV p.174 confirms the statement being used. The original Fukaya–Kato locators listed below were not verified in their publication. Verified secondary statements are now distinguished from an original-source check. This must remain visible until the primary locators/proofs or an adequate accessible replacement are established. The package author's remaining primary arithmetic proof leaves, and the filtered-ring transfer input of NE.0.5, also need the exact closure promised by the protocol; this review has not converted a proof sketch into an established supplier theorem.

These are defects in the submitted dependency/proof plan. General targets are retained, with the gaps exposed. They cannot all be repaired by changing the five files this issue permits; the relevant supplier packages and tier contracts need coordinated changes. A new upstream package should not describe the currently requested contracts as already delivered.

## Fixes applied

- Deleted old NE.0.11, the noetherianity target already owned by CompletedCohomologyPartII §5.1. No removed-target stub remains. Old NE.0.12–NE.0.17 are now NE.0.11–NE.0.16. All internal numerical references were updated, retaining semantic anchors.
- Removed the competing uniform/powerful predicates from Suggested.lean. NE.0.1 now adds only constant lower-p-series indices and dimension to the supplied predicate. NE.0.4 adds the finite-quotient Jacobson-radical formula and semilocality, rather than replanning the supplied locality criterion. NE.0.8 adds an explicit coordinate valuation, rather than a second generic p-valuation definition. NE.0.10 keeps the integral grading with its extra commutator condition; the residual polynomial grading is imported at the boundary.
- Separated the Auslander Ext condition from finite global dimension. New NE.0.11 proves the condition; NE.0.12 supplies the dimension and combines them. This removes the old circular dependency. The Ext checks now compute Ext¹(A/(T),A) and its degree-zero dual, rather than testing the separate dimension claim. NE.0.14 uses the supplied residual graded ring for all uniform groups; it no longer depends on the stronger integral-grading hypothesis.
- Corrected the ramified weighted graded coefficients in NE.0.9. Schneider's Chapter VI assumes p is a uniformizer of O, permitting unramified extensions. For ramified O with p=uπ^e the coefficient graded ring is κ[Π], with P sent to ūΠ^e and deg Π=1/e. It is not a polynomial ring over O/pO. Added the strict filtered base-change argument: O has the orthogonal basis 1,π,…,π^(e−1) over its maximal unramified subring; ordered-series valuations make the coefficient comparison strict; passing to symbols and PBW gives the claimed ramified formula and domain consequence. This preserves all finite-extension coefficients. The finite-free completion comparison itself remains among the owner-contract requirements above.
- Removed repeated imported-result paragraphs from the target layers and kept the ownership declarations at the opening boundary. NE.6.22 now owns the restriction/Hecke comparison of smoothed constants, while the Hilbert Eisenstein construction stays with its supplier. The algebraic Möbius–Wall target no longer repeats the earlier analytic congruence target.
- Replaced out-of-scope p=2 tests of Kakde's odd-p congruence group by controls in G=Γ×C_p. For g generating C_p the norm/quotient pair is (1,g); for a scalar u it is (u^p,u); the pair (1,1+p) fails the norm condition. The scalar M4 test is u^(p²)≡u^p modulo p².
- Corrected NE.6.26's finite group: Gal(F̃∞/F)=Δ×G̃ with G̃ pro-p and infinite, while the subgroup lattice and trace orders use G̃/Z=H̃×Ḡ. The prime-to-p factor stays in the coefficients. The trivial quotient now computes T₁ as the identity trace.
- Moved the independent Ritter–Weiss route ahead of canonical descent. Old NE.6.31–NE.6.34 are new NE.6.27–NE.6.30; old NE.6.27–NE.6.30 are new NE.6.31–NE.6.34. Descent's dependence on the completed main theorem now points backward. No prerequisite in a numbered Needs line points to a later local target.
- Corrected NE.7.2 to a derived-category direct-sum description with blocks in arbitrary adjacent degrees. Added the shift control. Replaced the even negative Gamma test by Γ*(−1)=−1, which detects a missing alternating sign. Clarified that NE.4.3's isogeny is defined over the base field. Replaced process-only checks by arithmetic controls in the Selmer and main-conjecture definitions.
- Corrected Fu's ordered-series locator and the secondary Fukaya–Kato 1.5.3 locator (Kakde p.25). Replaced repeated Sources/Hypotheses catalogue fields by sentences. Expanded Suggested.lean's closing comment to account for every README definition/construction absent from Lean; no heavy carrier or replacement theory was added.

The resulting package has 135 numbered targets, in layers of 16,14,15,14,8,8,36,24 targets. The 49 definition/construction subsections each retain at least three checks. The metadata topic remains math.NT.

## Current-library and ownership audit

I read the reviewed coverage entries for all eight NE layers in data/library-coverage.json, then checked the actual libraries and current roadmaps. The old coverage claim that no completed group algebra exists is stale: this is supplied on current Tau Ceti and is a boundary import, not a target here. The representatives in Suggested.lean use only pinned Mathlib carriers.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current Tau Ceti was read at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The provided roadmap checkout is on a feature head, so I also read GitHub's current main at `fee8e0eaa2c141487bf0de9be5678c38b20ea8a2`. Neither read-only checkout was built or changed.

I used ProfiniteCohomology and ClassFieldTheory as the two style models and read UPSTREAM_GUIDE.md. The duplication screen included the current README/Suggested statements of ProfiniteProPGroups, ProfiniteArithmetic, PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion, InductionRestriction and LocalGaloisGroups, and object searches across the current roadmap and Completed trees, including the nine additions and the four Completed additions named in WORKERS.md. Searches covered completed coefficients/actions, uniform and powerful groups, ordered coordinates, Ore regularity, relative localization, characteristic elements, Akashi series, SK₁/reduced norms, Bocksteins and Fitting invariants. I inspected candidate matches, rather than treating a name search alone as evidence of ownership.

In current Tau Ceti, completedGroupAlgebra's Basic, PowerSeries, product-coordinate and Prod APIs provide the carrier and special product coordinates. In particular `completedGroupAlgebra.monoidAlgebraProdEquiv` identifies the algebra of C×Γ for finite C with a group algebra over that of Γ; it is not the arbitrary-open-subgroup freeness theorem of NE.0.3. The library's coefficient-sequence Bocksteins are not the cyclotomic derived-specialization Bockstein of NE.7.1. No competing noncommutative Ore/relative-K₁/Akashi/Fitting target was identified in the current screen.

Supplier versions actually inspected:

| Supplier | Upstream PR/head | Finding |
|---|---|---|
| CompletedCohomologyPartII | #1035, `1337958d2e3b2f68f5589ad3ef3c4ee2e71e0e10` | §§0.1,3.11,5.1,5.5,5.8 own uniformity/open uniform subgroups, locality, noetherianity/residual grading, uniform Auslander dimension and growth. Duplicates removed or reduced to new variants. |
| GeneralAlgebraicKTheory | #1212, `67c1f583452d1a6cf255f200a2261340490fc894` | General numerical-layer K-theory is present; the exact missing determinant/Ore-comparison contracts are listed above. |
| SelmerIwasawaCohomology | #869, `691599e9863c501bbce9c0e3e3af6a61f7487613` | Mapping fibres and abelian Iwasawa cohomology exist; the stronger noncommutative homology/height contracts are not supplied. |
| ArithmeticGaloisDuality | #858, `567ff2b2099d724d7e75a37994ea44ba375f4a17` | Cohomological dimension and finiteness do not supply the requested weak-Leopoldt theorem. |
| AlgebraicKTheory | #1142, `7ecab00a30fddb0f594c087038b2c8242cd881c7` | Low K₀/K₁ and matrix-determinant interfaces are imports, not new layers here. |
| IntegralHeckeAndGaloisDeterminants | #785, `0d37c3f452ad9769ad7bfc257b5f283091814d85` | Reduced/Azumaya determinant contract kept distinct from a noncommutative determinant functor. |

The upstream/downstream follow-up list in the author's handoff still needs application by the appropriate owners: CompletedCohomologyPartII's older packet references to NE noetherianity/uniform dimensions should point to its own §5.1/§5.5; the generic p-valuation/lower-series ownership must stay with ProfiniteArithmetic and ND.0; StableReduction's putative NE.2 determinant-functor import needs the actual general K-theory owner. New local numbering in this report refers to this package, not to unchanged packet IDs.

## Source checks

I opened the four classes of author-flagged additions (Brumer, Fukaya–Kato, DDMS, handwritten bibliography) and a reproducible sample of fifteen other target records, sampled with seed 11084 before editing. A source being downloaded is not proof that every claim in it was checked. The following are the locators and specific comparisons actually read; all statements here are paraphrases.

| Sampled target (current numbering) | Source read | Result |
|---|---|---|
| NE.6.9, additive β | Kakde v3, Definitions 55–57, p.37 | Finite quotient, trace and cyclic/noncyclic factors agree. |
| NE.3.11, K′₁ | Kakde v3, Definitions 6–7, p.9 | Integral kernel image and quotient distinguished from total-quotient SK₁. |
| NE.7.17, height/Bockstein | BV v2, (32)–(34), Propositions 6.4/6.6, pp.31–33; Definition 3.2 and Lemma 3.9, pp.9,11–12 | Height adjoint and descent located; unshifted order checked with a degree-one/two DVR block. |
| NE.7.1, Bockstein | BV v2, §§3.1–3.2, pp.7–9 | θ, cone and connecting-map degrees agree. |
| NE.1.12, flatness | CFKSV p.192 | Exactness of localization used there; generic Ore flatness remains a proof target, not a claim of a named CFKSV theorem. |
| NE.1.11, localization | CFKSV (11), p.170 | The canonical denominators/localization are the stated ones. |
| NE.6.20, approximation | Kakde v3, Definition 100, Lemma 101, Proposition 102 and three proof steps, pp.70–73 | Quotient modulus, inverse limit and independence of k checked. |
| NE.3.1, twist homomorphism | CFKSV (14)–(16), p.172 | Group element maps to ρ(g) times its cyclotomic image; multiplication and coefficient direction agree. |
| NE.0.12, global dimension (old 0.13) | CFKSV p.174; Venjakob Theorems 3.26/3.29, pp.18–19; Ribes–Zalesskii Theorem 7.3.7(a), pp.265–266 | d+1 integral versus d rational distinguished. Original Brumer locator remains unverified. |
| NE.2.4, H-homology | CFKSV Lemma 3.1, p.171 | Finitely generated torsion cyclotomic modules require the stated no-p-torsion hypotheses. |
| NE.3.8, Artin formalism | CFKSV Theorem 3.10 and proof, pp.183–184 | Induction, coefficient norm and Euler-characteristic exponents checked. |
| NE.7.8, generalized Euler characteristic | BV v2, Proposition 3.19/Remark 3.20, pp.17–18 | Finite homology of the Bockstein complex is essential; χ_add=0 does not force each group to vanish. |
| NE.1.10, S* | CFKSV p.170 | Union of p^nS, including n=0; differs from all nonzero denominators. |
| NE.4.6, compact support | BV v2, (8)–(14), pp.18–21, and pp.28–36; Kakde v3 §2.3, p.11 | Inverse group action, compact-support fibre, dual shifts and quoted perfection/base change located. The primary FK proof is still qualified. |
| NE.3.3, evaluation | CFKSV (21)–(22), p.173 | Rational augmentation admits poles; finite Euler characteristic is an extra condition. |

Further direct comparisons supported the fixes: Ardakov–Brown §§2.3,3.1,3.4; Venjakob's filtered and rational dimension arguments; Lazard II.2.2.2, V.2.2.3–V.2.2.7; Calegari–Dimitrov–Tang Lemmas 4.5.6/4.5.9; Fu's ordered expansions; Schneider Chapter VI p.195 and Theorem 28.3/Corollaries 28.5–28.6, pp.199–201; Kakde's M1–M4 definitions and Lemma 118; Ritter–Weiss 2026 Theorem 1A, pp.6–7. The last is a conditional reduction to cyclic crossed-product SK₁, not an unconditional vanishing theorem. The Nickel source was used for the Fitting-order, denominator and square-presentation controls. The Berger and Gambheera–Popescu sources support the representation and abelian-minus scopes; they do not supply a normalized general noncommutative determinant comparison.

For the flagged references: CFKSV p.174 confirms Brumer's role, but the original public download was unavailable (HTTP 403). BV §2.2, pp.6–7 and §6.1, p.28, and Kakde §2.3 p.11, §4.1 p.18 and §4.3 p.25 verify the secondary occurrences of FK 1.3.7, 1.5.1, 1.5.3 and 3.3.5; the original FK numbering/proofs remain unchecked. Ardakov–Brown §2.3, pp.3–4 verifies the quoted DDMS uniform criterion; no uncleared DDMS or Oliver book copy was used. Schneider and Ribes–Zalesskii were read only in the maintainer-cleared library, in place. No book file or passage was copied. The bibliography's checked public identities are recorded in the provenance table; a secondary citation is explicitly identified as such in the README.

## Adversarial mathematics pass

I checked the statement and defining conventions of every numbered target, including the author's additional hand-computed checks. The table records the actual instances used and resulting fixes or qualifications. A retained statement is still a planned theorem, not a proof produced by this review. Each row's scope includes the API identities and hypotheses of that target. The zero complex/module and identity morphism are also used throughout the additive/functorial APIs. Equal-characteristic k[[π]] is outside the standing finite-ℚ_p coefficient scope; no general DVR claim is inferred from a ℤ_p computation.

| Target | Instances and conclusion |
|---|---|
| NE.0.1 | ℤ_p^d has indices p^d; C_p has p,1; the trivial group has dimension zero. Uniformity is imported; at 2 use level 4. |
| NE.0.2 | A finite group has open uniform subgroup 1; ∏ℕ C_p has unbounded rank and is excluded. Analytic-atlas equivalence remains with ND.0. |
| NE.0.3 | H′=H gives rank one; index p gives p cosets. Left module basis uses right cosets, and right basis left cosets. |
| NE.0.4 | For U=G=C_p the residual augmentation ideal is nilpotent; C_ℓ with ℓ≠p has semisimple residual algebra and several maximal ideals. Finite-quotient radical formula retained. |
| NE.0.5 | For ℤ_p[[T]], gr=𝔽_p[P,T]. Completeness/separatedness are required for lifting generators; the filtered transfer theorem remains an input. |
| NE.0.6 | ℚ_p has zero mod-p quotient but is nonzero and noncompact; compactness is essential. For Λ/(T−p), Γ-invariants vanish but the mod-p coinvariants do not. |
| NE.0.7 | ℤ_p² gives two independent coordinates; U=1 gives an empty product. A noncommuting pair cannot be reordered. |
| NE.0.8 | At odd p use 1+min v_p; at 2 use 2+min v₂, which satisfies the strict p-valuation lower bound. The identity has valuation ∞. |
| NE.0.9 | U=1, O=ℤ_p[π], π²=p gives gr O=𝔽_p[Π], whereas O/pO has a nonzero nilpotent. Unbounded coefficients π^(−n) are excluded from rationalization; filtered ramified argument added. |
| NE.0.10 | For aba⁻¹=b^(1+p), the leading commutator is p(b−1), so general uniformity does not give a commutative integral grading. Extra commutator condition retained. |
| NE.0.11 | For A=ℤ_p[[T]], Ext¹(A/(T),A)=A/(T) but its Hom into A is zero. At i=0 there is no j<i condition; finite dimension is separate. |
| NE.0.12 | G=1 gives dimension one; G=C_p gives infinite dimension; ℤ_p×C_ℓ, ℓ≠p, gives a product of regular dimension-two rings. No-p-torsion is essential. |
| NE.0.13 | G=1 gives ℚ_p of dimension zero; ℤ_p gives dimension one, not the zero dimension of its full fraction field. |
| NE.0.14 | For ℤ_p² the dimensions are 1,2,1. At 2 degree-one squares still vanish. C_p has nontruncating cohomology and is excluded. |
| NE.0.15 | Trivial ρ recovers coefficient extension; a rank-one character untwists by ρ(g)⁻¹. Rank-zero and direct-sum cases preserve exactness. |
| NE.0.16 | For G=1 only H₀ survives; rational homology vanishes above dim G. Compact Tor and ordinary rational Tor require the lattice comparison; supplier gap retained. |
| NE.1.1 | For Λ=ℤ_p[[T]], T∈S, p∉S and 0∉S. For the auxiliary ring definition B=A, even 0 belongs: regularity needs the Iwasawa hypotheses. |
| NE.1.2 | H=1 gives the central Γ itself; a finite group cannot have quotient Γ. The chosen central subgroup must have finite index in the one-dimensional quotient. |
| NE.1.3 | For trivial finite quotient, V is its coefficient fraction field; a matrix block distinguishes regular elements from nonzero elements. |
| NE.1.4 | Finite-dimensionality makes injectivity equivalent to surjectivity. The zero endomorphism fails; zero-rank summands create no extra condition. |
| NE.1.5 | The right-sided comparison is made in the opposite ring. The shift on an infinite-dimensional vector space is injective, not surjective, so finiteness cannot be dropped. |
| NE.1.6 | Λ/(T) is finite over ℤ_p and S-torsion; Λ itself is neither. Finite generation of the starting Λ-module is essential for a common annihilator argument. |
| NE.1.7 | For H=1, S is the complement of (p) in ℤ_p[[T]]. Zero is excluded; the two Ore directions and denominator regularity remain separate requirements. |
| NE.1.8 | For C_p the residual element (z−1)^p vanishes; over ℤ_p it does not. The augmentation nilpotence uses a finite p-group kernel. |
| NE.1.9 | A nonzero singular matrix is not regular modulo the prime radical; invertibility in the finite semisimple quotient is the relevant test. |
| NE.1.10 | p=p¹·1 lies in S* and not S; n=0 recovers S. Multiplying the whole set of nonzero elements is a different localization. |
| NE.1.11 | For ℤ_p[[T]], Λ_S=Λ_(p), with maximal ideal pΛ_S; T is a unit and p is not. Its residue field is 𝔽_p((T)). |
| NE.1.12 | ℤ→ℤ[1/p] preserves injections and exact sequences. Noncentral Ore tensor factors retain their left/right direction. |
| NE.1.13 | Λ/(p) enters after removing p-primary torsion; Λ does not. The zero module and extensions meet the category conditions. |
| NE.1.14 | The zero complex is localization-acyclic; Λ in one degree is not. The complex of multiplication by s∈S is acyclic after localization. Missing determinant/localization contract exposed. |
| NE.2.1 | K₀(ℤ_p)=K₀(𝔽_p)=ℤ via rank; a product has one rank per factor. The generic complete-ideal lifting comparison needs its supplier contract. |
| NE.2.2 | For G=1 the comparison has rank one; with a prime-to-p finite factor all product ranks must be kept. |
| NE.2.3 | The trivial character alone does not distinguish projective ranks of different finite semisimple blocks; use all characters and their correct field factors. |
| NE.2.4 | H=1 gives H₀=M and higher H_i=0; H≅ℤ_p uses invariants/coinvariants and finite projective dimension. Infinite p-torsion resolutions are excluded. |
| NE.2.5 | Rank-one trivial twist is identity; twisting a free rank m module by rank n gives rank mn. The p-primary submodule is handled before Λ(H)-finiteness. |
| NE.2.6 | Λ_S is semilocal; adjoining p⁻¹ does not automatically preserve semilocality. The S* assertion is not inferred by the same argument. |
| NE.2.7 | The zero perfect complex gives the identity class; shifted complexes give inverse determinant classes. The weaker subcategory closure (iv′) is retained. |
| NE.2.8 | The triple for multiplication by T represents [Λ/(T)]; shifting negates it. Cohomology classes require finite projective dimension; with p-torsion use perfect complexes. |
| NE.2.9 | For T the boundary is [Λ/(T)], and the kernel is the integral K₁ image. Exactness is not a chosen splitting. |
| NE.2.10 | For [Λ→^TΛ] in degrees −1,0, ∂[T]=[Λ/(T)] whereas the BV characteristic class has boundary −[C]. Sign fixed by this witness. |
| NE.2.11 | Zero relative class has lift 1; finite-group block ranks must all vanish in the K₀ comparison. No-p-torsion retained for the CFKSV route. |
| NE.2.12 | Two characteristic lifts differ by integral K₁; the zero module has characteristic class 1. This is not a canonical choice of scalar. |
| NE.2.13 | A scalar unit maps to its K₁ class; singular or noninvertible matrices are not unit representatives. The localization-unit surjectivity has its stated hypotheses. |
| NE.2.14 | Λ/(T−p) has characteristic T−p up to a unit; the zero module has unit characteristic. A characteristic ideal does not fix normalization. |
| NE.2.15 | If G has p-torsion, do not replace every torsion module by a finite projective resolution. The general argument uses the relative perfect-complex model. |
| NE.3.1 | For ρ=1, g maps to its Γ image; for a scalar character the coefficient is ρ(g), not its inverse. Identity and product matrices agree. |
| NE.3.2 | For n=1, H=1 this is scalar localization; a vanishing specialization can still have a well-defined rational image. Denominator regularity is checked before extension. |
| NE.3.3 | T at trivial ρ has value 0 and T⁻¹ has value ∞. They are not units in the augmentation local ring; a leading term replaces a pole value. |
| NE.3.4 | H=1 gives the ordinary characteristic series; the zero module gives Akashi series 1. Alternating H_i factors cannot all go in the numerator. |
| NE.3.5 | Trivial ρ reduces to augmentation of the Akashi series; the comparison uses the contragredient twist and coefficient norm. |
| NE.3.6 | For M=Λ/(T−p), invariants vanish and coinvariants have order p, so χ=p=\|−p\|_p⁻¹. Euler finiteness is essential. |
| NE.3.7 | If f(0)=0, Γ-coinvariants have positive rank and evaluation does not compute a finite Euler characteristic. Restrict to the stated finiteness case. |
| NE.3.8 | Induction from the whole group is identity; splitting a coefficient field changes cardinality exponents by the field degree. This checks norm rather than raw evaluation. |
| NE.3.9 | The X₁(11), p=5 calculation is retained as its specified example, with its local factors; it is not a general GL₂ proof. |
| NE.3.10 | An integral unit is integral at every finite specialization; mere membership in a fraction field is weaker. The statement remains a conjecture. |
| NE.3.11 | Integral SK₁ is the kernel image used to define K′₁; total-quotient SK₁ can survive. The quotient of 1 is 1. |
| NE.3.12 | G=Γ gives a commutative fraction field; a finite nonabelian factor gives a product of matrix/simple factors, not one scalar field. |
| NE.3.13 | For a matrix algebra reduced norm is determinant and SK₁ is trivial; this does not prove vanishing for nonsplit components. Fitting equality cannot recover the relative class. |
| NE.3.14 | Identity subgroup/coefficient map gives identity; induction and norms use all conjugate factors. The inverse representation convention is not silently changed. |
| NE.4.1 | The zero Selmer group has zero dual; finite coefficient quotients retain compact Pontryagin duals. The group acts contragrediently, not by an unstated scalar action. |
| NE.4.2 | A p-primary module can have zero p-torsion-free quotient and so belong to 𝔐_H(G) without being Λ(H)-finite. Conjectural status is retained. |
| NE.4.3 | An isogeny over F identifies rational p-adic representations and their kernels; one only defined over an extension need not preserve the F-kernel. Base field clarified. |
| NE.4.4 | The cyclotomic extension is admissible with H=1; a tower not containing it is excluded. μ=0 is an additional arithmetic hypothesis. |
| NE.4.5 | For H=1 the cohomology is H^(−1)=X_Σ and H⁰=ℤ_p, giving [C]=[ℤ_p]−[X_Σ]. Weak-Leopoldt/perfection inputs remain open. |
| NE.4.6 | Trivial coefficient rank gives the zero complex; derived augmentation of multiplication by T has two terms. Compact support is a fibre with the specified shift. |
| NE.4.7 | A free one-term complex is perfect and not S-torsion. Underived specialization loses Tor₁; p-torsion requires arithmetic perfection beyond finite global dimension. |
| NE.4.8 | At a real place and p=2, C₂ has nonzero positive Tate cohomology. Division by 2 cannot justify the odd-p averaging argument; separate correction target retained. |
| NE.5.1 | Trivial ρ fixes the period and Euler factors; the ordinary unit root is u, not w. Analytic continuation and period rationality remain hypotheses; p≥5 remains the source scope. |
| NE.5.2 | Multiplying by an integral scalar unit preserves the boundary but changes interpolation. The conjecture imposes both, and does not export unconditional existence. |
| NE.5.3 | The zero Euler factor forces a zero/pole check before claiming a nonzero finite evaluation. The consequences remain conditional on the main conjecture. |
| NE.5.4 | The p=5 X₁(11) numerical/local data are a consistency check, not a proof of every Artin interpolation statement. |
| NE.5.5 | For F∞=F_cyc this is the abelian theorem; p=2 is outside the odd-p route. Boundary and normalized interpolation are separate clauses. |
| NE.5.6 | An integral unit alters normalization without altering the relative boundary. At a zero, order and leading term replace division by zero. |
| NE.5.7 | Identity norm/quotient is identity; a finite extension transfers Euler factors and induced characters together. Scalar interpolation alone does not prove K₁ equality. |
| NE.5.8 | A commutative characteristic ideal can survive multiplication by any unit; a normalized determinant requires the actual period and Euler trivializations. Real p=2 correction remains separate. |
| NE.6.1 | Γ alone recovers Wiles. A prime-to-p cyclic factor splits over unramified coefficients; all product components are retained. |
| NE.6.2 | For one subgroup the patching diagram is identity. Without injective detection of the integral component, compatible images do not give uniqueness. |
| NE.6.3 | Identity quotient gives the same conjecture; the reduction does not discard interpolation or the arithmetic base-change class. |
| NE.6.4 | The trivial finite group is elementary; a p-subgroup and a prime-to-p cyclic subgroup use different induction steps. |
| NE.6.5 | ℓ≠p and the prime-to-ℓ action are essential. The pro-p relative K₁ kernel admits unique roots of order prime to p; not p-th roots in general. |
| NE.6.6 | When Δ=1 the coefficient product has one factor; otherwise every unramified domain factor is needed. Do not treat the product as a domain. |
| NE.6.7 | q=1 gives zero carry; a=b=0 gives normalization; for q=9, a=1,b=8 the carry is one. This detects the central factor in a basis inverse; q>0 is required for the cocycle theorem. |
| NE.6.8 | For G=Γ×C_p, θ(g)=(1,g), θ(u)=(u^p,u); (1,1+p) fails M1. M4 scalar congruence holds modulo p². Replaced irrelevant p=2 tests. |
| NE.6.9 | The identity conjugacy class has the expected trace multiplicity; noncyclic P gives the specified zero component. Twisted cocentre relations retain τ. |
| NE.6.10 | For the trivial finite quotient, β is identity on the coefficient cocentre. Summing cyclic components twice would change the required trace multiplicity. |
| NE.6.11 | log(1)=0. Over p=2 the same radius is unavailable; the odd-p/radical and unramified coefficient hypotheses are retained. |
| NE.6.12 | For x=1, L(x)=0; Teichmüller torsion is in the logarithmic kernel. Frobenius acts on coefficients as well as the central variable. |
| NE.6.13 | The identity unit yields zero on both additive sides. Products over index-p overgroups retain their multiplicities and p-powers. |
| NE.6.14 | The trivial quotient recovers the coefficient-ring kernel; augmentation and logarithm impose distinct conditions. Zero additive target is not the whole multiplicative kernel. |
| NE.6.15 | For trivial Ḡ, Φ is the coefficient-unit group and θ is identity. Unramified domain coefficients are handled factorwise. |
| NE.6.16 | An integral class that dies after localization is tested in K′₁, not asserted zero in unreduced K₁. Identity class is detected. |
| NE.6.17 | For Γ alone the tuple has one abelian component. Integral θ injectivity and the boundary are both required in addition to interpolation. |
| NE.6.18 | Identity inclusion gives equal norm/quotient; conjugation relabels the component. M1/M2 alone do not imply M4. |
| NE.6.19 | For ℚ, Σ={3}, k=2, the partial value is 1/6; ε=0 and u=1 give zero smoothed value. Translation is ε_u(x)=ε(ux). |
| NE.6.20 | For u=1, all approximating sums vanish. j=0 still uses p^f; compatibility is in both group quotient and modulus, not either separately. |
| NE.6.21 | For a trivial action of C_p, trace ideal is pR whereas invariants are R. A fixed g must satisfy every stabilizer-modulus test. |
| NE.6.22 | Identity extension has degree/weight factor one. For F/K, restriction multiplies weight by [F:K]; the special cusp keeps the Artin-symbol exponent and normalized constant compatible. |
| NE.6.23 | For C_(p²)×C_p with maximal cyclic P=C_(p²), transfer lands in pC_(p²). Orbit length is ord(gP), not ord(g). |
| NE.6.24 | For Σ=C_p the full Möbius sum has coefficients +1,−1. Weights multiply to [L:K]k; the conductor-dependent g is not a uniform choice. |
| NE.6.25 | For C_(p²)×C_p there are p cyclic overgroups of the specified order, so Kakde’s cyclic-overgroup sum loses multiplicity. The full Möbius route is kept, with its uniform-smoothing gap. |
| NE.6.26 | For Ḡ=1 the finite quotient and H̃ are trivial and T₁ is the identity trace. For nontrivial Ḡ all orders and normalizers are in G̃/Z, not infinite G̃. |
| NE.6.27 | The identity character function has logarithm zero; t is an additive cocentre element, not an integral multiplicative zeta element. Central completion is separate from canonical localization. |
| NE.6.28 | For Q=C_p the Möbius coefficients are +1,−1 and trace is p times the invariant coefficient in the trivial action. The algebraic unit congruence is distinct from the analytic input. |
| NE.6.29 | In the abelian case the integrality criterion uses the classical main theorem; quotient characters and the inverse limit do not automatically give a normalized K₁ element. |
| NE.6.30 | For Γ alone this is the classical theorem; p=2 is excluded. Existence in the completed Det image does not assert arbitrary total-quotient SK₁ vanishing. |
| NE.6.31 | The identity field quotient must preserve boundary and interpolation. Central completion and the canonical S-localization need a comparison, not an equality by notation. |
| NE.6.32 | Index one imposes no extra M4 condition. The p·i_P² trace bound is applied in the finite quotient, with completed-to-canonical descent before θ-surjectivity. |
| NE.6.33 | All four M conditions are needed; satisfying M1/M2 alone is insufficient. Abelian Γ reduces to its single normalized pseudomeasure. |
| NE.6.34 | Cyclotomic specialization is Wiles, with the same boundary sign. Uniqueness is in K′₁ and the proof retains the uniform-smoothing dependence. |
| NE.6.35 | r,s≥1 and F unramified match the cyclic algebra; exponent m=1 is identity, while m prime to p gives an invertible parameter change. All SK₁ vanishings remain premises. |
| NE.6.36 | Complex conjugation uses (1−j)/2, so p must be odd. μ=0 is absent from the Fitting theorem but required for the further Tate-module identification; dual action remains covariant. |
| NE.7.1 | For [Λ→^TΛ], B₁=−1; for an invertible differential the specialized cohomology is zero. This fixes the connecting-map sign. |
| NE.7.2 | [R→^TR] is semisimple, while [R→^(T²)R] has zero Bockstein after specialization and is not. A shift changes order −1 to +1; arbitrary adjacent degrees added. |
| NE.7.3 | An acyclic specialization gives its acyclicity trivialization; [Λ→^TΛ] gives the determinant of B₁⁻¹. Triangle products and shifts invert as prescribed. |
| NE.7.4 | For T⁻¹ε the order is −1 and leading term ε(0): the Bockstein minus sign is cancelled by (−1)^r. The inverse pair uses monoidal inversion, not reversing the arrow. |
| NE.7.5 | T⁻¹ε has Laurent order −1 and leading coefficient ε(0); shifting gives its inverse. A derivative-only definition would omit poles. |
| NE.7.6 | At order zero the leading term is ordinary finite nonzero evaluation. Positive and negative orders cannot be replaced by a value in L×. |
| NE.7.7 | For f=T^r a(T), substitution T=χ(γ)^s−1 multiplies the leading coefficient by c_γ^r, including negative r. Derivative formula only for r≥0; c_γ≠0. |
| NE.7.8 | For B₁=−1 every Bockstein cohomology group vanishes and χ_add=0. Finite nonzero groups in opposite parity can also cancel; zero total length is not individual acyclicity. |
| NE.7.9 | ζ:1→d(C)⁻¹ becomes 1→d(C[1]); r changes sign and ∂ch=+[C]. It is not obtained by reversing ζ’s arrow. The zero complex gives the unit. |
| NE.7.10 | Trivial character multiplicity m controls the Tate order; Leopoldt is an explicit injectivity hypothesis and is not deduced from rational dimension alone. |
| NE.7.11 | The zero virtual character gives both sides 1. A zero regulator makes the displayed quotient undefined, so the nonvanishing/Leopoldt condition is essential. |
| NE.7.12 | Permutation character induced from the whole group is trivial; finite-index induction uses a product of zeta factors. The Colmez/class-number input remains an owner requirement. |
| NE.7.13 | For multiplicity m=1, order is −1 and the scalar normalization is c_γ⁻¹. This follows from the shifted determinant, not the unshifted positive exponent. |
| NE.7.14 | For ℚ-rational permutation characters the preceding shifted formula applies; Artin induction is not a conclusion for arbitrary nonrational characters under only the same Leopoldt hypothesis. |
| NE.7.15 | Γ*(0)=1, Γ*(−1)=−1, Γ*(−2)=1/2 and Γ*(3)=2; factorial denominators are nonzero. The odd negative Lean test now detects the residue sign. |
| NE.7.16 | The zero representation satisfies DP. A split ordinary representation distinguishes the chosen subspace from the quotient; B1 and C1 are different Euler nonvanishing conditions. |
| NE.7.17 | For rank h=1, the degree-one/two T-block has r(SC)=−1 and r(SC[1])=1. Height nondegeneracy is needed for the Bockstein isomorphism; the supplier comparison remains open. |
| NE.7.18 | For h=0 the height determinant is the empty determinant 1; rank one gives the height determinant after shifting. Vanishing local Euler factors require the exceptional-factor target. |
| NE.7.19 | A commutative complete DVR is an order in its field; a dimension-one Iwasawa algebra is an order over ℤ_p[[Γ₀]]. An arbitrary noncommutative fraction ring is not admitted. |
| NE.7.20 | For a maximal order, H=I=its centre; for a nonmaximal order, denominator clearing is required. The zero and identity matrices test the adjoint identities. |
| NE.7.21 | Fitt(0)=I(Λ); a presentation with a<b gives zero. Over a commutative ring recover Fitt₀, and a surjection gives containment in the stated direction. |
| NE.7.22 | For an injective square presentation by f over a DVR, Fitt=(f). The class with boundary −[M] contributes the inverse norm; Fitting equality alone does not recover relative K₀. |
| NE.7.23 | Commutative Λ gives ordinary Fitting annihilation. In a nonmaximal order multiply by the denominator ideal; the zero module has the unit annihilator. |
| NE.7.24 | For scalar T, the order is one and leading scalar one; T⁻¹ has a pole. An arithmetic exceptional-zero formula additionally requires semisimplicity and the height/regulator comparison. |

The author's 26 additional check groups are covered by the corresponding rows above. Old NE.0.11's nonanalytic infinite-product control was removed with the duplicated theorem; the same discriminating example remains in NE.0.2. Old NE.0.13 is now NE.0.12; old NE.6.30 is now NE.6.34. The noncompact Nakayama example, infinite-dimensional endomorphism shift, isogeny field, finite trace orders and negative Gamma sign were explicitly recalculated. Check counts alone are not mathematical verification; the supplier and uniformity qualifications above remain material.

## Lean signatures and validation

The file has four real-bodied light definitions (`canonicalSet`, `saturatedSet`, `carryExponent`, `gammaStar`), seven named theorems (two proved and five admitted), and six proved examples. There are no admitted examples, sorry-bodied data or auxiliary theory developments. No Tau Ceti import remains because the retained declarations use Mathlib only. The closing comment accounts for all 49 README definition/construction targets, including the partial ring-level realizations above. Headline noncommutative/arithmetic milestones whose carriers or comparisons are absent from the pins remain in the README.

Ten declaration signatures were checked against their README scopes: the four definitions; `one_mem_canonicalSet`; `mul_mem_canonicalSet`; `mem_canonicalSet_powerSeries_iff`; `carryExponent_cocycle`; `gammaStar_eq_Gamma`; and `gammaStar_eq_residue`. I also checked `of_sub_one_pow_char`. The generic B=A canonical-set example deliberately allows zero; regularity is not smuggled into that definition. The power-series theorem has the prime hypothesis, the cocycle theorem q>0, and the residue theorem a punctured limit at a nonpositive integer. None assumes its conclusion. The one-variable ℤ_p theorem is explicitly a specialization of the general README construction, not a replacement of its coefficient scope.

Validation results:

- `lean-check` on the package Suggested.lean: exit 0, exactly five `declaration uses sorry` warnings and no other warnings/errors. Available memory was about 75 GB. The later Lean edits only corrected documentation and the closing inventory; the declarations are those checked.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/NoncommutativeAndEquivariantIwasawa.json`: exit 0, zero errors and zero warnings. The packet still has its original 136 nodes, 19 obligations and 28 supplier requests; this structural check does not close them, and the packet was not edited.
- `python3 research/blueprint/intake.py check-files` on the changed deliverables and metadata: zero problems.
- Local checks: 135 sequential numbered subsections; no missing internal fragment; no forward numbered local Needs dependency; every one of the 49 definition/construction subsections has at least three Checks; `git diff --check` passes. No local filesystem paths occur in the deliverables.

No fetched text or another author's PR material was treated as an instruction, and no suspicious instruction requiring a separate incident note was encountered. No source passages or section-by-section source summaries were added. No worker was delegated this review. No second issue was claimed.

## Public source provenance

All were accessed on 2026-10-19. Hashes identify the downloaded bytes. Their inclusion records provenance, not an assertion that every page was audited. Cleared books were read in place and are not included as downloadable artifacts.

| Source | URL/version | SHA-256 |
|---|---|---|
| CFKSV-2005 | [CFKSV-2005](https://www.numdam.org/article/PMIHES_2005__101__163_0.pdf) | `c0955aa2b2f15cfc68f9e136cccae41d71935bb3b2b0566ecea6021fcd074b47` |
| ARDAKOV-BROWN-2006 | [ARDAKOV-BROWN-2006](https://arxiv.org/pdf/math/0511345v1) | `a665d599485fdbf33a550393731f51fdf733bbd0d5be5c71e443e55ae8d81668` |
| BURNS-VENJAKOB-2006 | [BURNS-VENJAKOB-2006](https://arxiv.org/pdf/math/0511672v2) | `4b33fb11251340c88a8f8a590d9f9296a413aadf4fae98968ea7191a14c857bc` |
| KAKDE-2011 | [KAKDE-2011](https://arxiv.org/pdf/1008.0142v3) | `5a05da0d58f2717422fb401510d9cad4aeeac707313929a796870b92e27ea45c` |
| VENJAKOB-2002 | [VENJAKOB-2002](https://arxiv.org/pdf/math/0106269) | `e0941131157703e16013f02b65a046a3f6051ec92b7efe061006eff71b8d0f64` |
| RITTER-WEISS-2010 | [RITTER-WEISS-2010](https://arxiv.org/pdf/1004.2578v2) | `48811a99c75f3b826f2315cc914563ffab1dd98381fd0af141816e05b99f2dee` |
| GAMBHEERA-POPESCU-2025 | [GAMBHEERA-POPESCU-2025](https://arxiv.org/pdf/2303.13603v1) | `ff36bc77629fc5e8eed142145839ca1c137d78a5e942ea037e0a537f7d5f9d2d` |
| NICKEL-FITTING | [NICKEL-FITTING](https://www.unibw.de/timor/mitarbeiter/mitarbeiter/univ-prof-dr-andreas-nickel/nickel/fitting-survey.pdf) | `50cd354a51d4904aef5c20b68d6b9cdbebd9d9152b6d7e6630b6440cc0ea32d8` |
| RITTER-WEISS-CONGRUENCES-II | [RITTER-WEISS-CONGRUENCES-II](https://arxiv.org/pdf/1001.2091v3) | `1c913044df7114503971621876f7c3268791ce38a19c891c0c8a854538df57d1` |
| VENJAKOB-COMPARISON-2011 | [VENJAKOB-COMPARISON-2011](https://www.mathi.uni-heidelberg.de/~otmar/workshopms/RitterWeiss.pdf) | `a0bc17a5fafd4258009d7f5d75970d4f7cbd6a0ccef7f169382cf356a7968a8f` |
| FU-2022 | [FU-2022](https://arxiv.org/pdf/2201.11190) | `d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614` |
| SCHNEIDER-VENJAKOB-2010 | [SCHNEIDER-VENJAKOB-2010](https://arxiv.org/pdf/1006.1493v1) | `dda52df49265b1c8859b00eb6c181cf23e10a205874bb7d416a591e5daa06cc1` |
| RITTER-WEISS-2026 | [RITTER-WEISS-2026](https://arxiv.org/pdf/2608.22601v1) | `546d7dd0efb4d7563cc7048d31338c656cd74a92e5c3a4d0f4c7a3f7dca80ec9` |
| LAZARD-1965 | [LAZARD-1965](https://www.numdam.org/item/PMIHES_1965__26__5_0.pdf) | `b0b50cf55528fd4abb94f9e1de10b23f0711c0dd804682a9853b70b3b378f380` |
| CDT-2025 | [CDT-2025](https://math.uchicago.edu/~fcale/papers/UDC.pdf) | `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e` |
| BERGER-INTRO | [BERGER-INTRO](https://perso.ens-lyon.fr/laurent.berger/articles/article05.pdf) | `9a892282543055b0b3e038286cdefd5803eb3b0effe4bc3a093748127fe3ebbe` |
