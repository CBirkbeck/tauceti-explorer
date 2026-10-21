# Endoscopic transfer and unitary trace comparison — ET.4: simple stable and twisted unitary trace formulas

ET.4 leads from the local endoscopic matching of ET.0–ET.3 to the simple stable–twisted trace identity for unitary similitude groups, together with the base-change and packet interfaces that its consumers need. It owns the p-adic and twisted character theorems, Kottwitz's formula for Tamagawa numbers and the stabilization of the elliptic terms, the base-change groups 𝒢_n⃗ with their finite-place and archimedean transfers, the invariant twisted trace formula on the coset 𝒢_n⃗θ and its simplification when [F⁺:ℚ]>1, Arthur–Clozel cyclic base change and automorphic induction for GL_n, the restricted unitary descent used by Scholze, Labesse's cohomological weak base change, Bernstein's irreducibility of unitary induction, the generic unitary packets and classification of Kaletha–Mínguez–Shin–White, and the general-type transfer between GSp₄ and GL₄.

The central hypothesis of the simple geometric comparison is [F⁺:ℚ]>1. The infinity function is a twisted Lefschetz function with a fixed algebraic central character. Proper geometric Levi terms vanish by the fixed-unitary-Levi cuspidality criterion; proper spectral Levi terms remain and include residual discrete GL data.

ET.5 (counting and stabilizing Igusa correspondences) and ET.6 (the classical local correspondence for GL_m and its inner forms) have their own documents and import the ET.4 targets they use: ET.5 takes the Tamagawa numbers and the stable elliptic distribution from here, and ET.6 takes cyclic base change, automorphic induction and the restricted unitary descent. The three unitary packet and classification targets of this document use the local Langlands correspondence for GL_N planned in ET.6, and only ET.7a consumes them; they belong after ET.6 (see *Structure and ownership*). The general Fujiwara–Varshavsky trace formula, the smooth-representation category and Satake isomorphism, reductive-group structure, adelic Tamagawa measures and class-field reciprocity are imported and not planned again.

## Conventions and construction order

Write G for the fixed unitary similitude group and 𝒢 for its restriction-of-scalars base-change group. The twisted coset is 𝒢θ inside 𝒢⋊⟨θ⟩. Its involution uses inverse conjugate transpose; conjugate transpose alone reverses products. The chosen character ϖ extends the CM quadratic character. Its ramified places belong to every exceptional spherical-transfer set. The character extension is imported from AA.2; its infinity classification is already owned by the GlobalNumberFields roadmap.

For N = n₁+n₂ the L-morphisms η̃_{n₁,n₂} and ζ̃_{n₁,n₂} twist the i-th block on W_{F₀} by ϖ^{ε(N−nᵢ)}, where ε is the parity, and the similitude factor by ϖ^{−N(n₁,n₂)} with N(n₁,n₂) = [F⁺:ℚ](n₁ε(N−n₁)+n₂ε(N−n₂))/2. For even N these exponents are ε(nᵢ), the form used for G_{2n}; for odd N they are not.

Tamagawa numbers satisfy τ(G)=|π₀(Z(Ĝ)^Γ)|/|ker¹(ℚ,G)| once the simply connected derived cover has Tamagawa number one. For G_n⃗ with r blocks the sources give τ(G_n⃗)∈{2^r,2^(r−1)}; it is 2^r when every block is even and 2^(r−1) when [F⁺:ℚ] is odd and some block is odd, and the coefficients carry the ratio itself in the remaining case. The base-change group has τ(𝒢_n⃗)=1.

Fix quotient measures and the positive real split centre before comparing distributions. Infinity functions are compact modulo that split centre and transform by the specified algebraic central character. The weighted invariant orbital normalization includes a square-root discriminant, whereas ordinary transfer uses the unnormalized orbital integral. The global extension operator is the normalized intertwiner of the spectral formula; the condition A²=1 alone does not determine its sign.

For a standard twisted Levi subset Lθ, cuspidality is tested on its associated **fixed unitary Levi** L_H, rather than the connected complex GL restriction-of-scalars Levi L. The full subset must pass this test. Morel's corrected Proposition 8.2.3 and Lemmas 8.2.5/8.2.6 provide the archimedean invariant calculation. The geometric comparison carries the central-volume factor J(Zθ) and the index d(G,𝒢) before their cancellation. On the spectral side Φ⁻¹θ acts by −1 on the quotient by the θ-fixed full-group split space, giving 2^(−dim), including a nontrivial full-Levi factor. The spectral expansion is Arthur's sum over t ≥ 0 taken in increasing order, with his convergence estimate; no absolute convergence of the double sum is used.

The build has four paths. The character prefix feeds component distributions, character support and twisted real Paley–Wiener. Tamagawa measures, the relative formula and the simply connected number-one input feed stable elliptic coefficients. Base-change groups and finite/infinity transfers then feed the simple geometric and spectral comparison. Finally cyclic GL base change, unitary descent and the generic unitary packet/classification interface supply the downstream automorphic targets. GSp₄ has its own Sp₄/SO₅ classification chain; the unitary classification is not its prerequisite.

Kottwitz 1986 Theorem 9.6 proves the noncentral elliptic formula with restricted endoscopic classes. A separate central-complement target is required for the full formula. Clozel–Labesse 2011 corrects the missing centralizer sign in the singular stable Lefschetz orbital formula of their 1999 appendix. Neither input is supplied by a regular-element argument.

## Libraries, sources and scope boundaries

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The baseline Haar-measure declaration is a measure interface, not a Tamagawa computation or a character theorem. Existing group structure, characters at infinity, class-field reciprocity, measures and representation carriers are imported rather than planned again.

Every definition or construction below has its API, uses and discriminating mathematical tests. Heavy carriers and constructions remain document targets. The compact suggested Lean file states only light numerical checks over carriers at the pins: the Tamagawa component counts and kernel bounds, the coefficient ι(G,H), the parity exponents of the L-morphisms and the twisted determinant coefficient. Its elaboration does not formalize the trace or classification theorems.

Harris–Taylor is not in the cleared source library and was not read from another copy; Bernstein's paper on P-invariant distributions is not freely available and was not read. The public Labesse theorem gives a wider cohomological **weak** base-change statement with its own hypotheses, not an all-place replacement for Scholze's restricted division-algebra descent. A source's unread underlying proof is named in the obligations below.

## ET.4 targets

### ET.4.1 Harish-Chandra's character theorem and the Weyl integration formula over p-adic fields ★

Target `ET.4/padic-character-distributions` (theorem). Planet: Harish-Chandra's character theorem.

Let F be a non-archimedean local field of characteristic 0, G a connected reductive group over F and π an admissible irreducible smooth complex representation of G(F). (a) For f ∈ C_c^∞(G(F)) the operator π(f) has finite rank, and Θ_π(f) = tr π(f) is an invariant distribution. (b) (Harish-Chandra) There is a locally integrable function θ_π on G(F), locally constant on the regular semisimple set G(F)_rs and invariant under conjugation, with Θ_π(f) = ∫_G f(g) θ_π(g) dg for every f; |D^G|^{1/2} θ_π is locally bounded. (c) (Weyl integration formula) For f ∈ C_c^∞(G(F)), ∫_G f(g) dg = Σ_T |N_G(T)(F)/T(F)|^{-1} ∫_{T(F)} |D^G(t)| O_t(f) dt, the sum over representatives T of the G(F)-conjugacy classes of maximal F-tori, with the orbital integrals and measures of ET.1/orbital-integral. (d) Consequently Θ_π(f) = Σ_T |N_G(T)(F)/T(F)|^{-1} ∫_{T(F)} |D^G(t)| θ_π(t) O_t(f) dt, and Θ_π is determined by θ_π on the elliptic regular set together with the characters of proper Levi subgroups through the van Dijk formula for induced representations.

Hypotheses and conventions:

- F non-archimedean of characteristic 0 (the theorem is used only in characteristic 0 here).
- π admissible and of finite length (irreducible representations are admissible by SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles).

Proof plan:

- Finite rank of π(f) is admissibility: f is bi-invariant under some compact open K and π(f) factors through π^K.
- Clozel 1987 Theorems 1–3: descend an admissible character near a semisimple element to its connected centralizer, use the exponential chart, and express the descended distribution locally by Fourier transforms of nilpotent orbital measures. The discriminant comparison in §3.4 transfers local boundedness/integrability back to the group; ET.1 supplies the orbital Fourier integrability.
- The Fourier-support input is Clozel Lemma 6, proved in §§3.5–3.9 from Howe’s small-compact orbit parametrization, the intertwining criterion, the norm estimates and the Fourier coefficient formula. Its underlying Howe theorem and Cartan decomposition are exact character-prefix proof inputs recorded in the gap, not consequences of admissibility.
- For the group formula use the Jacobian of (T(F)\G(F)) × T(F)_rs → G(F)_rs, (x,t) ↦ x⁻¹tx: it is |det(1−Ad(t)|𝔤/𝔱)|. Its fibre has |N_G(T)(F)/T(F)| elements. Kottwitz §7 proves the analogous Lie-algebra formula; it does not itself state the group formula.
- (d) combines (b) and (c); the formula for parabolically induced characters is van Dijk's, recorded with the induction functor of SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction.

Direct prerequisites:

- `ET.1/orbital-integral`
- `ET.1/fourier-transform-orbital-integrals`
- `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`
- `mathlib:MeasureTheory.Measure.IsHaarMeasure`

Sources:

