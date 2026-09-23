# PAPER-ANDRE-18-B — direct summands, the unramified reduction and complete-base duality

Status: **partial**. Issue #2188. Agent: **Claude Code — cc-7b31c4**, 23 September 2026. Continues #2210, #2222, #2233 and #2243. No Lean file was requested, created or compiled.

This checkpoint adds 34 items to the 108-item extraction: **142 items, 17 library, 7 planned, 118 missing**, five ownership routes, 28 definition/construction APIs, 84 typed planning tests and 153 selected dependency edges. All missing items have exactly one route. The whole published paper has now been extracted at declaration size except for the pieces named at the end of G0; G1–G7 remain open at their stated boundaries, so the status stays partial.

## 0. This checkpoint: closing most of G0

G0 asked for the parts of André's own text that earlier checkpoints had read but not turned into items. Those are now extracted, from a fresh reading of the published version.

**How the paper was read.** The version of record is open access on Centre Mersenne, [10.1007/s10240-017-0097-9](https://pmihes.centre-mersenne.org/item/10.1007/s10240-017-0097-9.pdf), 23 pages, and its SHA-256 recomputed from a fresh download agrees with the one already recorded, `34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053`. It was read with a font-aware extraction built from the PDF's own `/Differences` and `/ToUnicode` tables, so displayed formulas such as `ℬ{f/λ}_{≤1} = (ℬ_{≤1}⟨U⟩/(λU − f))^a_*` could be compared as printed rather than through a lossy text layer. The 2016 arXiv v1 (`1609.00345`, e-print SHA-256 `878082a3d2be43ed19a333ccd5db57be0033c937ea87cd4f765267cc2e08b3b6`) was read at the matching passages; it is a strictly earlier text and cannot correct the published one, but it dates the §0.1 renumbering exactly.

**What was added, and where it goes.**

- *§0.1, the homological reformulations* (eight items). The maximal secant sequence and the alternating-sum rank of a module of finite projective dimension, which the footnote defines; then the five statements listed as equivalent to the conjecture — contraction of ideals from integral extensions, descent of flatness along integral extensions, the monomial conjecture, the dimension bound for a complex with finite-length higher homology — and the syzygy conjecture they imply, with the equivalence itself as a separate item. These are the same direct-summand direction as the conjecture, so they join **DirectSummandsAndBigCohenMacaulay**.
- *§0.2, the easy cases* (six items). The divided trace in invertible degree, the splitting of a finite flat extension, dimension at most two, Heitmann in dimension three, the `K[x,y]/(xy)` counterexample showing regularity is necessary, and Hochster's characteristic-p theorem through the corrected contracting-endomorphism criterion of E4. Same route.
- *§1.2, uniform Banach algebras and Weierstrass localisation* (seven items). The uniform-Banach predicate; the construction `ℬ{f/λ}` with formula (1); that `λU − f` is a non-zero-divisor; the π-adic topology of the unit ball; the unit-ball formula **with its two valuation cases kept apart** — formula (2) for a discrete valuation and formula (3), with the almost-`*` functor, otherwise; the identification of the unit ball with the π-adic completion of `ℬ_{≤1}[f/λ]`; and the approximation invariance of §1.2.3 that the proof of 2.5.2 uses twice. These are rational-localisation statements about uniform Tate rings, so they go to **PerfectoidSpaces P1–P2**, the route that already carries the perfectoid rational-localisation model.
- *§2.3–2.4 and §2.6.1, the tower itself* (eleven items). Complete integral closedness as a predicate; the integral-closure properties of `A°_{jk}` including Noetherianness and p-adic completeness at finite stages and complete integral closedness at `j = ∞`; the unique spectral norm with `A°_{∞k}` as unit ball; isometric transitions and multiplicativity only for `k = 0`; the idempotent prime `A°°_{∞0} = K°°_∞ A°_{∞0}`; and the §2.6.1 variants — normality, the Capelli–Vahlen domain criterion, multiplicativity of the norm, ramifying several elements at once, a possibly ramified regular base, and the observation that only the statement modulo each power of p is ever used. These are ramification facts about this tower, so they join the **PerfectoidRamification Part II** already proposed by PAPER-ANDRE-18, with the same id and title.
- *A.2.1 product stability* (two items). G0 asked for its exact indexing and base: the index set is arbitrary and the base ring is fixed, and the statement is that a product of pure submodules is pure, equivalently that `R → ∏_i S_i` is pure when each `R → S_i` is. It rests on a comparison that is **missing at the pin**, so that comparison is a separate item.

**Three precise library absences.** Searching the pinned trees for the carriers these items need gave: no system-of-parameters predicate (`IsSystemOfParameters`, `systemOfParameters`, parameter ideals all absent); no `IsCompletelyIntegrallyClosed`, which is strictly stronger than the pinned `IsIntegrallyClosed` and is what §2.4 needs; and, for A.2.1, `TensorProduct.piRight` in `Mathlib/LinearAlgebra/TensorProduct/Pi.lean` is stated and proved **only for a finite index type** — its own docstring says "In general, this is not an isomorphism, but if `ι` is finite, then it is". The arbitrary-index comparison for a finitely presented left factor therefore has to be proved from a finite presentation. Mathlib's `spectralValue`, `spectralNorm` and `IsPowMul` and Tau Ceti's `Huber.IsTateRing` and `IsTopologicallyNilpotent` are the nearest existing carriers for §1.2 and §2.4, and `Submodule.IsPure` is still absent, consistent with the open upstream pull request already recorded.

**Three new findings, E13–E15, none with a review verdict.**

- **E13 (misprint, reaches nothing).** §0.1 asserts that statements (1)–(5) are equivalent, but footnote 1 supplies only `(1) ⇒ (3)` and only `(4) ⇒ (5)`. Both converses are in the works cited at those very places — the reference for (3) is Ohi's *Direct summand conjecture and descent for flatness*, whose title is the equivalence, and the second reference for (5) is Dutta's *On the canonical element conjecture*. The 2016 preprint, which has no flat-descent item and so numbers the statements (1)–(5), writes the same attributions two-sidedly: "Pour l'équivalence (1) ⇔ (3)…" and "Pour (3) ⇒ (4), voir [H2], et [Du] pour la réciproque". The one-sided arrows are an artefact of inserting the new statement (3) and shifting the numbering.
- **E14 (gap, reaches nothing).** §1.2.1 announces that `ℬ_{≤1}⟨U⟩/(λU − f)` has no π-torsion and then says it is enough to treat λ. The reduction goes the wrong way when `|π| < |λ|`: there λ-torsion is contained in π-torsion, not conversely. Nothing is lost, because the displayed computation never uses a property of λ beyond injectivity of multiplication by f modulo it. Running it with an arbitrary nonzero `μ ∈ 𝒦°`: from `μ Σ b_m U^m = (λU − f) Σ a_m U^m` one gets `μ b₀ = −f a₀`, so `|a₀| = |f a₀| ≤ |μ|` and `a₀ ∈ μℬ_{≤1}` because multiplication by f is isometric; then `μ b_m = λ a_{m−1} − f a_m` gives `a_m ∈ μℬ_{≤1}` by induction, so the lifted element lies in `(λU − f)ℬ_{≤1}⟨U⟩` and is zero. That proves the stronger correct statement, torsion-freeness over `𝒦°`. In the only use, §2.5.2 with `λ = π^i` and `λ = π_{ik}`, one does have `|λ| ≤ |π|`, so the printed reduction is harmless there.
- **E15 (misprint, reaches nothing).** "si la valuation de 𝒦 **et** discrète" in formula (2) should read "est discrète"; the same slip is in the 2016 source.

**What G0 still holds.** Remark 2.6.1(3) is a pointer to Koh and Ranganathan rather than a statement, and is not extracted. The reduction of §3.1 to a reduced, p-torsion-free, even integral B and the choice of the discriminant g are recorded only inside the application items and want declarations of their own. §4.4's three obstacles to weak functoriality, including the `Z_p[[T]]` example that blocks a compatible unramified regular subring, are described in the report but not split into items.

## 1. What changed in checkpoint #2243, and which sources were read

The complete published [André paper](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), printed pp.71–93, was read in checkpoint #2243. Its SHA-256 was recalculated from that session’s earlier public download:

`34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053`.

In that checkpoint the [Hochster 1983 article](https://deepblue.lib.umich.edu/handle/2027.42/25107) was obtained through Michigan’s public repository API after the old PDF URLs returned HTML. The actual [bitstream](https://backend.production.deepblue-documents.lib.umich.edu/server/api/core/bitstreams/e8432785-2176-424e-a449-adb5930bb1db/content) has SHA-256:

`be549b099aa0057cf6e1ffbd0414ea23ce08ba69c1192a58a9f7a29f68d59642`.

Printed pp.504–518 and 538–543 were read, including Definition 2.1, the root-complex argument through 2.17 and Theorem 6.1 with its proof. This is selected reading, not a claim to have read all 51 pages. The theorem’s page image was inspected.

[Hochster’s 2011 local-cohomology notes](https://sites.lsa.umich.edu/hochster/wp-content/uploads/sites/1337/2024/10/615W2011.LocCoh.pdf), version 6 January 2011, were read at pp.7–8,19–21,35–36,40–42. Their SHA-256 is:

`e8dda8d32793d5257b3e2c51f68e0fc61ea02bbca23117f2adacbc3bb7ce8ed0`.

In particular, Theorem 5.1 gives the endomorphism ring of the injective hull, Remark 11.6 treats arbitrary modules in top local cohomology, and Theorem 11.8 explicitly assumes a finite module for the opposite-direction formula. The full notes were not read.

The existing Mathlib local-cohomology file and Tau Ceti injective-envelope file were read in full at the pins. The tensor–Hom equivalence, injective extension property and integral-closure carrier were also statement-read. The reviewed R03.3 audit and current R03.1/R03.3/DD.1 stage texts were checked, together with paper ownership proposals. Generic Matlis theory already routes to R03.3 in PAPER-BHATT-ETAL-23 and PAPER-HACON-WITASZEK-23; this extraction refines that supplier.

## 2. The complete-base duality repair

Write `D(M)=Hom_R(M,E)`, where E is an injective hull of the residue field of a Noetherian local ring R. The letter `∨` in André’s appendix instead means the ordinary dual `Hom_R(S,R)`; these two duals must remain distinct.

### 2.1 The displayed isomorphism is false for an infinite integral algebra

E5 concerns the display in published A.3.1, p.91, also present in arXiv v1 p.14. Take R=F_p, its maximal ideal zero, r=0, σ=id and S=an algebraic closure of F_p, with τ=id. This satisfies the printed endomorphism hypotheses, and the extension is both integral and pure. The dimension is zero and E=F_p. The displayed identification therefore says `S≅S**` for the algebraic vector-space dual.

But S is countably infinite and has countably infinite dimension over F_p. Its dual has cardinality `2^ℵ₀`; over a finite field its dimension has that same infinite cardinality. Its double dual has cardinality `2^(2^ℵ₀)`. Hence even a noncanonical isomorphism is impossible. This disproves the display; it does not disprove splitting of a field extension.

The same orientation appears in Hochster 1983, p.541. Neither occurrence licenses infinite-module biduality. The correction needed for their complete-base nonvanishing argument is available directly.

### 2.2 Correct direction, with completion visible

For a regular Noetherian local ring R of dimension d, top local cohomology is represented by the top Čech cokernel, equivalently the direct limit of parameter-power quotients. Tensoring an arbitrary module M commutes with that cokernel/direct limit. Since `H_m^d(R)≅E`, this gives

`H_m^d(M)≅M⊗_R E`.

Consequently tensor–Hom adjunction and Hochster’s Theorem 5.1 give

`D(H_m^d(M)) ≅ Hom_R(M,End_R(E)) ≅ Hom_R(M,Rhat)`.

This is valid without a finite-generation hypothesis on M. The functor D detects nonzero modules: map a nonzero cyclic submodule onto the residue field, embed that field in E, and extend the resulting nonzero map by injectivity. Therefore

`H_m^d(M)≠0 ⇔ Hom_R(M,Rhat)≠0`.

For **complete** R the target is R. For noncomplete R it is Rhat, and replacing it by R is an additional assertion. The previous handoff proposed a Mittag–Leffler investigation of inverse systems of ordinary duals. That investigation is unnecessary for this complete-base proof: no limit/dual interchange is made.

If R→S is pure and integral, write S as the filtered union of finite subalgebras. Each finite inclusion is pure and splits over Noetherian R. Thus the nonzero top local-cohomology class of R remains nonzero at every stage and in the colimit. Correct-direction duality then gives a nonzero ordinary dual when R is complete. The filtered-colimit comparison for the pinned Ext-colimit carrier still needs its Lean-level adapter.

### 2.3 A stronger complete-base splitting argument

There is an even shorter route that does not require regularity, integrality or an endomorphism. Let R be **any complete Noetherian local ring** and R→S a pure algebra map. Purity makes

`E → S⊗_R E`, `e ↦ 1⊗e`

injective. As E is injective, its identity extends to an R-linear map `f:S⊗E→E`. Curry f to a map `S→End_R(E)≅R`. The image of 1 is the identity of E, hence corresponds to 1 in R. This is an R-linear retraction of R→S.

Accordingly, if all finite extension domains of a complete regular local R split, their union R+ is pure and also splits. This is a conditional theorem and does not assume the general direct-summand theorem inside its own proof. It applies to André’s W(k) power-series base after Theorem 0.2.1.

The printed application with `V[[T]]` for an **arbitrary noncomplete DVR V** is still held. This checkpoint neither proves nor disproves that broader assertion. It establishes the complete-base version with a fully explicit mathematical argument, while leaving the missing formal suppliers visible.

### 2.4 What is already in the libraries

| Needed object or step | Pinned supplier and limit |
|---|---|
| Local cohomology | `mathlib:localCohomology`; the Ext-colimit carrier exists. Its Čech comparison is explicitly future work. |
| Same support radical | `mathlib:localCohomology.isoOfSameRadical`, for Noetherian R. This alone does not change the base ring. |
| Tensor–Hom | `mathlib:TensorProduct.lift.equiv` and its evaluation formulas. |
| Extension into an injective module | `mathlib:Module.Injective.extension_property`, with its universe hypotheses. |
| Injective envelope | `tauceti:TauCeti.IsInjectiveEnvelope` and uniqueness; **existence is not proved in that file**. |
| Absolute integral closure carrier | `mathlib:integralClosure`, instantiated in a chosen algebraic closure of the fraction field. |

The six new missing Matlis/local-cohomology interfaces go to **DeformationAndDerivedPatchingAlgebra:R03.3**, matching the existing Matlis proposals. The generic Koszul complex comes from **DerivedDeRhamCohomology:DD.1**. No second carrier or separate Matlis roadmap is introduced.

## 2A. What Hochster’s unramified reduction actually uses

Theorem 6.1(2) assumes a **complete unramified regular local ring with algebraically closed residue field** and finite extension domains. André proves the needed mixed-characteristic cases for W(k)[[T]] with perfect k, which includes that residue-field case. Equal-characteristic cases are separate inputs in Hochster’s theorem.

The chain is substantive. Localization and faithfully flat extension are justified by the image of evaluation at 1 on `Hom_A(B,A)`, using finite presentation to commute Hom with flat base change. Reduction to finite domain extensions and residue-field enlargement are also required. These steps do not alone remove ramification.

From finite splittings over the complete unramified base one gets nonzero top local cohomology of A+. A finite extension of complete coefficient DVRs lets one identify the two absolute integral closures and compare local cohomology, since the extended maximal ideal is primary for the new one. Over that **complete** base the corrected duality gives a nonzero ordinary dual. The endomorphism sending each coordinate to its q-th power extends to A+, and the corrected functional criterion splits it.

Hochster then applies this to the root extensions needed in Theorem 2.9. The tensor product of the two-term complexes `[J_i→B∞]`, with J_i generated by all compatible p-power roots of a parameter, is a flat resolution of its augmentation. Its acyclicity uses distributivity of root ideals in the perfect quotient, not an assertion that B∞ is already Cohen–Macaulay. A hypothetical failure of CE produces a homotopy and a monomial relation in a finite intermediate algebra. The assumed splitting contradicts the nonzero socle monomial of a regular parameter quotient. CE then implies monomial noncontainment, and the finite-extension monomial criterion returns the desired splitting.

The result now records the exact reduction and these intermediate theorem contracts. **G3 remains open** for the declaration-sized root-complex/distributivity/homotopy decomposition, the original 1973 socle criterion, coefficient-ring and residue-enlargement proofs, and their precise library adapters. The source was read; it was not flattened into a fictitious one-line completion lemma.

## 2B. The Tor induction and source findings

The footnote proving flatness of an arbitrary balanced big-CM algebra contains two occurrences of M where N is needed (E6, page image checked). For M=A/P choose a maximal regular sequence in P and an embedding `M→N=A/(x)`. The positive Tor groups of **N** against C vanish because x is regular on C. The exact segment is

`Tor_(i+1)(N/M,C) → Tor_i(M,C) → Tor_i(N,C)`.

Descending induction kills the first term; regularity kills the last. The middle term is the desired conclusion, not an assumption. The associated-prime embedding and the bounded-projective-dimension input remain genuine suppliers; finite-module Auslander–Buchsbaum alone is not a proof for arbitrary C.

All twelve source findings await a finished independent review job. E1–E4 retain the prior workers’ mathematical reasoning. Their former `review: confirmed` fields came from paper job #2188, not a completed review job, so they were moved intact into `assessmentHistory` under PROTOCOL §18. This is a metadata correction, not a rejection of the counterexample. The report below retains its full proof.

The new records are E5 (infinite-module duality), E6 (Tor typography), E7 (Shimomoto bibliography year), E8 (Yekutieli title and publication metadata), E9 (the dimension-zero edge case in the introductory monomial membership iff), E10 (the reversed intermediate-module arrow in A.4), E11 (the v1 almost-purity tensor formula, already corrected in print), and E12 (two v1 bibliography spellings, already corrected in print). E9 does not affect the usual monomial noncontainment or the main theorem. E10 follows by inclusion of tensor kernels and does not need the extra almost-injectivity condition. Bounded correction searches and exact locators are recorded in the JSON.

The following proofs of E4 and the §3.4 limit argument are retained from the earlier checkpoint, with their scope unchanged.

## 3. E4: a zero-divisor counterexample to Appendix A.3.1

### 3.1 The hypotheses that matter

The published proposition starts with a local ring `(R,m)`, not necessarily Noetherian, and an element `r∈m` such that R is r-adically separated. It assumes a local endomorphism σ with R free over σ(R), the containment

`⋂_{j≥0} σ^j(m)R ⊆ rR`,

and an extension R⊂S to which σ extends injectively. Among the stated conditions are a nonzero dual `Hom_R(S,R)` and the existence of an R-linear retraction. The proof attempts to divide a nonzero functional by a power of r to make its image escape rR. There is no printed nonzerodivisor hypothesis on r.

### 3.2 The rings and endomorphisms

Let k be any field, put `A=k[[t]]` and `K=k((t))`, and form the square-zero rings

`R=A⊕εA = A[ε]/(ε²)`,

`S=A⊕εK`.

In pair notation their common multiplication law is

`(a,b)(c,d)=(ac,ad+bc)`.

The inclusion R⊂S is coefficientwise. The ring R is Noetherian local with maximal ideal `(t,ε)`; an element `(a,b)` is a unit precisely when the constant coefficient of a is nonzero. Choose `r=ε=(0,1)`. Then `r²=0`, so `⋂ r^nR=0`: R is r-adically separated despite r being a zero divisor.

Define σ on R, and τ on S, by substituting `t²` for t in both components and fixing k and ε. Substitution preserves sums and products and is injective on formal power series and Laurent series. It is local on R because it preserves the constant coefficient of the first component.

Every power series has a unique even/odd decomposition. Applying this to both components gives

`R = σ(R) ⊕ tσ(R)`

as a σ(R)-module. Thus R is free of rank two over σ(R). Moreover

`σ^j((t,ε))R=(t^(2^j),ε)`.

The intersection of these ideals is `(ε)`: the first component lies in every `t^(2^j)A` and is therefore zero, while the second component is unrestricted in εA. Hence the required intersection containment holds, in fact with equality `⋂ σ^j(m)R=rR`.

The extension S is even integral over R. For `(a,b)∈S`, the square of `(a,b)−(a,0)` is zero, so it satisfies the monic polynomial `(X−a)²`. Integrality alone therefore does not repair the faulty implication.

### 3.3 A nonzero dual but no retraction

Define `λ:S→R` by

`λ(a,b)=(0,a)`.

For `(c,d)∈R` and `(a,b)∈S`,

`λ((c,d)(a,b))=(0,ca)=(c,d)λ(a,b)`.

Thus λ is R-linear, and `λ(1)=ε≠0`. In particular the dual is nonzero.

Now let `ρ:S→R` be any R-linear map. For every positive integer N, S contains `(0,t^(−N))`, and

`ε=t^N(0,t^(−N))`.

Consequently `ρ(ε)∈t^N R` for every N. Since `R=A⊕εA` is t-adically separated,

`ρ(ε)∈⋂_N t^N R=0`.

Every R-linear map kills ε. A retraction of R⊂S would have to send ε to the nonzero element ε. No retraction exists.

There is also a direct tensor witness against purity. Since multiplication by t is surjective on K,

`R/tR ≅ k[ε]/(ε²)`, whereas `S/tS ≅ k`.

The induced map kills the nonzero ε-class. Thus this example satisfies the proposition’s hypotheses and its nonzero-dual condition while failing both splitting and purity.

This is not a counterexample to André’s main theorem: R is not regular, and S is not module-finite over R. It isolates the excessive generality of the appendix. The independent reviewer should check the proposition’s hypotheses against this construction rather than treating the finite algebra diagnostics below as a proof.

### 3.4 A sufficient corrected implication

Keep the hypotheses above and add:

**either r=0, or multiplication by r on R is injective.**

Assume R is nonzero and choose `0≠λ∈Hom_R(S,R)`.

If r=0, λ already has an image outside rR. Otherwise the set of n with `λ(S)⊆r^nR` contains 0 and is bounded: any nonzero value of λ cannot belong to every r-power because R is r-adically separated. Choose its largest n. Multiplication by r^n is injective, so every equation `r^n x=λ(s)` has a unique solution x. These solutions define an R-linear functional λ₀. Uniqueness proves additivity and scalar compatibility; maximality of n gives `λ₀(S)⊄rR`.

Choose s with `λ₀(s)∉rR`, and replace λ₀ by its precomposition with multiplication by s. We may therefore assume `λ₀(1)∉rR`. The intersection hypothesis supplies j such that

`λ₀(1)∉σ^j(m)R`.

Injectivity of τ implies injectivity of σ. Transporting the free σ(R)-module presentation along its iterates and composing free-module presentations proves that R is free over σ^j(R). The latter is a local ring, isomorphic to R, with maximal ideal σ^j(m).

In a σ^j(R)-basis expansion of λ₀(1), at least one coefficient is outside σ^j(m), hence is a unit. Only finitely many coordinates of this element are nonzero, even if the basis is infinite. Project to a unit coordinate and scale by its inverse. This gives a σ^j(R)-linear functional

`μ:R→σ^j(R)` with `μ(λ₀(1))=1`.

Finally put

`ρ=(σ^j:R≅σ^j(R))^(-1) ∘ μ ∘ λ₀ ∘ τ^j`.

For a∈R and s∈S, `τ^j(as)=σ^j(a)τ^j(s)`. The R-linearity of λ₀, σ^j(R)-linearity of μ and final inverse isomorphism yield `ρ(as)=aρ(s)`. Additivity is immediate, and `ρ(1)=1`. This is the required retraction.

The added disjunction is sufficient, not claimed necessary. It retains the r=0 equal-characteristic case and the regular-element setting of the domain applications. It does not validate the other part of A.3.1, whose noncomplete-base branch remains G6; the complete-base branch is proved above. E2, the undefined letter in the printed coordinate-functional paragraph, is a separate typographical issue.

## 4. Completing the Artinian-retraction argument of §3.4

### 4.1 Why these parameter quotients give the right limit

Fix `A=W(k)[[T_1,…,T_n]]` and write `m_A=(p,T_1,…,T_n)`. For m≥1 let

`I_m=(p^m,T_1^(p^m),…,T_n^(p^m))`.

The sequence is descending. Since `p^m≥m`, one has `I_m⊆m_A^m`. Conversely,

`m_A^(m+n(p^m−1)) ⊆ I_m`.

Indeed, a monomial in p and the n parameters of total degree `m+n(p^m−1)` cannot have p-exponent at most m−1 and every parameter exponent at most p^m−1: those upper bounds sum to one less than the specified degree. Every such monomial is divisible by a generator of I_m.

Thus I_m is m_A-primary and the I_m form a cofinal system with the maximal-ideal powers. The quotients A/I_m have finite length, and completeness of A gives `A≅lim_m A/I_m`. When n=0 the exponent bound is just m. No finiteness of the perfect residue field k is assumed.

### 4.2 Retractions are cosets in finite-length modules

Let B be finite as an A-module, with distinguished element 1. Write

`V_m=Hom_A(B,A/I_m)`,

`H_m={f∈V_m : f(1)=1}`.

An A-linear map B→A/I_m annihilates I_mB, so this is the same retraction set obtained from `B/I_mB`. Splittings modulo p^m give H_m≠∅ by further quotienting the already split inclusion by the parameter powers. It is not necessary to choose those splittings compatibly.

A finite generating family of B gives an injection `V_m→(A/I_m)^q`; hence V_m is Artinian as an A-module. The set H_m is a nonempty affine coset of the submodule `K_m={f:f(1)=0}`.

For l≥m, reduction gives H_l→H_m, and its image is a coset of the image of K_l in V_m. For fixed m these direction submodules form a descending chain. Artinianity makes the chain stabilize. The cosets themselves are nested and nonempty; once their directions agree, the cosets agree, because any point in the smaller one identifies both as its translate by that common direction.

This is exactly the stabilization used on Hochster’s p.30. The crucial property is finite **module length**, not a finite number of elements. Over an infinite k, even A/m_A is an infinite set.

### 4.3 Restrict to stable images before choosing lifts

Let E_m be the eventual image in H_m. It is nonempty. The induced map `E_(m+1)→E_m` is surjective: given x∈E_m, choose l beyond the stabilization indices for both m and m+1, lift x from H_l, and map that lift to H_(m+1). Its image lies in E_(m+1) and maps to x.

The two cited Mathlib declarations already express these nonemptiness and surjectivity conclusions for eventual ranges. Use them after proving the algebra-specific stabilization lemma; do not introduce a second Mittag–Leffler carrier.

Choose a point of E_1 and, recursively, a preimage under each surjection. The resulting f_m are compatible. This is a countable recursive-choice argument; it is not a general assertion that arbitrary surjective diagrams of nonempty sets have nonempty limits.

### 4.4 Recover the actual A-linear functional

For b∈B, the values f_m(b) form a compatible element of `lim_m A/I_m`. Let ρ(b) be its unique preimage in A. Equality in A can be checked in all those quotients, so additivity, A-linearity and `ρ(1)=1` follow componentwise. The same argument gives uniqueness for a prescribed compatible family.

Finite generation of B was used to make V_m Artinian. It is not needed for this last Hom/target-limit step. In particular there is no need to insert an additional theorem `B≅lim_m B/I_mB` into this proof.

The JSON now separates parameter cofinality, coset stabilization, countable compatible choice and functional reconstruction. These four adapters route to the existing proposed `DirectSummandsAndBigCohenMacaulay` direction. The two general eventual-range results are library items and need no route.


## 5. Ownership and unfinished work

The five routes remain the existing proposed architecture; this checkpoint added items to three of them and created none. DirectSummandsAndBigCohenMacaulay now receives 79 missing items, including the CE/reduction and complete-pure-splitting adapters. PerfectoidSpaces P0 retains its generic almost foundations, while P1–P2 supply the cyclotomic example and rational-localization model and now also the §1.2 uniform-Banach and Weierstrass facts. The twenty ramification items retain the **same PerfectoidRamification Part II** id/title used by PAPER-ANDRE-18. R03.3 receives the finite CM predicate plus six new missing Matlis/local-cohomology interfaces; these refine its existing supplier proposals.

Keep the valuation and ramified almost ideals distinct, module `!` distinct from algebra `!!`, and product roots `(ϖg)^(1/p^h)` distinct from g-roots alone. Preserve m≥2 for the nonzero pg witness modulo p^m and p² in §4.2. PerfectoidQuotients Q3 does not identify its existential extension with André’s specified normalized one without a proof.

G0 is narrowed to the three pieces listed at the end of §0 above; G1–G2 need the exact perfectoid/Abhyankar and finite-stage flatness suppliers; G4 needs Hochster 2002 partial modifications and Bartijn–Strooker balancing; G5 needs pure completion, compatible coefficient enlargement and the weakly functorial CM argument. G3 now has a source-read reduction but unfinished detailed adapters. G6 is restricted to the noncomplete-base branch. G7 retains the fine baseline and proof closure audit. Keep status partial until these are addressed.

## 6. Validation

The repository paper checker, intake file validation and whitespace check pass on this revision. The embedded diagnostics were run locally in this checkpoint too: **3,646 retained finite cases and 15,066 square-zero/Laurent-polynomial identities**. They support the earlier explicit algebra computations; they do not establish infinite intersections, cardinalities, Matlis duality or a formalization. Those arguments are supplied mathematically above. The structural check verifies all 142 identities, unique routing of 118 missing items, 28 APIs with 84 allowed-type tests, 153 acyclic dependencies, and absence of unauthorized review verdicts.

No new executable finite test is offered as a proxy for the infinite-module counterexample. No Lean file was compiled. API and test signatures remain planning contracts.

```python
import collections
import json
import math
from pathlib import Path
from random import Random

path = Path('research/blueprint/papers/PAPER-ANDRE-18-B.result.json')
data = json.loads(path.read_text(encoding='utf-8'))
items = {x['id']: x for x in data['items']}
assert len(items) == len(data['items']) == 142
assert collections.Counter(x['status'] for x in items.values()) == {
    'library': 17, 'planned': 7, 'missing': 118
}
taken = collections.Counter(i for r in data['routes'] for i in r['items'])
assert all(taken[i] == 1 for i, x in items.items() if x['status'] == 'missing')
definitions = [x for x in items.values() if x['kind'] in ('definition', 'construction')]
assert len(definitions) == 28
assert all(x.get('api') and x.get('uses') and len(x.get('tests', [])) >= 3
           for x in definitions)
assert sum(len(x['tests']) for x in definitions) == 84
active, done = set(), set()
def visit(i):
    assert i in items
    assert i not in active, i
    if i in done:
        return
    active.add(i)
    for j in items[i].get('dependencies', []):
        visit(j)
    active.remove(i)
    done.add(i)
for i in items:
    visit(i)
assert sum(len(x.get('dependencies', [])) for x in items.values()) == 153
assert len(data['coverageGaps']) == 8
assert len(data['sourceIssues']) == 15
assert data['status'] == 'partial'
allowed = {'computation', 'degenerate', 'compatibility', 'characterisation', 'non-example'}
assert all(t['kind'] in allowed for x in definitions for t in x['tests'])
assert all('review' not in issue for issue in data['sourceIssues'])

# Retained diagnostics from checkpoint #2210, not proofs of general theorems.
ann_checks = 0
for n in range(2, 49):
    divisors = [a for a in range(1, n + 1) if n % a == 0]
    for a in divisors:
        for b in divisors:
            if math.gcd(b*b, n) != b or b % a:
                continue
            for s in range(0, n, b):
                assert any(((1-r)*s) % n == 0 for r in range(0, n, a))
                ann_checks += 1
pg_checks = 0
for p in (2, 3, 5, 7):
    for m in range(2, 6):
        for g in range(1, 65):
            if g % p:
                assert (p*g) % (p**m) != 0 and (p*g) % p == 0
                pg_checks += 1
split_checks = 0
for n in range(2, 13):
    for a in range(n):
        b = (1-a) % n
        for r in range(n):
            assert (a*r+b*r) % n == r
            split_checks += 1
assert (ann_checks, pg_checks, split_checks) == (2269, 728, 649)

# Exact Laurent-polynomial checks for E4; no finite quotient of K is invented.
rng = Random(2188)
checks = 0
def add(a, b, p):
    return {i: c for i in a.keys() | b.keys()
            if (c := (a.get(i, 0) + b.get(i, 0)) % p)}
def mul(a, b, p):
    out = {}
    for i, x in a.items():
        for j, y in b.items():
            out[i+j] = (out.get(i+j, 0) + x*y) % p
    return {i: x for i, x in out.items() if x}
def smul(r, s, p):
    a, b = r
    c, d = s
    return mul(a, c, p), add(mul(a, d, p), mul(b, c, p), p)
def sadd(r, s, p):
    return add(r[0], s[0], p), add(r[1], s[1], p)
def sig(s):
    return tuple({2*i: c for i, c in a.items()} for a in s)
def lam(s):
    return {}, s[0]
def sample(p, lo, hi):
    return {i: c for i in range(lo, hi+1) if (c := rng.randrange(p))}
def check(a, b):
    global checks
    assert a == b, (a, b)
    checks += 1
for p in (2, 3, 5):
    for _ in range(1000):
        r = (sample(p, 0, 3), sample(p, 0, 3))
        s = (sample(p, 0, 3), sample(p, -3, 3))
        z = (sample(p, 0, 3), sample(p, -3, 3))
        check(sig(smul(s, z, p)), smul(sig(s), sig(z), p))
        check(sig(sadd(s, z, p)), sadd(sig(s), sig(z), p))
        check(lam(smul(r, s, p)), smul(r, lam(s), p))
        check(lam(sadd(s, z, p)), sadd(lam(s), lam(z), p))
        even = tuple({i//2: c for i, c in a.items() if i % 2 == 0} for a in r)
        odd = tuple({(i-1)//2: c for i, c in a.items() if i % 2 == 1} for a in r)
        check(r, sadd(sig(even), smul(({1: 1}, {}), sig(odd), p), p))
    eps = ({}, {0: 1})
    check(smul(eps, eps, p), ({}, {}))
    check(lam(({0: 1}, {})), eps)
    for n in range(1, 21):
        check(smul(({n: 1}, {}), ({}, {-n: 1}), p), eps)
assert checks == 15066
print('structure: 142 items, 118 missing routed once, 28 APIs, 84 tests, 153 acyclic edges')
print('finite diagnostics: 3646 retained cases and 15066 square-zero identity checks')
print('These computations certify neither the general theorems nor Lean elaboration.')
```