- [L. Clozel, Characters of non-connected reductive p-adic groups](https://doi.org/10.4153/CJM-1987-008-3), §3.3 Theorems 1–3 pp. 153–154; §3.4 pp. 154–156; §§3.5–3.9 pp. 156–167. The primary proof works on a component of a possibly disconnected reductive group, and specializes to the connected character theorem.
- [R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), Introduction, pp. 394–396. states Harish-Chandra's theorem that the distribution character of an admissible representation is given by a locally integrable function, locally constant on the regular set, and outlines the descent to the Lie algebra
- [R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §7, pp. 421–423 (7.7). derives the Weyl integration formula on the Lie algebra; the group form is the same computation with the Weyl discriminant D^G
- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §2, p. 12 (Proposition 2.2). records the corresponding statement for twisted characters and uses the untwisted theorem as input

Checks:

- For G = GL_1, θ_χ = χ for a character χ, and the Weyl integration formula is the identity ∫_{F^×} f = ∫_{F^×} f.
- For the Steinberg representation of GL_2(F), θ_St = −1 on the regular elliptic set (the normalization check reused by the ET.6 local correspondence).
- Θ_π is nonzero on C_c^∞(G(F)_rs) for every irreducible π (linear independence of characters).

### ET.4.2 Transfer between GSp_4 and GL_4 for general-type representations

Target `ET.4/gsp4-gl4-transfer` (theorem).

Let F be a number field, Π a cuspidal automorphic representation of GL_4(𝔸_F) and χ : 𝔸_F^×/F^× → ℂ^× unitary with Π ≅ Π^∨ ⊗ (χ∘det). Exactly one of L^S(s, Π, ∧² ⊗ χ^{-1}) and L^S(s, Π, Sym² ⊗ χ^{-1}) has a pole at s = 1; in the first (symplectic) case Π descends to a discrete automorphic representation π of GSp_4(𝔸_F) with central character χ, and in the second to a discrete representation of the quasi-split quadratic form GSpin_4^α prescribed by its orthogonal parameter. A discrete π of GSp_4 arising this way is of general type; it is cuspidal and stable, every π′ with π′_v in the L-packet of π_v for all v is automorphic and occurs with multiplicity one, the L-parameter of π_v composed with GSp_4 ⊂ GL_4 is rec(Π_v), and if π is algebraic then Π is algebraic (the forward implication stated in BCGP §1.8.22).

Hypotheses and conventions:

- Π and χ unitary with Π cuspidal, as in Gee–Taïbi Proposition 6.1.7. The GSp_4 packet/multiplicity consequences use its Sp_4/SO_5 classification, local intertwining and twisted stabilization chain, conditional on the weighted fundamental-lemma input recorded by the source.
- Do not import the unitary-group classification as a proof for this different group. The ordinary spherical twisted fundamental lemma is not the weighted assertion.

Proof plan:

- Gee–Taïbi Proposition 6.1.7 pp. 507–508 uses the twisted spectral comparison and the orthogonal/symplectic pole dichotomy to isolate the unique GSpin endoscopic group. The symplectic form is GSpin_5≃GSp_4; the orthogonal form is quasi-split GSpin_4^α, not an arbitrary inner form of split GSpin_4.
- Remark 6.1.8 gives the trivial global component group for the general-type parameter. Theorem 7.4.1 pp. 512–514 applies the Sp_4/SO_5 local/global classification, restriction of packets and strong multiplicity-one comparison to prove the general-type multiplicity and local-parameter assertions.
- The exact primary inputs for twisted weighted stabilization, local packet restriction and the exterior/symmetric-square pole proof are recorded in the GSp_4 gap; the unitary packet theorem is not an input. BCGP §1.8.22 supplies the forward algebraicity implication.

Direct prerequisites:

- `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`

Sources:

- [T. Gee and O. Taïbi, Arthur’s multiplicity formula for GSp4 and restriction to Sp4](https://www.numdam.org/item/10.5802/jep.99.pdf), Proposition 6.1.7 and Remark 6.1.8 pp. 507–508; Theorem 7.4.1 pp. 512–514; introduction p. 472. Primary transfer and general-type multiplicity chain; the orthogonal alternative is quasi-split GSpin_4^α and the source explicitly retains weighted fundamental-lemma assumptions.
- [G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.8.22, p. 15. recalls the transfer between GL_4 and GSp_4 for general-type representations, multiplicity one and compatibility of local parameters, citing Gee–Taïbi Proposition 6.1.7
- [G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.6, p. 8. records the dependency of Arthur's classification on the twisted weighted fundamental lemma

Checks:

- For a non-CM holomorphic cuspidal GL₂ form of weight at least two whose symmetric cube is cuspidal, Sym³ of its two-dimensional parameter preserves an alternating form up to det³, giving the symplectic case.
- If Π is an isobaric sum the representation is not of general type.
- The orthogonal alternative is not a GSp_4 representation: it goes through GSpin_4.

### ET.4.3 Tamagawa number one for the simply connected classical inputs

Target `ET.4/classical-simply-connected-tamagawa` (theorem).

For a number field k and a simply connected semisimple group S that is a product of restrictions of scalars of the special linear or special unitary inner forms occurring as derived groups of G, H and connected elliptic centralizers I, τ(S)=1. The quasi-split branch is Lai §7.2, deduced from his Theorem 7.1. The inner special-unitary and inner special-linear branch is a separate primary-proof obligation; quasi-splitness is not inferred from being simply connected.

Hypotheses and conventions:

- Characteristic zero; S is the simply connected cover of the derived group, never the full unitary similitude group.

Proof plan:

- Use the product formula and compatibility of Tamagawa measures with restriction of scalars from AA.2.
- For quasi-split simply connected S, Lai Theorem 7.1 pp. 186–187 expresses τ(S) through the Tamagawa number of a maximal torus in a Borel subgroup (via the Eisenstein residue computation of §§5–6), and §7.2 pp. 187–188 deduces τ(S)=1 because simple connectedness makes that torus a product of induced tori, to which Ono’s formula applies.
- The same conclusion for the inner forms used by rational centralizers needs the classical computation: Lai §7.2 p. 187 records that Weil’s conjecture is known for the classical groups other than the trialitarian forms (Tamagawa, Weil, Mars), and Kottwitz’s 1988 theorem on Tamagawa numbers covers every simply connected group without E₈ factors. Neither primary proof was read here, so this branch remains the named inner-form Tamagawa gap. No quasi-split theorem is applied to an anisotropic inner form.

Direct prerequisites:

- `AdelicAlgebraicGroups:AA.2/tamagawa-measure`
- `AdelicAlgebraicGroups:AA.2/tamagawa-number`
- `ReductiveGroupsPartII:RG2.1/z-extension-existence`

Sources:

- [K. F. Lai, Tamagawa number of reductive algebraic groups](https://www.numdam.org/item/CM_1980__41_2_153_0.pdf), §7, Theorem 7.1 pp. 186–187 and §7.2 pp. 187–188. Theorem 7.1 gives the Tamagawa number of a quasi-split group through a maximal torus; §7.2 deduces Tamagawa number one for quasi-split simply connected groups and records which inner forms were known by other authors. It does not prove the required arbitrary inner-form branch.
- [R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf), §9.3 pp. 392–393. Lists the simply connected Tamagawa and Hasse inputs used for the centralizers in elliptic stabilization.

Checks:

- τ(SL_n)=1, including SL_1=1.
- For a norm-one torus τ=2 can occur; the statement is not extended to arbitrary unitary groups.
- The group GU(p,q) itself has a central torus and is not a simply connected semisimple input.

### ET.4.4 A Hecke character extending the CM quadratic character

Target `ET.4/quadratic-character-extension` (construction).

For an imaginary quadratic field F₀, construct a continuous unitary Hecke character ϖ of C_F₀=F₀×\𝔸_F₀× whose restriction along C_ℚ→C_F₀ is ω_F₀/ℚ. Retain its choice as data: it is not unique. Define Ram_ℚ(ϖ) as the finite set of rational primes below finite places where its local character is nontrivial on the units; every spherical transfer set S contains this set. At the complex place write ϖ∞(z)=(z/|z|)^m|z|^{it}; restriction to ℝ× forces m odd and t=0.

Hypotheses and conventions:

- F₀/ℚ imaginary quadratic; ω_F₀/ℚ uses the global Artin convention already owned by ClassFieldTheory.

Proof plan:

- The idele-class inclusion is injective because F₀×∩𝔸_ℚ×=ℚ×. The norm-one idele class groups are compact; comparison of norms shows that the image is closed and C_F₀/C_ℚ is compact.
- Apply AA.2/central-character-extension-twist to the closed central subgroup of the torus Res_F₀/ℚ G_m. This supplies the continuous unitary extension; its general character-extension proof is inherited from AA, not reproved here.
- Local continuity gives finite ramification. Apply the existing real/complex character classification to the restriction at infinity, obtaining odd angular exponent and zero norm exponent.

Direct prerequisites:

- `AdelicAlgebraicGroups:AA.2/central-character-extension-twist`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`

Sources:

- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1 p. 11 (ϖ and Ram_ℚ(ϖ)); §3.2 pp. 14–16. The chosen extension enters the L-embeddings and its ramified places are excluded from the spherical set. Existence is the specialization of the imported continuous character-extension theorem.

Planning API:

- `CMQuadraticCharacterExtension` (constructor): The data consist of a continuous unitary Hecke character and the equality of its restriction to ω_F₀/ℚ.
- `CMQuadraticCharacterExtension.restrict` (simp): For x∈C_ℚ, ϖ(x)=ω_F₀/ℚ(x).
- `CMQuadraticCharacterExtension.ramifiedPlaces` (structure): Ram_ℚ(ϖ) is finite; outside it each local character is trivial on the unit subgroup.
- `CMQuadraticCharacterExtension.infinityParity` (characterisation): The complex angular exponent is odd and the continuous norm exponent is zero.
- `CMQuadraticCharacterExtension.change` (relation): Two choices differ by a character of C_F₀/C_ℚ; downstream L-embeddings retain the chosen character.
- `CMQuadraticCharacterExtension.artin` (compatibility): Under the imported Artin reciprocity map, the Hecke character gives the W_F₀-character used in the L-embedding; the two conventions are transported together.

Uses:

- ET.4/base-change-groups: Supplies the actual ϖ-twist, rather than an assumed extension.
- ET.4/unramified-transfers and small-level-transfer: Pins the finite exceptional set and prevents using Satake at a ramified character place.

Unit tests:

- `CMQuadraticCharacterExtension.negativeReal` (computation): At the complex place ϖ∞(−1)=−1.
- `CMQuadraticCharacterExtension.evenParity` (non-example): (z/|z|)^2 restricts trivially to ℝ× and cannot be the required infinity factor.
- `CMQuadraticCharacterExtension.choice` (compatibility): Twisting by a quotient character preserves the restriction but may change Ram_ℚ(ϖ).

Checks:

- ϖ∞(−1)=−1; an even angular exponent fails the restriction condition.
- The trivial Hecke character is not an extension of ω_F₀/ℚ.
- Multiplying by a character trivial on C_ℚ gives another valid choice; equality of choices is not a theorem.

### ET.4.5 Tempered local unitary packets with inner-twist pairings

Target `ET.4/tempered-unitary-local-packets` (theorem).

For a local field of characteristic zero, a quasi-split unitary group G*, an extended pure inner twist (G,ξ,z), and a bounded local L-parameter φ (Arthur SL₂ trivial), KMSW Theorem* 1.6.1 gives a finite relevant packet Π_φ(G,ξ) and pairing into Irr(S_φ♮,χ_z). It is empty if φ is irrelevant. Packet members are tempered, the pairing is injective, and at nonarchimedean places it is a bijection to the prescribed component characters. At real places the bijection is over the specified union of pure inner forms, not necessarily on a single form. The packet is independent of z while its pairing uses z. The normalized endoscopic character identity includes e(G) and evaluation at s_e s_φ, with transfer factors normalized by (ξ,z). At a split place the packet is the GL_N singleton.

Hypotheses and conventions:

- Bounded L-parameters only, in the generic case of KMSW v1 Theorem* 1.6.1(5). KMSW prove it taking Mok’s quasi-split classification and the weighted fundamental lemma as inputs (Introduction p. 6); their word “unconditional” is relative to those inputs. Use the chosen Whittaker normalization and extended pure inner twist.
- The GL_N parameters are those of the local Langlands correspondence for GL_N: ET.6/full-wd-correspondence at non-archimedean places and AF.1/archimedean-llc-gln at real and complex places. ET.6 is a later layer of this roadmap, so this target, with the extended packets and the global classification that use it, is to be placed in ET.7a after ET.6.

Proof plan:

- Use the local classification and normalized endoscopic identity of KMSW §1.6.1; relevance and the central character χ_z determine which inner form receives each member.
- Use the injectivity/bijection clauses with their field-dependent scope. Proposition 1.6.2 transports a change of z without claiming that its pairing is unchanged.
- The proof passes through quasi-split classification and normalized local intertwining relations. Their exact primary proof chains are the classification gap, distinct from the packet statement itself.

Direct prerequisites:

- `ET.0/unitary-elliptic-endoscopic-data`
- `ET.1/transfer-factor-properties`
- `ET.3/twisted-fundamental-lemma-and-transfer`
- `ET.6/full-wd-correspondence`
- `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`

Sources:

- [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White, Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.1 Theorem* 1.6.1 pp. 79–80; Proposition 1.6.2 p. 81. Pins the bounded-parameter packet, pairing, relevance, character identity and real-place union.

Checks:

- An irrelevant parameter gives the empty packet on that form.
- At a split place the packet is a GL_N singleton; an independently chosen cyclic GL base-change fibre is not a unitary packet.
- A real packet can be smaller than the full component-character set on one inner form; surjectivity is over the prescribed union.

### ET.4.6 Twisted characters of θ-stable representations

Target `ET.4/twisted-characters` (theorem).

Let E/F be a cyclic extension of non-archimedean local fields of characteristic 0 with Gal(E/F) generated by σ, G_0 connected reductive over F and G = R_{E/F}G_0, so σ acts on G(F) = G_0(E). Let Π be an irreducible admissible representation of G_0(E) with Π ≅ Π∘σ, and fix an intertwiner I_σ : Π → Π∘σ (unique up to scalar; with I_σ^ℓ = 1 where ℓ = [E:F]; cyclic base change additionally uses the canonical extension: for generic Π choose the Whittaker-normalized I_σ preserving the fixed Whittaker functional, and for arbitrary Π use the extension induced on its Langlands standard module and its unique irreducible constituent, as in AC Ch. 1 §2 pp. 10–11). (a) The twisted trace f ↦ tr(Π(f) I_σ) on C_c^∞(G_0(E)) is given by a locally integrable function Θ_{Π,σ}, locally constant near σ-regular elements and invariant under σ-conjugacy g ↦ h g σ(h)^{-1}. (b) (Shintani relation, used to define base change; G_0 = GL_n) If γ ∈ GL_n(E) has σ-regular norm Nγ ∈ GL_n(F) (the norm map of AC Ch. 1 §1), the value Θ_{Π,σ}(γ) depends only on the conjugacy class of Nγ; for general G_0 the norm is defined on stable σ-classes (Labesse 1999 §2.5). (c) The twisted Weyl integration formula expresses ∫_{G_0(E)} f in terms of twisted orbital integrals over σ-conjugacy classes, with stable norms for general G_0; the injectivity on rational σ-conjugacy classes asserted here is restricted to GL_n. (d) The same holds for the coset 𝒢θ of a non-connected group 𝒢^+ = 𝒢 ⋊ ⟨θ⟩ with θ of finite order acting by a quasi-semisimple automorphism, which is the form used for the unitary twisted spaces of ET.4/twisted-trace-formula.

Hypotheses and conventions:

- F of characteristic 0; Π irreducible admissible and σ-stable.

Proof plan:

- Apply Clozel 1987 Theorem 1 to the representation of the finite semidirect product obtained from the chosen intertwiner. Restrict its character distribution to the σ-component; the value there is tr(Π(f)I_σ). The discriminant and descent are those of §2 and §3.4, not a formal invocation of the connected theorem.
- For GL_n the norm is injective on σ-conjugacy classes by AC Ch. 1 Lemma 1.1(ii), pp. 3–4. Lemma 1.4, pp. 7–8, gives the elliptic norm criterion; the general reductive-group norm correspondence is on stable classes, with rational classes tracked separately.
- (d): the same argument applied to the coset of a quasi-semisimple automorphism of finite order.

Direct prerequisites:

- `ET.4/padic-character-distributions`
- `ET.0/norm-correspondence`
- `ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction`

Sources:

- [L. Clozel, Characters of non-connected reductive p-adic groups](https://doi.org/10.4153/CJM-1987-008-3), §2 pp. 150–152; §3.3 Theorem 1 pp. 153–154 and proof §§3.4–3.9 pp. 154–167. Applying the character theorem on the nonidentity component gives the locally integrable twisted trace; regularity uses the component discriminant, not the untwisted one.
- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §1, Lemmas 1.1–1.5, pp. 3–9. defines the norm map for cyclic base change of GL(n), shows that an elliptic regular element is a norm iff its determinant is a norm, and that the norm is injective on σ-conjugacy classes
- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §2, Proposition 2.2, pp. 11–12. states that the twisted character of a σ-stable admissible representation is a locally integrable function, locally constant near σ-regular elements
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, pp. 31–32. integrates the twisted character of the base-change lift as a function when proving bijectivity

Checks:

- For n = 1, Θ_{χ∘N,σ}(γ) = χ(Nγ) for a character χ of F^× (the norm map is the field norm).
- If Π is not σ-stable no twisted character is defined; the statement requires Π ≅ Π∘σ.
- Changing I_σ by an ℓ-th root of unity ζ multiplies Θ_{Π,σ} by ζ.

### ET.4.7 Kottwitz's formula for Tamagawa numbers ★

Target `ET.4/tamagawa-number-formula` (theorem). Planet: Kottwitz's Tamagawa number formula.

For the connected reductive groups G, their elliptic endoscopic groups H and connected elliptic centralizers I used in this layer, let S be the simply connected cover of the derived group. Kottwitz’s relative formula is τ(G)/τ(S)=|π₀(Z(Ĝ)^Γ)|/|ker¹(k,Z(Ĝ))|. With ET.0/kottwitz-duality and ET.4/classical-simply-connected-tamagawa this gives τ(G)=|π₀(Z(Ĝ)^Γ)|/|ker¹(k,G)|. For G_n⃗ with r positive blocks and d=[F⁺:ℚ], the component count |π₀(Z(Ĝ_n⃗)^Γ)| is 2^r if d is even or every block is even, and 2^(r−1) otherwise, while ker¹(ℚ,Z(Ĝ_n⃗)) embeds in a group of order 2 in the first case and of order 1 in the second. Hence τ(G_n⃗)∈{2^r,2^(r−1)}: it equals 2^r when every block is even (ker¹ trivial) and 2^(r−1) when d is odd and some block is odd. When d is even and some block is odd, |ker¹(ℚ,G_n⃗)|∈{1,2} is not determined by the cited sources, so the coefficients carry τ(G_n⃗) as this ratio rather than as a fixed power of 2. For the base-change group τ(𝒢_n⃗)=1. The same ratio must be applied to each inner centralizer with its own ker¹; it is not declared trivial merely because it is a centralizer.

Hypotheses and conventions:

- Use the Tamagawa measures and split-centre quotient of AA.2. The number-one theorem applies to the simply connected derived cover, not the similitude group.
- The displayed absolute formula for the inner-form inputs relies on the explicitly planned classical number-one theorem, whose inner-form proof is a gap.

Proof plan:

- Use Kottwitz 1984 §5: pass through a z-extension to a group with simply connected derived subgroup, apply Ono’s torus formula and the relative-ratio invariance under the central extension. This supplies τ(G)/τ(S), not τ(S)=1. The absolute number-one input is the separate classical target.
- |ker^1(F,G)| = |ker^1(F,Z(Ĝ))| is Kottwitz 1984 (4.2.2), the duality of ET.0/kottwitz-duality.
- Shin 2011 Lemma 3.1 pp. 13–14 computes the dual centre and its Γ-fixed component group, and embeds ker¹(ℚ,Z(Ĝ_n⃗)) into H¹(F₀/ℚ, Z(Ĝ_n⃗)^{Gal(ℚ̄/F₀)}), of order 2 if d is even or every block is even and of order 1 otherwise; this gives only τ(G_n⃗)∈{2^r,2^(r−1)}. Remark 3.2 p. 14 fixes ker¹(ℚ,G_n⃗)=1 when every block is even (by the argument of Kottwitz 1992 §7) and when d is odd with an odd block. For the base-change group use restriction of scalars, Shapiro and Hilbert 90: ker¹ is trivial and Z(Ĝ)^Γ is a torus. Apply the relative formula with the derived covers. Inner centralizers use ET.0 duality separately.

Direct prerequisites:

- `AdelicAlgebraicGroups:AA.2/tamagawa-number`
- `AdelicAlgebraicGroups:AA.2/tamagawa-measure`
- `ET.0/kottwitz-duality`
- `ET.0/unitary-elliptic-endoscopic-data`
- `ReductiveGroupsPartII:RG2.1/z-extension-existence`
- `ReductiveGroupsPartII:RG2.5/langlands-dual-group`
- `ET.4/classical-simply-connected-tamagawa`

Sources:

- [R. E. Kottwitz, Stable trace formula: cuspidal tempered terms](https://math.uchicago.edu/~drinfeld/langlands/Kottwitz.pdf), §5 pp. 625–626; §4.2 (4.2.2) pp. 623–624. Proves the relative Tamagawa formula using z-extensions, Ono’s torus computation and the invariance of the ratio; the duality identifies the kernel orders.
- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §1.2, display (1.2), p. 4. states Kottwitz's formula τ(G) = |π_0(Z(Ĝ)^Γ)|/|ker^1(ℚ,G)| as the convention behind the Igusa coefficients
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1, Lemma 3.1 with (3.3) and Remark 3.2, pp. 13–14. computes the component group of Z(Ĝ_n⃗)^Γ and bounds ker^1 for G_n⃗ by a group of order 2 or 1, giving τ(G_n⃗) ∈ {2^r, 2^{r−1}} (exact in the two cases of Remark 3.2) and τ = 1 for the base-change group, citing Kottwitz 1988 p. 629

Checks:

- τ(𝔾_m) = 1 and τ(R_{F_0/ℚ}𝔾_m) = 1.
- τ(U(1)) = 2 for the norm-one torus of an imaginary quadratic F_0 (π_0 of (ℂ^×)^Γ = {±1}, ker^1 trivial).
- For n⃗ = (1) and [F^+:ℚ] odd, |π_0(Z(Ĝ_{(1)})^Γ)| = 2^{r−1} = 1 and ker^1 is trivial, so τ(G_{(1)}) = 1 (Shin 2011 Remark 3.2).
- For d even and some odd block the sources give only τ(G_n⃗)∈{2^r,2^(r−1)}; a definition that sets ker¹(ℚ,G_n⃗)=1 for every block pattern asserts more than Shin 2011 Lemma 3.1 proves.

### ET.4.8 Base-change groups and the L-morphisms BC and ζ̃

Target `ET.4/base-change-groups` (construction).

Let F = F^+F_0 be a CM field (F_0 imaginary quadratic, [F^+:ℚ] ≥ 2), n⃗ = (n_1,…,n_s) and G_n⃗ the quasi-split unitary similitude group of ET.0/unitary-elliptic-endoscopic-data, with the character ϖ : 𝔸_{F_0}^×/F_0^× → ℂ^× extending the quadratic character of F_0/ℚ fixed there. Put 𝒢_n⃗ = R_{F_0/ℚ}(G_n⃗ ×_ℚ F_0); then 𝒢_n⃗ ≅ R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗ and its dual group is ℂ^× × ℂ^× × ∏_{σ ∈ Φ} GL_n⃗(ℂ) (Φ the embeddings F → ℂ), W_{F_0} permuting the σ-factors and w ∉ W_{F_0} acting by (λ_+, λ_−, (g_σ)) ↦ (λ_− ∏_{σ ∉ Φ^+} det g_σ, λ_+ ∏_{σ ∈ Φ^+} det g_σ, (Φ_n⃗ ᵗg_{c w^{-1}σ}^{-1} Φ_n⃗^{-1})_σ). The construction gives: (a) the base-change L-morphism BC_n⃗ : ^LG_n⃗ → ^L𝒢_n⃗, (λ,(g_σ)_{σ∈Φ^+}) ⋊ w ↦ (λ, λ, (g_σ)_{σ∈Φ^+}, (g_{cσ})_{σ∉Φ^+}) ⋊ w; (b) for n_1 + n_2 = N the L-morphism ζ̃_{n_1,n_2} : ^L𝒢_{n_1,n_2} → ^L𝒢_N extending GL_{n_1} × GL_{n_2} ⊂ GL_N by the ϖ-twist of η̃_{n_1,n_2} on W_{F_0} and the element (a_{n_1,n_2}, a_{n_1,n_2}, (Φ_{n_1,n_2}Φ_N^{-1})_σ) on a fixed w* ∉ W_{F_0}; (c) the commutative square BC_N ∘ η̃_{n_1,n_2} = ζ̃_{n_1,n_2} ∘ BC_{n_1,n_2}; (d) the automorphism θ of 𝒢_n⃗ induced by the non-trivial element of Gal(F_0/ℚ), θ(λ, g) = (λ^c, λ^c g^♯) with g^♯ = Φ_n⃗ ᵗ(g^c)^{-1} Φ_n⃗^{-1} (the inverse is required; the non-compact sequel §5.5 omits it, see sourceIssues), so that 𝒢_n⃗ ⋊ Gal(F_0/ℚ) ≅ 𝒢^+_n⃗ = 𝒢_n⃗ ⋊ {1, θ}.

Hypotheses and conventions:

- F = F^+F_0 CM with F_0 imaginary quadratic; ϖ fixed as in ET.0/unitary-elliptic-endoscopic-data; a_{n_1,n_2} a fixed square root of (−1)^{N(n_1,n_2)} with N = n_1 + n_2, N(n_1,n_2) = [F^+:ℚ](n_1ε(N−n_1) + n_2ε(N−n_2))/2 and ε(m) ∈ {0,1} the parity of m; on W_{F_0} the i-th block of η̃_{n_1,n_2} and ζ̃_{n_1,n_2} is twisted by ϖ^{ε(N−n_i)} (Shin 2011 §3.2 p. 14; Caraiani–Scholze 2017 §5.5 p. 746). For even N, ε(N−n_i) = ε(n_i), the form printed for G_{2n} in Caraiani–Scholze non-compact §5.2 p. 68 and Remark 5.4.1; for odd N the exponent ε(n_i) has the wrong parity.

Proof plan:

- Compute the dual group of R_{F_0/ℚ}(G_n⃗)_{F_0} from the Weil-restriction rule (ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction).
- Define BC_n⃗ and ζ̃ by the displayed formulas and check they are L-morphisms by comparing with the action of w ∉ W_{F_0} (Caraiani–Scholze non-compact §5.4, p. 69).
- The square (c) commutes by direct computation on Ĝ and on w* (Caraiani–Scholze non-compact (5.4.1), p. 69; Shin 2011 §3.2 and §4.4).

Direct prerequisites:

- `ET.0/unitary-elliptic-endoscopic-data`
- `ReductiveGroupsPartII:RG2.5/l-group`
- `ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction`
- `ReductiveGroupsPartII:RG2.5/langlands-dual-group`
- `ET.4/quadratic-character-extension`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, (5.4.1) and the definitions of BC_n⃗ and ζ̃_{n_1,n_2}, pp. 69–70. defines the base-change group, its dual group, the L-morphisms BC and ζ̃ and checks the commutative square
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, p. 72. defines the twisted group 𝒢^+_n⃗ = (R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗) ⋊ {1,θ} and identifies 𝒢_n⃗ ⋊ Gal(F_0/ℚ) with it
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1 and §3.2, pp. 12–14. defines G_n⃗, its dual group and the L-morphisms in the compact case
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, proof of Corollary 5.5.5, pp. 745–746. recalls ζ̃_{n_1,n_2} for arbitrary rank n with the block twists ϖ^{ε(n−n_i)}, the general-rank form of the parity convention.

Planning API:

- `BaseChangeGroup` (constructor): 𝒢_n⃗ = R_{F_0/ℚ}(G_n⃗ ×_ℚ F_0).
- `BaseChangeGroup.equivGL` (equivalence): 𝒢_n⃗ ≅ R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗ over ℚ.
- `BaseChangeGroup.theta` (data): The order-two automorphism θ(λ,g) = (λ^c, λ^c g^♯).
- `BaseChangeGroup.theta_sq` (simp): θ² = id.
- `BCLMorphism` (constructor): The base-change L-morphism BC_n⃗ : ^LG_n⃗ → ^L𝒢_n⃗.
- `zetaLMorphism` (constructor): The L-morphism ζ̃_{n_1,n_2} : ^L𝒢_{n_1,n_2} → ^L𝒢_N.
- `BCLMorphism_comm` (relation): BC_N ∘ η̃_{n_1,n_2} = ζ̃_{n_1,n_2} ∘ BC_{n_1,n_2}.
- `BaseChangeGroup.semidirect` (equivalence): 𝒢_n⃗ ⋊ Gal(F_0/ℚ) ≅ 𝒢_n⃗ ⋊ {1,θ}, with c ↦ θ.

Uses:

- Caraiani–Scholze non-compact §5.4, (5.4.2)–(5.4.3): the transfers BC* and ζ̃* of unramified Hecke algebras are dual to these L-morphisms
- Shin 2011 §4.4: compatibility of transfers along ζ̃ and BC
- ET.7a/twisted-spectral-normalization (ET.6a packet): the twisted spectral coefficients are computed on 𝒢^+_n⃗

Unit tests:

- `BaseChangeGroup.rank_one` (computation): For n⃗ = (1), 𝒢_{(1)}(ℚ) = F_0^× × F^×.
- `BaseChangeGroup.theta_fixed` (characterisation): The θ-fixed points of 𝒢_n⃗(ℚ) are G_n⃗(ℚ).
- `BCLMorphism_comm_test` (compatibility): The square BC_N ∘ η̃ = ζ̃ ∘ BC holds on W_{F_0} and on w*.
- `BaseChangeGroup.not_base_change` (non-example): 𝒢_n⃗ is not G_n⃗ ×_ℚ F_0 viewed over F_0: it is its Weil restriction to ℚ, whose ℚ-points are G_n⃗(F_0).
- `zetaLMorphism.parity` (computation): For N = 3 and (n_1,n_2) = (2,1) the W_{F_0}-component of ζ̃_{2,1} twists the GL_2-block by ϖ^{ε(1)} = ϖ and the GL_1-block by ϖ^{ε(2)} = 1, and N(2,1) = [F^+:ℚ]; the even-rank exponents ε(n_i) would twist the GL_1-block instead.

Checks:

- For n⃗ = (1), 𝒢_{(1)}(ℚ) = F_0^× × F^×.
- The θ-fixed points of 𝒢_n⃗(ℚ) are G_n⃗(ℚ).
- The square BC_N ∘ η̃ = ζ̃ ∘ BC holds on W_{F_0} and on w*.
- 𝒢_n⃗ is not G_n⃗ ×_ℚ F_0 viewed over F_0: it is its Weil restriction to ℚ, whose ℚ-points are G_n⃗(F_0).
- For N = 3 and (n_1,n_2) = (2,1) the block twists are ϖ on GL_2 and trivial on GL_1; the even-rank exponents ε(n_i) would reverse them.

### ET.4.9 Extended local unitary packets by positive-exponent induction

Target `ET.4/extended-unitary-local-packets` (construction).

For ψ∈Ψ⁺(G*) write the KMSW §1.6.4 decomposition ψ=ψ_M·φ_λ with ψ_M bounded on a relevant Levi M* and λ in the positive chamber, giving an unramified character χ_λ. If the Levi datum is irrelevant for G, set Π_ψ(G,ξ)=∅. Otherwise transfer the extended pure inner twist to M and set Π_ψ(G,ξ)={I_P(π_M⊗χ_λ): π_M∈Π_ψM(M,ξ_M)}. Transport the pairing by Irr(S_ψ♮,χ_z)=Irr(S_ψM♮,χ_zM), using KMSW (1.6.3)–(1.6.4). These induced admissible representations may be reducible or nonunitary for a general Ψ⁺ parameter. Do not replace them by irreducible Langlands quotients without an additional theorem. For λ=0 and tempered ψ this recovers the tempered packet. Retain Weyl-conjugacy independence and the choice-sensitive pairing.

Hypotheses and conventions:

- In the generic global localization used here the bounded Levi packet is a tempered L-packet. A general nongeneric bounded Arthur parameter would require the broader bounded packet theorem, which is not planned here.
- Normalize parabolic induction and χ_λ as in KMSW; the inner twist must be relevant for that Levi.

Proof plan:

- Separate positive real exponents from the bounded parameter and use the relevant Levi decomposition in KMSW §1.6.4.
- Construct normalized induction from each bounded Levi packet member and transport its component-character pairing through (1.6.3)–(1.6.4). Record these as actual induced modules, preserving possible reducibility.
- Weyl reordering of the linear factors and the canonical induced representation identifications give independence of the representative decomposition. A change of z transports the pairing via the central character, not literal equality of pairings.

Direct prerequisites:

- `ET.4/tempered-unitary-local-packets`
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`
- `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`
- `ET.0/unitary-elliptic-endoscopic-data`

Sources:

- [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White, Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.4 pp. 86–87, equations (1.6.3)–(1.6.4); Remark 1.7.2 p. 89. Defines the extended induced packets and their pairings; explains their necessity even for generic global parameters.

Planning API:

- `ExtendedUnitaryPacket` (constructor): Store ψ, its relevant positive-exponent Levi decomposition, the induced members and transported component pairing.
- `ExtendedUnitaryPacket.irrelevant` (simp): An irrelevant Levi decomposition gives no members.
- `ExtendedUnitaryPacket.bounded` (simp): At λ=0 for a bounded L-parameter the construction is the tempered packet.
- `ExtendedUnitaryPacket.members` (characterisation): Members are the normalized induced representations I_P(π_M⊗χ_λ), not silently their Langlands quotients.
- `ExtendedUnitaryPacket.pairing` (structure): The component pairing is transported through KMSW (1.6.3)–(1.6.4) and retains the χ_z restriction.
- `ExtendedUnitaryPacket.weyl` (relation): Weyl-conjugate decompositions give canonically identified induced packets and transported pairings.
- `ExtendedUnitaryPacket.split` (compatibility): At a split place the generic localization gives the GL_N parameter representation with the same positive-exponent convention.

Uses:

- ET.4/unitary-endoscopic-classification: Supplies non-tempered localizations of generic global parameters without assuming Ramanujan.
- ET.7a/relevant-packet-multiplicity: The local packet/pairing input is this construction and the tempered theorem, not cyclic GL lifting.

Unit tests:

- `ExtendedUnitaryPacket.zero` (degenerate): Zero exponents recover the bounded packet.
- `ExtendedUnitaryPacket.irrelevantTest` (non-example): A Levi incompatible with the chosen inner form contributes no member.
- `ExtendedUnitaryPacket.reducible` (non-example): At a reducibility point the induced module is retained; its quotient alone is not the constructed object.
- `ExtendedUnitaryPacket.permutation` (compatibility): Permuting conjugate linear Levi blocks transports to the same normalized induced representation.

Checks:

- For λ=0 and bounded φ this is the tempered packet.
- Irrelevant Levi data give the empty packet.
- Taking Langlands quotients of a reducible induced member changes the stated construction and needs an extra theorem.

### ET.4.10 The stable elliptic distribution ST^H_e and the coefficient ι(G,H)

Target `ET.4/stable-elliptic-distribution` (definition).

Let (H,s,η) be an elliptic endoscopic triple of a connected reductive ℚ-group G. Work in the space of smooth functions compactly supported modulo A_{H,∞}^0 (the positive real points of the maximal ℚ-split central torus), transforming under a fixed compatible central character χ; all quotient measures and traces use this same convention. For stable-cuspidal h_∞ define ST^H_e(h) = τ(H) Σ_{[γ_H]_st,ell} |π₀(H_{γ_H})(ℚ)|⁻¹ SO_{γ_H}(h), with the connected-centralizer measures and signs specified by Shin 2010 (7.3), p. 26. The coefficient is ι(G,H)=τ(G)τ(H)⁻¹|Out(H,s,η)|⁻¹. For the unitary similitude endoscopic groups of this layer the centralizers are connected, so the component factor is 1.

Hypotheses and conventions:

- Only ℚ-elliptic semisimple classes enter; h_∞ must be stable cuspidal so that non-elliptic terms vanish at ∞.

Proof plan:

- Use the central quotient, support conditions and summation convention of Shin 2010 §1.2 and (7.3). Compactness modulo the entire centre alone does not imply finiteness: a torus would leave all rational central translates. Any finiteness assertion must be made on the specified quotient and support, not inferred from compact support modulo Z(H).
- ST^H_e is a stable distribution: each SO_{γ_H} is stable (ET.1/kappa-and-stable-orbital-integrals).
- ι(G,H) depends only on the isomorphism class of the triple.

Direct prerequisites:

- `ET.1/kappa-and-stable-orbital-integrals`
- `ET.0/endoscopic-datum`
- `ET.4/tamagawa-number-formula`
- `ET.1/pseudocoefficients`
- `AdelicAlgebraicGroups:AA.2/tamagawa-measure`

Sources:

- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §1.2 pp. 3–4; §7 (7.3) p. 26 and Theorem 7.2 p. 27. defines ι(G,H) as τ(G)τ(H)^{-1}|Out(H,s,η)|^{-1} and uses ST^H_e as the stable elliptic part of the trace formula of H
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Theorem 5.3.2, p. 68; Proposition 5.5.1, p. 73. uses ST^{G_n⃗}_e as the sum of stable orbital integrals over ℚ-elliptic semisimple stable classes, normalised by τ

Planning API:

- `StableEllipticDistribution` (constructor): Let (H,s,η) be an elliptic endoscopic triple of a connected reductive ℚ-group G. Work in the space of smooth functions compactly supported modulo A_{H,∞}^0 (the positive real points of the maximal ℚ-split central torus), transforming under a fixed compatible central character χ; all quotient measures and traces use this same convention. For stable-cuspidal h_∞ define ST^H_e(h) = τ(H) Σ_{[γ_H]_st,ell} |π₀(H_{γ_H})(ℚ)|⁻¹ SO_{γ_H}(h), with the connected-centralizer measures and signs specified by Shin 2010 (7.3), p. 26. The coefficient is ι(G,H)=τ(G)τ(H)⁻¹|Out(H,s,η)|⁻¹. For the unitary similitude endoscopic groups of this layer the centralizers are connected, so the component factor is 1.
- `StableEllipticDistribution.isStable` (characterisation): ST^H_e vanishes on h all of whose stable orbital integrals vanish.
- `StableEllipticDistribution.linear` (simp): ST^H_e is linear in h.
- `endoscopicCoefficient` (constructor): ι(G,H) = τ(G)τ(H)^{-1}|Out(H,s,η)|^{-1}.
- `endoscopicCoefficient_self` (simp): ι(G,G) = 1 for the trivial triple.
- `endoscopicCoefficient_iso` (relation): ι(G,H) depends only on the isomorphism class of (H,s,η).

Uses:

- Shin 2010 Theorem 7.2: the stable Igusa trace formula is a sum of ι(G,H) ST^H_e(h^H) over elliptic triples (ET.5/stable-trace-with-normalizations)
- Caraiani–Scholze non-compact §5.5, Proposition 5.5.1: the geometric side of the twisted trace formula equals τ(G_n⃗)^{-1} ST^{G_n⃗}_e (ET.4/twisted-geometric-side)
- Shin 2011 Corollary 4.7: same identity in the compact case

Unit tests:

- `StableEllipticDistribution.torus` (computation): For a torus the connected-centralizer component factor is 1, and the formula is τ(T) times the rational sum with A_{T,∞}^0 and the central-character convention fixed; no finiteness follows merely from compact support modulo the whole torus.
- `endoscopicCoefficient_equal_blocks` (computation): For G = G_{2n} and H = G_{n,n}, |Out(H,s,η)| = 2, so ι(G,H) = τ(G)/(2τ(H)).
- `StableEllipticDistribution.non_elliptic_zero` (non-example): A semisimple class that is not elliptic at infinity has zero orbital integral against h_∞ stable cuspidal. A sum of stable orbital integrals over more classes remains stable; the ellipticity test checks the selected geometric term, not stability.
- `endoscopicCoefficient_self_test` (degenerate): For the trivial triple (G,1,id), ι(G,G) = 1.

Checks:

- For a torus the connected-centralizer component factor is 1, and the formula is τ(T) times the rational sum with A_{T,∞}^0 and the central-character convention fixed; no finiteness follows merely from compact support modulo the whole torus.
- For G = G_{2n} and H = G_{n,n}, |Out(H,s,η)| = 2, so ι(G,H) = τ(G)/(2τ(H)).
- A semisimple class that is not elliptic at infinity has zero orbital integral against h_∞ stable cuspidal. A sum of stable orbital integrals over more classes remains stable; the ellipticity test checks the selected geometric term, not stability.
- For the trivial triple (G,1,id), ι(G,G) = 1.

### ET.4.11 Unramified transfers BC*, ζ̃*, η̃* and their compatibilities

Target `ET.4/unramified-transfers` (theorem).

With ET.4/base-change-groups, let v be a place of ℚ outside a finite set S containing ∞, p, ℓ and the primes where F or ϖ ramifies. (a) The L-morphisms BC_n⃗, ζ̃_{n_1,n_2} and η̃_{n_1,n_2} induce, through the Satake isomorphism (SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism), algebra maps BC*_n⃗ : H^ur(𝒢_n⃗(ℚ_v)) → H^ur(G_n⃗(ℚ_v)), ζ̃*_{n_1,n_2} : H^ur(𝒢_N(ℚ_v)) → H^ur(𝒢_{n_1,n_2}(ℚ_v)) and η̃*_{n_1,n_2} : H^ur(G_N(ℚ_v)) → H^ur(G_{n_1,n_2}(ℚ_v)), and dual maps on unramified representations, with tr π(η̃*φ) = tr η̃_*(π)(φ) and the same for BC and ζ̃. (b) The squares BC*_{n_1,n_2} ∘ ζ̃*_{n_1,n_2} = η̃*_{n_1,n_2} ∘ BC*_N on Hecke algebras and the dual square on unramified representations commute. (c) Explicitly, for Q_{n_1,n_2} a parabolic of 𝒢_N with Levi 𝒢_{n_1,n_2}: ζ̃*_{n_1,n_2}(f_v) = f_v^{Q} · χ_{ϖ,v}, the normalised constant term times the character χ_ϖ(λ,g_1,g_2) = ϖ(λ^{−N(n_1,n_2)} ∏_i N_{F/F_0}(det g_i)^{ε(N−n_i)}) with N(n_1,n_2) and the parity exponents of ET.4/base-change-groups (for even N these are the exponents ε(n_i) printed in Caraiani–Scholze non-compact Remark 5.4.1), and ζ̃_{n_1,n_2,*}(Π_v) = n-Ind(Π_v ⊗ χ_{ϖ,v}); these formulas extend to all f_v ∈ C_c^∞ and all Π_v ∈ Rep(𝒢_{n_1,n_2}(ℚ_v)), since both groups are products of restrictions of scalars of general linear groups.

Hypotheses and conventions:

- v ∉ S for the unramified statements (a),(b); (c) holds at every place v.

Proof plan:

- (a): functoriality of the Satake isomorphism along L-morphisms between unramified groups (SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism, SR.4/spherical-parameter).
- (b): apply (a) to the commutative square of ET.4/base-change-groups (c) (Caraiani–Scholze non-compact (5.4.2)–(5.4.3), from Shin 2011 (4.18)).
- (c): the constant-term formula tr π(f^Q) = tr n-Ind(π)(f) and its unramified version (Shin 2011 Lemma 3.3), with the twist by χ_ϖ read off from ζ̃ (Caraiani–Scholze non-compact Remark 5.4.1).

Direct prerequisites:

- `ET.4/base-change-groups`
- `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`
- `SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter`
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`
- `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`
- `ET.4/quadratic-character-extension`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, (5.4.2), (5.4.3) and Remark 5.4.1, pp. 69–70. defines the unramified transfers dual to BC and ζ̃, records the two commuting squares and gives the explicit constant-term-and-χ_ϖ formula
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.3, Lemma 3.3, p. 15; §4.2, (4.4), p. 22; §4.4, (4.18)–(4.20), pp. 25–26. proves the constant-term trace identity, the unramified base-change character identity and the compatibility of transfers

Checks:

- For v split in F_0, BC*_n⃗ is surjective (Shin 2011 §4.2, Case 2).
- For n_2 = 0, ζ̃* is the identity.
- tr(n-Ind(Π ⊗ χ_ϖ))(f) = tr Π(f^Q · χ_ϖ) for f ∈ C_c^∞(𝒢_N(ℚ_v)) (constant-term adjunction).

### ET.4.12 Base-change transfer of test functions at every place

Target `ET.4/base-change-transfer-of-functions` (theorem).

With ET.4/base-change-groups: (a) (split places) if v splits in F_0 (in particular v = p in the applications), every f_v ∈ C_c^∞(𝒢_n⃗(ℚ_v)) has a BC-transfer φ_v ∈ C_c^∞(G_n⃗(ℚ_v)) (Shin 2011 §4.2, Case 2), i.e. tr π_v(φ_v) = tr(BC(π_v)(f_v) ∘ A_θ) for the normalised θ-intertwiner, and the map f_v ↦ φ_v is surjective onto C_c^∞(G_n⃗(ℚ_v)); base change of irreducible representations at such v is injective. (b) (all finite places; Labesse 1999 Théorème 3.3.1) every f_v ∈ C_c^∞(𝒢_n⃗(ℚ_v)) has a φ_v with matching orbital integrals, i.e. SO_γ(φ_v) equals the stable twisted orbital integral of f_v at δ when γ is a norm of δ, and SO_γ(φ_v) = 0 when γ is not a norm. (c) (inverse transfer; Labesse 1999 Proposition 3.3.2) a function φ_v ∈ C_c^∞(G_n⃗(ℚ_v)) whose stable orbital integrals vanish at every semisimple element that is not a norm is a BC-transfer of some f_v. (d) (norm criterion) a semisimple γ ∈ G_n⃗(ℚ_v) is a norm iff its image in the cocentre D_n⃗ = G_n⃗/G_n⃗^der is a norm; for v split in F_0 every element is a norm (Caraiani–Scholze non-compact Lemma 5.4.3, via Labesse 1999 Proposition 2.5.3).

Hypotheses and conventions:

- v finite; in (c),(d) v may be inert or ramified in F_0.

Proof plan:

- (a): at split v, 𝒢_n⃗(ℚ_v) ≅ G_n⃗(ℚ_v) × G_n⃗(ℚ_v) with θ swapping factors; take φ_v the convolution of the two components (Shin 2011 §4.2, Case 2).
- (b),(c): Labesse's transfer for stable base change, the twisted analogue of ET.3/local-transfer-existence, recorded at ET.3/base-change-fundamental-lemma-and-transfer (c); Proposition 3.3.2 is its converse for functions supported on norms.
- (d): Labesse 1999 Proposition 2.5.3 reduces to the cocentre of an elliptic Levi M containing γ; the explicit description of D_n⃗ and D_M as tori with multiplier λ shows that an element of D_M is a norm iff its image in D_n⃗ is (Caraiani–Scholze non-compact proof of Lemma 5.4.3, after Morel 2010 Lemma 8.3.6).

Direct prerequisites:

- `ET.4/base-change-groups`
- `ET.3/base-change-fundamental-lemma-and-transfer`
- `ET.4/twisted-characters`
- `ET.1/matching-functions`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, Proposition 5.4.2 and Lemma 5.4.3 with proof, pp. 70–71. recalls Labesse's existence and inverse-transfer criteria and proves the cocentre norm criterion for a general imaginary CM field
- [J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 2.5.3 p. 61; Théorème 3.3.1 pp. 78–79 and Proposition 3.3.2 p. 79 (Numdam edition). proves that an elliptic semisimple element is a norm iff its cocentre image is, the existence of base-change transfer, and the converse for functions with stable orbital integrals supported on norms
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.2, Cases 1–2, pp. 22–23. constructs BC-matching functions at unramified and at split places

Checks:

- At split v, with vol(K) = 1, the BC-transfer of 1_K ⊗ 1_K is 1_K.
- For n⃗ = (1) the norm criterion reduces to the classical criterion for the multiplier torus.
- A function supported on non-norms has BC-transfer 0 under (b).

### ET.4.13 Archimedean Euler–Poincaré and twisted Lefschetz functions for unitary similitude groups

Target `ET.4/archimedean-lefschetz-functions` (construction).

Let G be a unitary similitude group over ℚ that is an inner form of G_N at ∞ of arbitrary signature, ξ an irreducible algebraic representation of G_ℂ, and Ξ = ξ ⊗ ξ the corresponding representation of (𝒢_n⃗)_ℂ. Construct: (a) the Euler–Poincaré function φ_{G_n⃗,ξ} (ET.1/pseudocoefficients) and Labesse's twisted Lefschetz function f_{𝒢_n⃗,Ξ} ∈ C_c^∞(𝒢_n⃗(ℝ)), whose twisted traces compute twisted Lefschetz numbers of (𝔤,K)-cohomology; they are BC-matching; (b) for each elliptic endoscopic G_n⃗ of G, the function φ^n⃗_∞ = e_n⃗(Δ_∞)(−1)^{q(G)}⟨μ_h, s⟩ Σ_{φ_H} det(ω_*(φ_H)) φ_{φ_H}, the sum over discrete L-parameters φ_H of G_n⃗ with η̃_n⃗ ∘ φ_H equivalent to the parameter of ξ, φ_{φ_H} the averaged pseudo-coefficient of the packet and q(G) = ½ dim G(ℝ)/K_∞A_{G,∞}^0; (c) the twisted analogue f^n⃗_∞ = e_n⃗(Δ_∞)(−1)^{q(G)}⟨μ_h, s⟩ Σ_{φ_n⃗} det(ω_*(φ_n⃗)) f_{𝒢_n⃗,Ξ(φ_n⃗)}; then f^n⃗_∞ and φ^n⃗_∞ are BC-matching, and φ^n⃗_∞ is a transfer of the Euler–Poincaré function of G (Kottwitz's construction, ET.1/archimedean-pseudocoefficient-transfer). In the pure U(p,q) factor construct the coefficient F=E⊗θE with θ acting by interchange of the two factors. With the Euler–Poincaré measure, Clozel–Labesse 2011 Theorems 4.1/5.1 give SO_δ(f_F)=0 when I_δ has no discrete series, and otherwise SO_δ(f_F)=e(I_δ)2^n tr(E(γ)) for γ=gθ(g), δ=gθ in GL_n(ℂ)θ. The centralizer sign e(I_δ) is essential, including at singular semisimple δ. For restrictions of scalars and similitude centres transport the factor formula with the split-centre measures and the ET.1 transfer normalization; the pure-unitary formula is not asserted unchanged for GU.

Hypotheses and conventions:

- G_ℝ an inner form of G_N of arbitrary signature (not only Harris–Taylor signature); ξ irreducible algebraic; the sign e_n⃗(Δ_∞) and ⟨μ_h,s⟩ fixed by the transfer-factor normalisation of ET.1/transfer-factor-properties.
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

Proof plan:

- Clozel–Labesse 2011 Theorem 2.2 computes the orbital integrals of the K-supported Lefschetz measure μ_F; the Lefschetz function is the regularization of μ_F by an Arthur multiplier with value one at the infinitesimal character of the coefficient (Labesse 1991, recalled before their Lemma 3.2). Lemma 3.2 makes its semisimple orbital integrals independent of the regularization; Proposition 3.3 gives the regular orbital formula. Theorems 4.1/5.1 descend to the stable centralizer with its Euler–Poincaré function and obtain the singular stable formula with e(I_δ). Their §4 (pp. 112–113) is the published erratum to Theorem A.1.1 of the Clozel–Labesse appendix to Astérisque 257, which omitted that sign (sourceIssues E3).
- (b): Shin 2011 (5.11), p. 35, with the real endoscopic signs of Shin 2011 §3.6; for arbitrary signature use q(G) and the packets of G_ℝ (Caraiani–Scholze 2017 §5.2 p. 735 and §5.3 pp. 737–738).
- (c): Shin 2011 (6.7), p. 43; BC-matching of f^n⃗_∞ and φ^n⃗_∞ follows termwise from (a).
- Use Shin §4.3 and ET.1’s real packet transfer for the pure-unitary norm correspondence and then transport products and the common similitude split centre with the chosen central character. The required quotient-measure and real-character boundary proof inputs are recorded explicitly.

Direct prerequisites:

- `ET.1/pseudocoefficients`
- `ET.1/archimedean-pseudocoefficient-transfer`
- `ET.1/real-transfer`
- `ET.4/base-change-groups`
- `AutomorphicSpectralTheory:AS.6/general-euler-poincare`

Sources:

- [L. Clozel and J.-P. Labesse, Orbital integrals and distributions](https://www.claymath.org/library/proceedings/cmip013c.pdf), Theorem 2.2 p. 109; Lemma 3.2 and Proposition 3.3 pp. 111–112; §4 erratum and Theorem 4.1 pp. 112–113; §5 Theorem 5.1 pp. 113–114. Provides the orbital integrals of the Lefschetz measure and functions and the singular stable formula with the centralizer sign, with the published erratum to the Clozel–Labesse appendix of Astérisque 257.
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.3, pp. 23–24; (5.11), p. 35; (6.7), p. 43. constructs Labesse's twisted Lefschetz functions, shows BC-matching with Euler–Poincaré functions and writes the explicit endoscopic combinations φ^n⃗_{Ig,∞} and f^n⃗_∞
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, p. 735; §5.3, pp. 737–738. uses the same functions for an inner form G_ℝ of arbitrary signature, with q(G) = ½ dim(G(ℝ)/K_∞A_∞^0)
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, p. 70; §5.6, pp. 74–75. recalls the matching at ∞ and the choice of f^n⃗_∞

Planning API:

- `eulerPoincareFunction` (constructor): φ_{G,ξ}, the averaged pseudo-coefficient of the discrete packet of ξ^∨.
- `twistedLefschetzFunction` (constructor): Construct the smooth twisted Lefschetz function with coefficient Ξ=ξ⊗θξ and the interchange extension, retaining the regularizing multiplier and split-centre normalization.
- `twistedLefschetzFunction_trace` (characterisation): tr(Π(f_{𝒢,Ξ}) A_θ) is the twisted Lefschetz number Σ_i (−1)^i tr(θ | H^i(𝔤,K; Π ⊗ Ξ)).
- `lefschetz_bcMatching` (compatibility): f_{𝒢,Ξ} and φ_{G,ξ} are BC-matching.
- `endoscopicInfinityFunction` (constructor): φ^n⃗_∞ as the signed combination over discrete parameters φ_H with η̃∘φ_H ~ φ_ξ.
- `twistedEndoscopicInfinityFunction` (constructor): f^n⃗_∞ as the matching combination of Lefschetz functions.
- `endoscopicInfinityFunction_isTransfer` (compatibility): φ^n⃗_∞ is a transfer of the Euler–Poincaré function of G (Kottwitz).
- `twistedLefschetzFunction_cuspidal` (other): f_{𝒢,Ξ} is cuspidal: its twisted orbital integrals vanish off θ-elliptic elements.
- `twistedLefschetzFunction.singularStableOrbital` (characterisation): For a pure U(p,q) factor and semisimple δ=gθ, the stable integral is zero if I_δ has no discrete series, and otherwise e(I_δ)2^n tr ξ(gθ(g)); do not suppress the centralizer sign.
- `twistedLefschetzFunction.regularization` (relation): Changing the Paley–Wiener multiplier while retaining value one at the coefficient parameter leaves semisimple orbital integrals unchanged.

Uses:

- Caraiani–Scholze 2017 Corollary 5.2.5, Theorem 5.3.2: the archimedean components of the Igusa test functions and of their base-change partners
- Caraiani–Scholze non-compact Definition 5.3.1(4): φ^n⃗_∞ is a combination of Euler–Poincaré functions
- ET.4/twisted-geometric-side: cuspidality of f^n⃗_∞ at ∞ kills non-elliptic twisted terms

Unit tests:

- `eulerPoincareFunction.trivial_compact` (degenerate): If G(ℝ)/A_{G,∞}^0 is compact and ξ=1 with trivial central character, its normalized constant function represents the Euler–Poincaré trace. Compactness merely modulo the full centre does not imply this assertion.
- `lefschetz_bcMatching.signature_check` (compatibility): For arbitrary signature recompute q(G), the Shimura cocharacter μ_h, the pairing ⟨μ_h,s⟩ and the contributing real packets. Holding μ_h fixed while changing signature need not preserve the endoscopic coefficients.
- `endoscopicInfinityFunction.sign` (computation): For the trivial triple the coefficient is (−1)^{q(G)}.
- `twistedLefschetzFunction.wrong_weight` (non-example): On a compact real quotient choose ξ and a coefficient Ξ′ whose restriction along the base-change embedding has a different highest weight and no ξ-constituent. Schur orthogonality distinguishes their traces and prevents matching; mere inequality Ξ′≠ξ⊗ξ is insufficient.
- `twistedLefschetzFunction.centralizerSign` (computation): Choose a semisimple δ with e(I_δ)=−1 and nonzero coefficient trace. The pure-unitary stable orbital integral is −2^n tr ξ(gθ(g)), distinguishing the corrected formula from the unsigned one.

Checks:

- If G(ℝ)/A_{G,∞}^0 is compact and ξ=1 with trivial central character, its normalized constant function represents the Euler–Poincaré trace. Compactness merely modulo the full centre does not imply this assertion.
- For arbitrary signature recompute q(G), the Shimura cocharacter μ_h, the pairing ⟨μ_h,s⟩ and the contributing real packets. Holding μ_h fixed while changing signature need not preserve the endoscopic coefficients.
- For the trivial triple the coefficient is (−1)^{q(G)}.
- On a compact real quotient choose ξ and a coefficient Ξ′ whose restriction along the base-change embedding has a different highest weight and no ξ-constituent. Schur orthogonality distinguishes their traces and prevents matching; mere inequality Ξ′≠ξ⊗ξ is insufficient.
- Choose a semisimple δ with e(I_δ)=−1 and nonzero coefficient trace. The pure-unitary stable orbital integral is −2^n tr ξ(gθ(g)), distinguishing the corrected formula from the unsigned one.

### ET.4.14 Cuspidal groups, cuspidal Levi subgroups and cuspidal Levi subsets

Target `ET.4/cuspidal-levi-subsets` (definition).

A connected reductive ℚ-group M is cuspidal if (M/A_M)_ℝ has an anisotropic maximal real torus, where A_M is its maximal ℚ-split central torus. A Levi subgroup of the fixed unitary similitude group G_n⃗ is cuspidal when it satisfies this condition. For a standard Levi subset Lθ of 𝒢_n⃗θ, form its associated Levi L_H=L∩G_n⃗ (equivalently the fixed group of the restricted involution); call the subset cuspidal when L_H is cuspidal. Define the property for a conjugate Levi subset by transport to a standard subset. The connected restriction-of-scalars Levi L by itself is not the group on which cuspidality is tested.

Hypotheses and conventions:

- M connected reductive over ℚ; Levi subsets in the sense of Arthur's non-connected theory.

Proof plan:

- Use CSnc Definition 5.5.2 p. 74 and Morel §8.2 p. 131: identify the standard fixed Levi L_H and apply the real anisotropic-torus criterion to L_H.
- AF.1/discrete-series supplies the real discrete-series criterion modulo the specified split centre. Products preserve cuspidality, whereas a surviving split central factor rules it out.

Direct prerequisites:

- `ET.4/base-change-groups`
- `AdelicAlgebraicGroups:AA.2/tamagawa-measure`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`
- `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Definition 5.5.2, p. 74. defines cuspidal groups, cuspidal Levi subgroups and cuspidal Levi subsets of the twisted coset
- [S. Morel, On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/abs/0802.4451v2), Definition 3.1.1 p. 50; §8.2 p. 131. Cuspidality of a standard Levi subset is defined using its associated Levi M_H of the fixed group.

Planning API:

- `IsCuspidalGroup` (constructor): M is cuspidal iff (M/A_M)_ℝ has an ℝ-anisotropic maximal torus.
- `IsCuspidalGroup.iff_discreteSeries` (characterisation): M is cuspidal iff M(ℝ) has discrete series modulo A_M(ℝ)^0.
- `IsCuspidalGroup.prod` (structure): A product is cuspidal iff each factor is.
- `IsCuspidalSubset` (constructor): A twisted Levi subset is cuspidal iff its associated standard fixed-unitary Levi L_H is cuspidal; this property is invariant under transport to conjugate standard data.
- `IsCuspidalGroup.resGL` (relation): For a CM field F, R_{F/ℚ}GL_h is cuspidal iff h = 1 and [F^+:ℚ] = 1: otherwise (M/A_M)_ℝ has a non-trivial split central torus (when [F^+:ℚ] > 1) or a split part in every maximal torus (when h ≥ 2).

Uses:

- Caraiani–Scholze non-compact proof of Proposition 5.5.1: the archimedean weighted twisted terms of a Lefschetz function vanish on non-cuspidal Levi subsets (Morel 2010 Proposition 8.2.3)
- ET.4/no-proper-cuspidal-subsets: the key lemma that no proper cuspidal subset exists when [F^+:ℚ] ≥ 2

Unit tests:

- `IsCuspidalGroup.gm` (computation): 𝔾_m is cuspidal (A_M = 𝔾_m and M/A_M is trivial).
- `IsCuspidalGroup.resGL_not` (non-example): For [F^+:ℚ] = 2, R_{F/ℚ}GL_1 is not cuspidal: its real centre contains a split torus of rank 2 while A_M has rank 1.
- `IsCuspidalGroup.unitary` (computation): A unitary group U(a,b) over ℚ relative to an imaginary quadratic field is cuspidal.
- `IsCuspidalGroup.trivial` (degenerate): The trivial group is cuspidal; a Levi subgroup is never required to contain a non-trivial torus.
- `IsCuspidalSubset.fullUnitary` (computation): The full component 𝒢_n⃗θ is cuspidal because its associated fixed group G_n⃗ is cuspidal. Testing discrete series on 𝒢_n⃗(ℝ), a product of complex general linear groups, would give the wrong result.

Checks:

- 𝔾_m is cuspidal (A_M = 𝔾_m and M/A_M is trivial).
- For [F^+:ℚ] = 2, R_{F/ℚ}GL_1 is not cuspidal: its real centre contains a split torus of rank 2 while A_M has rank 1.
- A unitary group U(a,b) over ℚ relative to an imaginary quadratic field is cuspidal.
- The trivial group is cuspidal; a Levi subgroup is never required to contain a non-trivial torus.
- The full component 𝒢_n⃗θ is cuspidal because its associated fixed group G_n⃗ is cuspidal. Testing discrete series on 𝒢_n⃗(ℝ), a product of complex general linear groups, would give the wrong result.

### ET.4.15 Local cyclic base change for GL_n (Arthur–Clozel) ★

Target `ET.4/local-cyclic-base-change` (theorem). Planet: Local cyclic base change.

Let E/F be a cyclic extension of non-archimedean local fields of characteristic 0 of prime degree ℓ with Gal(E/F) = ⟨σ⟩, and G = GL_n. (Definition, Shintani) For tempered representations, a σ-stable irreducible admissible representation Π of GL_n(E) is a base-change lift of an irreducible admissible π of GL_n(F) if Θ_{Π,σ}(g) = Θ_π(Ng) for every g ∈ GL_n(E) with σ-regular norm Ng, the twisted character normalised as in ET.4/twisted-characters. Then: (a) every irreducible tempered π has a unique lift Π, which is tempered; (b) every σ-stable irreducible tempered Π lifts at least one π, and π is tempered; (c) the notion does not depend on the generator σ; (d) if Π lifts π = ind(π_1 ⊗ … ⊗ π_r) with π_i discrete series, the representations lifting to Π are exactly ind((π_1⊗χ_1)⊗…⊗(π_r⊗χ_r)) with χ_i characters of F^×/N(E^×); (e) lifting is compatible with contragredients and with twists: π⊗ω lifts to Π⊗(ω∘N_{E/F}), and ω_Π = ω_π ∘ N_{E/F}; (f) for π supercuspidal: if its lift is discrete then it is supercuspidal, otherwise the lift is a normalized induction of the full σ-orbit of a supercuspidal representation of GL_{n/ℓ}(E), with ℓ dividing n (AC Lemma 6.10); (g) the lift extends to all irreducible representations through the Langlands classification (SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; no dependence on ET.6) by lifting tempered data and taking Langlands quotients.

Hypotheses and conventions:

- E/F cyclic of prime degree ℓ, characteristic 0
- twisted characters normalised as in ET.4/twisted-characters
- The Shintani character identity defines tempered lifting with the canonical intertwiner. The extension to all irreducibles is by Langlands standard data, not an assertion of that character identity for every non-tempered representation.

Proof plan:

- Compare twisted orbital integrals of φ on GL_n(E) with orbital integrals of f on GL_n(F) through the norm map (AC Ch. 1 §§1–3, Proposition 3.1) and the base-change fundamental lemma (ET.3/base-change-fundamental-lemma-and-transfer).
- Existence for discrete series by a global argument with the simple trace formula comparison of AC Ch. 2 (Theorems A and B) applied to cuspidal representations with prescribed local components; tempered case by parabolic induction (AC Ch. 1 Theorem 6.2, p. 52).
- Fibres (d), compatibilities (e) and supercuspidality (f): AC Ch. 1 Propositions 6.6–6.9 and Lemma 6.10, pp. 58–64, using linear independence of twisted characters (ET.4/twisted-characters).

Direct prerequisites:

- `ET.4/twisted-characters`
- `ET.3/base-change-fundamental-lemma-and-transfer`
- `ET.4/padic-character-distributions`
- `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`
- `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`
- `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`

Sources:

- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 Theorem 6.2 pp. 51–52; Propositions 6.6 p. 58, 6.7–6.8 p. 59, 6.9 pp. 60–61 and Lemma 6.10 p. 62. defines base-change lifting by the Shintani character identity and proves existence and uniqueness of lifts of tempered representations
- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §6, Proposition 6.6 pp. 58–59, Propositions 6.7–6.8 p. 59, Proposition 6.9 pp. 60–61, Lemma 6.10 p. 62 (proof to p. 64). describes the fibres of lifting by twists, compatibility with contragredients and twists, and the behaviour of supercuspidal representations
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, pp. 31–32. uses Arthur–Clozel Lemma 6.10, Theorem 6.2 and Proposition 6.7 to prove bijectivity on supercuspidals

Checks:

- For n = 1, the lift of a character χ of F^× is χ ∘ N_{E/F}.
- The Steinberg representation of GL_n(F) lifts to the Steinberg representation of GL_n(E).
- An unramified principal series lifts to the unramified principal series with Satake parameters raised to the ℓ-th power when E/F is unramified.

### ET.4.16 Twisted character support and real Paley–Wiener theorem

Target `ET.4/twisted-character-support-and-paley-wiener` (theorem).

For a component of a reductive group over a characteristic-zero local field with rational points, each invariant orbital distribution I_M(γ) is supported on characters: it vanishes on any Hecke function whose invariant twisted character transform is zero. The real twisted trace transform is onto the Paley–Wiener families of Delorme–Mezo Theorem 4: finite K-type support, covariance under the root-of-unity change of extension, and Fourier transforms of smooth functions supported in the radius-t ball on each induced spectral parameter space. Thus the real trace Paley–Wiener assumption left in Kottwitz–Rogawski and Arthur’s original disconnected induction is supplied for the components used here.

Hypotheses and conventions:

- Use Delorme–Mezo’s real reductive component, chosen maximal compact group and radius convention; only representations whose restriction to the identity component is irreducible tempered enter its primary dual.
- Kottwitz–Rogawski’s general support theorem assumes trace Paley–Wiener; the two results are used together, not cited as two unconditional proofs of the same statement.

Proof plan:

- Delorme–Mezo Theorem 4: necessity follows from finite K-types, the scalar extension action and the Fourier support bound. For sufficiency convert the family to the main Theorem 3 data; normalized analytic intertwiners preserve the root-of-unity covariance and the spectral relations.
- Kottwitz–Rogawski §6: induct on dimension/Levi order, descend to regular elliptic elements, globalize the local group, use weak approximation and the cohomological conjugacy-separation lemmas, and isolate a positive multiple of the desired local distribution in the global trace identity.
- The global argument is an induction in Arthur’s formula, not a cycle using this packet’s final unitary stable comparison. Its underlying approximation/Hasse inputs remain the precise source-proof gap.

Direct prerequisites:

- `ET.4/base-change-groups`
- `ET.4/twisted-characters`
- `ET.0/kottwitz-duality`
- `AutomorphicSpectralTheory:AS.6/invariant-recursion`
- `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`

Sources:

- [R. E. Kottwitz and J. D. Rogawski, The distributions in the invariant trace formula are supported on characters](https://doi.org/10.4153/CJM-2000-034-6), Introduction p. 804; §6 Theorem 1 and proof pp. 810–813. Proves character support, conditionally on the real trace Paley–Wiener statement.
- [P. Delorme and P. Mezo, A twisted invariant Paley–Wiener theorem for real reductive groups](https://www.i2m.univ-amu.fr/perso/patrick.delorme/reprints-delorme/2008TwistedPaley-WienerMezo.pdf), §9 Theorem 4 and proof pp. 375–377; §7 Theorem 3 pp. 364–365. Gives the twisted invariant real trace transform and its three support/covariance conditions.

Checks:

- A family invariant under A↦−A with nonzero value cannot be the order-two twisted trace transform.
- For θ=1, the covariance condition becomes the ordinary real trace transform condition.
- If every twisted character vanishes on f, every I_M(γ,f) vanishes.

### ET.4.17 Small-level functions are base-change transfers (the level N_0)

Target `ET.4/small-level-transfer` (theorem).

Let S_pf be a finite set of finite primes at which F_0 need not be split. For every v ∈ S_pf there is an open neighbourhood U_v of 1 in G_N(ℚ_v) such that every φ_v ∈ C_c^∞(G_N(ℚ_v)) supported in U_v has the property that, for each elliptic endoscopic G_n⃗ of G_N and each Langlands–Shelstad transfer φ_v^n⃗ of φ_v to G_n⃗(ℚ_v), φ_v^n⃗ is the BC-transfer of some f_v^n⃗ ∈ C_c^∞(𝒢_n⃗(ℚ_v)). Consequently there is an integer N_0 ≥ 3 divisible only by primes in S_pf such that, for every N divisible by N_0, the characteristic function of the principal congruence subgroup K(N)_v has this property at every v ∈ S_pf, and every sufficiently small compact open subgroup is transferable in the sense of Liu–Tian–Xiao–Zhang–Zhu Definition D.2.1.

Hypotheses and conventions:

- v ∈ S_pf finite; the elliptic endoscopic groups are those of ET.0/unitary-elliptic-endoscopic-data.

Proof plan:

- By ET.4/base-change-transfer-of-functions (d), there is a neighbourhood U_n⃗ of 1 in G_n⃗(ℚ_v) all of whose semisimple elements are norms, because norms in a torus contain a neighbourhood of 1.
- Morel 2010 Lemma 8.4.2 gives a neighbourhood V_n⃗ of 1 in G_N(F_0 ⊗ ℚ_v) such that semisimple elements of G_n⃗(ℚ_v) conjugate into V_n⃗ are conjugate into U_n⃗; intersect over the finitely many n⃗.
- If SO_γ(φ^n⃗) ≠ 0 then γ matches some δ with O_δ(φ) ≠ 0, so δ ∈ U and γ is conjugate into U_n⃗, hence a norm; conclude by ET.4/base-change-transfer-of-functions (c) (Caraiani–Scholze non-compact proof of Lemma 5.4.4, after Morel 2010 Lemma 8.4.1).

Direct prerequisites:

- `ET.4/base-change-transfer-of-functions`
- `ET.3/local-transfer-existence`
- `ET.0/unitary-elliptic-endoscopic-data`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, Lemma 5.4.4 and Remark 5.4.5, pp. 71–72. proves that functions supported near the identity at bad places have transfers that are base-change transfers and defines N_0 accordingly
- [Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Appendix D.2 Definition D.2.1 and Lemma D.2.2(3), p. 369. uses that every sufficiently small compact open subgroup at a bad place is transferable

Checks:

- For v split in F_0, U_v = G_N(ℚ_v) works.
- When every prime of S_pf splits in F_0, every level satisfies the transfer condition.
- The constant function 1_{G_N(ℤ_v)} need not be transferable in this sense at a ramified v; small support is a genuine hypothesis.

### ET.4.18 No proper cuspidal subsets when [F^+:ℚ] ≥ 2

Target `ET.4/no-proper-cuspidal-subsets` (theorem).

If [F^+ : ℚ] ≥ 2 then 𝒢_n⃗θ admits no proper cuspidal Levi subset. If F^+ = ℚ (F imaginary quadratic) the analogue fails: the unitary similitude groups G_N then have proper cuspidal Levi subgroups (R_{F/ℚ}𝔾_m)^s × G_{N−2s}, and the stable trace formula for Igusa varieties can no longer be identified with the geometric side of the twisted trace formula, which acquires additional terms.

Hypotheses and conventions:

- F = F^+F_0 CM; the statement is about the base-change coset of ET.4/base-change-groups.

Proof plan:

- For a standard proper twisted Levi subset take its associated fixed Levi M_H in G_n⃗; use the cuspidality definition from ET.4/cuspidal-levi-subsets.
- A proper ℚ-Levi of G_n⃗ has a Res_F/ℚ GL_h factor. Its real split centre has rank [F⁺:ℚ], while its ℚ-split centre has rank one. The quotient by the latter still has a positive-dimensional real split centre when [F⁺:ℚ]>1, so an anisotropic maximal real torus is impossible.
- This proves vanishing for proper geometric Levi terms only. It does not remove proper-Levi spectral terms, which remain in ET.4/twisted-spectral-side.

Direct prerequisites:

- `ET.4/cuspidal-levi-subsets`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Lemma 5.5.3 and Remark 5.5.4, p. 74. proves that the coset has no proper cuspidal subsets when [F^+:ℚ] ≥ 2 and gives the counterexample for F^+ = ℚ
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Remark 4.6, p. 27. notes that for F^+ = ℚ more terms appear, citing Morel 2010 Proposition 8.2.3
- [S. Morel, On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/abs/0802.4451v2), §8.2 p. 131 and Proposition 8.2.3 pp. 133–135. Makes the fixed-Levi criterion and its role in geometric vanishing explicit; proper spectral Levi terms survive.

Checks:

- For [F⁺:ℚ]=2 the proper fixed Levi factor Res_F/ℚ GL_1 has a rank-two real split centre and rank-one rational split centre, hence is not cuspidal.
- For F^+ = ℚ, (R_{F/ℚ}𝔾_m)^s × G_{N−2s} ⊂ G_N is a proper cuspidal Levi subgroup (non-example of the hypothesis).
- The lemma is used only with test functions cuspidal at ∞.

### ET.4.19 Central contribution to elliptic stabilization

Target `ET.4/central-elliptic-stabilization` (theorem).

In the same test-function and transfer normalization as ET.4/elliptic-stabilization, the contribution T_e(G;central,f) of rational central elliptic classes equals the sum of ι(G,H) times the complementary stable elliptic terms omitted from Kottwitz 1986 Theorem 9.6. For a proper datum H the complement consists of classes that are not (G,H)-regular; for the quasi-split inner datum it consists of the omitted central classes. This precise complement identity is the additional target needed to pass from Theorem 9.6 to the full T_e formula; it is not asserted proved by that theorem.

Hypotheses and conventions:

- G_der simply connected; local/global transfers and product formula fixed; same real split-centre quotient and central character on both sides.

Proof plan:

- Separate the noncentral classes on G and the (G,H)-regular classes on H exactly as in Kottwitz §9.5–9.6.
- Compute the omitted terms with the centralizer measures, ker¹ and component weights, and prove their complementary identity. A primary proof with these conventions remains the central elliptic gap.
- Add this identity to Theorem 9.6; no regular approximation argument silently inserts the singular central terms.

Direct prerequisites:

- `ET.4/stable-elliptic-distribution`
- `ET.0/global-kottwitz-obstruction`
- `ET.1/transfer-factor-properties`

Sources:

- [R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf), §9.5–9.6 pp. 393–396. The published theorem explicitly removes central classes and restricts the endoscopic classes; this target specifies the missing complement, not a theorem claimed from that source.

Checks:

- For a torus the noncentral sides are zero, so this target carries the full identity.
- Omitting the central term cannot be justified by strong regularity of the transfer relation.
- A zero test function gives zero on each complement.

### ET.4.20 Invariant orbital and character distributions on the twisted coset

Target `ET.4/twisted-invariant-distributions` (construction).

For a characteristic-zero local field k and the component 𝒢θ of 𝒢⋊⟨θ⟩, use the connected group 𝒢 for conjugation and θ-stable parabolic/Levi subsets. For a Levi subset Mθ, construct the twisted weighted orbital distribution J_M(δθ,f) using the component discriminant |det(1−Ad(δ)θ on 𝔤/𝔦_δθ)|^(1/2), connected centralizer quotient measure, and Arthur’s (𝒢,M)-family weight. Construct J_M(π,X,f) from normalized intertwining operators for the corresponding induced θ-stable representation, retaining its chosen extension. Define the maps φ_L from weighted characters and the invariant distributions recursively by I_M^𝒢=J_M^𝒢−Σ_{L⊊𝒢} Ĩ_M^L∘φ_L, in both orbital and spectral variables. Ĩ denotes descent to the invariant character quotient. At M=𝒢 the orbital distribution is the discriminant-normalized twisted orbital integral and the spectral distribution is the ordinary twisted character transform. The geometric test-function transfer uses unnormalized orbital integrals; convert by the displayed discriminant rather than identifying the two normalizations.

Hypotheses and conventions:

- Measures, central character and normalized intertwiner are fixed; π is tempered for the initial spectral transform.
- Functions are in Arthur’s smooth Hecke/almost-compact spaces on the component, K-finite at real places; the quotient is by functions whose twisted character transforms vanish.
- The induction through lower-dimensional Levi subsets uses character support, provided by the separate twisted Paley–Wiener/character-support theorem.

Proof plan:

- Use the component kernel and the same truncation parameter/chambers as AS.6, transporting them to θ-stable parabolics; AS.6 supplies the untwisted machinery and does not assert these coset identities.
- Construct weighted orbital integrals and weighted characters with the component discriminant and global/local intertwiner conventions. Arthur I §§2–3 defines the invariant recursion simultaneously on components.
- Induct on the dimension of proper Levi subsets; character support makes the hatted distributions on the quotient well-defined. Arthur I Corollary 8.3 and Proposition 9.1 give the descent and splitting identities.
- Use the two completions of Arthur II §5: Kottwitz–Rogawski supplies support on characters and Delorme–Mezo the real twisted trace transform. These complete the disconnected induction.

Direct prerequisites:

- `ET.4/base-change-groups`
- `ET.4/twisted-characters`
- `ET.4/twisted-character-support-and-paley-wiener`
- `AutomorphicSpectralTheory:AS.6/weighted-orbital-integral`
- `AutomorphicSpectralTheory:AS.6/invariant-recursion`
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`
- `ET.1/orbital-integral`

Sources:

- [J. Arthur, The invariant trace formula I. Local theory](https://www.claymath.org/library/cw/arthur/pdf/26.pdf), §2 (2.1) pp. 331–332; §3 (3.1) pp. 335–336; Corollary 8.3 and Proposition 9.1. Defines invariantization of the two weighted families for components, with support on characters as an induction hypothesis.
- [R. E. Kottwitz and J. D. Rogawski, The distributions in the invariant trace formula are supported on characters](https://doi.org/10.4153/CJM-2000-034-6), §6 Theorem 1 pp. 810–813. Finishes the character-support input needed to descend through the invariant quotient.

Planning API:

- `TwistedInvariantDistributions` (constructor): Produce the component Hecke space, weighted families, φ_L and the two recursive invariant families with fixed measure/extension data.
- `TwistedInvariantDistributions.linear` (structure): J_M, I_M and φ_L are linear in f.
- `TwistedInvariantDistributions.topLevi` (simp): At the full Levi the proper-Levi sum is empty; the result is the normalized orbital integral or twisted character transform.
- `TwistedInvariantDistributions.recursion` (characterisation): For each proper Levi, I_M=J_M−Σ_{L⊊𝒢}Ĩ_M^L∘φ_L; the hatted maps factor through the twisted character quotient.
- `TwistedInvariantDistributions.conjugation` (relation): I_M is invariant under conjugation by the connected group, with Levi data transported accordingly.
- `TwistedInvariantDistributions.descent` (compatibility): Arthur I Corollary 8.3 transports a semisimple orbital term to the connected centralizer, preserving the component discriminant and quotient measures.
- `TwistedInvariantDistributions.splitting` (compatibility): Arthur I Proposition 9.1 splits a tensor-product term into the local invariant/constant-term terms with its d_M^𝒢 coefficients.
- `TwistedInvariantDistributions.untwisted` (compatibility): The identity automorphism recovers AS.6’s weighted distributions and recursion, not a second untwisted construction.

Uses:

- ET.4/twisted-trace-formula: Supplies the distributions in the coarse/fine coset expansions.
- ET.4/twisted-geometric-side: Splitting and descent isolate the infinity factor and allow the cuspidal-Levi vanishing theorem.

Unit tests:

- `TwistedInvariantDistributions.identity` (compatibility): For θ=1 the orbital discriminant and recursion equal the AS.6 definitions.
- `TwistedInvariantDistributions.fullLevi` (degenerate): For M=𝒢, I_M=J_M; no subtraction is made.
- `TwistedInvariantDistributions.intertwinerSign` (non-example): Replacing A by −A changes the weighted character sign, even though A²=1 in both cases.
- `TwistedInvariantDistributions.torus` (computation): For a torus with θ=1 the discriminant is 1 and the orbital quotient is a point.

Checks:

- For θ=1, the recursion agrees with AS.6, with the same measures and character quotient.
- For M=𝒢 there is no proper-Levi subtraction.
- Multiplying an order-two extension operator by −1 reverses its twisted spectral transform.

### ET.4.21 Kottwitz's stabilization of the elliptic terms

Target `ET.4/elliptic-stabilization` (theorem).

Let G be connected reductive over ℚ with G_der simply connected, f = ∏_v f_v ∈ C_c^∞(G(𝔸)) with f_∞ the Euler–Poincaré (Lefschetz) function of an irreducible algebraic representation ξ (ET.1/pseudocoefficients). Let T_e(f) = Σ_γ |G_γ(ℚ)/I_γ(ℚ)|^{-1} τ(I_γ) O_γ(f) be the elliptic part of the trace formula, the sum over the elliptic semisimple G(ℚ)-conjugacy classes γ with connected centralizer I_γ (Kottwitz 1986 §9.1); since G_der is simply connected the component factor is 1. Grouping the rational classes inside each stable class of the quasi-split inner form G_0 gives T_e(f) = Σ_{γ_0} τ(I_0) Σ_γ O_γ(f), γ over the G(ℚ)-classes in the stable class of γ_0 (Kottwitz 1986 (9.6.1), using τ(I_γ)=τ(I_0)); the adelic classes, the signs e(γ) and the κ-sum enter only in the proof. Then T_e(f) = Σ_{(H,s,η)} ι(G,H) ST^H_e(f^H), the sum over isomorphism classes of elliptic endoscopic triples of G, where f^H = ∏_v f^H_v with f^H_v a transfer of f_v (ET.1/matching-functions, ET.3/local-transfer-existence), f^H_v the unramified image of f_v at almost all v (ET.3/fundamental-lemma-almost-all-places), and f^H_∞ the explicit combination of averaged pseudo-coefficients of ET.1/archimedean-pseudocoefficient-transfer. The ker^1 factors and the κ-sum are those of ET.0/global-kottwitz-obstruction.

Hypotheses and conventions:

- G_der simply connected (achieved by a z-extension otherwise)
- f_∞ stable cuspidal (Euler–Poincaré), so only elliptic terms occur
- transfer factors normalised as a global product equal to 1 on rational pairs (ET.1/transfer-factor-properties)
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.
- Local/global transfer, compatibility and almost-all-place fundamental lemma are supplied by ET.1/ET.3. The simply connected Hasse/Tamagawa inputs of Kottwitz §9.3 are needed for the centralizers.
- The full elliptic identity includes the separate central-elliptic-stabilization target. Without that target, the primary theorem establishes only the noncentral identity.

Proof plan:

- Kottwitz 1986 (9.6.1)–(9.6.4): count rational classes in an adelic stable class via ker¹(I)→ker¹(G), translate the existence condition through the global Kottwitz obstruction and apply finite Fourier inversion in κ.
- Use Lemma 9.7 to identify pairs (stable γ,κ) with elliptic endoscopic data and transferred stable classes. Its existence/uniqueness and automorphism-orbit calculation produce the outer automorphism denominator; they are not a simple bijection before taking these orbits.
- Apply the transfer-factor product formula and local matching; the cohomological exact-sequence calculation in the proof produces the relative τ₁(G)/τ₁(I) coefficients. Use the number-one target to replace relative Tamagawa numbers by absolute ones.
- Theorem 9.6 gives T_e* = Σι ST_e** only: omit central classes on G, use (G,H)-regular classes for proper H, and omit central classes for its quasi-split inner datum. Add the separate complement theorem to obtain the full displayed T_e identity. Its proof remains a recorded gap.

Direct prerequisites:

- `ET.4/stable-elliptic-distribution`
- `ET.0/global-kottwitz-obstruction`
- `ET.1/matching-functions`
- `ET.3/local-transfer-existence`
- `ET.3/fundamental-lemma-almost-all-places`
- `ET.1/archimedean-pseudocoefficient-transfer`
- `ET.1/transfer-factor-properties`
- `ET.4/tamagawa-number-formula`
- `ET.4/central-elliptic-stabilization`
- `ET.0/kottwitz-duality`

Sources:

- [R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf), §9.1 p. 391; §§9.2–9.7 pp. 392–397, especially §9.5 and Theorem 9.6 p. 393, (9.6.1)–(9.6.6) pp. 394–395 and Lemma 9.7 p. 396. Proves the noncentral elliptic identity by the cohomological coefficient and endoscopic orbit calculation. The full central identity is not contained in this theorem.
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.4, p. 36. records that the trace formula for compact quotients is stabilised on the geometric side after Langlands and Kottwitz, especially Kottwitz 1986 Theorem 9.6
- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5.1, Lemma 5.1, pp. 15–16; §7, Lemma 7.1, p. 26. performs the same regrouping by κ and endoscopic triples for the Igusa counting formula

Checks:

- For G anisotropic with only the trivial elliptic endoscopic triple, T_e(f) = ST^G_e(f^G) with f^G = f.
- For G = 𝔾_m every class is stable and the identity is tautological.
- For a unitary similitude group G_N the sum runs over (G_N,1,id) and the (G_{n_1,n_2}, s, η) of ET.0/unitary-elliptic-endoscopic-data.

### ET.4.22 The invariant twisted trace formula for the unitary base-change spaces

Target `ET.4/twisted-trace-formula` (theorem).

On the component 𝒢_n⃗θ of 𝒢_n⃗⋊⟨θ⟩, the invariant global formula equates I_geom(fθ) and I_spec(fθ). Use fixed-central-character functions compact modulo the specified positive real split centre; restrict to 𝒢(𝔸)¹ after the central-character twist, as in Shin §4.5. The geometric expansion is the sum over Levi subsets and rational classes of Arthur’s coefficients times the invariant twisted orbital distributions; the spectral expansion is the sum over discrete inducing data and intertwiner terms of the invariant twisted character distributions. The precise distributions are ET.4/twisted-invariant-distributions. The spectral expansion is Arthur II Theorem 4.4, a sum over t ≥ 0 taken in increasing order of t, with the convergence estimate of Arthur II §6, Corollary 6.5; no absolute convergence of the double sum is asserted. Splitting and descent are part of the same component theory.

Hypotheses and conventions:

- 𝒢^+_n⃗ is a non-connected group whose coset 𝒢θ is defined by an automorphism θ of order 2 preserving a ℚ-splitting; f has the stated central character.
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

Proof plan:

- Use Arthur II Theorems 3.3 and 4.4 for the fine geometric/spectral expansions of the component kernel, with invariant recursion from ET.4/twisted-invariant-distributions. AS.6 supplies the connected kernel/truncation interface, not the twisted theorem.
- Arthur’s original §1 scope restriction is removed by the separate Kottwitz–Rogawski character-support and Delorme–Mezo Paley–Wiener inputs. Record their approximation and real harmonic-analysis proof inputs explicitly.
- Apply Arthur II Theorem 4.4 with its ordering in t and the estimate of Corollary 6.5, and restrict the central character. Transfer of central characters uses the base-change split-centre map; it does not require simultaneously imposing trivial and ξ-central characters on the same function.

Direct prerequisites:

- `ET.4/twisted-invariant-distributions`
- `ET.4/twisted-character-support-and-paley-wiener`
- `ET.4/base-change-groups`
- `AutomorphicSpectralTheory:AS.6/coarse-trace-identity`
- `AutomorphicSpectralTheory:AS.6/fine-geometric-expansion`
- `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, (5.5.1), p. 72. states the invariant twisted trace formula I_geom = I_spec for the coset 𝒢_n⃗θ, citing Arthur 1988
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, p. 26. notes that Arthur's twisted trace formula is unconditional by Kottwitz–Rogawski and Delorme–Mezo, and uses it for unitary base change
- [J. Arthur, The invariant trace formula II. Global theory](https://www.claymath.org/library/cw/arthur/pdf/27.pdf), §1 p. 505; Theorem 3.3 p. 512; Theorem 4.4 pp. 520–521; §6 Corollary 6.5 p. 537. The component expansions (Theorems 3.3 and 4.4) and the convergence estimate of §6 are the primary formula; the scope restriction of §1 is completed by the two named theorems.

Checks:

- For θ trivial (no twist) the statement reduces to AutomorphicSpectralTheory:AS.6/invariant-trace-formula.
- If 𝒢θ(ℚ)\𝒢(𝔸)^1 were compact the formula would reduce to the twisted Selberg trace formula.
- For f cuspidal at ∞ with [F^+:ℚ] ≥ 2, the geometric side reduces to elliptic terms (ET.4/twisted-geometric-side).

### ET.4.23 The archimedean invariant vanishing and character identity

Target `ET.4/archimedean-invariant-vanishing` (theorem).

In Morel’s base-change component for a quasi-split cuspidal fixed group H with simply connected derived subgroup, let f∞ be a twisted pseudo-coefficient of the θ-discrete representation with parameter φ|W_ℂ, for the discrete-series packet associated with a regular algebraic coefficient of H. After splitting, a term for M can survive only when A_M=A_M,ℝ. For such M, I_M^𝒢(γ,f∞)=0 if the associated fixed Levi M_H is not cuspidal. If it is cuspidal, I_M^𝒢(γ,f∞)=|D^M(γ)|^(1/2) Φ_M^𝒢(γ,f∞), where the discriminant uses the semisimple part of γθ and Φ is the θ-discrete packet character expression of Morel §8.2. It is zero on non-θ-semisimple γ. These identities yield Morel Proposition 8.2.3; its spectral coefficients still incorporate discrete data from proper Levi subsets.

Hypotheses and conventions:

- Use Morel’s hypotheses and central-character spaces; no claim for an arbitrary disconnected reductive group or arbitrary infinity function.
- Real θ-discrete character growth and boundary identities, and connected centralizer unipotent limits, are needed; precise unread underlying proofs are a gap.

Proof plan:

- Apply Arthur I Proposition 9.1 and Corollary 9.2 to isolate the infinity factor and force equality of rational and real split centres.
- For a noncuspidal associated fixed Levi, Morel Lemma 8.2.6 first descends a regular element to a proper real Levi and uses cuspidality. Local centralizer orbital integrals and their regular density extend zero to singular and unipotent elements.
- For a cuspidal M, prove the regular character identity by induction on M using the differential equations, growth estimate and boundary relations for θ-discrete characters; the full-group case is Morel Lemma 8.1.10.
- Use Morel Lemma 8.2.5 and connected-centralizer unipotent orbital limits to extend from regular semisimple elements. Substitute in the split geometric expansion. The separate global no-proper-cuspidal theorem then removes the proper geometric terms when [F⁺:ℚ]>1.

Direct prerequisites:

- `ET.4/twisted-invariant-distributions`
- `ET.4/archimedean-lefschetz-functions`
- `ET.4/cuspidal-levi-subsets`
- `ET.1/real-transfer`
- `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`

Sources:

- [S. Morel, On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/abs/0802.4451v2), §8.2 Proposition 8.2.3 and proof pp. 133–135; Lemmas 8.2.5/8.2.6 pp. 135–136; Lemma 8.1.10 p. 130. Gives the component invariant vanishing proof and corrects the spectral expansion by retaining the proper-Levi discrete data.

Checks:

- For the full component the fixed Levi is H, which is cuspidal; testing cuspidality on complex GL_n would incorrectly erase this term.
- A noncuspidal fixed Levi gives zero even at a singular semisimple element, not merely on the regular set.
- At degree one a proper cuspidal fixed Levi may survive; infinity cuspidality alone does not imply the simple geometric identity.

### ET.4.24 The simple twisted geometric side equals a stable elliptic sum

Target `ET.4/twisted-geometric-side` (theorem).

Assume [F^+:ℚ] ≥ 2. Let φ^n⃗ = (φ^n⃗)^S φ^n⃗_{S_f} φ_{G_n⃗,ξ} ∈ C_c^∞(G_n⃗(𝔸)) and f^n⃗ = (f^n⃗)^S f^n⃗_{S_f} f_{𝒢_n⃗,Ξ} ∈ C_c^∞(𝒢_n⃗(𝔸)) with (φ^n⃗)^S and φ^n⃗_{S_f} BC-transfers of (f^n⃗)^S and f^n⃗_{S_f} (ET.4/unramified-transfers, ET.4/base-change-transfer-of-functions) and the archimedean functions of ET.4/archimedean-lefschetz-functions. Then I^{𝒢_n⃗θ}_geom(f^n⃗θ) = Σ_γ SO^{G_n⃗(𝔸)}_γ(φ^n⃗) = τ(G_n⃗)^{-1} ST^{G_n⃗}_e(φ^n⃗), the middle sum over ℚ-elliptic semisimple stable conjugacy classes of G_n⃗(ℚ); equivalently the geometric side is the sum over θ-elliptic θ-conjugacy classes δ of 𝒢_n⃗(ℚ) of vol(I_{δθ}(ℚ)A_{𝒢θ}\I_{δθ}(𝔸)) O_{δθ}(f^n⃗).

Hypotheses and conventions:

- [F^+ : ℚ] ≥ 2 (used through ET.4/no-proper-cuspidal-subsets)
- f^n⃗ cuspidal at ∞ (the Lefschetz function)
- BC-matching at every finite place
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

Proof plan:

- Apply ET.4/archimedean-invariant-vanishing (Morel Proposition 8.2.3 and Lemmas 8.2.5/8.2.6). The fixed-Levi definition of cuspidality and [F⁺:ℚ]>1 leave only the full geometric term; no second finite cuspidal place is required.
- Clozel–Labesse’s corrected singular-centralizer orbital formula and the real norm matching give the elliptic semisimple expression. Use the same quotient measures and transported central character; a regular-only orbital formula would not justify the singular sum.
- Shin Proposition 4.5 and Corollary 4.7: T_el=J(Zθ) I_geom and T_el=(τ(𝒢)J(Zθ)/(τ(G)d(G,𝒢)))ST_e. Here τ(𝒢)=1 and d(G,𝒢)=1 because H¹(ℝ,𝒢)=0. Cancel J(Zθ) to obtain I_geom=τ(G)⁻¹ST_e. The intermediate central-volume factor is not silently set to one.

Direct prerequisites:

- `ET.4/twisted-trace-formula`
- `ET.4/no-proper-cuspidal-subsets`
- `ET.4/archimedean-lefschetz-functions`
- `ET.4/unramified-transfers`
- `ET.4/base-change-transfer-of-functions`
- `ET.4/stable-elliptic-distribution`
- `ET.4/tamagawa-number-formula`
- `ET.4/archimedean-invariant-vanishing`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Proposition 5.5.1 and proof, pp. 72–74. proves the identity of the twisted geometric side with the stable elliptic sum, explaining the role of cuspidal subsets and replacing the second cuspidal place by [F^+:ℚ] ≥ 2
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, Proposition 4.5 and Corollary 4.7, p. 27. proves the same identity in the compact case, citing Labesse's Théorème 4.3.4
- [J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 4.3.2 and Théorème 4.3.4 (§4.3). rewrites the θ-elliptic part of the twisted trace formula as a sum of stable orbital integrals of matching functions
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Proposition 5.3.1, p. 737. records the same proposition for the compact unitary groups of arbitrary rank
- [S. Morel, On the cohomology of certain non-compact Shimura varieties](https://arxiv.org/abs/0802.4451v2), Proposition 8.2.3 pp. 133–135 and Lemma 8.2.6 p. 136. The primary proper-geometric-Levi vanishing proof.
- [L. Clozel and J.-P. Labesse, Orbital integrals and distributions](https://www.claymath.org/library/proceedings/cmip013c.pdf), Theorems 4.1/5.1 pp. 113–114. The corrected singular stable orbital formula needed at infinity.

Checks:

- For n⃗ = (1) the identity reduces to a statement about the elliptic part of the twisted trace formula of a torus.
- Dropping [F^+:ℚ] ≥ 2 (F imaginary quadratic) makes the identity false in general: extra cuspidal-Levi terms appear (Caraiani–Scholze non-compact Remark 5.5.4).
- Both sides vanish when f^n⃗_v = 0 at one place.

### ET.4.25 Irreducibility of unitary parabolic induction for GL_n

Target `ET.4/unitary-induction-irreducibility` (theorem).

Let F be a non-archimedean local field of characteristic 0 and π_1, …, π_m irreducible unitary smooth representations of GL_{n_1}(F), …, GL_{n_m}(F). Then the normalized parabolic induction π_1 × ⋯ × π_m from the standard parabolic subgroup with Levi GL_{n_1} × ⋯ × GL_{n_m} is an irreducible unitary representation of GL_n(F), n = n_1 + ⋯ + n_m (Bernstein). Consequently, for unitary π_i and purely imaginary exponents s, the normalized intertwining operators N(σ,π,s) between π_1[s_1] × ⋯ × π_m[s_m] and its permutations are holomorphic at s and are isomorphisms. The same statements over ℝ and ℂ are the archimedean input requested from AutomorphicFormsOnReductiveGroups:AF.1.

Hypotheses and conventions:

- F non-archimedean of characteristic 0; induction normalized by δ_P^{1/2}.
- Each π_i is unitary, not merely of unitary central character; the exponents s_i are purely imaginary.

Proof plan:

- Bernstein’s theorem, stated as Tadić 1986 Theorem 2.5(i) p. 346 with attribution to Bernstein (P-invariant distributions on GL(N), §0.2), gives irreducibility and unitarity of π_1 × π_2 for irreducible unitary π_1, π_2; induction in stages gives the m-fold product.
- Unitarity of the induced representation is the induced inner product on the normalized induction of SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction.
- Mœglin–Waldspurger §I.1.1(3) pp. 607–608: at purely imaginary exponents the normalized operators are holomorphic, and irreducibility of the unitary induced representation makes the nonzero operator N(σ,π,s) an isomorphism.
- Bernstein’s primary proof is in Lecture Notes in Mathematics 1041 (1984) and was not read; it is recorded in the residual-spectrum and unitary-induction gap.

Direct prerequisites:

- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`
- `AutomorphicFormsOnReductiveGroups:AF.1`

Sources:

- [M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), §2.5, Theorem (J. N. Bernstein) (i), p. 346. Records Bernstein’s theorem that the product of two irreducible unitarizable representations of general linear groups over a non-archimedean field is irreducible and unitarizable.
- [C. Mœglin and J.-L. Waldspurger, Le spectre résiduel de GL(n)](https://www.numdam.org/item/ASENS_1989_4_22_4_605_0.pdf), §I.1.1, property (3) and its proof, pp. 607–608. For unitary inducing data and purely imaginary exponents the normalized intertwining operators are holomorphic isomorphisms; the proof uses irreducibility of unitary induction, citing Bernstein §0.2 and Vogan.
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, before Proposition 4.8, p. 28. Uses irreducibility of the normalized induction of a unitary discrete Π_M, citing Mœglin–Waldspurger p. 607 (3), so that the global intertwiner M_{Q|Q_s}(0) is an isomorphism.

Checks:

- For GL_2 and unitary characters χ_1, χ_2 of F^×, the principal series χ_1 × χ_2 is irreducible.
- Non-example: |·|^{1/2} × |·|^{−1/2} is reducible, with the trivial character and the Steinberg representation as constituents; its inducing characters are not unitary, so the hypothesis cannot be weakened to unitary central character.
- For m = 1 the statement is the irreducibility and unitarity of π_1 itself.

### ET.4.26 The spectral side of the simple twisted trace formula

Target `ET.4/twisted-spectral-side` (theorem).

With f^n⃗ as in ET.4/twisted-geometric-side, I^{𝒢_n⃗θ}_spec(f^n⃗θ) = Σ_M |W_M| |W_{𝒢_n⃗}|^{-1} |det(Φ_n⃗^{-1}θ − 1)_{𝔞^{𝒢θ}_M}|^{-1} Σ_{Π_M} tr(n-Ind^{𝒢_n⃗}_Q(Π_M)_ξ(f^n⃗) ∘ A′), where M runs over Levi subgroups of 𝒢_n⃗ containing a fixed minimal Levi M_0, W_M and W_{𝒢_n⃗} are Weyl groups relative to M_0 (the denominator is the Weyl group of 𝒢_n⃗, Caraiani–Scholze 2017 erratum E71), Φ_n⃗^{-1}θ acts as −1 on 𝔞^{𝒢θ}_M so the determinant is non-zero, Q is a parabolic with Levi M, Π_M runs over the irreducible Φ_n⃗^{-1}θ-stable subrepresentations of the relatively discrete spectrum R_{M,disc} (each occurring with multiplicity one by multiplicity one for general linear groups), the subscript ξ is the twist by the character of A^0_{𝒢,∞} determined by ξ, and A′ is the normalised intertwining operator on n-Ind(Π_M)_ξ composed with θ (Shin 2011 §4.5). Each n-Ind(Π_M)_ξ is a θ-stable isobaric irreducible automorphic representation, and its archimedean component is cohomological for Ξ when its trace against f_{𝒢,Ξ} is non-zero. The quotient 𝔞_M^{𝒢θ} is by the θ-fixed full-group split space, not by the full split space. Thus even M=𝒢 can have nonzero anti-invariant dimension r, and the coefficient is 2^(−r), not automatically one. The inducing data include residual Speh representations. A′ is the global normalized intertwiner M_Q|Qs(0)ρ_Q(s,0,θ;Π_M) of Shin Lemma 4.11, with the ξ central twist; choosing an arbitrary order-two extension does not reproduce its trace sign.

Hypotheses and conventions:

- f^n⃗_∞ a twisted Lefschetz function; the discrete spectrum of the general linear Levi M as described by Mœglin–Waldspurger.

Proof plan:

- Shin Proposition 4.8: start with Arthur’s spectral expansion and its chosen parameter ordering. The infinity infinitesimal character eliminates the additional Weyl terms; the surviving involution acts by −1 on the indicated quotient, giving determinant 2^dim.
- Shin Lemma 4.11 and Corollary 4.14: use the global functional equation and normalized intertwiner to fix A′ and its square; the ξ twist restricts to 𝒢(𝔸)¹. Proper spectral Levi terms remain.
- Use the number-field residual classification for GL_n, including multiplicity one for discrete Speh data. Mœglin–Waldspurger §I.1.1(3) gives irreducibility of unitary induction and holomorphic invertible normalized operators at the unitary point; its proof invokes Bernstein’s non-archimedean theorem (ET.4/unitary-induction-irreducibility) and the archimedean case requested from AF.1. Nonzero Lefschetz trace forces the required cohomological infinity component.

Direct prerequisites:

- `ET.4/twisted-trace-formula`
- `ET.4/archimedean-lefschetz-functions`
- `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`
- `ET.4/twisted-characters`
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`
- `AutomorphicSpectralTheory:AS.4`
- `AutomorphicFormsOnReductiveGroups:AF.1`
- `ET.4/unitary-induction-irreducibility`

Sources:

- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, Proposition 4.8 and Corollary 4.14, pp. 28–30. computes the spectral side of the twisted trace formula for a Lefschetz test function as a sum over θ-stable discrete data with normalised intertwiners
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Proposition 5.3.3 and Remark 5.3.4, p. 738. records the same expansion and explains the twist by ξ and the normalised intertwiner
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.6, proof of Lemma 5.6.2, pp. 75–76. uses the expansion and the isobaricity of n-Ind(Π_M)_ξ
- [C. Mœglin and J.-L. Waldspurger, Le spectre résiduel de GL(n)](https://www.numdam.org/item/ASENS_1989_4_22_4_605_0.pdf), §I.1.1(3) and proof pp. 607–608. Unitary induction irreducibility and holomorphy/invertibility; includes residual discrete data and references the needed underlying real/p-adic input.

Checks:

- For a full Levi with anti-invariant dimension r, the term is 2^(−r) tr(Π(f)A′), including residual Speh Π; for a single GL block r=1 its determinant coefficient is 1/2.
- The coefficient |det(Φ^{-1}θ − 1)|^{-1} equals 1 when 𝔞^{𝒢θ}_M = 0.
- Non-θ-stable discrete Π_M contribute zero.
- A proper spectral Levi can contribute even when every proper geometric Levi term is zero; the two expansions have different indexing data.

### ET.4.27 The simple trace formula for division-algebra unitary groups

Target `ET.4/simple-division-algebra-trace-identity` (theorem).

Let F = F_0K be a CM field with F_0 totally real of even degree over ℚ and K imaginary quadratic, D a central division algebra over F of dimension n² with an involution * of the second kind, and G the unitary similitude group of (D, *) chosen as in Scholze's Lemma 8.1: signature (1, n−1) at one infinite place of F_0 and (0, n) at the others, G_{ℚ_p} ≅ GL_n(F_w) × (D′)^× × ℚ_p^× at a prime p split in K. Then G(ℚ)\G(𝔸)/A_G is compact, with the division-place test-function restriction the stabilised elliptic sum reduces to the term of G itself, and for test functions with a component at a place where D is a division algebra (as used by Kottwitz and Scholze), the contributions of the proper elliptic endoscopic groups vanish; for f = f^∞ f_∞ with f_∞ Kottwitz's Euler–Poincaré function of ξ, the elliptic part of the trace formula equals Σ_π m(π) tr(π_f(f^∞)) tr(π_∞(f_∞)), where π runs over automorphic representations of G. Further, π_f contributes to the ξ-cohomology only if π_∞ is cohomological, and the global Jacquet–Langlands correspondence relates such π (with the stated local conditions on D) to cuspidal or residual automorphic representations of GL_n over F.

Hypotheses and conventions:

- D a division algebra (the ramification hypothesis of Scholze Remark 8.3 needed for the global Jacquet–Langlands step)
- [F_0:ℚ] even (needed for the existence of D, *, and for base change)
- p split in K
- D splits away from the pair x,xᶜ over x₀, with local division-algebra data of Scholze §8 Lemma 8.1; the distinguished place w used for cohomology is different from x,xᶜ. Proper-endoscopy vanishing uses the division-place component, not anisotropy alone.

Proof plan:

- Existence of (D,*,h_0) with the signatures: Scholze Lemma 8.1 (Kottwitz 1992; Harris–Taylor §I.7).
- Compactness: D is a division algebra, so G is anisotropic modulo centre and AutomorphicSpectralTheory:AS.6/compact-trace-specialization applies.
- Vanishing of proper endoscopic contributions and the identity of the elliptic part with the spectral side: Kottwitz's argument for simple Shimura varieties (Kottwitz 1992, Invent. Math. 108), used by Scholze §§9–10 (Corollary 10.1); recorded with ET.4/elliptic-stabilization in the case of the trivial triple.
- The global Jacquet–Langlands step is cited by Scholze through Harris–Taylor and Clozel's base change, ET.4/unitary-gl-base-change-descent.

Direct prerequisites:

- `AutomorphicSpectralTheory:AS.6/compact-trace-specialization`
- `ET.4/elliptic-stabilization`
- `ET.1/pseudocoefficients`
- `PELModuli:M0/similitude-group`
- `PELModuli:M5/unitary-pel-datum`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8, Lemma 8.1 and Remarks 8.2–8.3, p. 19. constructs the division algebra, involution and h_0 with the stated signatures and explains why a ramification hypothesis on D is needed for the global Jacquet–Langlands correspondence
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10, Corollary 10.1, p. 26. uses Kottwitz's results that π_f occurring in the ξ-cohomology has cohomological archimedean component, with the trace identity from the simple trace formula
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.4, p. 36. describes the stabilised trace formula for compact quotients after Kottwitz 1986 Theorem 9.6

Checks:

- For n = 1 G is a torus and the identity is the Poisson-type formula for the compact torus quotient.
- Replacing D by a split algebra leaves the scope of this construction; no assertion that every split-algebra unitary quotient is noncompact is made.
- For f_∞ the Euler–Poincaré function, non-cohomological π_∞ contribute zero.

### ET.4.28 Global cyclic base change for GL_n (Arthur–Clozel) ★

Target `ET.4/global-cyclic-base-change` (theorem). Planet: Global cyclic base change.

Let E/F be a cyclic extension of number fields of prime degree ℓ with Gal(E/F) = ⟨σ⟩ and ω the character of 𝔸_F^×/F^× N(𝔸_E^×) of class field theory. An automorphic representation of GL_n is induced from cuspidal if it is ind(σ_M ⊗ 1) for a cuspidal unitary representation σ_M of a Levi M(𝔸). A σ-stable Π of GL_n(𝔸_E) is a weak lift of π if Π_w is the unramified lift of π_v at almost all places, and a strong lift if Π_w is the local lift of π_v (ET.4/local-cyclic-base-change) at every place. Then (all representations induced from cuspidal): (a) if π is cuspidal and π ≇ π⊗ω, there is a unique σ-stable Π lifting π, and Π is cuspidal; (b) if π is cuspidal and π ≅ π⊗ω, then ℓ divides n and Π is the isobaric sum of the ℓ distinct conjugates of a cuspidal representation of GL_{n/ℓ}(𝔸_E); (c) every σ-stable cuspidal Π is the lift of some cuspidal π, unique up to twisting by powers of ω; (d) a weak lift is a strong lift; (e) ω_Π = ω_π ∘ N_{E/F}, and the lift is independent of the choice of σ; (f) two cuspidal π, π′ with the same lift differ by a power of ω. At a real place becoming complex, rec(Π_w)=rec(π_v)|W_ℂ in the AF.1 archimedean normalization; for n=1 this is χ↦χ∘N_ℂ/ℝ, with N(z)=|z|². Apply the same normalization to contragredients and algebraic central twists.

Hypotheses and conventions:

- E/F cyclic of prime degree ℓ, number fields
- representations induced from cuspidal (unitary cuspidal data)
- Every place includes archimedean places. Use AF.1/archimedean-llc-gln: at ℝ→ℂ restrict the W_ℝ-parameter to W_ℂ; at a split complex place use the identical parameter. This is the existing archimedean dictionary, not the nonarchimedean cyclic theorem.

Proof plan:

- Compare the twisted trace formula for GL_n(E) ⋊ ⟨σ⟩ with the trace formula of GL_n(F) through the matching of functions (ET.3/base-change-fundamental-lemma-and-transfer) and the term-by-term comparison of AC Ch. 2 (Theorems A and B).
- Separate eigencharacters with the strong multiplicity one theorem and the Jacquet–Shalika results (AC Ch. 3 §2) to obtain weak lifting (AC Ch. 3 Theorem 4.2, p. 203) and the fibres (Theorem 3.1, p. 201).
- Strong lifting from weak lifting and the local theory (AC Ch. 3 Theorem 5.1, p. 213); central characters and independence of σ (Proposition 4.4, p. 211).

Direct prerequisites:

- `ET.4/local-cyclic-base-change`
- `ET.4/twisted-trace-formula`
- `ET.3/base-change-fundamental-lemma-and-transfer`
- `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`

Sources:

- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 3 Definitions 1.1–1.2 p. 199, Theorem 3.1 p. 201, Definition 4.1 and Theorem 4.2 pp. 202–203, Proposition 4.4 pp. 210–211, Theorem 5.1 pp. 212–213. defines weak and strong lifts and induced-from-cuspidal representations, proves weak lifting, its fibres, central characters, and that weak lifts are strong
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, p. 31; §13, pp. 32–35. uses cyclic base change to reduce supercuspidal representations to cases that become non-supercuspidal after finitely many prime-degree cyclic base changes

Checks:

- For n = 1, the lift of a Hecke character χ is χ ∘ N_{𝔸_E/𝔸_F}.
- For n = ℓ = 2 and π the automorphic induction of a Hecke character of E, π ≅ π⊗ω and the lift is the isobaric sum χ ⊞ χ^σ.
- A cuspidal π whose base change is cuspidal is not a twist-invariant (non-example to (b)).
- For χ(x)=sgn(x)^ε|x|^t at a real place, its complex base change is |z|^(2t), independently of ε; restriction forgets the sign character.

### ET.4.29 Stable–twisted identity for unitary similitude groups ★

Target `ET.4/stable-twisted-identity` (theorem). Planet: Stable–twisted identity for unitary groups.

Assume [F^+:ℚ] ≥ 2. For every vector n⃗ and every pair of BC-matching functions φ^n⃗ ∈ C_c^∞(G_n⃗(𝔸)), f^n⃗ ∈ C_c^∞(𝒢_n⃗(𝔸)) as in ET.4/twisted-geometric-side (unramified outside S, small level at S_pf as in ET.4/small-level-transfer, any function at split primes, Euler–Poincaré and Lefschetz functions at ∞), ST^{G_n⃗}_e(φ^n⃗) = τ(G_n⃗) I^{𝒢_n⃗θ}_spec(f^n⃗θ), with the spectral side expanded as in ET.4/twisted-spectral-side. Combined with ET.4/elliptic-stabilization, for G an inner form of G_N with G(𝔸_f) ≅ G_N(𝔸_f) and any f on G(𝔸) with Euler–Poincaré f_∞, T_e^G(f) = Σ_{G_n⃗ ∈ E^ell(G)} ι(G,G_n⃗) τ(G_n⃗) I^{𝒢_n⃗θ}_spec(f^n⃗θ), where for each n⃗ the function f^n⃗ is chosen BC-matching with the transfer f^{G_n⃗}. This holds for every rank N and both parities (with the pairs excluded by Kottwitz's condition 7.4.3 omitted) and for G_ℝ of arbitrary signature.

Hypotheses and conventions:

- [F^+:ℚ] ≥ 2
- the transfers f^{G_n⃗} exist as BC-transfers at every place (ET.4/base-change-transfer-of-functions, ET.4/small-level-transfer)
- Euler–Poincaré function at ∞
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

Proof plan:

- Combine ET.4/twisted-geometric-side with the twisted trace formula I_geom = I_spec (ET.4/twisted-trace-formula).
- Insert into the elliptic stabilization ET.4/elliptic-stabilization; the factors ι(G,G_n⃗)τ(G_n⃗) = τ(G)|Out|^{-1} and the factor ½ for n_1 = n_2 come from |Out(G_{n,n})| = 2 (ET.4/stable-elliptic-distribution).
- The widening to every rank, both parities and arbitrary signature is Caraiani–Scholze 2017 §5.2–5.3; the non-compact case with level N_0 is Caraiani–Scholze non-compact §§5.4–5.6.

Direct prerequisites:

- `ET.4/twisted-geometric-side`
- `ET.4/twisted-spectral-side`
- `ET.4/elliptic-stabilization`
- `ET.4/small-level-transfer`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §§5.5–5.6, Proposition 5.5.1 and Theorem 5.6.1, pp. 72–75. combines the twisted simplification with the stable trace formula and the explicit test functions; the coefficient ε_n⃗ = ½ for n⃗ = (n,n)
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Theorem 5.3.2 and Proposition 5.3.3, pp. 737–738. states the same combination for compact unitary groups of arbitrary rank and signature
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 4.7, p. 27. proves the geometric identity used here

Checks:

- For N = 1 the identity is the base-change identity for the torus G_1.
- For n_1 = n_2 = N/2 the coefficient carries the factor ½ seen as ε_n⃗ in Caraiani–Scholze non-compact Theorem 5.6.1.
- The identity fails for F^+ = ℚ (Remark 5.5.4).

### ET.4.30 Cyclic automorphic induction for GL_n (Arthur–Clozel) ★

Target `ET.4/cyclic-automorphic-induction` (theorem). Planet: Cyclic automorphic induction.

Let E/F be a cyclic extension of number fields of degree ℓ (prime or not) and π_E an automorphic representation of GL_m(𝔸_E) induced from cuspidal. Say that an automorphic representation π_F of GL_{mℓ}(𝔸_F) is automorphically induced from π_E if at almost all places v unramified in E, the Satake parameter of π_{F,v} is the induction of those of π_{E,w}: at v split in E it is the direct sum over w | v, and at an arbitrary unramified v it is ⊕_{w|v} Ind_{W_{E_w}}^{W_{F_v}}. Then there exists one and only one such π_F, and π_F is induced from cuspidal. For ℓ prime and π_E cuspidal, π_F is cuspidal iff π_E is not isomorphic to its Galois conjugate π_E^σ; the induction is transitive along towers of cyclic extensions; and its base change to E is the isobaric sum of the Galois conjugates of π_E.

Hypotheses and conventions:

- E/F cyclic; π_E induced from cuspidal

Proof plan:

- Use prime-degree cyclic base change and its cuspidal fibres to construct induction as in AC Ch. 3 §6, Theorem 6.2 p. 215; iterate along a cyclic tower. Verify the unramified induced Satake parameter at every splitting type, then apply strong multiplicity one and Rankin–Selberg pole counting. This proof does not introduce an additional unplanned character-twisted trace formula.
- Uniqueness from strong multiplicity one; cuspidality criterion from the Rankin–Selberg pole count (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles) and ET.4/global-cyclic-base-change (AC Ch. 3 Theorem 6.2, p. 215, and Corollary 6.5, p. 218, proof to p. 219).

Direct prerequisites:

- `ET.4/global-cyclic-base-change`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`

Sources:

- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 3 Definition 6.1 and Theorem 6.2 p. 215; Corollary 6.5 p. 218. defines automorphic induction by matching Hecke eigenvalues, proves existence and uniqueness for cyclic extensions and identifies the cuspidal case
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §14, p. 35. uses automorphic induction of Hecke characters along cyclic towers in the globalisation for L- and ε-factors

Checks:

- For m = 1 and ℓ = 2, the induction of a Hecke character χ of E is the classical automorphic induction (theta series) to GL_2(𝔸_F).
- The induction of the trivial character of 𝔸_E^× is the isobaric sum of the characters of 𝔸_F^×/F^×N(𝔸_E^×).
- If π_E ≅ π_E^σ the induction is not cuspidal.

### ET.4.31 Base change and descent between unitary groups and GL_n over CM fields

Target `ET.4/unitary-gl-base-change-descent` (theorem).

For exactly the division-algebra unitary similitude datum of Scholze §8 (totally real F₀ of even degree, F=F₀K, D split away from x,xᶜ and the signatures of Lemma 8.1), let Π be cuspidal, conjugate self-dual, regular algebraic on GL_n(𝔸_F), with Π_x essentially square-integrable. Scholze Theorem 10.5 gives an algebraic Hecke character ψ of K and π_f occurring in ξ-cohomology such that at every rational prime p′ split in K and every w′|p′ different from x,xᶜ the GL_n-factor of π_{p′} is Π_{w′}, while its similitude GL₁-factor is ψ_{u′}. One may arrange ψ unramified at a prescribed such p′. At a split place the entire pair consisting of the GL₁ multiplier character and all GL_n-factors determines the local similitude representation. Broader quasi-split base change and converse descent are not established by this source and remain a separate gap.

Hypotheses and conventions:

- F_0 totally real of even degree in the division-algebra case; p and the descent place split in K
- Π cuspidal, conjugate self-dual, regular algebraic, with a square-integrable component

Proof plan:

- Apply Scholze §10 Theorem 10.5 p. 27 with all hypotheses of §8 pp. 19–20. Its proof cites Harris–Taylor VI.2.10; those internal proofs remain a source-access gap.
- Keep the similitude character ψ: equality of the GL_n-factor alone is not injective on representations of GL₁×GL_n.
- Shin 2011 Corollaries 6.5 and 6.7 concern cohomology and Hodge data and do not state this base change or descent.

Direct prerequisites:

- `ET.4/stable-twisted-identity`
- `ET.4/simple-division-algebra-trace-identity`
- `ET.4/base-change-transfer-of-functions`
- `ET.4/global-cyclic-base-change`
- `ET.3/inner-form-transfer`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8 Lemma 8.1 and Remark 8.3 pp. 19–20; §10 Theorem 10.5 p. 27. supplies the restricted division-data descent used in the construction, with the GL₁ character and specified split local components

Checks:

- At a split place distinguish ψ_{u′} on GL₁ from Π_{w′} on GL_n; omitting ψ loses injectivity.
- A Π with no square-integrable component at x is outside Theorem 10.5.
- The rank-one U(1) map z↦z/z̄ is not the whole similitude-group construction.

### ET.4.32 Endoscopic classification of unitary groups for generic parameters

Target `ET.4/unitary-endoscopic-classification` (theorem).

Let U be a pure inner form of a unitary group for a CM extension F/F⁺, with its inner twist and local normalization fixed. For a generic global parameter ψ=⊞_i Π_i, with distinct cuspidal conjugate self-dual constituents of the prescribed parity and total rank N, KMSW Theorem* 1.7.1 supplies the ψ-part of the discrete spectrum: it is the direct sum of global packet members whose product pairing restricted to S_ψ equals ε_ψ, with multiplicity one, and ε_ψ=1 for generic ψ. This is the generic pure-inner case that KMSW v1 prove, taking Mok’s quasi-split classification and the weighted fundamental lemma as inputs (Introduction p. 6), not the full nongeneric assertion. Tempered local parameters have the relevant packets and inner-twist pairings of Theorem* 1.6.1; general localizations of a generic global parameter require the extended packet construction and are not asserted tempered. In particular, unitary local base change is defined by the unitary L-embedding and twisted endoscopy, not by cyclic GL_n base change.

Hypotheses and conventions:

- Generic global parameter and pure inner twist; do not include the nongeneric or arbitrary-inner assertion beyond the scope proved in KMSW v1 pp. 88–89.
- Local pairings depend on the chosen extended pure inner twist; at real places the component-character bijection uses the union over the pure inner forms specified in Theorem* 1.6.1(5).

Proof plan:

- Use KMSW §1.7.1 pp. 88–89 for the generic pure-inner multiplicity statement and ε_ψ=1; the paper explicitly distinguishes the case it proves, relative to its stated inputs, from the announced general theorem.
- Use ET.4/tempered-unitary-local-packets for the bounded Levi parameters, and ET.4/extended-unitary-local-packets (KMSW §1.6.4 pp. 86–87) for non-tempered localizations. This supplies the missing construction at target level. The full stabilization and local intertwining primary proof inputs remain the explicit classification gap.
- Liu–Tian–Xiao–Zhang–Zhu Proposition C.3.1 p. 363 gives only the relevant cuspidal cohomological specialization, and cannot replace that broader packet construction.

Direct prerequisites:

- `ET.4/stable-twisted-identity`
- `ET.4/elliptic-stabilization`
- `ET.3/twisted-fundamental-lemma-and-transfer`
- `ET.4/extended-unitary-local-packets`

Sources:

- [Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Appendix C.3, Proposition C.3.1. uses the generic case of the endoscopic classification of Mok and Kaletha–Mínguez–Shin–White for multiplicity one and the definite–indefinite switches
- [G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.6, p. 8. records that Arthur's missing references are now supplied by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, leaving the twisted weighted fundamental lemma as the only unproved input
- [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White, Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.1 Theorem* 1.6.1 pp. 79–80; §1.7.1 Theorem* 1.7.1 and Remark 1.7.2 pp. 88–89. states the local packet pairing, the generic pure-inner global multiplicity formula and the part of it the paper proves relative to Mok’s theorems and the weighted fundamental lemma
- [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White, Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.4 pp. 86–87. The positive-exponent induced-packet construction, needed when a generic global parameter is non-tempered locally.

Checks:

- For N = 1 the classification is the description of automorphic characters of U(1) through base change.
- At a place split in F, U(F^+_v) ≅ GL_N(F_v) and the packet is a singleton given by ψ_v.
- For a simple generic global parameter, the allowed packet members satisfy the global pairing condition; each such occurring member has multiplicity one. The formula does not assert every local packet choice occurs.

### ET.4.33 Worked checks for the simple stable and twisted formulas

Target `ET.4/acceptance-examples` (application).

(1) Torus check: for N = 1, G_1 is the similitude torus of a CM field; E^ell(G_1) = {G_1}, τ(G_1) = 1 when [F^+:ℚ] is odd (Shin 2011 Remark 3.2), and the stable–twisted identity reduces to the base-change character matching for the similitude torus including its multiplier; z↦z/z̄ alone applies to U(1), not G₁. (2) Non-example: for F imaginary quadratic (F^+ = ℚ), the coset 𝒢_2θ has the proper cuspidal subset coming from (R_{F/ℚ}𝔾_m) × G_0, so ET.4/twisted-geometric-side fails without extra terms. (3) Unramified GL_2 check: for N = 2 and v split in F_0, BC* sends the Hecke operator T_v to the Hecke operator of GL_2(F_w) and the trace identity of ET.4/unramified-transfers is the Satake identity. (4) Local base change of the Steinberg representation of GL_2 is the Steinberg representation, and the twisted character at a σ-regular element equals −1 on elliptic norms, matching θ_St = −1 (ET.4/padic-character-distributions). (5) Coefficient check: for G = G_4 and H = G_{2,2}, ι(G,H) carries the factor ½ of |Out| = 2, matching ε_{(2,2)} = ½ in Caraiani–Scholze non-compact Theorem 5.6.1.

Hypotheses and conventions:

- the data of the individual nodes

Proof plan:

- Each item is a direct specialisation of the named node.

Direct prerequisites:

- `ET.4/stable-twisted-identity`
- `ET.4/no-proper-cuspidal-subsets`
- `ET.4/unramified-transfers`
- `ET.4/local-cyclic-base-change`
- `ET.4/tamagawa-number-formula`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Remark 5.5.4, p. 74; §5.6, Theorem 5.6.1, p. 75. gives the F^+ = ℚ counterexample and the coefficient ε_n⃗
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Lemma 3.1, p. 13. computes the Tamagawa numbers used in the torus check

Checks:

- Each of (1)–(5) is a numerical or structural identity that a wrong normalisation (missing ½, wrong sign of the Steinberg character, wrong Tamagawa number) would violate.

### ET.4.34 Public cohomological unitary weak base change and descent

Target `ET.4/cohomological-unitary-weak-base-change` (theorem).

Let E/F be CM with [F:ℚ]≥2 and U an inner form of the quasi-split unitary group in Labesse §5. Let σ be a discrete automorphic representation with discrete-series infinity component satisfying property (*): all representations with its finite part have infinity pseudo-coefficient trace of one common sign. Labesse Corollary 5.3 gives a weak base change to an isobaric sum of θ-stable discrete GL blocks, with local matching at unramified and split finite places and compatible infinitesimal character at infinity. If every block is cuspidal, the infinity component is its actual archimedean base change. Conversely, when E/F is unramified at all finite places and U is quasi-split at finite inert places, Theorem 5.4 descends a θ-stable cuspidal cohomological GL_N representation to a discrete cohomological σ. Under its extra discrete-series, spherical-inert and (*) hypotheses a cuspidal σ has multiplicity one. This is weak unitary base change with precisely these hypotheses; it does not prove all-place transfer in the separate Harris–Taylor division-algebra setting.

Hypotheses and conventions:

- Use the central-character, inner-form and discrete infinity hypotheses of Labesse Theorem 5.1. Property (*) holds in the compact infinity case and with the sufficiently regular coefficients specified on p. 42; it is not assumed for every cohomological representation.
- The converse retains the everywhere-finitely-unramified CM extension and finite-inert quasi-splitness hypotheses.

Proof plan:

- Labesse Theorem 5.1 compares the unitary trace to the twisted GL trace with the discrete-series test function and controlled endoscopic terms.
- The common-sign property isolates the finite part without cancellation. Corollary 5.3 obtains a θ-stable discrete isobaric weak lift, with the precise split/unramified and infinity compatibilities.
- For the converse Theorem 5.4 uses the additional finite-place hypotheses to match the cuspidal θ-stable GL trace and recover the cohomological unitary representation. Its multiplicity-one assertion uses the additional spherical-inert and (*) assumptions.

Direct prerequisites:

- `ET.4/stable-twisted-identity`
- `ET.4/twisted-spectral-side`
- `ET.4/archimedean-lefschetz-functions`
- `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`

Sources:

- [J.-P. Labesse, Changement de base CM et séries discrètes](https://webusers.imj-prg.fr/~michael.harris/CBCM.pdf), Théorème 4.12 p. 40; Theorem 5.1 pp. 41–42; property (*) p. 42; Corollary 5.3 pp. 43–44; Theorem 5.4 pp. 45–46. The public source gives this wider cohomological weak lift and a descent with stronger finite-place hypotheses; neither equals the restricted all-place HT theorem.

Checks:

- At compact infinity, property (*) prevents cancellation of the finite part.
- A residual discrete GL block does not imply actual infinity base change from infinitesimal-character compatibility alone.
- A ramified finite inert place prevents direct application of the stated descent theorem.

## Exact supplier contracts

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Global class field theory for cyclic extensions: the character ω of 𝔸_F^×/F^×N(𝔸_E^×) attached to a cyclic extension E/F.

Used by `ET.4/global-cyclic-base-change`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Maximal tori, Levi subgroups and anisotropic tori of connected reductive groups over ℚ and ℝ, used to define cuspidal groups.

Used by `ET.4/cuspidal-levi-subsets`.

### AutomorphicSpectralTheory:AS.4

Number-field GL_n unitary discrete residual Speh classification, its global multiplicity one, and the induced Levi data used in Shin Proposition 4.8; the existing function-field/unramified specialization does not supply it. Read Mœglin–Waldspurger 1989 main theorem pp. 605–606 and provide its full primary proof chain.

Used by `ET.4/twisted-spectral-side`, `ET.4/cohomological-unitary-weak-base-change`.

### AutomorphicFormsOnReductiveGroups:AF.1

For GL_n(ℝ) and GL_n(ℂ), normalized parabolic induction of arbitrary irreducible unitary GL-block representations is irreducible, and the normalized intertwiner is holomorphic/invertible at the unitary point. Mœglin–Waldspurger §I.1.1(3) pp. 607–608 invokes Vogan/Bernstein; generic-unitary classification alone does not cover residual Speh data. The non-archimedean blocks are ET.4/unitary-induction-irreducibility (Bernstein); this request is the archimedean case (Vogan), used there and in the spectral side.

Used by `ET.4/twisted-spectral-side`, `ET.4/unitary-induction-irreducibility`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic

Import the already planned real/complex continuous-character classification for the infinity component of ϖ: its restriction to ℝ× forces odd angular exponent and zero norm exponent. This is an existing roadmap import, not a request to plan that classification again.

Used by `ET.4/quadratic-character-extension`.

## Proof obligations retained by the plan

These are endpoints of target-level prerequisite chains. They prevent a closed coverage claim.

### Unitary classification primary proof chain

KMSW v1 Theorem* 1.6.1, §1.6.4 and Theorem* 1.7.1 have been read: the bounded local theorem and positive-exponent packet construction are now separate targets, and generic pure-inner global classification retains its correct scope. The complete quasi-split Mok proof, inner-form local intertwining relations and global stabilized comparison underlying these results have not been traced to primary proofs. Supply exact character-normalization and stabilization suppliers; ordinary twisted spherical FL does not establish a weighted FL. General nongeneric/arbitrary-inner assertions are outside this target, not silently upgraded.

Needed by `ET.4/unitary-endoscopic-classification`, `ET.4/tempered-unitary-local-packets`, `ET.4/extended-unitary-local-packets`.

### Harris–Taylor §VI and Kottwitz's simple Shimura varieties read only through citing papers

The base change and descent statements Harris–Taylor Lemma VI.2.10, Theorem VI.2.9 and Corollaries VI.2.7–VI.2.8, and Kottwitz's results on simple Shimura varieties (Invent. Math. 108, 1992), are planned from their statements as used in Scholze 2010 §§8–10 (Theorem 10.5 p. 27 cites Harris–Taylor Theorem VI.1.1, Lemma VI.2.10, Theorem VI.2.9 and Theorem VI.2.1). The Harris–Taylor book is not freely available and is not in the cleared library (the same source-access request as the ET.6a packet). The proofs must be matched with internal locators once a copy is registered; Labesse's Changement de base CM et séries discrètes (2011) is the public alternative for the unitary base change.

Needed by `ET.4/unitary-gl-base-change-descent`, `ET.4/simple-division-algebra-trace-identity`.

### Character-theorem Howe support and real harmonic inputs

Clozel 1987 Theorems 1–3 and the support proof §§3.5–3.9 were read. His Lemma 6 uses Howe’s small-compact orbit parametrization/intertwining result and Cartan estimates; their primary proofs were not read here. Delorme–Mezo Theorems 3/4 use the real tempered classification, normalized analytic intertwiners and the induction/spectral relations of their main Paley–Wiener theorem. SR.2 induction and AF.1 classification give carriers but not these full analytic support statements. Name the exact supplying results and match their extension-scalar convention before treating these proof chains as closed.

Needed by `ET.4/padic-character-distributions`, `ET.4/twisted-characters`, `ET.4/twisted-character-support-and-paley-wiener`.

### Classical inner-form Tamagawa and Hasse proof

Kottwitz 1984 §5 pp. 625–626 supplies the relative formula; Lai 1980 Theorem 7.1 and §7.2 pp. 186–188 supply only the quasi-split simply connected branch; Lai §7.2 p. 187 records that the classical groups other than the trialitarian forms were treated by Tamagawa, Weil and Mars, and Kottwitz, Tamagawa numbers, Ann. of Math. 127 (1988), 629–646, proves τ=1 for simply connected groups without E₈ factors. Neither proof was read. Need the classical Weil/Kneser primary proof of τ=1 for the inner SL/SU covers of the elliptic centralizers, the simply connected Hasse principle and the approximation inputs used in Kottwitz–Rogawski Lemma 1. AA.2 supplies measures and Ono’s general formula interface, not this inner-form number-one computation. Do not infer that an inner centralizer is quasi-split or that its ker¹ vanishes. For the unitary similitude groups themselves, Shin 2011 Lemma 3.1 and Remark 3.2 determine τ(G_n⃗) only when every block is even or [F⁺:ℚ] is odd; in the remaining case |ker¹(ℚ,G_n⃗)|∈{1,2} is open in the cited sources.

Needed by `ET.4/classical-simply-connected-tamagawa`, `ET.4/tamagawa-number-formula`, `ET.4/elliptic-stabilization`, `ET.4/twisted-character-support-and-paley-wiener`.

### Central elliptic complement

Kottwitz 1986 Theorem 9.6 (statement p. 393, proof pp. 394–397) proves the noncentral formula, with (G,H)-regular endoscopic classes and omitted central classes for the inner datum. The new complement target states exactly the additional identity needed for the full displayed elliptic formula. A primary proof of the omitted central/nonregular terms with the same quotient measures and transfer normalization remains required. Regular matching alone does not close this singular identity.

Needed by `ET.4/central-elliptic-stabilization`, `ET.4/elliptic-stabilization`.

### Real character boundary and central quotient transport

Clozel–Labesse 2011 Theorems 2.2, 4.1 and 5.1 provide the pure-unitary Lefschetz construction and singular stable orbital formula, including the centralizer sign; Morel corrected v2 Proposition 8.2.3 and Lemmas 8.2.5/8.2.6 give the invariant vanishing proof. That proof uses Clozel’s real θ-discrete character growth and boundary results (Morel [Cl2] Theorems 5.1 and 7.2), Arthur’s connected-centralizer unipotent limits and differential-equation induction. These exact primary proofs, and the product/similitude quotient-measure transport to this packet’s GU central-character spaces, were not independently read. ET.1 real transfer supplies matching, not those analytic estimates.

Needed by `ET.4/archimedean-lefschetz-functions`, `ET.4/archimedean-invariant-vanishing`, `ET.4/twisted-geometric-side`.

### Number-field residual spectrum and all-unitary induction

Mœglin–Waldspurger 1989 §I.1.1(3) pp. 607–608 supplies irreducibility of unitary GL induction and regular invertible normalized operators at the unitary point, but invokes Bernstein/Vogan primary proofs. AS.4 currently supplies a function-field everywhere-unramified residual classification rather than the needed number-field discrete Speh classification and multiplicity one. The two exact supplier requests below are prerequisites of the spectral proof. Restricting to cuspidal data or generic unitary induction would lose residual Speh terms. The non-archimedean irreducibility is the target ET.4/unitary-induction-irreducibility, stated by Tadić 1986 §2.5 p. 346 with attribution to Bernstein (P-invariant distributions on GL(N) and the classification of unitary representations of GL(N), Lecture Notes in Math. 1041, 1984), whose proof was not read; the archimedean case is the AF.1 request.

Needed by `ET.4/twisted-spectral-side`, `ET.4/cohomological-unitary-weak-base-change`, `ET.4/unitary-induction-irreducibility`.

### GSp4 classification and weighted twisted stabilization

Gee–Taïbi Proposition 6.1.7, Remark 6.1.8 and Theorem 7.4.1 pp. 507–514 were read. Their chain uses the Sp₄/SO₅ classification, local packet restriction/normalization, twisted weighted stabilization and the exterior/symmetric-square pole argument. The primary proofs of these underlying inputs were not traced here; the introduction p. 472 retains the weighted fundamental-lemma assumption. Record a precise conditional supplier for those inputs. The unitary classification is not a substitute. ML.4 should import the general-type ET.4 theorem, keeping its own full-classification application; it must not duplicate this target or be an upward dependency.

Needed by `ET.4/gsp4-gl4-transfer`.

### Unitary packets need the GL_N local correspondence of a later layer

KMSW Theorem* 1.6.1 attaches packets to L-parameters of the unitary group and states the twisted endoscopic character identity through the representation of GL_N attached to the parameter by the local Langlands correspondence (KMSW §1.6.3, p. 81, using their Theorem 1.2.4). In this roadmap that correspondence is ET.6/full-wd-correspondence, a later layer. The three packet and classification targets therefore cannot stay in ET.4; their only consumers are ET.7a targets, and they are to be placed in ET.7a. No other ET.4 target uses them.

Needed by `ET.4/tempered-unitary-local-packets`, `ET.4/extended-unitary-local-packets`, `ET.4/unitary-endoscopic-classification`.

## Source corrections

### EndoscopicTransferAndUnitaryTraceComparison/E2

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, definition of 𝒢^+_n⃗, p. 72 (arXiv:1909.01898v2).

The source defines θ by θ(λ, g)θ^{-1} = (λ^c, λ^c g^♯) with g^♯ = Φ_n⃗ ᵗg^c Φ_n⃗^{-1}, i.e. without an inverse.

g^♯ = Φ_n⃗ ᵗ(g^c)^{-1} Φ_n⃗^{-1}, as in Shin 2011 §4 before (4.2), p. 21, where the map is g ↦ Φ_n⃗ ᵗg^{−c} Φ_n⃗^{-1}.

θ must be an automorphism of order 2 whose fixed points are the unitary similitude group G_n⃗; without the inverse, g ↦ Φ ᵗg^c Φ^{-1} is an anti-automorphism (it reverses products), so θ would not be a group automorphism.

Known correction: The same slip in Caraiani–Scholze 2017 §5.3 p. 736 is recorded as erratum E69 of the accepted extraction PAPER-CARAIANI-SCHOLZE-17; for the non-compact sequel it is new here.

Kind: misprint; reach: nothing. Verdict: confirmed at the locator.

### EndoscopicTransferAndUnitaryTraceComparison/E3

[L. Clozel and J.-P. Labesse, Appendice A. Changement de base pour les représentations cohomologiques de certains groupes unitaires](https://www.numdam.org/item/AST_1999__257__119_0.pdf), Appendice A, Théorème A.1.1, p. 121, Astérisque 257 (1999) (Numdam copy); the sign is dropped in the computations on p. 120, lines 14 and 16, p. 122, lines −8 and −6, and p. 123, line 6, as the 2011 erratum identifies.

Théorème A.1.1 states that the stable θ-orbital integral of a Lefschetz function at a θ-semisimple element whose stable θ-centralizer has discrete series equals d(G(ℝ)), with no sign depending on that centralizer; it assumes the stable centralizers connected.

The stable orbital integral is e(I_δ)·d(G)·trace F(δ), with e(I_δ) Kottwitz’s sign of the stable centralizer (e(I_δ)·d(G) for trivial coefficients); for base change from U(p,q) to GL_n(ℂ) the nonzero value is e(I_δ)·2^n·trace E(γ), γ = gθ(g).

Descent to the stable centralizer replaces the Lefschetz function by the centralizer’s Euler–Poincaré function, whose value at 1 is (−1)^{q(I_δ)} d(I_δ); its sign depends on the real form of I_δ. The printed computation drops this sign at the lines listed, so the stated formula is wrong for singular δ with e(I_δ) = −1 (Clozel–Labesse 2011 §4).

Known correction: Clozel–Labesse, Orbital integrals and distributions, Clay Mathematics Proceedings 13 (2011), §4 “Erratum and complements to [CL]”, pp. 112–113, with the corrected Theorem 4.1 (p. 113) and Theorem 5.1 (pp. 113–114).

Kind: error; reach: a stated result. Verdict: confirmed at the locator.

### EndoscopicTransferAndUnitaryTraceComparison/E4

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, proof of Proposition 4.5, p. 27.

The prose cuspidality criterion reverses the existence of an anisotropic maximal real torus modulo the split centre.

A cuspidal connected group has such an anisotropic maximal torus modulo A_M; for a twisted Levi subset test this on its associated fixed unitary Levi.

Morel Definition 3.1.1 and §8.2 give the positive-existence criterion. Shin’s subsequent split-centre rank argument rules out proper cuspidal Levis only with that criterion.

Known correction: new

Kind: misprint; reach: nothing. Verdict: confirmed at the locator.

## Structure and ownership

The early character prefix stays in ET.4 until a SmoothRepresentations Part II takes it over as a single owner. Cyclic base change, automorphic induction and the restricted unitary descent form the proposed sub-layer ET.4b, which ET.6, ET.7a and the GL₂ transfer roadmap import. ModularityAndLanglandsExtensions ML.4 imports the general-type GSp₄ transfer and keeps its full-classification application.

The targets `ET.4/tempered-unitary-local-packets`, `ET.4/extended-unitary-local-packets` and `ET.4/unitary-endoscopic-classification` use the GL_N parameters of `ET.6/full-wd-correspondence`. Their consumers are the ET.7a targets on relevant packets, local unitary base change, the definite–indefinite switches and oldform dimensions. They are to be placed in ET.7a, after ET.6, with their statements unchanged; no other ET.4 target depends on a later layer.

The number-field residual spectrum of GL_n is requested from AutomorphicSpectralTheory AS.4, and the archimedean irreducibility of unitary induction from AutomorphicFormsOnReductiveGroups AF.1; the archimedean GL parameter dictionary is imported from AF.1.
