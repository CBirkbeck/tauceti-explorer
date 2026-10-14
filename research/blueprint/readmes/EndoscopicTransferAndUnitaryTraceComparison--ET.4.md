# Endoscopic transfer and unitary trace comparison — ET.4 revision

ET.4 plans the passage from local endoscopic matching to the simple stable–twisted unitary trace identity, and the base-change and packet interfaces needed by its consumers. The central hypothesis for the simple geometric comparison is [F⁺:ℚ]>1. The infinity function is a twisted Lefschetz function with a fixed algebraic central character. Proper geometric Levi terms vanish by the fixed-unitary-Levi cuspidality criterion; proper spectral Levi terms can remain and include residual discrete GL data.

This is revision 2 of the target-level plan, issue #9758, by Codex (GPT-6), session codex-tcAXQG. Only **ET.4** is in scope and its coverage is **planned**. The packet is complete as a planning pass under PROTOCOL §0; it is not mathematically closed or accepted by a new review. All implementations remain unchecked. The historical independent review records needs_changes and is preserved for the next reviewer. Its 69 node IDs and in-place corrections are retained. Nine explicit supporting targets have been added, giving 78 nodes in the file.

The ET.5 and ET.6 targets below are inherited material, reproduced from the corrected packet so that the reader carries the review's repairs. They are unchanged by this revision and have no coverage claim here. In particular the algebraic/Igusa prefix, Drinfeld-level geometry, newvector theorem and full Weil–Deligne factor proof remain obligations of their owners. A proposed tier change does not replace these obligations.

## Conventions and construction order

Write G for the fixed unitary similitude group and 𝒢 for its restriction-of-scalars base-change group. The twisted coset is 𝒢θ inside 𝒢⋊⟨θ⟩. Its involution uses inverse conjugate transpose; conjugate transpose alone reverses products. The chosen character ϖ extends the CM quadratic character. Its ramified places belong to every exceptional spherical-transfer set. The character extension is imported from AA.2; its infinity classification is already owned by the current GlobalNumberFields roadmap.

Fix quotient measures and the positive real split centre before comparing distributions. Infinity functions are compact modulo that split centre and transform by the specified algebraic central character. The weighted invariant orbital normalization includes a square-root discriminant, whereas ordinary transfer uses the unnormalized orbital integral. The global extension operator is the normalized intertwiner of the spectral formula; the condition A²=1 alone does not determine its sign.

For a standard twisted Levi subset Lθ, cuspidality is tested on its associated **fixed unitary Levi** L_H, rather than the connected complex GL restriction-of-scalars Levi L. The full subset must pass this test. Morel's corrected Proposition 8.2.3 and Lemmas 8.2.5/8.2.6 provide the archimedean invariant calculation. The geometric comparison carries the central-volume factor J(Zθ) and the index d(G,𝒢) before their cancellation/specialization. On the spectral side Φ⁻¹θ acts by −1 on the quotient by the θ-fixed full-group split space, giving 2^(−dim), including a nontrivial full-Levi factor.

The build has four paths. The character prefix feeds component distributions, character support and twisted real Paley–Wiener. Tamagawa measures, the relative formula and the simply connected number-one input feed stable elliptic coefficients. Base-change groups and finite/infinity transfers then feed the simple geometric and spectral comparison. Finally cyclic GL base change, unitary descent and the generic unitary packet/classification interface supply the downstream automorphic targets. GSp₄ has its own Sp₄/SO₅ classification chain; the unitary classification is not its prerequisite.

Kottwitz 1986 Theorem 9.6 proves the noncentral elliptic formula with restricted endoscopic classes. A separate central-complement target is required for the full formula. Clozel–Labesse 2011 corrects the missing centralizer sign in the singular stable Lefschetz orbital formula. The two inputs are not filled by a regular-element argument.

For inherited ET.6, ν=|det|, induction is normalized, and arithmetic local reciprocity is imported from ClassFieldTheory before applying the explicit inversion that gives the geometric convention. The special Weil–Deligne object is owned by ArithmeticGaloisRepresentations R01.2. Scholze's early positive semisimple rec input precedes the local correspondence; the late global Galois realization is a separate target. Segment monodromy and pair conductors cannot be recovered from semisimple cuspidal support alone.

## Libraries, sources and scope boundaries

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The baseline Haar-measure declaration is a measure interface, not a Tamagawa computation or a character theorem. The current read-only upstream roadmaps and Tau Ceti library were checked before adding targets. Existing group structure, characters at infinity, class-field reciprocity, measures and representation carriers are imported rather than planned again.

Every definition or construction below has its API, uses and discriminating mathematical tests. Heavy carriers and constructions remain reader targets. The compact suggested Lean file states only light numerical, interval and matrix checks over carriers at the pins; elaboration does not formalize the trace or classification theorems.

The source receipts in the packet distinguish primary sources read for this revision from inherited source metadata. Harris–Taylor is not in the cleared source library; it was not read from another copy. The public Labesse theorem gives a wider cohomological **weak** base-change statement with its own hypotheses, not an all-place replacement for Scholze's restricted division-algebra descent. A source's unread underlying proof is named in the obligations below.

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
- For the Steinberg representation of GL_2(F), θ_St = −1 on the regular elliptic set (a computation used in ET.6/acceptance-examples).
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
- The exact primary inputs for twisted weighted stabilization, local packet restriction and the exterior/symmetric-square pole proof are recorded in the direct GSp_4 gap; the unitary packet theorem is removed as an unrelated supplier. BCGP §1.8.22 supplies the algebraicity implication as previously corrected.

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

For a number field k and a simply connected semisimple group S that is a product of restrictions of scalars of the special linear or special unitary inner forms occurring as derived groups of G, H and connected elliptic centralizers I, τ(S)=1. The quasi-split branch is Lai Theorem 7.2. The inner special-unitary and inner special-linear branch is a separate primary-proof obligation; quasi-splitness is not inferred from being simply connected.

Hypotheses and conventions:

- Characteristic zero; S is the simply connected cover of the derived group, never the full unitary similitude group.

Proof plan:

- Use the product formula and compatibility of Tamagawa measures with restriction of scalars from AA.2.
- For quasi-split simply connected S, Lai §7 obtains τ=1 from the weight-lattice permutation torus, Ono’s torus formula and the Eisenstein residue computation of §§5–6.
- The same conclusion for the inner forms used by rational centralizers needs the classical Weil/Kneser computation. Its precise proof supplier remains the named inner-form Tamagawa gap. No quasi-split theorem is applied to an anisotropic inner form.

Direct prerequisites:

- `AdelicAlgebraicGroups:AA.2/tamagawa-measure`
- `AdelicAlgebraicGroups:AA.2/tamagawa-number`
- `ReductiveGroupsPartII:RG2.1/z-extension-existence`

Sources:

- [K. F. Lai, Tamagawa number of reductive algebraic groups](https://www.numdam.org/item/CM_1980__41_2_153_0.pdf), §7 Theorem 7.2 pp. 187–188. Proves Tamagawa number one for quasi-split simply connected groups; does not prove the required arbitrary inner-form branch.
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

- Bounded L-parameters only, in the unconditional generic local case of KMSW v1; use the chosen Whittaker normalization and extended pure inner twist.
- The GL local parameter dictionary is ET.6/full-wd-local-langlands at nonarchimedean places and AF.1/archimedean-llc-gln at real/complex places; the former retains its inherited factor proof gap.

Proof plan:

- Use the local classification and normalized endoscopic identity of KMSW §1.6.1; relevance and the central character χ_z determine which inner form receives each member.
- Use the injectivity/bijection clauses with their field-dependent scope. Lemma 1.6.2 transports a change of z without claiming that its pairing is unchanged.
- The proof passes through quasi-split classification and normalized local intertwining relations. Their exact primary proof chains are the classification gap, distinct from the packet statement itself.

Direct prerequisites:

- `ET.0/unitary-elliptic-endoscopic-data`
- `ET.1/transfer-factor-properties`
- `ET.3/twisted-fundamental-lemma-and-transfer`
- `ET.6/full-wd-local-langlands`
- `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`

Sources:

- [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White, Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.1 Theorem* 1.6.1 pp. 79–80; Lemma 1.6.2 p. 80. Pins the unconditional bounded-parameter packet, pairing, relevance, character identity and real-place union.

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

For the connected reductive groups G, their elliptic endoscopic groups H and connected elliptic centralizers I used in this packet, let S be the simply connected cover of the derived group. Kottwitz’s relative formula is τ(G)/τ(S)=|π₀(Z(Ĝ)^Γ)|/|ker¹(k,Z(Ĝ))|. With ET.0/kottwitz-duality and ET.4/classical-simply-connected-tamagawa this gives τ(G)=|π₀(Z(Ĝ)^Γ)|/|ker¹(k,G)|. For G_n⃗ with r positive blocks, the component count is 2^r if [F⁺:ℚ] is even or all blocks are even, and 2^(r−1) otherwise; ker¹ is trivial for these groups. Thus those counts are their Tamagawa numbers, while τ(𝒢_n⃗)=1. The same ratio must be applied to each inner centralizer with its own ker¹; it is not declared trivial merely because it is a centralizer.

Hypotheses and conventions:

- Use the Tamagawa measures and split-centre quotient of AA.2. The number-one theorem applies to the simply connected derived cover, not the similitude group.
- The displayed absolute formula for the inner-form inputs relies on the explicitly planned classical number-one theorem, whose inner-form proof is a gap.

Proof plan:

- Use Kottwitz 1984 §5: pass through a z-extension to a group with simply connected derived subgroup, apply Ono’s torus formula and the relative-ratio invariance under the central extension. This supplies τ(G)/τ(S), not τ(S)=1. The absolute number-one input is the separate classical target.
- |ker^1(F,G)| = |ker^1(F,Z(Ĝ))| is Kottwitz 1984 (4.2.2), the duality of ET.0/kottwitz-duality.
- Shin 2011 Lemma 3.1 pp. 13–14 computes the dual centre and its Γ-fixed component group. Its cohomological argument gives ker¹(G_n⃗)=1; for the base-change group use restriction of scalars, Shapiro and Hilbert 90. Apply the relative formula with the derived covers. Inner centralizers use ET.0 duality separately.

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
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1, Lemma 3.1 with (3.3) and Remark 3.2, pp. 13–14. computes the component group and ker^1 for G_n⃗, gives τ(G_n⃗) ∈ {2^r, 2^{r−1}} and τ = 1 for the base-change group, citing Kottwitz 1988 p. 629

Checks:

- τ(𝔾_m) = 1 and τ(R_{F_0/ℚ}𝔾_m) = 1.
- τ(U(1)) = 2 for the norm-one torus of an imaginary quadratic F_0 (π_0 of (ℂ^×)^Γ = {±1}, ker^1 trivial).
- For n⃗ = (1) and [F^+:ℚ] odd, |π_0(Z(Ĝ_{(1)})^Γ)| = 2^{r−1} = 1 and ker^1 is trivial, so τ(G_{(1)}) = 1 (Shin 2011 Remark 3.2).

### ET.4.8 Base-change groups and the L-morphisms BC and ζ̃

Target `ET.4/base-change-groups` (construction).

Let F = F^+F_0 be a CM field (F_0 imaginary quadratic, [F^+:ℚ] ≥ 2), n⃗ = (n_1,…,n_s) and G_n⃗ the quasi-split unitary similitude group of ET.0/unitary-elliptic-endoscopic-data, with the character ϖ : 𝔸_{F_0}^×/F_0^× → ℂ^× extending the quadratic character of F_0/ℚ fixed there. Put 𝒢_n⃗ = R_{F_0/ℚ}(G_n⃗ ×_ℚ F_0); then 𝒢_n⃗ ≅ R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗ and its dual group is ℂ^× × ℂ^× × ∏_{σ ∈ Φ} GL_n⃗(ℂ) (Φ the embeddings F → ℂ), W_{F_0} permuting the σ-factors and w ∉ W_{F_0} acting by (λ_+, λ_−, (g_σ)) ↦ (λ_− ∏_{σ ∉ Φ^+} det g_σ, λ_+ ∏_{σ ∈ Φ^+} det g_σ, (Φ_n⃗ ᵗg_{c w^{-1}σ}^{-1} Φ_n⃗^{-1})_σ). The construction gives: (a) the base-change L-morphism BC_n⃗ : ^LG_n⃗ → ^L𝒢_n⃗, (λ,(g_σ)_{σ∈Φ^+}) ⋊ w ↦ (λ, λ, (g_σ)_{σ∈Φ^+}, (g_{cσ})_{σ∉Φ^+}) ⋊ w; (b) for n_1 + n_2 = N the L-morphism ζ̃_{n_1,n_2} : ^L𝒢_{n_1,n_2} → ^L𝒢_N extending GL_{n_1} × GL_{n_2} ⊂ GL_N by the ϖ-twist of η̃_{n_1,n_2} on W_{F_0} and the element (a_{n_1,n_2}, a_{n_1,n_2}, (Φ_{n_1,n_2}Φ_N^{-1})_σ) on a fixed w* ∉ W_{F_0}; (c) the commutative square BC_N ∘ η̃_{n_1,n_2} = ζ̃_{n_1,n_2} ∘ BC_{n_1,n_2}; (d) the automorphism θ of 𝒢_n⃗ induced by the non-trivial element of Gal(F_0/ℚ), θ(λ, g) = (λ^c, λ^c g^♯) with g^♯ = Φ_n⃗ ᵗ(g^c)^{-1} Φ_n⃗^{-1} (the inverse is required; the non-compact sequel §5.5 omits it, see sourceIssues), so that 𝒢_n⃗ ⋊ Gal(F_0/ℚ) ≅ 𝒢^+_n⃗ = 𝒢_n⃗ ⋊ {1, θ}.

Hypotheses and conventions:

- F = F^+F_0 CM with F_0 imaginary quadratic; ϖ fixed as in ET.0/unitary-elliptic-endoscopic-data; a_{n_1,n_2} a fixed square root of (−1)^{N(n_1,n_2)} with N(n_1,n_2) = [F^+:ℚ](n_1ε(n_1) + n_2ε(n_2))/2 and ε(m) ∈ {0,1} the parity of m.

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

Checks:

- For n⃗ = (1), 𝒢_{(1)}(ℚ) = F_0^× × F^×.
- The θ-fixed points of 𝒢_n⃗(ℚ) are G_n⃗(ℚ).
- The square BC_N ∘ η̃ = ζ̃ ∘ BC holds on W_{F_0} and on w*.
- 𝒢_n⃗ is not G_n⃗ ×_ℚ F_0 viewed over F_0: it is its Weil restriction to ℚ, whose ℚ-points are G_n⃗(F_0).

### ET.4.9 Extended local unitary packets by positive-exponent induction

Target `ET.4/extended-unitary-local-packets` (construction).

For ψ∈Ψ⁺(G*) write the KMSW §1.6.4 decomposition ψ=ψ_M·φ_λ with ψ_M bounded on a relevant Levi M* and λ in the positive chamber, giving an unramified character χ_λ. If the Levi datum is irrelevant for G, set Π_ψ(G,ξ)=∅. Otherwise transfer the extended pure inner twist to M and set Π_ψ(G,ξ)={I_P(π_M⊗χ_λ): π_M∈Π_ψM(M,ξ_M)}. Transport the pairing by Irr(S_ψ♮,χ_z)=Irr(S_ψM♮,χ_zM), using KMSW (1.6.3)–(1.6.4). These induced admissible representations may be reducible or nonunitary for a general Ψ⁺ parameter. Do not replace them by irreducible Langlands quotients without an additional theorem. For λ=0 and tempered ψ this recovers the tempered packet. Retain Weyl-conjugacy independence and the choice-sensitive pairing.

Hypotheses and conventions:

- In the generic global localization used here the bounded Levi packet is a tempered L-packet. A general nongeneric bounded Arthur parameter would require the broader bounded packet theorem, whose proof is not claimed in this revision.
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

Let (H,s,η) be an elliptic endoscopic triple of a connected reductive ℚ-group G. Work in the space of smooth functions compactly supported modulo A_{H,∞}^0 (the positive real points of the maximal ℚ-split central torus), transforming under a fixed compatible central character χ; all quotient measures and traces use this same convention. For stable-cuspidal h_∞ define ST^H_e(h) = τ(H) Σ_{[γ_H]_st,ell} |π₀(H_{γ_H})(ℚ)|⁻¹ SO_{γ_H}(h), with the connected-centralizer measures and signs specified by Shin 2010 (7.3), p. 26. The coefficient is ι(G,H)=τ(G)τ(H)⁻¹|Out(H,s,η)|⁻¹. For the unitary similitude endoscopic groups in this packet the centralizers are connected, so the component factor is 1.

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

- `StableEllipticDistribution` (constructor): Let (H,s,η) be an elliptic endoscopic triple of a connected reductive ℚ-group G. Work in the space of smooth functions compactly supported modulo A_{H,∞}^0 (the positive real points of the maximal ℚ-split central torus), transforming under a fixed compatible central character χ; all quotient measures and traces use this same convention. For stable-cuspidal h_∞ define ST^H_e(h) = τ(H) Σ_{[γ_H]_st,ell} |π₀(H_{γ_H})(ℚ)|⁻¹ SO_{γ_H}(h), with the connected-centralizer measures and signs specified by Shin 2010 (7.3), p. 26. The coefficient is ι(G,H)=τ(G)τ(H)⁻¹|Out(H,s,η)|⁻¹. For the unitary similitude endoscopic groups in this packet the centralizers are connected, so the component factor is 1.
- `StableEllipticDistribution.isStable` (characterisation): ST^H_e vanishes on h all of whose stable orbital integrals vanish.
- `StableEllipticDistribution.linear` (simp): ST^H_e is linear in h.
- `endoscopicCoefficient` (constructor): ι(G,H) = τ(G)τ(H)^{-1}|Out(H,s,η)|^{-1}.
- `endoscopicCoefficient_self` (simp): ι(G,G) = 1 for the trivial triple.
- `endoscopicCoefficient_iso` (relation): ι(G,H) depends only on the isomorphism class of (H,s,η).

Uses:

- Shin 2010 Theorem 7.2: the stable Igusa trace formula is a sum of ι(G,H) ST^H_e(h^H) over elliptic triples (ET.5/stable-igusa-trace-formula)
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

With ET.4/base-change-groups, let v be a place of ℚ outside a finite set S containing ∞, p, ℓ and the primes where F or ϖ ramifies. (a) The L-morphisms BC_n⃗, ζ̃_{n_1,n_2} and η̃_{n_1,n_2} induce, through the Satake isomorphism (SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism), algebra maps BC*_n⃗ : H^ur(𝒢_n⃗(ℚ_v)) → H^ur(G_n⃗(ℚ_v)), ζ̃*_{n_1,n_2} : H^ur(𝒢_N(ℚ_v)) → H^ur(𝒢_{n_1,n_2}(ℚ_v)) and η̃*_{n_1,n_2} : H^ur(G_N(ℚ_v)) → H^ur(G_{n_1,n_2}(ℚ_v)), and dual maps on unramified representations, with tr π(η̃*φ) = tr η̃_*(π)(φ) and the same for BC and ζ̃. (b) The squares BC*_{n_1,n_2} ∘ ζ̃*_{n_1,n_2} = η̃*_{n_1,n_2} ∘ BC*_N on Hecke algebras and the dual square on unramified representations commute. (c) Explicitly, for Q_{n_1,n_2} a parabolic of 𝒢_N with Levi 𝒢_{n_1,n_2}: ζ̃*_{n_1,n_2}(f_v) = f_v^{Q} · χ_{ϖ,v}, the normalised constant term times the character χ_ϖ(λ,g_1,g_2) = ϖ(λ^{−N(n_1,n_2)} ∏_i N_{F/F_0}(det g_i)^{ε(n_i)}), and ζ̃_{n_1,n_2,*}(Π_v) = n-Ind(Π_v ⊗ χ_{ϖ,v}); these formulas extend to all f_v ∈ C_c^∞ and all Π_v ∈ Rep(𝒢_{n_1,n_2}(ℚ_v)), since both groups are products of restrictions of scalars of general linear groups.

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

- Clozel–Labesse 2011 Theorem 2.2 constructs the Lefschetz trace distribution from the K-supported distribution and a Paley–Wiener regularizing multiplier with value one at the coefficient parameter. Lemma 3.2 makes its semisimple orbital integrals independent of regularization; Proposition 3.3 gives the regular orbital formula. Theorems 4.1/5.1 use connected-centralizer Euler–Poincaré functions to obtain the singular stable formula with e(I_δ). The published correction on p. 115 repairs the omitted sign in Labesse 1999 Appendix A.
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

- [L. Clozel and J.-P. Labesse, Orbital integrals and distributions](https://www.claymath.org/library/proceedings/cmip013c.pdf), Theorem 2.2 p. 109; Lemma 3.2 and Proposition 3.3 pp. 111–112; Theorems 4.1/5.1 pp. 113–115. Provides the primary Lefschetz construction and singular-centralizer formula, with the published correction to Labesse 1999 Appendix A.
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
- Fibres (d), compatibilities (e) and supercuspidality (f): AC Ch. 1 Propositions 6.6–6.9 and Lemma 6.10, pp. 59–63, using linear independence of twisted characters (ET.4/twisted-characters).

Direct prerequisites:

- `ET.4/twisted-characters`
- `ET.3/base-change-fundamental-lemma-and-transfer`
- `ET.4/padic-character-distributions`
- `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`
- `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`
- `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`

Sources:

- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 Theorem 6.2 pp. 51–52; Propositions 6.6 p. 58, 6.7–6.8 p. 59, 6.9 pp. 60–61 and Lemma 6.10 p. 62. defines base-change lifting by the Shintani character identity and proves existence and uniqueness of lifts of tempered representations
- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §6, Propositions 6.6–6.9 and Lemma 6.10, pp. 59–63. describes the fibres of lifting by twists, compatibility with contragredients and twists, and the behaviour of supercuspidal representations
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

Let G be connected reductive over ℚ with G_der simply connected, f = ∏_v f_v ∈ C_c^∞(G(𝔸)) with f_∞ the Euler–Poincaré (Lefschetz) function of an irreducible algebraic representation ξ (ET.1/pseudocoefficients). Let T_e(f) = Σ_{γ_0} τ(I_0) · Σ_{γ ∈ adelic class} e(γ) O_γ(f) be the elliptic part of the trace formula written over pairs (γ_0, γ) with γ_0 elliptic semisimple and γ adelically conjugate to γ_0. Then T_e(f) = Σ_{(H,s,η)} ι(G,H) ST^H_e(f^H), the sum over isomorphism classes of elliptic endoscopic triples of G, where f^H = ∏_v f^H_v with f^H_v a transfer of f_v (ET.1/matching-functions, ET.3/local-transfer-existence), f^H_v the unramified image of f_v at almost all v (ET.3/fundamental-lemma-almost-all-places), and f^H_∞ the explicit combination of averaged pseudo-coefficients of ET.1/archimedean-pseudocoefficient-transfer. The ker^1 factors and the κ-sum are those of ET.0/global-kottwitz-obstruction.

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

- [R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://people.dm.unipi.it/maffei/didattica/seminario2020/Kottwitz1986.pdf), §9.3–9.7 pp. 392–397, especially Theorem 9.6. Proves the noncentral elliptic identity by the cohomological coefficient and endoscopic orbit calculation. The full central identity is not contained in this theorem.
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.4, p. 36. records that the trace formula for compact quotients is stabilised on the geometric side after Langlands and Kottwitz, especially Kottwitz 1986 Theorem 9.6
- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5.1, Lemma 5.1, pp. 15–16; §7, Lemma 7.1, p. 26. performs the same regrouping by κ and endoscopic triples for the Igusa counting formula

Checks:

- For G anisotropic with only the trivial elliptic endoscopic triple, T_e(f) = ST^G_e(f^G) with f^G = f.
- For G = 𝔾_m every class is stable and the identity is tautological.
- For a unitary similitude group G_N the sum runs over (G_N,1,id) and the (G_{n_1,n_2}, s, η) of ET.0/unitary-elliptic-endoscopic-data.

### ET.4.22 The invariant twisted trace formula for the unitary base-change spaces

Target `ET.4/twisted-trace-formula` (theorem).

On the component 𝒢_n⃗θ of 𝒢_n⃗⋊⟨θ⟩, the invariant global formula equates I_geom(fθ) and I_spec(fθ). Use fixed-central-character functions compact modulo the specified positive real split centre; restrict to 𝒢(𝔸)¹ after the central-character twist, as in Shin §4.5. The geometric expansion is the sum over Levi subsets and rational classes of Arthur’s coefficients times the invariant twisted orbital distributions; the spectral expansion is the sum over discrete inducing data and intertwiner terms of the invariant twisted character distributions. The precise distributions are ET.4/twisted-invariant-distributions. The ordered spectral limit is Arthur II Theorem 6.4; no unproved absolute convergence of a doubly indexed sum is asserted. Splitting and descent are part of the same component theory.

Hypotheses and conventions:

- 𝒢^+_n⃗ is a non-connected group whose coset 𝒢θ is defined by an automorphism θ of order 2 preserving a ℚ-splitting; f has the stated central character.
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

Proof plan:

- Use Arthur II Theorems 3.3 and 4.4 for the fine geometric/spectral expansions of the component kernel, with invariant recursion from ET.4/twisted-invariant-distributions. AS.6 supplies the connected kernel/truncation interface, not the twisted theorem.
- Arthur’s original §1 scope restriction is removed by the separate Kottwitz–Rogawski character-support and Delorme–Mezo Paley–Wiener inputs. Record their approximation and real harmonic-analysis proof inputs explicitly.
- Apply Arthur II Theorem 6.4 with its prescribed spectral ordering and central-character restriction. Transfer of central characters uses the base-change split-centre map; it does not require simultaneously imposing trivial and ξ-central characters on the same function.

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
- [J. Arthur, The invariant trace formula II. Global theory](https://www.claymath.org/library/cw/arthur/pdf/27.pdf), §§3–4 Theorems 3.3/4.4 pp. 511–520; Theorem 6.4 pp. 536–538. The component expansions and ordered spectral identity are the primary formula; its original hypothesis is completed by the two named theorems.

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
- [L. Clozel and J.-P. Labesse, Orbital integrals and distributions](https://www.claymath.org/library/proceedings/cmip013c.pdf), Theorems 4.1/5.1 pp. 113–115. The corrected singular stable orbital formula needed at infinity.

Checks:

- For n⃗ = (1) the identity reduces to a statement about the elliptic part of the twisted trace formula of a torus.
- Dropping [F^+:ℚ] ≥ 2 (F imaginary quadratic) makes the identity false in general: extra cuspidal-Levi terms appear (Caraiani–Scholze non-compact Remark 5.5.4).
- Both sides vanish when f^n⃗_v = 0 at one place.

### ET.4.25 The spectral side of the simple twisted trace formula

Target `ET.4/twisted-spectral-side` (theorem).

With f^n⃗ as in ET.4/twisted-geometric-side, I^{𝒢_n⃗θ}_spec(f^n⃗θ) = Σ_M |W_M| |W_{𝒢_n⃗}|^{-1} |det(Φ_n⃗^{-1}θ − 1)_{𝔞^{𝒢θ}_M}|^{-1} Σ_{Π_M} tr(n-Ind^{𝒢_n⃗}_Q(Π_M)_ξ(f^n⃗) ∘ A′), where M runs over Levi subgroups of 𝒢_n⃗ containing a fixed minimal Levi M_0, W_M and W_{𝒢_n⃗} are Weyl groups relative to M_0 (the denominator is the Weyl group of 𝒢_n⃗, Caraiani–Scholze 2017 erratum E71), Φ_n⃗^{-1}θ acts as −1 on 𝔞^{𝒢θ}_M so the determinant is non-zero, Q is a parabolic with Levi M, Π_M runs over the irreducible Φ_n⃗^{-1}θ-stable subrepresentations of the relatively discrete spectrum R_{M,disc} (each occurring with multiplicity one by multiplicity one for general linear groups), the subscript ξ is the twist by the character of A^0_{𝒢,∞} determined by ξ, and A′ is the normalised intertwining operator on n-Ind(Π_M)_ξ composed with θ (Shin 2011 §4.5). Each n-Ind(Π_M)_ξ is a θ-stable isobaric irreducible automorphic representation, and its archimedean component is cohomological for Ξ when its trace against f_{𝒢,Ξ} is non-zero. The quotient 𝔞_M^{𝒢θ} is by the θ-fixed full-group split space, not by the full split space. Thus even M=𝒢 can have nonzero anti-invariant dimension r, and the coefficient is 2^(−r), not automatically one. The inducing data include residual Speh representations. A′ is the global normalized intertwiner M_Q|Qs(0)ρ_Q(s,0,θ;Π_M) of Shin Lemma 4.11, with the ξ central twist; choosing an arbitrary order-two extension does not reproduce its trace sign.

Hypotheses and conventions:

- f^n⃗_∞ a twisted Lefschetz function; the discrete spectrum of the general linear Levi M as described by Mœglin–Waldspurger.

Proof plan:

- Shin Proposition 4.8: start with Arthur’s spectral expansion and its chosen parameter ordering. The infinity infinitesimal character eliminates the additional Weyl terms; the surviving involution acts by −1 on the indicated quotient, giving determinant 2^dim.
- Shin Lemma 4.11 and Corollary 4.14: use the global functional equation and normalized intertwiner to fix A′ and its square; the ξ twist restricts to 𝒢(𝔸)¹. Proper spectral Levi terms remain.
- Use the number-field residual classification for GL_n, including multiplicity one for discrete Speh data. Mœglin–Waldspurger §I.1.1(3) gives irreducibility of unitary induction and holomorphic invertible normalized operators at the unitary point; its proof invokes the real and p-adic unitary GL inputs specified in requests. Nonzero Lefschetz trace forces the required cohomological infinity component.

Direct prerequisites:

- `ET.4/twisted-trace-formula`
- `ET.4/archimedean-lefschetz-functions`
- `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`
- `ET.4/twisted-characters`
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`
- `AutomorphicSpectralTheory:AS.4`
- `AutomorphicFormsOnReductiveGroups:AF.1`
- `ET.6/tadic-unitary-dual`

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

### ET.4.26 The simple trace formula for division-algebra unitary groups

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

### ET.4.27 Global cyclic base change for GL_n (Arthur–Clozel) ★

Target `ET.4/global-cyclic-base-change` (theorem). Planet: Global cyclic base change.

Let E/F be a cyclic extension of number fields of prime degree ℓ with Gal(E/F) = ⟨σ⟩ and ω the character of 𝔸_F^×/F^× N(𝔸_E^×) of class field theory. An automorphic representation of GL_n is induced from cuspidal if it is ind(σ_M ⊗ 1) for a cuspidal unitary representation σ_M of a Levi M(𝔸). A σ-stable Π of GL_n(𝔸_E) is a weak lift of π if Π_w is the unramified lift of π_v at almost all places, and a strong lift if Π_w is the local lift of π_v (ET.4/local-cyclic-base-change) at every place. Then (all representations induced from cuspidal): (a) if π is cuspidal and π ≇ π⊗ω, there is a unique σ-stable Π lifting π, and Π is cuspidal; (b) if π is cuspidal and π ≅ π⊗ω, then ℓ divides n and Π is the isobaric sum of the ℓ distinct conjugates of a cuspidal representation of GL_{n/ℓ}(𝔸_E); (c) every σ-stable cuspidal Π is the lift of some cuspidal π, unique up to twisting by powers of ω; (d) a weak lift is a strong lift; (e) ω_Π = ω_π ∘ N_{E/F}, and the lift is independent of the choice of σ; (f) two cuspidal π, π′ with the same lift differ by a power of ω. At a real place becoming complex, rec(Π_w)=rec(π_v)|W_ℂ in the AF.1 archimedean normalization; for n=1 this is χ↦χ∘N_ℂ/ℝ, with N(z)=|z|². Apply the same normalization to contragredients and algebraic central twists.

Hypotheses and conventions:

- E/F cyclic of prime degree ℓ, number fields
- representations induced from cuspidal (unitary cuspidal data)
- Every place includes archimedean places. Use AF.1/archimedean-llc-gln: at ℝ→ℂ restrict the W_ℝ-parameter to W_ℂ; at a split complex place use the identical parameter. This is the existing archimedean dictionary, not the nonarchimedean cyclic theorem.

Proof plan:

- Compare the twisted trace formula for GL_n(E) ⋊ ⟨σ⟩ with the trace formula of GL_n(F) through the matching of functions (ET.3/base-change-fundamental-lemma-and-transfer) and the term-by-term comparison of AC Ch. 2 (Theorems A and B).
- Separate eigencharacters with the strong multiplicity one theorem and the Jacquet–Shalika results (AC Ch. 3 §2) to obtain weak lifting (AC Ch. 3 Theorem 4.2, p. 203) and the fibres (Theorem 3.1, p. 202).
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

### ET.4.28 Stable–twisted identity for unitary similitude groups ★

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

### ET.4.29 Cyclic automorphic induction for GL_n (Arthur–Clozel) ★

Target `ET.4/cyclic-automorphic-induction` (theorem). Planet: Cyclic automorphic induction.

Let E/F be a cyclic extension of number fields of degree ℓ (prime or not) and π_E an automorphic representation of GL_m(𝔸_E) induced from cuspidal. Say that an automorphic representation π_F of GL_{mℓ}(𝔸_F) is automorphically induced from π_E if at almost all places v unramified in E, the Satake parameter of π_{F,v} is the induction of those of π_{E,w}: at v split in E it is the direct sum over w | v, and at an arbitrary unramified v it is ⊕_{w|v} Ind_{W_{E_w}}^{W_{F_v}}. Then there exists one and only one such π_F, and π_F is induced from cuspidal. For ℓ prime and π_E cuspidal, π_F is cuspidal iff π_E is not isomorphic to its Galois conjugate π_E^σ; the induction is transitive along towers of cyclic extensions; and its base change to E is the isobaric sum of the Galois conjugates of π_E.

Hypotheses and conventions:

- E/F cyclic; π_E induced from cuspidal

Proof plan:

- Use prime-degree cyclic base change and its cuspidal fibres to construct induction as in AC Ch. 3 §6, Theorem 6.2 p. 215; iterate along a cyclic tower. Verify the unramified induced Satake parameter at every splitting type, then apply strong multiplicity one and Rankin–Selberg pole counting. This proof does not introduce an additional unplanned character-twisted trace formula.
- Uniqueness from strong multiplicity one; cuspidality criterion from the Rankin–Selberg pole count (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles) and ET.4/global-cyclic-base-change (AC Ch. 3 Theorem 6.2 and Corollary 6.5, pp. 216–219).

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

### ET.4.30 Base change and descent between unitary groups and GL_n over CM fields

Target `ET.4/unitary-gl-base-change-descent` (theorem).

For exactly the division-algebra unitary similitude datum of Scholze §8 (totally real F₀ of even degree, F=F₀K, D split away from x,xᶜ and the signatures of Lemma 8.1), let Π be cuspidal, conjugate self-dual, regular algebraic on GL_n(𝔸_F), with Π_x essentially square-integrable. Scholze Theorem 10.5 gives an algebraic Hecke character ψ of K and π_f occurring in ξ-cohomology such that at every rational prime p′ split in K and every w′|p′ different from x,xᶜ the GL_n-factor of π_{p′} is Π_{w′}, while its similitude GL₁-factor is ψ_{u′}. One may arrange ψ unramified at a prescribed such p′. At a split place the entire pair consisting of the GL₁ multiplier character and all GL_n-factors determines the local similitude representation. Broader quasi-split base change and converse descent are not established by this source and remain a separate gap.

Hypotheses and conventions:

- F_0 totally real of even degree in the division-algebra case; p and the descent place split in K
- Π cuspidal, conjugate self-dual, regular algebraic, with a square-integrable component

Proof plan:

- Apply Scholze §10 Theorem 10.5 p. 27 with all hypotheses of §8 pp. 19–20. Its proof cites Harris–Taylor VI.2.10; those internal proofs remain a source-access gap.
- Keep the similitude character ψ: equality of the GL_n-factor alone is not injective on representations of GL₁×GL_n.
- Shin 2011 Corollaries 6.5 and 6.7 concern cohomology and Hodge data, not the base-change/descent assertions previously attributed to them.

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

### ET.4.31 Endoscopic classification of unitary groups for generic parameters

Target `ET.4/unitary-endoscopic-classification` (theorem).

Let U be a pure inner form of a unitary group for a CM extension F/F⁺, with its inner twist and local normalization fixed. For a generic global parameter ψ=⊞_i Π_i, with distinct cuspidal conjugate self-dual constituents of the prescribed parity and total rank N, KMSW Theorem* 1.7.1 supplies the ψ-part of the discrete spectrum: it is the direct sum of global packet members whose product pairing restricted to S_ψ equals ε_ψ, with multiplicity one, and ε_ψ=1 for generic ψ. This is the unconditional generic pure-inner case of that theorem, not its full nongeneric assertion. Tempered local parameters have the relevant packets and inner-twist pairings of Theorem* 1.6.1; general localizations of a generic global parameter require the extended packet construction and are not asserted tempered. In particular, unitary local base change is defined by the unitary L-embedding and twisted endoscopy, not by cyclic GL_n base change.

Hypotheses and conventions:

- Generic global parameter and pure inner twist; do not include the nongeneric or arbitrary-inner assertion beyond the unconditional scope of KMSW v1 pp. 88–89.
- Local pairings depend on the chosen extended pure inner twist; at real places the component-character bijection uses the union over the pure inner forms specified in Theorem* 1.6.1(5).

Proof plan:

- Use KMSW §1.7.1 pp. 88–89 for the generic pure-inner multiplicity statement and ε_ψ=1; the paper explicitly distinguishes its unconditional case from the announced general theorem.
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
- [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White, Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.1 Theorem* 1.6.1 pp. 79–80; §1.7.1 Theorem* 1.7.1 and Remark 1.7.2 pp. 88–89. states the local packet pairing, generic pure-inner global multiplicity formula and its unconditional scope
- [T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White, Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.4 pp. 86–87. The positive-exponent induced-packet construction, needed when a generic global parameter is non-tempered locally.

Checks:

- For N = 1 the classification is the description of automorphic characters of U(1) through base change.
- At a place split in F, U(F^+_v) ≅ GL_N(F_v) and the packet is a singleton given by ψ_v.
- For a simple generic global parameter, the allowed packet members satisfy the global pairing condition; each such occurring member has multiplicity one. The formula does not assert every local packet choice occurs.

### ET.4.32 Worked checks for the simple stable and twisted formulas

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

### ET.4.33 Public cohomological unitary weak base change and descent

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

- [J.-P. Labesse, Changement de base CM et séries discrètes](https://webusers.imj-prg.fr/~michael.harris/CBCM.pdf), Theorem 5.1 pp. 40–42; property (*) p. 42; Corollary 5.3 pp. 43–44; Theorem 5.4 pp. 45–46. The public source gives this wider cohomological weak lift and a descent with stronger finite-place hypotheses; neither equals the restricted all-place HT theorem.

Checks:

- At compact infinity, property (*) prevents cancellation of the finite part.
- A residual discrete GL block does not imply actual infinity base change from infinitesimal-character compatibility alone.
- A ramified finite inert place prevents direct application of the stated descent theorem.

## ET.5 — inherited corrected targets

These targets retain the reviewed packet statements. They are outside this revision’s coverage.

### ET.5.1 Acceptable elements of J_b(ℚ_p) and acceptable test functions ★

Target `ET.5/acceptable-test-functions` (definition). Planet: Acceptable test functions.

Let (B, O_B, *, V, Λ_0, ⟨,⟩, h) be an unramified integral PEL datum of type (A) or (C) with group G, p a good prime, b ∈ B(G_{ℚ_p}, −μ) and Σ_b a completely slope-divisible p-divisible group with G-structure of type b, with slope decomposition Σ_b = ⊕_{i=1}^r Σ_i of slopes λ_1 > … > λ_r, so J_b(ℚ_p) ⊂ ∏_i End^0(Σ_i)^× (IgusaVarietiesAndTorsionConcentration:IG.0/automorphism-group-of-universal-cover). (a) An element δ = (δ_i) ∈ J_b(ℚ_p) is acceptable if for all i < j every eigenvalue e_i of δ_i and e_j of δ_j satisfy v_p(e_i) < v_p(e_j). More generally, for a Levi M_0 ⊂ G_0 with central cocharacter ν, a semisimple γ ∈ M_0(ℚ_p) is ν-acceptable if for every root α of G_0 not in M_0, ⟨α,ν⟩ > 0 iff α(γ) has positive p-adic valuation (Shin 2010 Definition 3.1); with the sign convention for the cocharacter attached to b in Shin 2010 §3.2, this agrees with (a) (Remark 3.3). (b) A function φ ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) is acceptable if (i) every (g,δ) in its support has δ acceptable and in the monoid S_b of elements acting on the Igusa tower by finite correspondences, and φ = Σ_{g ∈ I} α_g 1_{U^p(m) g U^p(m)} for a finite I and a sufficiently small level U^p(m); (ii) each correspondence [U^p(m) g U^p(m)] has finitely many fixed points on Ig_{b,U^p,m}(𝔽̄_p); (iii) for each g ∈ I the Lefschetz trace on H_c(Ig_{b,U^p,m}, L_ξ) equals the sum over those fixed points of the traces on stalks of L_ξ (ET.5/igusa-fixed-point-formula).

Hypotheses and conventions:

- unramified integral PEL datum of type (A) or (C) at a good prime p
- Σ_b completely slope divisible
- levels U^p(m) small enough to be torsion free
- Write ν_i=−λ_i explicitly when comparing the 2009 slope convention with the 2010 root convention. Large negative powers fr^(−sN) separate valuations; positive powers fr^(sN) have the opposite sign.

Proof plan:

- The definitions are Shin 2009 Definitions 6.1–6.2 and Shin 2010 Definition 3.1 with Remark 3.3; Caraiani–Scholze 2017 §5.2 (Remark 5.2.1) records that acceptability separates the slope components by valuation, which makes transfer from J_b to G possible (ET.5/transfer-at-p).
- The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

Direct prerequisites:


Sources:

- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6 Definitions 6.1–6.2 p. 19. defines acceptable elements of J_b(ℚ_p) by separation of eigenvalue valuations across slopes, and acceptable functions by support, finiteness of fixed points and validity of the fixed-point formula (16)
- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.3, Definition 3.1 and Remark 3.3, p. 11. defines ν-acceptable elements of a Levi and notes agreement with the 2009 definition
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Remark 5.2.1 and Definition 5.2.2, pp. 732–733. uses acceptable functions for the Igusa trace and explains why acceptability allows transfer from J_b(ℚ_p) to G(ℚ_p)

Planning API:

- `IsAcceptableElement` (constructor): δ = (δ_i) ∈ J_b(ℚ_p) is acceptable iff v_p(e_i) < v_p(e_j) for all eigenvalues e_i of δ_i, e_j of δ_j, i < j.
- `IsNuAcceptable` (constructor): γ ∈ M_0(ℚ_p) is ν-acceptable iff, for all roots α outside M_0, ⟨α,ν⟩ > 0 ⇔ v_p(α(γ)) > 0.
- `IsNuAcceptable.iff_acceptable` (equivalence): For ν the cocharacter attached to b with ν_i=−λ_i, Shin's sign convention and γ ∈ M_b ≅ J_b over ℚ̄_p, ν-acceptable equals acceptable (Shin 2010 Remark 3.3).
- `IsAcceptableElement.mul_central` (relation): If δ is acceptable and z is central with v_p of z constant on slopes, δz is acceptable.
- `IsAcceptableFunction` (constructor): The three conditions (support, finite fixed points, fixed-point formula) of Shin 2009 Definition 6.2.
- `IsAcceptableFunction.add` (structure): Acceptable functions on a fixed finite family of double cosets form a vector space.

Uses:

- Shin 2009 Theorem 13.1: the counting formula is proved for acceptable test functions
- Shin 2010 Theorem 7.2: the stable Igusa trace formula is stated for acceptable functions
- Caraiani–Scholze non-compact §5.3: the test function φ = φ_p φ_{S_pf} φ^S is assumed acceptable in the first instance

Unit tests:

- `IsAcceptableElement.gl2` (computation): For GL_2-type data with slopes λ_1 > λ_2: δ = (1, p) on the slope components is acceptable and δ = (p, 1) is not.
- `IsAcceptableElement.basic` (degenerate): If b is basic (r = 1) every element of J_b(ℚ_p) is acceptable.
- `IsNuAcceptable.compat` (compatibility): For G_0 = GL_n and M_0 a standard Levi, ν-acceptability compares eigenvalue valuations across blocks i < j with ⟨e_i − e_j, ν⟩ > 0 (those on block i are larger); with ν_i=−λ_i, Shin's sign convention this is the 2009 condition that larger slopes carry smaller valuations.
- `IsAcceptableFunction.not_all` (non-example): 1_{U^p} ⊗ 1_{J_b(ℤ_p)} is not acceptable when r > 1, because 1 ∈ J_b is not acceptable.

Checks:

- For GL_2-type data with slopes λ_1 > λ_2: δ = (1, p) on the slope components is acceptable and δ = (p, 1) is not.
- If b is basic (r = 1) every element of J_b(ℚ_p) is acceptable.
- For decreasing slopes λ_i, the cocharacter ν_i=−λ_i yields the large negative Frobenius shift fr^(−sN), which is acceptable; the positive shift reverses the inequality.
- 1_{U^p} ⊗ 1_{J_b(ℤ_p)} is not acceptable when r > 1, because 1 ∈ J_b is not acceptable.

### ET.5.2 The fixed-point formula for Frobenius-twisted Igusa correspondences

Target `ET.5/igusa-fixed-point-formula` (theorem).

Let φ = 1_{U^p(m) g U^p(m)} with g ∈ G(𝔸_f^p) × S_b, U^p(m) small, and Ig_{b,U^p,m} the finite-level Igusa variety over 𝔽̄_p with a model over a finite field 𝔽_{p^s} on which the absolute Frobenius acts as fr^{-s} ∈ J_b(ℚ_p). (a) The double coset defines an algebraic correspondence [U^p(m) g U^p(m)] on Ig_{b,U^p,m} through a smaller level V^p(m′), and a cohomological correspondence on L_ξ. (b) There is M′ > 0, independent of the coefficient sheaf, such that for every N > M′ the correspondence (Fr^s × 1)^N ∘ [U^p(m) g U^p(m)] = [U^p(m) g (fr^{-s})^N U^p(m)] has finitely many fixed points and its Lefschetz trace on H_c(Ig_{b,U^p,m}, L_ξ) equals the sum over its fixed points of the traces on the stalks of L_ξ. (c) Consequently φ^{(N)}(x) = φ(x·(fr^s)^N) is acceptable for N ≫ 0 (Shin 2009 Lemma 6.3). For a normalized double-coset function e_g=1_{UgU}/vol(U), the trace is the correspondence trace; for the unnormalized characteristic function 1_{UgU}, multiply the correspondence fixed-point sum by vol(U), as in Shin 2009 (11), p. 17.

Hypotheses and conventions:

- Ig_{b,U^p,m} is separated of finite type but not proper; the theorem uses the Frobenius-twist form of Fujiwara's theorem, not a proper Lefschetz formula
- U^p(m) small enough
- ξ an irreducible algebraic representation giving the ℓ-adic sheaf L_ξ
- To invoke EDC.8, verify a finite-type compactification with locally invariant boundary, proper first leg over the interior and quasi-finite second leg, using the Igusa Hecke correspondence. The sheaf-independent bound is taken after that geometric correspondence is fixed.

Proof plan:

- Build the correspondence (13) of Shin 2009 §6 from the Hecke and J_b-actions of IgusaVarietiesAndTorsionConcentration:IG.1/igusa-group-actions, with the level V^p(m′) of Mantovan 2005 Lemma 6.
- Choose a model over 𝔽_{p^s} on which Frobenius acts through fr^{-s} (Shin 2007 §2.3), so that twisting by (fr^{-s})^N is composition with the N-th Frobenius power.
- Apply the Fujiwara–Varshavsky theorem (EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula, with EDC.8/frobenius-twist-contracting): for N above a bound independent of the sheaf, the twisted correspondence has isolated fixed points and naive local terms. Isolation, finiteness and the large-Frobenius-power bound are checked here, on the Igusa variety; the general trace theorem is EDC.8's.
- This is the contracting-boundary trace theorem of the layer: the Igusa application of Fujiwara–Varshavsky, not the point count of an ordinary endomorphism.
- The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

Direct prerequisites:

- `EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula`
- `EtaleDualityAndPerverseSheaves:EDC.8/frobenius-twist-contracting`
- `EtaleDualityAndPerverseSheaves:EDC.8/contracting-correspondence`
- `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence-lifting`
- `EtaleDualityAndPerverseSheaves:EDC.5`
- `EtaleDualityAndPerverseSheaves:EDC.6`
- `LefschetzPencilsAndVanishingCycles:LPV.6`

Sources:

- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, diagrams (13)–(14), (15), formula (16) and Lemma 6.3 with proof, pp. 17–18. realises Hecke and J_b-actions as correspondences on Igusa varieties, states the desired fixed-point formula (16) and proves it after a large Frobenius twist by Fujiwara's formula (Fujiwara 1997 Cor. 5.4.5; Varshavsky Thm 2.3.2)
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, proof of Lemma 5.5.1, p. 743. records that the proof of Shin's Lemma 6.4 rests on Lemma 6.3, i.e. on Fujiwara's formula for the datum at hand

Checks:

- For g = 1 and N large, the fixed points of (Fr^s)^N are the 𝔽_{p^{sN}}-points of the model, and the formula is the Grothendieck–Lefschetz trace formula for the open variety with compact supports.
- Small powers are outside the theorem’s guaranteed range. The source does not prove a failure example for every small N.
- The bound M′ does not depend on ξ.

### ET.5.3 Endoscopy of J_b through the Levi M_b

Target `ET.5/jb-endoscopic-levi-data` (construction).

Let b ∈ B(G_{ℚ_p}) be decent with slope cocharacter ν_b, M_b the centralizer of ν_b (a Levi subgroup of G_{ℚ_p}) and J_b the inner form of M_b given by b (BunGAndNewtonStrata:BG0/sigma-centralizer-J-b). For an endoscopic triple (H, s, η) of G over ℚ_p define: E_p(M_b, G) and E_p(J_b, G), the sets of G-endoscopic triples (M_H, s_H, η_H) for M_b and for J_b; the subsets E^ef_p(M_b, G; H) of classes for which some γ_{M_H} ∈ M_H(ℚ_p) and γ_H ∈ H(ℚ_p) correspond, with γ_{M_H} ν_b-acceptable, and E^eff_p(J_b, G; H) ⊂ E^ef_p(M_b, G; H) similarly for J_b (Shin 2010 §6.1–6.2). For a triple (T_H, T, j) of maximal tori T_H ⊂ H, T ⊂ M_b and j : T_H ≅ T construct the cocharacter ν : 𝔻 → H (ν_b followed by j^{-1}), the centralizer H_ν = Z_H(ν), and complete it to a G-endoscopic triple (H_ν, s_ν, η_ν) for M_b with embeddings l_{M_b}, l_{M_H}, i_{M_H}, ν_{M_H} fixed as in Shin 2010 §6.2; this gives the representatives used for the transfer at p.

Hypotheses and conventions:

- b decent; the endoscopic triples are ordinary (no twist) over ℚ_p
- Each M_H is quasi-split. The torus map j is the admissible map determined by the endoscopic datum, not an arbitrary isomorphism of ℚ_p-tori.

Proof plan:

- Compare root systems: R(H_ν, T_H) ⊂ R(M_b, T) and the coroots satisfying α^∨(s) = 1 (Shin 2010 (6.4)).
- Construct the L-embedding of ^LH_ν into ^LM_b compatible with η via the Levi L-embedding of ReductiveGroupsPartII:RG2.5/l-group-levi-embedding.
- Show the injection E^eff_p(J_b,G;H) ↪ E^ef_p(M_b,G;H) and the bijection between related pairs (Shin 2010 (6.1)–(6.2), Lemmas 6.1–6.2).
- The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

Direct prerequisites:

- `ET.0/endoscopic-datum`
- `ReductiveGroupsPartII:RG2.5/l-group-levi-embedding`
- `ET.0/inner-twist`

Sources:

- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.2, p. 10. defines M_b and J_b and the inner twist between them
- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.1–6.2, (6.1)–(6.4) and Lemmas 6.1–6.2, pp. 17–20. defines the sets of (effective) endoscopic triples for M_b and J_b and constructs the representatives (M_H, s_H, η_H) from tori
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1, pp. 739–740. uses E^eff_p(J_b, G, G_n⃗) (attributed there to Shin's §6.2) to define the map Red^b_n⃗

Planning API:

- `JbEndoscopicTriples` (constructor): E_p(J_b,G) and E_p(M_b,G), sets of G-endoscopic triples for J_b and M_b.
- `JbEndoscopicTriples.effective` (constructor): E^eff_p(J_b,G;H) ⊂ E^ef_p(M_b,G;H), defined by the existence of related ν_b-acceptable elements.
- `JbEndoscopicTriples.ofTori` (constructor): (H_ν, s_ν, η_ν) built from (T_H, T, j).
- `JbEndoscopicTriples.effective_injective` (relation): E^eff_p(J_b,G;H) ↪ E^ef_p(M_b,G;H).
- `JbEndoscopicTriples.basic` (simp): For b basic, E_p(J_b,G) is the set of endoscopic triples of the inner form J_b of G.
- `JbEndoscopicTriples.trivial` (simp): For H = G, the only triple is (M_b, 1, id).

Uses:

- Shin 2010 Lemma 6.5: h^H_p is defined by matching κ-orbital integrals indexed by these triples
- Caraiani–Scholze 2017 Remark 5.4.1: Red^b_n⃗ is a sum over E^eff_p of Jacquet functors, transfer and the Langlands–Jacquet map
- ET.7b/newton-reduction (ET.6a packet): the representation-theoretic dual of the transfer at p

Unit tests:

- `JbEndoscopicTriples.gl_basic` (computation): For G=GL₂ and basic slope 1/2, J_b=D×, while the effective trivial datum has quasi-split endoscopic group M_H=GL₂ and s=1; it is not the triple (D×,1,id).
- `JbEndoscopicTriples.ordinary` (compatibility): Under the explicit hypothesis J_b≅M_b, the effective inner-form and quasi-split sets agree. Do not infer this solely from an undefined μ-ordinary label in general PEL data.
- `JbEndoscopicTriples.empty` (non-example): For an endoscopic H whose tori do not transfer to J_b (e.g. a split torus and J_b anisotropic modulo centre), E^eff_p(J_b,G;H) is empty.
- `JbEndoscopicTriples.trivial_test` (degenerate): For H = G the set has one element.

Checks:

- For G=GL₂ and basic slope 1/2, J_b=D×, while the effective trivial datum has quasi-split endoscopic group M_H=GL₂ and s=1; it is not the triple (D×,1,id).
- Under the explicit hypothesis J_b≅M_b, the effective inner-form and quasi-split sets agree. Do not infer this solely from an undefined μ-ordinary label in general PEL data.
- For an endoscopic H whose tori do not transfer to J_b (e.g. a split torus and J_b anisotropic modulo centre), E^eff_p(J_b,G;H) is empty.
- For H = G the set has one element.

### ET.5.4 p-adic types with field action ★

Target `ET.5/p-adic-type` (definition). Planet: p-adic types.

For a number field F₀ define a p-adic type as (M,(η_t),(n_t),κ), where M=∏_{t∈I} M_t is a nonempty finite product of CM or totally real fields, κ:F₀→M is a ℚ-algebra homomorphism, n_t is a positive integer, and η_t=Σ_{x|p}η_{t,x}[x] is an effective rational divisor supported above p with η_t+c*η_t=[p]. Here [p] has coefficient e(x/p), and pullback under a field embedding uses the ramification indices. It is simple when I is a singleton and n_t=1. Equivalence is common refinement by F₀-algebra embeddings, preserving the pulled-back η and summing multiplicities in each target factor as in Shin §8 p. 24; isomorphism and equivalence are distinct. Each equivalence class has a unique minimal representative up to isomorphism.

Hypotheses and conventions:

- M_t CM or totally real; κ is an algebra map, not a polarization or positivity datum.

Proof plan:

- Use divisor pullback with ramification multiplicities; common refinements give the equivalence relation.
- For simple types descend η in a common Galois extension to its stabilizer field; then collect distinct minimal simple types and multiplicities (Shin §8 pp. 24–25).

Direct prerequisites:

- `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`

Sources:

- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8 Definitions 8.1–8.2 and equivalence p. 24; minimal representatives p. 25. defines the rational divisors, multiplicities, algebra action and refinement equivalence

Planning API:

- `PadicType.mk` (constructor): Constructor from effective η with η+c*η=[p], positive n and κ.
- `PadicType.ext` (extensionality): For fixed labeled factors, equality follows from equality of η, n and κ. Relabeling factors gives isomorphism, not literal equality.
- `PadicType.pullback` (relation): Pullback uses e(y/x); c* and [p] commute with it.
- `PadicType.equiv` (relation): Equivalence by common refinements is reflexive, symmetric and transitive.
- `PadicType.minimal` (relation): Minimal representatives are unique up to F₀-algebra isomorphism.

Uses:

- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Normalization and constructors used by the dependent targets identified in the review.

Unit tests:

- `PadicType.ordinary` (computation): For an imaginary quadratic M in which p splits as x·xᶜ, η=[x] and n=1 satisfy η+c*η=[p], with slopes 1 and 0.
- `PadicType.real` (computation): For M=ℚ, c=1 forces η=(1/2)[p]; η=0 fails the balancing equation.
- `PadicType.product` (computation): The product of two inequivalent simple types with multiplicities 2 and 3 is a type; it is not simple and its factors cannot be dropped.
- `PadicType.ramified_pullback` (computation): For a ramified quadratic extension of local factors, coefficient 1 pulls back to coefficient 2, not 1; this preserves [p].

Checks:

- For an imaginary quadratic M in which p splits as x·xᶜ, η=[x] and n=1 satisfy η+c*η=[p], with slopes 1 and 0.
- For M=ℚ, c=1 forces η=(1/2)[p]; η=0 fails the balancing equation.
- The product of two inequivalent simple types with multiplicities 2 and 3 is a type; it is not simple and its factors cannot be dropped.
- For a ramified quadratic extension of local factors, coefficient 1 pulls back to coefficient 2, not 1; this preserves [p].

### ET.5.5 Kottwitz triples for Igusa varieties and their invariant ★

Target `ET.5/igusa-kottwitz-triples` (definition). Planet: Kottwitz triples for Igusa varieties.

With the PEL datum and b as in ET.5/acceptable-test-functions: a Kottwitz triple of type b is (γ_0; γ, δ) with γ_0 ∈ G(ℚ) semisimple and elliptic in G(ℝ), γ ∈ G(𝔸_f^p) conjugate to γ_0 over 𝔸_f^p, and δ ∈ J_b(ℚ_p) acceptable and conjugate to γ_0 in G(ℚ̄_p) (after transport over ℚ̄_p through the inner twist; J_b need not be ℚ_p-isomorphic to M_b), up to the equivalence generated by conjugating γ_0 stably, γ in G(𝔸_f^p) and δ in J_b(ℚ_p). KT_b is the set of equivalence classes. For each triple with stable centralizer I_0 the Kottwitz invariant α(γ_0; γ, δ) ∈ 𝔎(I_0/ℚ)^D is defined from local invariants inv_v(γ_0, γ_v) for v ≠ p, ∞ (ET.0/rational-classes-in-stable-class), the invariant α_p(γ_0; δ) obtained from the class of δ in B(I_0) through the Kottwitz map, and the archimedean invariant; the triple is effective if α(γ_0; γ, δ) is trivial, and KT_b^eff ⊂ KT_b is the set of effective classes. The group I_δ (the ordinary connected centralizer of δ in J_b) is an inner form of I_0 over ℚ_p, and α_p changes by inv_p when δ or γ_0 is replaced by a stably conjugate element.

Hypotheses and conventions:

- unramified PEL datum of type (A) or (C)
- δ acceptable

Proof plan:

- The definition is Shin 2009 Definitions 10.1, 10.3 and 10.7, with α defined in §10 from the cocycles c_v and the Kottwitz map (displays (27)–(28)); Shin 2010 Definition 4.2 and §§4.2–4.3 give the same notion with α̃_p.
- Lemma 10.8 (I_δ is an inner form of I_0) and Lemma 10.9 (change of invariants) follow from the inner-twist theory of ET.0/inner-twist and the Kottwitz map of BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps.
- The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

Direct prerequisites:

- `ET.0/rational-classes-in-stable-class`
- `ET.0/global-kottwitz-obstruction`
- `ET.0/inner-twist`
- `ET.5/acceptable-test-functions`

Sources:

- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §10, Definitions 10.1, 10.3, 10.7 and Lemmas 10.8–10.9, pp. 28–32. defines Kottwitz triples of type b, their equivalence, the Kottwitz invariant and effective triples, and proves that I_δ is an inner form of I_0 and how the invariants change
- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.2, Definition 4.2 and Lemma 4.3, pp. 13–14; §4.3, p. 14. restates Kottwitz triples with ν_b-acceptable δ and defines α̃_p(γ_0, δ)

Planning API:

- `KottwitzTriple` (constructor): Triples (γ_0;γ,δ) with γ_0 elliptic semisimple, γ ~ γ_0 away from p, δ acceptable with δ ~ γ_0 at p.
- `KottwitzTriple.equiv` (extensionality): Equivalence generated by stable conjugation of γ_0 and conjugation of γ and δ.
- `KottwitzTriple.invariant` (data): α(γ_0;γ,δ) ∈ 𝔎(I_0/ℚ)^D from local invariants and the Kottwitz map at p.
- `KottwitzTriple.IsEffective` (constructor): Effective iff α is trivial.
- `KottwitzTriple.innerForm` (projection): I_δ is an inner form of I_0 over ℚ_p.
- `KottwitzTriple.invariant_change` (relation): α_p(γ_0;δ′) = α_p(γ_0;δ) + inv_p(δ,δ′) and α_p(γ′_0;δ) = α_p(γ_0;δ) + inv_p(γ_0,γ′_0).

Uses:

- Shin 2009 Theorem 13.1: the counting formula is a sum over KT_b^eff
- Shin 2010 §§5–6: the stabilisation regroups effective triples by κ ∈ 𝔎(I_0/ℚ) and endoscopic triples
- Kottwitz 1992 (19.5): the analogous formula for Shimura varieties, to which Shin's is modelled (Remark 13.3)

Unit tests:

- `KottwitzTriple.gm` (computation): For G = 𝔾_m-type data every triple is (z;z,z) with z central and all triples are effective.
- `KottwitzTriple.not_acceptable` (non-example): (γ_0;γ,δ) with δ not acceptable is excluded; including it would break the transfer at p (ET.5/transfer-at-p).
- `KottwitzTriple.trivial_kernel` (degenerate): If 𝔎(I_0/ℚ) = 1 then KT_b^eff = KT_b over γ_0.
- `KottwitzTriple.compat_shimura` (compatibility): Even for basic b these are ordinary conjugacy triples with δ∈J_b(ℚ_p). Kottwitz 1992 uses a σ-conjugacy variable over an unramified extension; Shin 2009 Remark 13.3 p. 42 warns that no explicit identification of the two indexing sets is supplied.

Checks:

- For G = 𝔾_m-type data every triple is (z;z,z) with z central and all triples are effective.
- (γ_0;γ,δ) with δ not acceptable is excluded; including it would break the transfer at p (ET.5/transfer-at-p).
- If 𝔎(I_0/ℚ) = 1 then KT_b^eff = KT_b over γ_0.
- Even for basic b these are ordinary conjugacy triples with δ∈J_b(ℚ_p). Kottwitz 1992 uses a σ-conjugacy variable over an unramified extension; Shin 2009 Remark 13.3 p. 42 warns that no explicit identification of the two indexing sets is supplied.

### ET.5.6 Transfer at p from J_b to endoscopic groups of G ★

Target `ET.5/transfer-at-p` (theorem). Planet: Endoscopic transfer at p for Igusa varieties.

Let (H,s,η) be an elliptic endoscopic triple of G and φ_p ∈ C_c^∞(J_b(ℚ_p)) acceptable. (a) (Nonstandard transfer, Shin 2010 Lemma 3.9) If φ ∈ C_c^∞(M_0(ℚ_p)) is supported on ν-acceptable elements and has vanishing orbital integrals at semisimple m with disconnected centralizer, there is φ̃ ∈ C_c^∞(G_0(ℚ_p)) with O^{G_0}_g(φ̃) = δ_P(ν)(m)^{-1} O^{M_0}_m(φ) when g is conjugate to an acceptable m and 0 otherwise. (b) (Transfer-factor identity, Lemma 6.3) For each (M_H, s_H, η_H) ∈ E^eff_p(J_b,G;H) there is a non-zero constant c_{M_H}, depending only on the normalisation of the transfer factor Δ_p(·,·)_{J_b M_H}, with c_{M_H} Δ_p(γ_H, δ)_{J_b M_H} = ⟨α̃_p(γ_0, δ), κ̃⟩^{-1} Δ_p(γ_H, γ_0)_{M_b M_H} for related γ_H, γ_0, δ; in the GL case c_{M_H}=e_p(J_b) μ₁(s₂)⟨ν̂_b^{M_H},s₁⟩⁻¹ (Shin (8.7), p. 28), and when J_b≅M_b the formula is c_{M_H}=μ₁(s₂)⟨κ_{Z(M_b)}(z),s₁⟩⁻¹ ((8.11), p. 29). Neither hypothesis forces c_{M_H}=1; for H=G the trivial datum gives c=e_p(J_b) (Remark 6.4 p. 21). (c) (Lemma 6.5) There is h^H_p ∈ C_c^∞(H(ℚ_p)) such that for every (G,H)-regular semisimple γ_H, SO(h^H_p) at γ_H equals the κ̃-weighted orbital integral O_p(γ_0, κ̃, φ_p) if (H,s,η,γ_H) is effectively related to some δ, and 0 otherwise; h^H_p is obtained by transfer from J_b(ℚ_p) to M_H(ℚ_p) (through the quasi-split M_b) followed by the nonstandard transfer (a) from M_H to H. Dually, on representations, tr π_H(h^H_p) = tr(Red^b_H(π_H))(φ_p) where Red^b_H = n-Red^b_H ⊗ δ̄^{1/2}_{P(ν_b)} includes the modulus twist δ̄_{P(ν_b)}(δ) = δ_{P(ν_b)}(γ_0) (Shin 2010 §6; the corrected form of Caraiani–Scholze 2017 Lemma 5.4.2, erratum E74 of the CS17 extraction); the representation-theoretic map itself is planned in ET.7b/newton-reduction.

Hypotheses and conventions:

- φ_p acceptable (essential for (a))
- transfer factors normalised as in Shin 2010 §6.3

Proof plan:

- (a): Shin 2010 Lemma 3.9 (cf. Harris–Taylor Lemma V.5.2), descending orbital integrals along the parabolic with Levi M_0 defined by ν, using that acceptable elements are regular for the unipotent radical.
- (b): compare Kottwitz invariants with the Langlands–Shelstad factors of ET.1/local-transfer-factor through the inner twist J_b → M_b (Shin 2010 §6.4, proof of Lemma 6.3).
- First put φ₀=φ_p·δ_{bar P(ν_b)}^(1/2). Transfer φ₀ from J_b to each quasi-split M_H using the chosen L-embedding, then multiply by δ_{P(iν)}^(−1/2) and apply Lemma 3.9. Sum over the embedding classes I(M_H,H), modulo the indicated outer action, with c_{M_H} and the coefficients of Shin §6.3 pp. 21–22. Lemma 6.5 proves the resulting stable-orbital identity. Omitting either modulus or the constants changes the trace formula.

Direct prerequisites:

- `ET.5/jb-endoscopic-levi-data`
- `ET.5/acceptable-test-functions`
- `ET.1/local-transfer-factor`
- `ET.3/local-transfer-existence`
- `ET.3/inner-form-transfer`
- `ET.0/kottwitz-sign`
- `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`

Sources:

- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.4, Lemma 3.9 and Corollary 3.10, p. 12. proves the nonstandard transfer of functions supported on ν-acceptable elements of a Levi to the group
- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.3–6.4, Lemmas 6.3 and 6.5, pp. 21–25; §8, pp. 27–28. proves the identity between the Kottwitz invariant and transfer factors with constant c_{M_H}, constructs h^H_p, and computes c_{M_H} in the GL and J_b ≅ M_b cases
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1, pp. 739–740. describes φ^n⃗_p as transfer from J_b(ℚ_p) to M_{G_n⃗}(ℚ_p) followed by nonstandard transfer to G_n⃗(ℚ_p)

Checks:

- For H = G and b basic, h^G_p is the transfer of φ_p from the inner form J_b to G, multiplied by the Kottwitz sign e(J_b).
- When J_b≅M_b, c=μ₁(s₂)⟨κ_{Z(M_b)}(z),s₁⟩⁻¹, not an unconditional 1.
- A nonacceptable φ_p is outside the hypotheses of the transfer construction; no universal impossibility of transfer is asserted.

### ET.5.7 Acceptable functions determine virtual representations

Target `ET.5/acceptable-functions-determine` (theorem).

If Π_1, Π_2 ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)) satisfy tr Π_1(φ) = tr Π_2(φ) for every acceptable φ, then Π_1 = Π_2. Consequently a linear identity between traces proved for acceptable φ_p (such as ET.5/stable-igusa-trace-formula composed with a spectral expansion) extends to every φ_p ∈ C_c^∞(J_b(ℚ_p)) once both sides are expressed as finite combinations of traces of irreducible representations.

Hypotheses and conventions:

- Π_1, Π_2 in the Grothendieck group of admissible representations

Proof plan:

- At fixed compact-open level admissibility leaves finitely many eigenvalues of the invertible central action t on the invariant spaces. Group equal eigenvalues; do not claim their individual characters are all distinct.
- Twist φ by powers t^z of the central element t = fr^s; for z ≫ 0 the twists are acceptable (ET.5/igusa-fixed-point-formula (c)), and tr π_i(φ^{(z)}) = χ_i(t)^(−z) tr π_i(φ).
- The aggregate traces are a finite linear combination Σ_λ a_λ λ^(−z) with distinct nonzero λ. If it vanishes for all sufficiently large z, a Vandermonde system forces all a_λ=0, hence equality also at z=0 (Shin Lemma 6.4 p. 20).

Direct prerequisites:

- `ET.5/igusa-fixed-point-formula`
- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`

Sources:

- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Lemma 6.4 and proof, p. 19. proves that traces against acceptable functions determine elements of the Grothendieck group, by Frobenius twisting and linear independence
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, proof of Lemma 5.5.1, p. 743. uses the lemma to remove acceptability; the Frobenius element twisted is a central element of J_b(ℚ_p) acting on φ_p

Checks:

- If Π_1 and Π_2 differ by a representation on which t acts by a scalar, the twist argument detects it.
- The statement fails if 'acceptable' is replaced by a class not stable under central Frobenius twists.
- Trivial for Π_1 = Π_2.

### ET.5.8 p-adic types and Honda–Tate theory with endomorphism structure

Target `ET.5/p-adic-types` (theorem).

For the semisimple category AV_B^0 of pairs (A,i) over 𝔽̄_p, with i:B→End⁰(A) a ℚ-algebra map and rational B-linear morphisms, where B is the PEL semisimple algebra with centre F and splits at p, isomorphism classes correspond to equivalence classes of p-adic types over F (ET.5/p-adic-type). For a minimal simple type (M_t,η_t), the centralizer division algebra C_t has the local invariants of Shin (23), p. 26; its slope at x|p is η_x/e(x/p) and the height is [M_{t,x}:ℚ_p]√[B:F]√[C_t:M_t]. For multiplicity n_t multiply that height by n_t. Corollary 8.5 restricts this classification to objects B_p-linearly quasi-isogenous to Σ_b by equality of each slope and each F_v-height. This classification is unpolarized. Kottwitz triples determine such types by Lemma 10.4 and Corollary 10.6; the polarization obstruction and effective-triple bijection are separate targets of §§11–12.

Hypotheses and conventions:

- The PEL algebra B and its centre F as in Shin §8; B splits at p.
- Objects and morphisms are considered up to isogeny; neither a polarization nor its obstruction is part of Proposition 8.4 or Corollary 8.5.

Proof plan:

- Use Tate Hom and Honda–Tate for simple abelian varieties, then semisimplicity of AV_B^0 to record distinct simple factors and multiplicities.
- Compute the B-centralizer algebras and the slopes and heights as in Shin Proposition 8.4 (23), p. 26; compare them with Σ_b for Corollary 8.5.
- Attach the type to a Kottwitz triple using Shin Lemma 10.4 and Corollary 10.6, pp. 30–31. Add polarization only in ET.5/fixed-points-and-effective-triples.

Direct prerequisites:

- `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`
- `AbelianSchemesAndArithmeticModuliPartII:F0/tate-hom`
- `PELModuli:M1/pel-abelian-scheme`
- `ET.5/igusa-kottwitz-triples`
- `ET.5/p-adic-type`

Sources:

- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8, Definitions 8.1–8.2, Remark 8.3, Proposition 8.4, Corollary 8.5 and Lemma 8.6, pp. 23–26. introduces p-adic types, relates simple types to Harris–Taylor's, and classifies isogeny classes with endomorphism structure through Honda–Tate theory
- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §10, Lemma 10.4 and Corollary 10.6, pp. 29–30. attaches a p-adic type to each Kottwitz triple

Checks:

- A supersingular elliptic curve over 𝔽_{p²} with Frobenius p has a real Weil number and End^0 the quaternion algebra ramified exactly at p and ∞.
- An ordinary elliptic curve has a type with M imaginary quadratic split at p.
- A Weil number that is not a q-Weil number gives no type.

### ET.5.9 Fixed points of Igusa correspondences are counted by effective triples

Target `ET.5/fixed-points-and-effective-triples` (theorem).

Let PIC_b be the near-equivalence classes of polarized PEL objects over 𝔽̄_p with the specified p-divisible-group structure. For z∈PIC_b, H_z is its algebraic group of PEL self-quasi-isogenies. Define FPAV_b by pairs (z,[a]) with a∈H_z(ℚ) acceptable, up to H_z(ℚ)-conjugacy (Shin Definition 9.7 p. 29). Lemmas 12.1 and 12.3 give a bijection FPAV_b→KT_b^eff: the auxiliary polarization invariants imply α=0 and vanishing α permits the converse construction. The centralizer Z_{H_z}(a), not the stabilizer of a neat-level point, is an inner form of I₀ compact modulo centre at infinity. The fixed-point description at a level is a quotient of the corresponding adelic level sets; Lemma 7.4 produces orbital integrals and centralizer-volume weights. The aggregate coefficient is then computed in the counting formula; it is not a pointwise |ker¹(ℚ,G)| multiplicity assertion.

Hypotheses and conventions:

- unramified PEL datum; polarizations up to near equivalence (Shin 2009 §9)

Proof plan:

- Describe Ig_b(𝔽̄_p) through polarized abelian varieties with an isomorphism of p-divisible groups to Σ_b (Shin 2009 §7, Lemma 7.1, Definition 7.2, Lemmas 7.3–7.4).
- Classify isogeny classes by p-adic types (ET.5/p-adic-types) and polarizations by Shin 2009 §9 (Lemmas 9.2–9.6), then attach a Kottwitz triple (Lemma 12.1) and prove effectivity from the vanishing of the auxiliary invariants (§11).
- Surjectivity onto effective triples uses Honda–Tate existence and the Hasse principle for the PEL group (PELModuli:M3/ker1-classification, M3/hasse-principle-cases), with ker^1 multiplicities as in Kottwitz 1992 §§14–19.
- This node is the Igusa-variety form of the Langlands–Kottwitz parametrisation; the Shimura-variety form for compact unitary data is AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity and is not replanned here.
- The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

Direct prerequisites:

- `ET.5/p-adic-types`
- `ET.5/igusa-kottwitz-triples`
- `PELModuli:M3/ker1-classification`
- `PELModuli:M3/hasse-principle-cases`

Sources:

- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §7, Lemmas 7.1, 7.3, 7.4, pp. 20–22; §9, Definition 9.7, p. 28. describes 𝔽̄_p-points of Igusa varieties and the fixed points of correspondences in terms of polarized abelian varieties
- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §§11–12, Lemma 11.1, Corollary 11.3, Lemmas 12.1 and 12.3, pp. 35–38. proves that triples from abelian varieties are effective and that FPAV_b → KT_b^eff is a bijection

Checks:

- For a CM point (b basic, I_0 a torus) the fibre over a triple is a single I_φ(ℚ)-orbit.
- If α(γ_0;γ,δ) ≠ 0 the triple has no abelian variety over it.
- The count is independent of the choice of Σ_b in its isogeny class.

### ET.5.10 Shin's point-counting formula for Igusa varieties ★

Target `ET.5/igusa-counting-formula` (theorem). Planet: Point-counting formula for Igusa varieties.

If φ ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) is acceptable, then tr(φ | H_c(Ig_b, L_ξ)) = Σ_{(γ_0;γ,δ) ∈ KT_b^eff} vol(I_∞(ℝ)^1)^{-1} |A(I_0)| tr ξ(γ_0) · O^{G(𝔸_f^p) × J_b(ℚ_p)}_{(γ,δ)}(φ), the orbital integral taken over I_{(γ,δ)}(𝔸_f^p × ℚ_p) with the transported Haar measures, I_∞ the inner form of I_0 compact modulo centre at ∞ and A_ℚ(I_0) = π_0(Z(Î_0)^Γ)^D (Kottwitz 1986 §§1–2; Shin 2010 §2.2), a finite group for elliptic γ_0, which sits in the exact sequence 1 → 𝔎(I_0/ℚ)^D → A_ℚ(I_0) → A_ℚ(G) → 1 (the analogue of the ker^1 and Tamagawa factors of Kottwitz 1992 (19.5)). The only implicit hypothesis is that Ig_b comes from an unramified integral PEL datum.

Hypotheses and conventions:

- unramified integral PEL datum of type (A) or (C) at p
- φ acceptable

Proof plan:

- Start from the fixed-point formula (ET.5/igusa-fixed-point-formula) and the parametrisation of fixed points by effective triples (ET.5/fixed-points-and-effective-triples).
- Regroup the fixed points over each triple as an orbital integral of φ with the volume of I_φ and the ker^1 multiplicity (Shin 2009 §13).
- Use Shin Theorem 13.1 p. 42 for the Igusa coefficient. Remark 13.3 compares the shape with Kottwitz (19.5) while explicitly leaving the relation between their indexing sets implicit; no direct identification is used.

Direct prerequisites:

- `ET.5/igusa-fixed-point-formula`
- `ET.5/fixed-points-and-effective-triples`
- `ET.1/orbital-integral`
- `AdelicAlgebraicGroups:AA.2/tamagawa-measure`

Sources:

- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §13, Theorem 13.1 and Remarks 13.2–13.3, p. 41. proves the counting formula for acceptable functions as a sum over effective Kottwitz triples, with the only implicit hypothesis an unramified integral PEL datum
- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.4, Theorem 4.4 and display (4.3), p. 15. restates the formula as the input to stabilisation

Checks:

- For b basic and g = 1, φ = 1_{U^p} ⊗ 1_{δ K_p}, the formula counts fixed points of δ on the zero-dimensional basic Igusa variety.
- For φ supported on non-acceptable δ the formula is not asserted.
- Both sides are linear in φ.

### ET.5.11 Stabilization of the Igusa counting formula away from p and ∞

Target `ET.5/stabilization-away-from-p` (theorem).

In the formula of ET.5/igusa-counting-formula, write the sum over effective triples as a sum over (γ_0, κ) with κ ∈ 𝔎(I_0/ℚ) by Fourier inversion of the Kottwitz invariant. Then: (a) e_v(I_v) = 1 for almost all v ≠ p, ∞, and for effective triples the product of the local signs is controlled (Shin 2010 Lemma 5.1); (b) for each (H, s, η) elliptic and each γ_H transferring to γ_0, there is h^{H,p} ∈ C_c^∞(H(𝔸_f^p)) (a Langlands–Shelstad transfer of φ^p, unramified-matching at almost all places) whose stable orbital integrals equal the κ-orbital integrals of φ^p (Lemma 5.2), and h_{H,∞} a combination of averaged pseudo-coefficients whose stable orbital integrals reproduce the archimedean factor vol(I_∞(ℝ)^1)^{-1} tr ξ(γ_0) with the sign ⟨μ, s⟩ convention of Kottwitz (Lemma 5.4 and Remark 5.5). The twisted fundamental lemma is not needed on this route: away from p only ordinary transfer and the ordinary fundamental lemma enter, and at p the transfer of ET.5/transfer-at-p is used.

Hypotheses and conventions:

- the ordinary transfer factors of ET.1/local-transfer-factor with Kottwitz's sign convention (Shin 2010 Remark 5.5: s versus s^{-1})
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

Proof plan:

- Rewrite α(γ_0;γ,δ) through 𝔎(I_0/ℚ)^D and its local components (ET.0/global-kottwitz-obstruction).
- Away from p and ∞ use Langlands–Shelstad transfer (ET.3/local-transfer-existence) and the fundamental lemma at almost all places (ET.3/fundamental-lemma-almost-all-places).
- At ∞ use the pseudo-coefficient transfer of ET.1/archimedean-pseudocoefficient-transfer (Kottwitz 1990 §7).
- The wording 'unproved twisted fundamental lemma' of the older stage text is replaced: the twisted fundamental lemma is proved for unit elements (Waldspurger with Ngô) and for spherical functions (Lemaire–Mœglin–Waldspurger 2018), see ET.3/twisted-fundamental-lemma-and-transfer; this route simply does not invoke it.

Direct prerequisites:

- `ET.5/igusa-counting-formula`
- `ET.0/global-kottwitz-obstruction`
- `ET.3/local-transfer-existence`
- `ET.3/fundamental-lemma-almost-all-places`
- `ET.1/archimedean-pseudocoefficient-transfer`
- `ET.1/local-transfer-factor`
- `ET.3/twisted-fundamental-lemma-and-transfer`

Sources:

- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5, Lemmas 5.1, 5.2, 5.4 and Remarks 5.3, 5.5, 5.6, pp. 15–17. performs the first stabilisation step and constructs the functions h_{H,p} away from p and h_{H,∞} at infinity
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Definition 5.2.2, pp. 732–733. defines φ^H away from p by Langlands–Shelstad transfer and at ∞ by Kottwitz's construction

Checks:

- For H = G and κ = 1 the transfer is the identity and the sign is 1.
- For G with 𝔎(I_0/ℚ) trivial for all γ_0 (no endoscopy), the stabilisation away from p is the identity.
- If φ^p is unramified at v, h^{H,p}_v is the unramified image.

### ET.5.12 The endoscopic test functions φ^H attached to an Igusa test function

Target `ET.5/igusa-endoscopic-test-function` (construction).

For φ = φ^p φ_p ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) acceptable and (H,s,η) ∈ E^ell(G), define φ^H = h^{H,p} h^H_p h^H_∞ ∈ C_c^∞(H(𝔸)): h^{H,p} a Langlands–Shelstad transfer of φ^p (unramified image at almost all places), h^H_p the function of ET.5/transfer-at-p, and h^H_∞ the general PEL archimedean function of ET.5/stabilization-away-from-p (and ET.4/archimedean-lefschetz-functions for the unitary specialization) (Kottwitz's combination of averaged pseudo-coefficients, φ^n⃗_∞ for the unitary groups). For the unitary similitude datum of Caraiani–Scholze with G ≅ G_N over 𝔸_f and the test function φ = φ_p · 1_{K(N)} · φ^S (φ^S unramified, K(N) principal congruence at S_pf with N_0 | N), φ^n⃗ = φ^n⃗_p · φ^n⃗_{S_pf} · φ^{n⃗,S} · φ^n⃗_∞ with φ^{n⃗,S} = η̃*_n⃗(φ^S) (ET.4/unramified-transfers) and φ^n⃗_{S_pf} the Langlands–Shelstad transfer of 1_{K(N)}.

Hypotheses and conventions:

- φ acceptable
- the level N divisible by N_0 of ET.4/small-level-transfer in the non-compact datum
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

Proof plan:

- Assemble the local constructions: Shin 2010 §7; Caraiani–Scholze 2017 Definition 5.2.2; Caraiani–Scholze non-compact Definition 5.3.1.

Direct prerequisites:

- `ET.5/transfer-at-p`
- `ET.5/stabilization-away-from-p`
- `ET.4/archimedean-lefschetz-functions`
- `ET.4/unramified-transfers`
- `ET.4/small-level-transfer`
- `ET.5/stabilization-away-from-p`

Sources:

- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §7, p. 26. assembles h_H from the local functions at p, away from p and at ∞
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Definition 5.2.2, pp. 732–733. defines φ^H := φ^{H,p} φ^H_p φ^H_∞ for acceptable φ and elliptic (H,s,η)
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Definition 5.3.1, p. 68. defines φ^n⃗ for the non-compact datum with φ^n⃗_{S_pf} the Langlands–Shelstad transfer and φ^{n⃗,S} = η̃*(φ^S)

Planning API:

- `igusaEndoscopicTestFunction` (constructor): φ ↦ φ^H = h^{H,p} h^H_p h^H_∞.
- `igusaEndoscopicTestFunction.stableOrbital` (characterisation): SO_{γ_H}(φ^H) equals the κ-weighted combination of orbital integrals of φ at the related triples, and 0 if no triple is related.
- `igusaEndoscopicTestFunction.unramified` (simp): At an unramified place v ∉ S, (φ^H)_v = η̃*(φ_v).
- `igusaEndoscopicTestFunction.trivial` (simp): For H = G, φ^G away from p is φ^p.
- `igusaEndoscopicTestFunction.linear` (structure): φ ↦ φ^H is linear modulo functions with vanishing stable orbital integrals.

Uses:

- Shin 2010 Theorem 7.2: the stable Igusa trace formula is Σ ι(G,H) ST^H_e(φ^H)
- Caraiani–Scholze non-compact Theorem 5.6.1: φ^n⃗ is BC-matched with f^n⃗ to pass to the twisted trace formula
- ET.7b/csnc-test-functions (ET.6a packet): the explicit test-function package of the non-compact datum

Unit tests:

- `igusaEndoscopicTestFunction.basic_gl` (computation): For G = GL_n-type, b basic and H = G, φ^G_p is the Jacquet–Langlands transfer of φ_p from D^× to GL_n with sign e(D^×) = (−1)^{n−1}.
- `igusaEndoscopicTestFunction.unramified_test` (compatibility): At v ∉ S, φ^H_v is the Satake transfer η̃*(φ_v) of ET.4/unramified-transfers.
- `igusaEndoscopicTestFunction.no_relation` (degenerate): If E^eff_p(J_b,G;H) is empty then φ^H_p has vanishing stable orbital integrals and ST^H_e(φ^H) = 0.
- `igusaEndoscopicTestFunction.not_naive` (non-example): For nonbasic b, transfer starts with a modulus-twisted function on J_b and passes through M_H with the constants of ET.5/transfer-at-p. Treating it as ordinary transfer directly from G misses these factors. If J_b=G and b is basic, ordinary transfer is the valid degenerate case.

Checks:

- For G = GL_n-type, b basic and H = G, φ^G_p is the Jacquet–Langlands transfer of φ_p from D^× to GL_n with sign e(D^×) = (−1)^{n−1}.
- At v ∉ S, φ^H_v is the Satake transfer η̃*(φ_v) of ET.4/unramified-transfers.
- If E^eff_p(J_b,G;H) is empty then φ^H_p has vanishing stable orbital integrals and ST^H_e(φ^H) = 0.
- For nonbasic b, transfer starts with a modulus-twisted function on J_b and passes through M_H with the constants of ET.5/transfer-at-p. Treating it as ordinary transfer directly from G misses these factors. If J_b=G and b is basic, ordinary transfer is the valid degenerate case.

### ET.5.13 Shin's stable trace formula for Igusa varieties ★

Target `ET.5/stable-igusa-trace-formula` (theorem). Planet: Shin's stable trace formula for Igusa varieties.

Let G come from an unramified integral PEL datum of type (A) or (C), b ∈ B(G_{ℚ_p}, −μ), Ig_b the Igusa variety and L_ξ the sheaf of an irreducible algebraic representation ξ. For every acceptable φ ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) written as a finite sum of product functions, with the local transfer extended linearly in the stable cocentre, tr(φ | ι_ℓ H_c(Ig_b, L_ξ)) = |ker^1(ℚ, G)| Σ_{(H,s,η) ∈ E^ell(G)} ι(G,H) ST^H_e(φ^H), with φ^H as in ET.5/igusa-endoscopic-test-function and ST^H_e, ι(G,H) as in ET.4/stable-elliptic-distribution. The formula holds for every PEL datum of type (A) or (C), in particular for the compact unitary data of Caraiani–Scholze 2017 §5.1 (any rank, any signature) and the quasi-split unitary datum of the non-compact sequel.

Hypotheses and conventions:

- unramified integral PEL datum of type (A) or (C) at p; K_p hyperspecial
- φ acceptable

Proof plan:

- Start from the counting formula ET.5/igusa-counting-formula.
- Stabilise away from p and ∞ (ET.5/stabilization-away-from-p) and at p (ET.5/transfer-at-p), then sum over κ and endoscopic triples with the global product formula of ET.0/global-kottwitz-obstruction (c) (Shin 2010 §7, Lemma 7.1).
- Collect the Tamagawa numbers and |Out| into ι(G,H) with ET.4/tamagawa-number-formula and the ker^1 factor from Kottwitz's formula (Shin 2010 Theorem 7.2).

Direct prerequisites:

- `ET.5/igusa-counting-formula`
- `ET.5/stabilization-away-from-p`
- `ET.5/transfer-at-p`
- `ET.5/igusa-endoscopic-test-function`
- `ET.4/stable-elliptic-distribution`
- `ET.4/elliptic-stabilization`
- `ET.4/tamagawa-number-formula`
- `ET.0/global-kottwitz-obstruction`

Sources:

- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), Theorem 1.1 (= Theorem 7.2), pp. 2 and 27; Remark 7.3. proves the stable trace formula for Igusa varieties for acceptable test functions
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Theorem 5.2.3 and Remark 5.2.4, p. 734. restates it and notes that it holds for every PEL datum of type (A) or (C)
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Theorem 5.3.2, p. 68. restates it for the non-compact sequel's quasi-split unitary datum

Checks:

- If G has no non-trivial elliptic endoscopy and b is basic, the formula reads tr(φ | H_c(Ig_b)) = |ker^1(ℚ,G)| ι(G,G) ST^G_e(φ^G).
- For φ = 0 both sides vanish.
- The numbering coincidence with Kottwitz 1990 Theorem 7.2 is accidental; the Igusa formula is the analogue of Kottwitz's stable formula for Shimura varieties (Remark 7.3).

### ET.5.14 The stable Igusa formula for unitary similitude groups of every rank and signature

Target `ET.5/unitary-igusa-trace-formula` (application).

Let G be the unitary similitude group of Caraiani–Scholze 2017 §5.1 (rank N arbitrary, G_ℝ of arbitrary signature, quasi-split at all finite places, F^+ ≠ ℚ) or of the non-compact sequel §5.1 (G ≅ G_{2n} quasi-split, p split in F_0). Then E^ell(G) = E^ell(G_N) is represented by (G_N,1,id) and (G_{n_1,n_2}, s_{n_1,n_2}, η_{n_1,n_2}) with n_1 + n_2 = N, n_1 ≥ n_2 > 0, omitting (n_1,n_2) when n_1, n_2 and [F^+:ℚ] are all odd, and for acceptable φ = φ^S φ_{S_f∖p} φ_p, tr(φ | ι_ℓ [H_c(Ig^b, ℚ̄_ℓ)]) = |ker^1(ℚ,G)| Σ_{n⃗} ι(G, G_n⃗) ST^{G_n⃗}_e(φ^n⃗) with φ^n⃗ as in ET.5/igusa-endoscopic-test-function. Combined with ET.4/stable-twisted-identity this gives the twisted spectral expression of the Igusa trace used by ET.7b.

Hypotheses and conventions:

- the unitary data stated; [F^+:ℚ] ≥ 2 for the twisted step

Proof plan:

- Specialise ET.5/stable-igusa-trace-formula with the endoscopic data of ET.0/unitary-elliptic-endoscopic-data (Caraiani–Scholze 2017 Corollary 5.2.5 and Remark 5.2.6; non-compact Theorem 5.3.2).
- For the spectral expression, BC-match φ^n⃗ with f^n⃗ and apply ET.4/stable-twisted-identity (Caraiani–Scholze 2017 Theorem 5.3.2; non-compact Theorem 5.6.1).
- The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

Direct prerequisites:

- `ET.5/stable-igusa-trace-formula`
- `ET.0/unitary-elliptic-endoscopic-data`
- `ET.4/stable-twisted-identity`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Corollary 5.2.5 and Remark 5.2.6, pp. 734–735; §5.3, Theorem 5.3.2, pp. 737–738. specialises Shin's formula to unitary groups of arbitrary signature and expresses it through twisted spectral sides
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.2, p. 67; §5.3, Theorem 5.3.2, p. 68; §5.6, Theorem 5.6.1, p. 75. gives the endoscopic data with Kottwitz's exclusion and the twisted spectral expression for the non-compact datum

Checks:

- For N = 1 the formula is a statement about a zero-dimensional Igusa variety for a torus.
- For n_1 = n_2 the coefficient carries |Out| = 2.
- The excluded odd–odd–odd pairs contribute nothing.

### ET.5.15 Worked checks for the Igusa counting and stabilisation

Target `ET.5/acceptance-examples` (application).

(1) For a basic GL₂ local factor J_b=D×, the trivial endoscopic transfer carries c=e_p(D×)=−1; this local example does not assert that every global Igusa variety with such a factor is zero-dimensional. (2) If J_b≅M_b, use c=μ₁(s₂)⟨κ_{Z(M_b)}(z),s₁⟩⁻¹ from Shin (8.11), p. 29; it need not be 1. (3) At two slopes, 1_{J_b(ℤ_p)} fails the support condition because the identity has equal valuations; the large negative Frobenius shift makes the test function acceptable. Failure of acceptability does not by itself prove failure of a particular naive fixed-point equality. (4) For unitary similitude data with all block sizes even, |ker¹(ℚ,G)|=1 (Shin Remark 3.2 p. 14).

Hypotheses and conventions:

- the data of the cited nodes

Proof plan:

- Each check is a direct specialisation.

Direct prerequisites:

- `ET.5/stable-igusa-trace-formula`
- `ET.5/transfer-at-p`
- `ET.5/igusa-fixed-point-formula`
- `ET.4/tamagawa-number-formula`

Sources:

- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §8.1–8.2, pp. 27–28. computes the constant c_{M_H} for general linear groups and when J_b ≅ M_b
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Remark 3.2, p. 14. records when ker^1 is trivial for G_n⃗

Checks:

- A wrong sign at p in (1), a missing constant in (2) or a naive Lefschetz formula in (3) would each be detected.

## ET.6 — inherited corrected targets

These targets retain the reviewed packet statements. They are outside this revision’s coverage.

### ET.6.1 Segments of cuspidal representations and their linking

Target `ET.6/cuspidal-segment` (definition).

Let F be a non-archimedean local field of characteristic 0 and ν = |det| the unramified character of every GL_d(F). Let C be the set of isomorphism classes of irreducible supercuspidal representations of the groups GL_d(F), d ≥ 1. A segment is a finite set Δ = [ρ, ν^{k−1}ρ] = {ρ, νρ, …, ν^{k−1}ρ} ⊂ C with ρ ∈ C and k ≥ 1; its length is k, its degree kd, its beginning ρ and its end ν^{k−1}ρ. In the real-endpoint convention of Atobe–Kondo–Yasuda, [a,b]_ρ with b − a ∈ ℤ_{≥0} denotes {ν^a ρ, …, ν^b ρ}, presentations differing by an unramified twist that fixes ρ being identified. Two segments Δ_1, Δ_2 are linked if Δ_1 ∪ Δ_2 is a segment and neither contains the other; if they are linked, Δ_1 precedes Δ_2 if the beginning of Δ_2 is ν^j times the beginning of Δ_1 with j > 0; they are juxtaposed if Δ_1 ∩ Δ_2 = ∅ and Δ_1 ∪ Δ_2 is a segment. A multisegment is a finite multiset of segments; its degree is the sum of the degrees.

Hypotheses and conventions:

- F of characteristic 0 (the definitions make sense in general; the layer uses characteristic 0)
- ρ supercuspidal (SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations)

Proof plan:

- The definitions are Zelevinsky 1980 §3 (segments) and §4.1 (linked, precedes); the real-endpoint presentation is that of Atobe–Kondo–Yasuda §2.1, whose type-χ lines use integral endpoints.

Direct prerequisites:

- `SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations`
- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`
- `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`

Sources:

- [A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §3 (pp. 180–183) and §4.1 (p. 184). defines segments of cuspidal representations and the relations linked and precedes
- [H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), §2.1 pp. 6–7. uses segments [a,b]_ρ with real endpoints and integral endpoints on type-χ lines, and the same linkedness and precedence

Planning API:

- `Segment` (constructor): Segment.mk ρ k : the segment [ρ, ν^{k−1}ρ] for ρ supercuspidal and k ≥ 1.
- `Segment.length` (projection): The number k of cuspidals in the segment.
- `Segment.beginning` (projection): The cuspidal ρ at the start; Segment.ending is ν^{k−1}ρ.
- `Segment.Linked` (relation): Δ_1 ∪ Δ_2 is a segment and neither contains the other.
- `Segment.Precedes` (relation): Linked and beginning(Δ_2) = ν^j beginning(Δ_1) with j > 0.
- `Segment.twist` (functoriality): (χ ⊗ Δ) = {χρ, …} for a character χ; twisting preserves linking.
- `Multisegment` (constructor): Finite multisets of segments, with degree the sum of degrees.

Uses:

- Zelevinsky 1980 Theorems 4.2, 6.1, 9.7: classification and irreducibility criteria are phrased by linkedness
- Scholze 2010 §3 (Lemma 3.1): the Langlands quotient ⊞π_0[(t+1)/2 − i] uses Bernstein–Zelevinsky precedence
- ET.6/segment-wd-parameter: each segment determines a Weil–Deligne block σ ⊗ Sp_k

Unit tests:

- `Segment.linked_example` (computation): [1, ν] and [ν, ν²] on GL_1 are linked and [1,ν] precedes [ν,ν²].
- `Segment.length_one` (degenerate): A segment of length 1 is linked to {νρ} and {ν^{-1}ρ} and to no other segment of length 1.
- `Segment.containment_not_linked` (non-example): [1, ν²] and [ν] are not linked although their union is a segment.
- `Segment.precedes_irrefl` (characterisation): No segment precedes itself and precedence is asymmetric.

Checks:

- [1, ν] and [ν, ν²] on GL_1 are linked and [1,ν] precedes [ν,ν²].
- A segment of length 1 is linked to {νρ} and {ν^{-1}ρ} and to no other segment of length 1.
- [1, ν²] and [ν] are not linked although their union is a segment.
- No segment precedes itself and precedence is asymmetric.

### ET.6.2 Functorial extensions of local class field theory and Henniart's characterization

Target `ET.6/llc-characterizing-properties` (definition).

A family π↦σ_F(π) of n-dimensional semisimple W_F-representations, for all finite F/ℚ_p and all n≥1, is a functorial extension of class field theory if it is natural under field isomorphisms and satisfies Scholze Theorem 12.1: (i) rank one is local reciprocity with geometric Frobenius; (ii) a subquotient of normalized induction has the direct sum of the inducing parameters; (iii) twisting by χ∘det tensors the parameter with σ_F(χ); (iv) prime-degree cyclic base change of a supercuspidal π restricts its parameter to W_E; (v) if σ_F(π) is unramified, π has an Iwahori-fixed vector. The existing ClassFieldTheory roadmap uses arithmetic reciprocity; define Art_geo(x)=Art_arith(x⁻¹) in W_F^ab, so (i) means σ_F(χ)=χ∘Art_geo⁻¹. Determinants and duals are later conclusions, not substitute axioms for (v). Henniart’s uniqueness characterization by factors of pairs is a separate target, requiring the factor comparison of ET.6/l-epsilon-of-pairs.

Hypotheses and conventions:

- F a finite extension of ℚ_p; Art_F normalised by geometric Frobenius

Proof plan:

- Use exactly Theorem 12.1 and Definition 12.2, Scholze pp. 30–31. Condition (v) drives the finite base-change induction in Theorem 12.3. Transport the existing arithmetic reciprocity normalization by inversion in the abelian target; no inversion map on the nonabelian Weil group is asserted.
- The additional uniqueness theorem uses equality of L and ε of supercuspidal pairs, as recalled in Scholze §1 p. 2; its primary proof remains to be supplied.

Direct prerequisites:

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`
- `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`
- `ET.4/local-cyclic-base-change`
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, Theorem 12.1 and Definition 12.2, pp. 30–31. lists the functorial properties of π ↦ σ(π) and defines a functorial extension of class field theory
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, p. 2. recalls Henniart's characterization of the correspondence by ε-factors of pairs

Planning API:

- `IsFunctorialExtensionCFT` (constructor): The conjunction of naturality under field isomorphisms and conditions (i)–(v) of Scholze Theorem 12.1, as stated above.
- `IsFunctorialExtensionCFT.degree_one` (simp): σ_F(χ) = χ ∘ Art_F^{-1} for n = 1.
- `IsFunctorialExtensionCFT.twist` (relation): σ_F(π ⊗ χ) = σ_F(π) ⊗ σ_F(χ).
- `IsFunctorialExtensionCFT.induction` (relation): σ_F is additive along parabolic induction.
- `IsFunctorialExtensionCFT.baseChange` (relation): For supercuspidal π and E/F cyclic of prime degree, σ_E(BC(π))=σ_F(π)|W_E.
- `henniart_uniqueness` (characterisation): At most one family of bijections on supercuspidals with (i)–(iv) and equality of L and ε of pairs.
- `IsFunctorialExtensionCFT.unramified_implies_iwahori` (relation): If σ_F(π) is unramified, π has a nonzero Iwahori-fixed vector.
- `IsFunctorialExtensionCFT.natural` (relation): Transport of π and σ along F≅F′ commutes with the family.

Uses:

- Scholze 2010 Theorem 12.3: any functorial extension of class field theory is bijective on supercuspidals
- ET.6/full-wd-local-langlands: the uniqueness of the correspondence
- Atobe–Kondo–Yasuda Lemma 2.9; Caraiani–Scholze non-compact §5.1: consumers rely on these normalisations

Unit tests:

- `IsFunctorialExtensionCFT.gl1` (computation): For n = 1 the unique family is local class field theory with geometric Frobenius normalisation.
- `IsFunctorialExtensionCFT.arithmetic_frobenius` (non-example): Normalising Art_F by arithmetic Frobenius gives a family violating (i) as stated (it is the contragredient family).
- `IsFunctorialExtensionCFT.unramified` (compatibility): On unramified principal series the family gives the sum of the unramified characters with the Satake parameters of SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter.
- `IsFunctorialExtensionCFT.steinberg_ss` (degenerate): With the fixed normalized σ and geometric Frobenius, σ_F(St₂)=|·|^(−1/2)⊕|·|^(1/2), not 1⊕|·|. It is unramified and St₂ has Iwahori-fixed vectors.

Checks:

- For n = 1 the unique family is local class field theory with geometric Frobenius normalisation.
- Normalising Art_F by arithmetic Frobenius gives a family violating (i) as stated (it is the contragredient family).
- On unramified principal series the family gives the sum of the unramified characters with the Satake parameters of SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter.
- With the fixed normalized σ and geometric Frobenius, σ_F(St₂)=|·|^(−1/2)⊕|·|^(1/2), not 1⊕|·|. It is unramified and St₂ has Iwahori-fixed vectors.

### ET.6.3 Deformation spaces of one-dimensional ϖ-divisible O-modules with Drinfeld level structure

Target `ET.6/drinfeld-level-deformation-spaces` (construction).

Let F/ℚ_p be finite with ring of integers O, uniformizer ϖ and residue field 𝔽_q, F_r the unramified extension of degree r with ring O_r, and ŎF the completion of the maximal unramified extension. A ϖ-divisible O-module over a scheme S on which p is locally nilpotent is a p-divisible group H with an O-action whose two induced actions on Lie H agree. For β ∈ GL_n(O_r) diag(ϖ, 1, …, 1) GL_n(O_r), let H_β be the one-dimensional ϖ-divisible O-module of height n over 𝔽_{q^r} determined by β (its Dieudonné module has σ-semilinear Frobenius F=βσ). (a) The formal deformation space R_β of H_β (as ϖ-divisible O-module) is formally smooth, isomorphic to O_r[[T_1, …, T_{n−1}]]. (b) For m ≥ 0 the covering R_{β,m} parametrising Drinfeld level-m structures (sections X_1, …, X_n of the universal deformation forming a full set of sections of its ϖ^m-torsion in Drinfeld's sense) is regular, finite over R_β and Galois with group GL_n(O/ϖ^m), étale in the generic fibre. (c) R_{β,m} algebraises: there is a separated flat scheme of finite type over O_r with smooth generic fibre and GL_n(O/ϖ^m)-action with a finite stable special-fibre subscheme Z such that its completion along Z is R_{β,m}. (d) The nearby-cycle cohomology H^0(R^iψ Spf R_{β,m}, ℚ̄_ℓ) is a finite-dimensional continuous representation of W_{F_r} × GL_n(O/ϖ^m), zero outside 0 ≤ i ≤ n−1.

Hypotheses and conventions:

- F of characteristic 0 (p-divisible groups do not exist in the equal-characteristic analogue with the same hypotheses)
- ℓ ≠ p
- H_β one-dimensional of height n

Proof plan:

- (a),(b): Drinfeld's theory of level structures (Drinfeld 1974), as recalled in Scholze 2010 Definition 2.2 and Proposition 2.3; the deformation theory of p-divisible groups is that of FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2.
- (c): Scholze 2010 Theorem 2.4, constructing ℛ_{β,m} from moduli of Drinfeld level structures.
- (d): Scholze 2010 Theorem 2.5 (Berkovich's nearby cycles for formal schemes; ClassicalAdicEtaleCohomology:H1:formal-adic-comparison and LefschetzPencilsAndVanishingCycles:LPV.6), independence of ℓ by Mieda.

Direct prerequisites:

- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`
- `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`
- `LefschetzPencilsAndVanishingCycles:LPV.6`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §2, Definitions 2.1–2.2, Proposition 2.3, Theorems 2.4–2.5, pp. 6–8. defines ϖ-divisible O-modules, the deformation space R_β and its Drinfeld-level covers, proves their structure, algebraisation and the finiteness and vanishing range of nearby cycles

Planning API:

- `DeformationSpace` (constructor): R_β, the deformation ring of H_β as a ϖ-divisible O-module.
- `DeformationSpace.formallySmooth` (characterisation): R_β ≅ O_r[[T_1, …, T_{n−1}]].
- `DrinfeldLevelCover` (constructor): R_{β,m}, parametrising Drinfeld level-ϖ^m structures.
- `DrinfeldLevelCover.regular` (characterisation): R_{β,m} is a regular semilocal ring (it need not be local when the étale part is nontrivial).
- `DrinfeldLevelCover.galois` (structure): R_{β,m}/R_β is finite with GL_n(O/ϖ^m)-action, whose generic fibre is a Galois cover. This does not assert an étale cover in the special fibre.
- `DrinfeldLevelCover.transition` (functoriality): The transition maps R_{β,m} → R_{β,m+1} are finite flat and GL_n-equivariant.
- `DrinfeldLevelCover.algebraize` (other): An algebraic model of finite type over O_r with smooth generic fibre.
- `nearbyCycles_finite` (other): The nearby-cycle cohomology is finite-dimensional and vanishes outside degrees 0..n−1.

Uses:

- Scholze 2010 Theorem 2.6: the test function φ_{τ,h} is defined by traces on nearby cycles of R_{β,m}
- ET.6a/lubin-tate-tower (ET.6a packet): the Lubin–Tate tower's generic fibres are the rigid generic fibres of these spaces
- Scholze 2010 Lemma 9.2: completed local rings of the Shimura variety at Drinfeld level are these spaces

Unit tests:

- `DrinfeldLevelCover.height_one` (computation): For n = 1, R_{β,m} is the ring of integers of the level-m Lubin–Tate extension over F_r.
- `DrinfeldLevelCover.level_zero` (degenerate): R_{β,0} = R_β.
- `DrinfeldLevelCover.not_etale_special` (non-example): For n=1, q>2 and m=1, the Lubin–Tate torsion extension has ramification degree q−1>1; its integral cover is not étale. The blanket claim for all m≥1 would fail when q=2,m=1.
- `DeformationSpace.dimension` (compatibility): R_β has Krull dimension n, i.e. relative dimension n − 1 over O_r, the dimension of the Lubin–Tate space.

Checks:

- For n = 1, R_{β,m} is the ring of integers of the level-m Lubin–Tate extension over F_r.
- R_{β,0} = R_β.
- For n=1, q>2 and m=1, the Lubin–Tate torsion extension has ramification degree q−1>1; its integral cover is not étale. The blanket claim for all m≥1 would fail when q=2,m=1.
- R_β has Krull dimension n, i.e. relative dimension n − 1 over O_r, the dimension of the Lubin–Tate space.

### ET.6.4 Norm maps for D-groups and base-change identities for the test functions

Target `ET.6/norm-maps-and-base-change-identities` (theorem).

Let D be a semisimple algebra over ℚ_p with maximal order O_D. (a) There is a bijection β ↦ Nβ between (O_D ⊗ ℤ_{p^r})^×-σ_0-conjugacy classes in (O_D ⊗ ℤ_{p^r})^× and O_D^×-conjugacy classes in O_D^×, under which the characteristic polynomial of Nβ equals that of β β^{σ_0} ⋯ β^{σ_0^{r−1}}; for h on O_D^× conjugation-invariant, the function φ_h(β) = h(Nβ) on (O_D ⊗ ℤ_{p^r})^× has matching twisted orbital integrals with h, and ∫ φ_h = ∫ h (Scholze 2010 Proposition 4.2, Proposition 4.3, Corollary 4.5). (b) For the height-n infinitesimal one-dimensional ϖ-divisible O-module, let B_r be the basic elements in GL_n(O_r)diag(ϖ,1,…,1)GL_n(O_r), and let D_r be the elements of valuation r in the central division algebra of invariant 1/n, with valuation of a division uniformizer 1. There is a norm correspondence between σ-conjugacy classes in B_r and conjugacy classes in D_r, with the associated orbital and integral identities (Proposition 4.6, Proposition 4.7, Corollary 4.8). For D = M_n(ℚ_p) and h = 1_{GL_n(ℤ_p)} this is the usual base-change identity for the unit element.

Hypotheses and conventions:

- semisimple D over ℚ_p with maximal order; unramified extension of degree r

Proof plan:

- Interpret σ_0-conjugacy classes as isomorphism classes of D-groups (étale p-divisible groups with O_D^op-action) over 𝔽_{p^r} and Nβ as the Frobenius over 𝔽_p (Scholze 2010 Definition 4.1, §4).
- Matching of twisted orbital integrals: compare the counting of D-groups over 𝔽_{p^r} and over 𝔽_p (Proposition 4.3, Remark 4.4).
- The integral identities follow from the Weyl integration formula (ET.4/padic-character-distributions, ET.4/twisted-characters).

Direct prerequisites:

- `ET.4/twisted-characters`
- `ET.4/padic-character-distributions`
- `ET.3/base-change-fundamental-lemma-and-transfer`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §4, Definition 4.1, Propositions 4.2–4.3, Remark 4.4, Corollary 4.5, Propositions 4.6–4.7, Corollary 4.8, pp. 11–13. constructs norm maps for D-groups and proves the matching of twisted orbital integrals and the integral identities

Checks:

- For D = ℚ_p, N is the norm from ℤ_{p^r}^× to ℤ_p^×.
- For D = M_n(ℚ_p) and h = 1_{GL_n(ℤ_p)}, φ_h = 1_{GL_n(ℤ_{p^r})}, the unit base-change identity (ET.3/base-change-fundamental-lemma-and-transfer (a)).
- ∫ φ_h = ∫ h is the case of the identity term.

### ET.6.5 Representations attached to segments: Zelevinsky, Steinberg and Speh representations

Target `ET.6/segment-representations` (construction).

For a segment Δ = [ρ, ν^{k−1}ρ] with ρ a supercuspidal representation of GL_d(F), the normalised parabolic induction ρ × νρ × … × ν^{k−1}ρ of GL_{kd}(F) has a unique irreducible subrepresentation Z(Δ) = ⟨Δ⟩ and a unique irreducible quotient L(Δ). L(Δ) is essentially square-integrable, and every essentially square-integrable irreducible representation of GL_n(F) is L(Δ) for a unique segment (Bernstein). For ρ = χ a character of GL_1, Z([χ, ν^{k−1}χ]) is the character χν^{(k−1)/2}∘det and L([χ, ν^{k−1}χ]) is the twisted Steinberg representation St_k(χν^{(k−1)/2}). For an irreducible tempered π of GL_n(F) and m ≥ 1, the Speh representation Sp(π, m) is the unique irreducible subrepresentation of π ν^{−(m−1)/2} × … × π ν^{(m−1)/2}; for π = L(Δ) square-integrable and unitary it is Tadić's u(π, m), the unique irreducible quotient of ν^{(m−1)/2}π × … × ν^{−(m−1)/2}π.

Hypotheses and conventions:

- ρ supercuspidal; normalised parabolic induction of SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction

Proof plan:

- Uniqueness of sub and quotient: Zelevinsky 1980 §3 and Proposition 2.10 (multiplicity-free support); the exactly-one-derivative property ⟨Δ⟩^{(d)} = ⟨Δ^−⟩ is Theorem 3.5.
- Essential square-integrability of L(Δ) and the converse: Zelevinsky 1980 Theorem 9.3 (Bernstein), proved by Casselman's criterion on exponents (SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion).
- Steinberg case: SmoothRepresentationsOfLocalGroups:SR.3/steinberg; Speh representations: Tadić 1986 Definition 7.4 and Atobe–Kondo–Yasuda Example 2.5(4).

Direct prerequisites:

- `ET.6/cuspidal-segment`
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`
- `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`
- `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`
- `SmoothRepresentationsOfLocalGroups:SR.3/steinberg`
- `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`
- `SmoothRepresentationsOfLocalGroups:SR.5/mirabolic-derivatives`

Sources:

- [A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §3, Theorem 3.5 (p. 182); §9, Theorem 9.3 (p. 198). constructs ⟨Δ⟩ as the unique irreducible submodule, computes its derivatives, and identifies the quasi-square-integrable representations with segment representations (Bernstein's theorem)
- [M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), §7, Definition 7.4, p. 370. defines u(δ, n) as the unique irreducible quotient of the twisted product of n copies of δ
- [H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), Example 2.5(4) and §8.2. defines the tempered Speh representation Sp(π, m) as a unique irreducible subrepresentation

Planning API:

- `Segment.zelevinskyRep` (constructor): Z(Δ), the unique irreducible subrepresentation of ρ × νρ × … × ν^{k−1}ρ.
- `Segment.langlandsRep` (constructor): L(Δ), the unique irreducible quotient of the same induced representation.
- `Segment.langlandsRep_essSqInt` (characterisation): L(Δ) is essentially square-integrable.
- `Segment.langlandsRep_surj` (characterisation): Every essentially square-integrable irreducible representation of GL_n(F) is L(Δ) for a unique Δ.
- `Segment.zelevinskyRep_derivative` (simp): For ρ on GL_d, the only positive nonzero derivative of Z(Δ) has order d, and equals Z(Δ^−). If k=1 this is the trivial representation of GL₀. The order is d, not the segment length k.
- `Segment.langlandsRep_twist` (functoriality): L(χ ⊗ Δ) ≅ (χ∘det) ⊗ L(Δ).
- `speh` (constructor): Sp(π, m) for π irreducible tempered.
- `speh_one` (simp): Sp(π, 1) = π.

Uses:

- Scholze 2010 Theorem 10.2: existence of rec for essentially square-integrable and generalized Speh representations is proved globally first
- ET.6/segment-wd-parameter: L(Δ) corresponds to the Weil–Deligne block rec(ρ) ⊗ Sp_k
- ET.7a/speh-representation (ET.6a packet): the global Speh datum is built from local Speh representations

Unit tests:

- `Segment.langlandsRep_steinberg` (compatibility): L([ν^{-1/2}, ν^{1/2}]) is the Steinberg representation of SmoothRepresentationsOfLocalGroups:SR.3/steinberg.
- `Segment.zelevinskyRep_trivial` (computation): Z([ν^{-1/2}, ν^{1/2}]) is the trivial representation of GL_2(F).
- `Segment.length_one_reps` (degenerate): For k = 1 both representations are ρ.
- `Segment.zelevinsky_not_square_integrable` (non-example): Z(Δ) is not square-integrable for k ≥ 2 and d = 1: the trivial character of GL_2(F) has no square-integrable twist.

Checks:

- L([ν^{-1/2}, ν^{1/2}]) is the Steinberg representation of SmoothRepresentationsOfLocalGroups:SR.3/steinberg.
- Z([ν^{-1/2}, ν^{1/2}]) is the trivial representation of GL_2(F).
- For k = 1 both representations are ρ.
- Z(Δ) is not square-integrable for k ≥ 2 and d = 1: the trivial character of GL_2(F) has no square-integrable twist.

### ET.6.6 Scholze's test functions φ_{τ,h} and f_{τ,h} ★

Target `ET.6/scholze-test-functions` (construction). Planet: Scholze's test functions φ_{τ,h}.

Fix ℓ ≠ p, τ ∈ Frob^r I_F ⊂ W_F with r ≥ 1 (Frob geometric) and h ∈ C_c^∞(GL_n(O)) with values in ℚ, and set h^∨(g) = h(ᵗg^{-1}). Define φ_{τ,h} on GL_n(F_r) by φ_{τ,h}(β) = tr(τ × h^∨ | [Rψ_β]) for β ∈ GL_n(O_r) diag(ϖ,1,…,1) GL_n(O_r), where [Rψ_β] is the alternating sum of the nearby-cycle cohomology of R_{β,m} for m large enough that h is bi-invariant under 1 + ϖ^m M_n(O) (ET.6/drinfeld-level-deformation-spaces (d)), and φ_{τ,h}(β) = 0 for other β. Then φ_{τ,h} ∈ C_c^∞(GL_n(F_r)) takes values in ℚ and is independent of ℓ. Let f_{τ,h} ∈ C_c^∞(GL_n(F)) be a function with matching (twisted) orbital integrals: the orbital integrals of f_{τ,h} at regular elements equal the σ-twisted orbital integrals of φ_{τ,h} at elements with that norm, and vanish at non-norms (ET.4/local-cyclic-base-change; ET.6/norm-maps-and-base-change-identities). f_{τ,h} is not unique, but its orbital integrals and its traces on representations are well defined.

Hypotheses and conventions:

- F finite over ℚ_p; r ≥ 1 so that τ lies over a positive power of geometric Frobenius
- h ℚ-valued and conjugation-invariant enough that h^∨ acts

Proof plan:

- Local constancy in β follows from the algebraisation and the finite group action (Scholze 2010 Theorem 2.4, Theorem 2.6 proof); compact support from the double-coset condition.
- Rationality and independence of ℓ: Mieda's theorem (Scholze 2010 Theorem 2.6).
- Existence of f_{τ,h}: the base change of functions for GL_n along the unramified extension F_r/F (Arthur–Clozel Ch. 1 §3, Proposition 3.1; ET.3/base-change-fundamental-lemma-and-transfer (c)).

Direct prerequisites:

- `ET.6/drinfeld-level-deformation-spaces`
- `ET.4/twisted-characters`
- `ET.3/base-change-fundamental-lemma-and-transfer`
- `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1 Theorem 1.1 p. 3; §2 Theorems 2.6–2.7 pp. 8–9. defines φ_{τ,h} by the trace of τ × h^∨ on nearby cycles, proves it is locally constant, compactly supported, ℚ-valued and independent of ℓ, and defines f_{τ,h} by matching twisted orbital integrals

Planning API:

- `scholzePhi` (constructor): φ_{τ,h}(β) = tr(τ × h^∨ | [Rψ_β]) on the double coset, 0 elsewhere.
- `scholzePhi_locallyConstant` (characterisation): φ_{τ,h} ∈ C_c^∞(GL_n(F_r)).
- `scholzePhi_rational` (other): φ_{τ,h} is ℚ-valued and independent of ℓ.
- `scholzeF` (constructor): f_{τ,h}, any function on GL_n(F) whose orbital integrals match the twisted orbital integrals of φ_{τ,h}.
- `scholzeF_trace_wellDefined` (characterisation): tr(f_{τ,h} | π) is independent of the choice of f_{τ,h}.
- `scholzePhi_linear_h` (simp): φ_{τ,h} is linear in h.
- `scholzePhi_support` (simp): φ_{τ,h} vanishes off GL_n(O_r) diag(ϖ,1,…,1) GL_n(O_r).

Uses:

- Scholze 2010 Theorem 1.2: rec(π) is characterised by tr(f_{τ,h} | π) = tr(τ | rec(π)) tr(h | π)
- Scholze 2010 Theorem 9.3: φ_{τ,h} is the test function at p in the Langlands–Kottwitz point count at Drinfeld level
- Scholze–Shin, Conjecture 7.1 and Theorem 8.1: endoscopic transfers f^H_{τ,h} of φ_{τ,h} for general Shimura varieties (not planned here)

Unit tests:

- `scholzePhi_gl1` (computation): For n = 1, tr(f_{τ,h} | χ) = χ(Art_F^{-1}(τ)) tr(h | χ): Theorem 1.2(a) for n = 1 is local class field theory.
- `scholzePhi_unramified` (compatibility): At any fixed β and τ, φ_{τ,h₁+h₂}(β)=φ_{τ,h₁}(β)+φ_{τ,h₂}(β), and φ_{τ,0}=0. This tests the linear trace construction without importing an unread comparison with Kottwitz’s spherical function.
- `scholzePhi_off_coset` (degenerate): φ_{τ,h}(1) = 0, since 1 is not in the double coset of diag(ϖ,1,…,1).
- `scholzeF_not_unique` (non-example): Two choices of f_{τ,h} may differ as functions; only their orbital integrals and traces are determined.

Checks:

- For n = 1, tr(f_{τ,h} | χ) = χ(Art_F^{-1}(τ)) tr(h | χ): Theorem 1.2(a) for n = 1 is local class field theory.
- At any fixed β and τ, φ_{τ,h₁+h₂}(β)=φ_{τ,h₁}(β)+φ_{τ,h₂}(β), and φ_{τ,0}=0. This tests the linear trace construction without importing an unread comparison with Kottwitz’s spherical function.
- φ_{τ,h}(1) = 0, since 1 is not in the double coset of diag(ϖ,1,…,1).
- Two choices of f_{τ,h} may differ as functions; only their orbital integrals and traces are determined.

### ET.6.7 Zelevinsky and Langlands classifications of irreducible representations of GL_n ★

Target `ET.6/zelevinsky-classification` (theorem). Planet: Zelevinsky classification.

(a) If Δ_1, …, Δ_r are segments ordered so that Δ_i does not precede Δ_j for i < j, then Z(Δ_1) × … × Z(Δ_r) has a unique irreducible subrepresentation Z(m), depending only on the multisegment m = {Δ_1, …, Δ_r}, and L(Δ_1) × … × L(Δ_r) has a unique irreducible quotient L(m); m ↦ Z(m) and m ↦ L(m) are bijections from multisegments of degree n to irreducible representations of GL_n(F). (b) Z(Δ_1) × … × Z(Δ_r) is irreducible iff no two Δ_i are linked; the same for the L(Δ_i). (c) Every irreducible generic representation is L(Δ_1) × … × L(Δ_r) with pairwise unlinked segments, the multiset being unique; such products are generic. (d) Z(m)^∨ = Z(m^∨) with m^∨ the multisegment of contragredient segments; the highest derivative of Z(m) is Z(m^−), m^− obtained by truncating each segment at its end; Z(m_1 + … + m_p) occurs with multiplicity one in Z(m_1) × … × Z(m_p). (e) There is an involution m ↦ m^# (Zelevinsky's involution, computed by the Mœglin–Waldspurger algorithm) with L(m) = Z(m^#). (f) The cuspidal support of Z(m) and of L(m) is the multiset union of the segments; L(m) is the Langlands quotient of SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification with essentially square-integrable data L(Δ_i).

Hypotheses and conventions:

- F non-archimedean of characteristic 0
- representations irreducible and smooth (hence admissible)

Proof plan:

- Zelevinsky Theorem 6.1 pp. 188–189 for (a), Theorem 4.2 p. 184 for (b), Theorem 9.7 p. 200 for (c), Theorem 7.10 p. 194 and Theorem 8.1 and Proposition 8.4 pp. 195–196 for (d). For (e), AKY §2.3 pp. 7–8 records the dual and references a later proof. Zelevinsky §9 pp. 199–203 does not prove the Mœglin–Waldspurger algorithm: a primary proof and explicit algorithm remain a gap.
- Derivatives are the mirabolic functors of SmoothRepresentationsOfLocalGroups:SR.5/mirabolic-derivatives; Jacquet modules and the geometric lemma (SR.2/geometric-lemma) compute the composition factors.
- Compatibility with the general Langlands classification: identify the tempered data with products of unitary L(Δ) and the exponents with the segment centres.

Direct prerequisites:

- `ET.6/segment-representations`
- `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`
- `SmoothRepresentationsOfLocalGroups:SR.5/mirabolic-derivatives`
- `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`
- `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`
- `SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals`
- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`

Sources:

- [A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Theorem 6.1 (pp. 188–189), Theorem 4.2 (p. 184), Theorem 7.10 (p. 194), Theorem 8.1 and Proposition 8.4 (pp. 195–196), Theorem 9.7 and §9 (pp. 199–203). Classifies irreducibles, gives linkedness, genericity, derivatives and multiplicity one; the later Mœglin–Waldspurger algorithm is not proved in this article.
- [H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), §2.1 pp. 6–7, §2.3 pp. 7–8 and Remark 2.6 p. 9. records the Zelevinsky and Langlands conventions Z(m), L(m) and L(m) = Z(m^#) used for newforms

Checks:

- For n = 2 and ρ = 1: the multisegments of degree 2 supported on {ν^{-1/2}, ν^{1/2}} are {[ν^{-1/2},ν^{1/2}]} and {[ν^{-1/2}],[ν^{1/2}]}; Z gives the trivial and the Steinberg representation respectively (for the second, order the segments as [ν^{1/2}], [ν^{-1/2}] so that no segment precedes one listed after it), while L gives Steinberg and the trivial representation.
- (b) for two characters χ_1, χ_2 of GL_1: χ_1 × χ_2 is irreducible iff χ_1χ_2^{-1} ≠ ν^{±1}.
- The involution # exchanges trivial and Steinberg for GL_2.

### ET.6.8 Comparison of the test functions with deformation spaces of (O, D′)-groups

Target `ET.6/comparison-of-two-functions` (theorem).

For a semisimple D′ over ℚ_p with maximal order O_{D′}, an (O, D′)-group is a p-divisible group H with O_D^op = M_n(O)^op × O_{D′}^op-action decomposing as H_n × H′ with H_n of the type of ET.6/drinfeld-level-deformation-spaces and H′ étale. (a) The deformation space R_H of such an H is canonically R_β, and its level-m version R_{H,m} ≅ R_{β,m} × (H′[p^m])^× (Scholze 2010 Proposition 7.3); (b) Rψ_H ≅ Rψ_β ⊗ C_c^∞(O_{D′}^×) W_{F_r} × G_D(ℤ_p)-equivariantly (Corollary 7.4); (c) for any τ, h, h′ the function φ_{τ,h,h′} built from Rψ_H is associated with f^∨_{τ,h} ⊗ h′ (Lemma 7.5). This is the local input that lets the test function at p of the Shimura varieties of ET.6/division-algebra-shimura-varieties be expressed through φ_{τ,h}.

Hypotheses and conventions:

- D = M_n(F) × D′ as in Scholze 2010 §7; δ_0 σ_0-conjugate to ((β^{-1})^t, 1, β′) (Proposition 7.2)
- The displayed product for R_{H,m} is a fibre product over R_β after the étale torsion factor is canonically lifted. The associated function is on GL_n(F)×(D′)×, a tensor product; h×h′ is not an input to the GL_n construction.

Proof plan:

- Scholze 2010 Definition 7.1, Propositions 7.2–7.3, Corollary 7.4, Lemma 7.5: decompose the Dieudonné module along the O_D-action and identify deformations of H with deformations of H_n.

Direct prerequisites:

- `ET.6/scholze-test-functions`
- `ET.6/norm-maps-and-base-change-identities`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §7, Definition 7.1, Propositions 7.2–7.3, Corollary 7.4 and Lemma 7.5, pp. 17–18. compares deformation spaces of (O,D′)-groups with those of one-dimensional ϖ-divisible O-modules and shows the associated functions match

Checks:

- For D′ = 0 the statement is ET.6/drinfeld-level-deformation-spaces itself.
- For H′ étale, deforming H′ is trivial, which is why only a factor (H′[p^m])^× appears.
- The comparison involves h^∨ and the transpose-inverse, so a version without ∨ fails.

### ET.6.9 The local Jacquet–Langlands correspondence for inner forms of GL_n ★

Target `ET.6/local-jacquet-langlands` (theorem). Planet: Local Jacquet–Langlands correspondence.

Let D be a central division algebra of dimension d² over F, n = rd and G′ = GL_r(D), an inner form of GL_n(F) with Kottwitz sign e(G′) = (−1)^{n−r} (ET.0/kottwitz-sign). Regular semisimple g′ ∈ G′ and g ∈ GL_n(F) correspond if they have the same characteristic polynomial. There is a unique bijection JL from essentially square-integrable irreducible representations of GL_r(D) to essentially square-integrable irreducible representations of GL_n(F) such that Θ_{JL(π′)}(g) = (−1)^{n−r} Θ_{π′}(g′) for all corresponding regular elliptic g, g′ (characters as functions, ET.4/padic-character-distributions). JL preserves central characters, commutes with twists by characters (det or reduced norm), and is compatible with contragredients. For r = 1, JL is a bijection from all irreducible representations of D^× to the essentially square-integrable representations of GL_n(F), and sends the trivial representation of D^× to the Steinberg representation; for n = 2 the sign is −1.

Hypotheses and conventions:

- F of characteristic 0 (Deligne–Kazhdan–Vignéras; Badulescu in positive characteristic, not used)

Proof plan:

- Deligne–Kazhdan–Vignéras, via the simple trace formula comparison for GL_n and D^× and the transfer of functions of ET.3/inner-form-transfer; recorded at ET.3/inner-form-transfer (b) for tempered representations.
- Extension to essentially square-integrable representations by twisting; characters as functions by ET.4/padic-character-distributions.
- Badulescu §2 Theorem 2.1 pp. 3–4 records the general GL_r(D) correspondence; Scholze’s D× case alone does not supply all r. A complete primary proof of classical JL is still an imported-theory requirement.

Direct prerequisites:

- `ET.3/inner-form-transfer`
- `ET.4/padic-character-distributions`
- `ET.0/kottwitz-sign`
- `ET.6/segment-representations`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §11, p. 29; §12, p. 31. uses the Jacquet–Langlands correspondence between D^× and essentially square-integrable representations of GL_n(F), characterised by the character equality with sign
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Lemma 5.4.3 with proof, p. 741. uses the Jacquet–Langlands and Langlands–Jacquet maps of Badulescu for all inner forms
- [A. I. Badulescu, Jacquet–Langlands et unitarisabilité](https://imag.umontpellier.fr/~ioan-badulescu/Files/jimj.pdf), §2 Theorem 2.1 pp. 3–4. records classical Jacquet–Langlands on essentially square-integrable representations, with character sign

Checks:

- For n = 2 and D quaternion, JL(1_{D^×}) = St_2 with Θ_{St}(g) = −1 = −Θ_1(g′) on elliptic regular elements.
- For d = 1 (D = F) JL is the identity.
- A principal series of GL_2 is not in the image of JL.

### ET.6.10 Truncation, the ram operation and ladder multisegments

Target `ET.6/multisegment-operations` (definition).

For a segment Δ = [a, b]_ρ let Δ^− = [a, b − 1]_ρ (empty if a = b), and for a multisegment m let m^− = Σ_{Δ ∈ m} Δ^− (empty segments removed). On unipotent multisegments (ρ unramified characters of GL_1) define m^ram = ((m^#)^−)^#. A type-χ line is the set of unramified twists χν^j, j ∈ ℤ, of an unramified character χ, and a type-χ multisegment [x_1, y_1]_χ + … + [x_t, y_t]_χ is a ladder if x_1 > … > x_t and y_1 > … > y_t.

Hypotheses and conventions:

- χ unramified for ladders and for the ram operation

Proof plan:

- The definitions are Atobe–Kondo–Yasuda §§2.3–2.4 and Example 2.5(2), §6.1; Zelevinsky's m^− is the multisegment of the highest derivative (Zelevinsky 1980 Theorem 8.1).

Direct prerequisites:

- `ET.6/zelevinsky-classification`
- `ET.6/cuspidal-segment`

Sources:

- [H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), §2.3 pp. 7–8, §2.4 pp. 9–11 and Example 2.5(2) pp. 8–9. defines right truncation, the ram operation on unipotent multisegments and ladder multisegments on a type-χ line
- [A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Theorem 8.1, p. 195. identifies the highest derivative of Z(m) with Z(m^−)

Planning API:

- `Segment.truncate` (constructor): Δ^− = [a, b−1]_ρ.
- `Multisegment.truncate` (constructor): m^− = Σ Δ^−.
- `Multisegment.ram` (constructor): m^ram = ((m^#)^−)^# on unipotent multisegments.
- `Multisegment.IsLadder` (constructor): Strictly decreasing beginnings and ends on a type-χ line.
- `Multisegment.truncate_degree` (simp): deg(m^−) = deg(m) − Σ_{Δ ∈ m} deg ρ_Δ.
- `Multisegment.highestDerivative` (compatibility): Z(m)^{(max)} = Z(m^−).

Uses:

- Atobe–Kondo–Yasuda Lemma 2.9: π^ram corresponds to the Weil–Deligne quotient V/(V^I ∩ ker N)
- Atobe–Kondo–Yasuda §6: ladder determinantal formulas and constituent criteria compute newform dimensions

Unit tests:

- `Multisegment.truncate_singleton` (degenerate): {[a,a]_ρ}^− is the empty multisegment.
- `Multisegment.IsLadder_example` (computation): {[1,2]_χ, [0,1]_χ} is a ladder.
- `Multisegment.IsLadder_non` (non-example): {[0,2]_χ, [1,1]_χ} is not a ladder.
- `Multisegment.ram_steinberg` (computation): If m^#={[0,1]_χ}, then Z(m)=L([0,1]_χ) is a twisted Steinberg representation and m^ram=({[0,0]_χ})^#. The Steinberg assertion concerns Z(m), not L(m).

Checks:

- {[a,a]_ρ}^− is the empty multisegment.
- {[1,2]_χ, [0,1]_χ} is a ladder.
- {[0,2]_χ, [1,1]_χ} is not a ladder.
- If m^#={[0,1]_χ}, then Z(m)=L([0,1]_χ) is a twisted Steinberg representation and m^ram=({[0,0]_χ})^#. The Steinberg assertion concerns Z(m), not L(m).

### ET.6.11 Tadić's classification of the unitary dual and the generic unitary representations

Target `ET.6/tadic-unitary-dual` (theorem).

Let D^u be the set of unitary square-integrable irreducible representations of the GL_m(F), m ≥ 1, and B = {u(δ, n), ν^α u(δ, n) × ν^{−α} u(δ, n) : δ ∈ D^u, n ≥ 1, 0 < α < ½}. (a) Every product of elements of B is irreducible and unitary. (b) Every irreducible unitary representation of GL_n(F) is such a product, uniquely up to order. (c) In particular every irreducible generic unitary representation is irreducibly induced from τ_1 ν^{α_1} ⊗ … ⊗ τ_d ν^{α_d} ⊗ τ_0 ⊗ τ_d ν^{−α_d} ⊗ … ⊗ τ_1 ν^{−α_1} with τ_i unitary generic tempered and ½ > α_1 > … > α_d > 0 (the complementary-series exponents lie in (0, ½)), and a conjugate self-dual generic unitary representation of GL_a over a quadratic extension has this form with τ_i^* in the second half.

Hypotheses and conventions:

- F non-archimedean of characteristic 0 (Tadić's Theorem A.10 is stated for characteristic 0)
- All complementary-series exponents α and α_i are real; products use normalized induction.

Proof plan:

- Tadić 1986 Theorems 7.1, 7.3 and 7.5 (pp. 368–370) and Theorem A.10 (p. 378), using Bernstein's irreducibility of unitary parabolic induction and the Zelevinsky classification (ET.6/zelevinsky-classification).
- (c): restrict to generic members, where by ET.6/zelevinsky-classification (c) only n = 1 occurs in u(δ, n); this is the form used in Jiang–Zhang 2020 Appendix B, (B.5)–(B.6).

Direct prerequisites:

- `ET.6/zelevinsky-classification`
- `ET.6/segment-representations`
- `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`

Sources:

- [M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), Introduction Theorems A–D (p. 339); §7, Theorems 7.1, 7.3, 7.5 and Definition 7.4 (pp. 368–370); Theorem A.10 (p. 378). classifies the irreducible unitary representations of GL(n) over a non-archimedean field as products of Speh representations and complementary series with exponents in (0, ½)

Checks:

- For GL_1 the unitary dual is the unitary characters (n = 1, no complementary series).
- For GL_2, ν^α × ν^{−α} is unitary for 0 < α < ½ and not for α > ½ (except the endpoints giving one-dimensional and Steinberg constituents).
- The trivial representation of GL_2 is u(1, 2).

### ET.6.12 Geometric and harmonic descent for the test functions

Target `ET.6/test-function-descent` (theorem).

(a) (Geometric descent) The connected components of Spf(R_{β,m} ⊗ Ŏ) are parametrised by surjective O-linear maps (O/ϖ^m)^n → H_β^{ét}[ϖ^m](k̄), with GL_n(O/ϖ^m) acting transitively; the nearby cycles of R_{β,m} decompose accordingly along the connected–étale filtration (Scholze 2010 Proposition 5.1). (b) (Harmonic descent) For π the normalised parabolic induction of π_1 ⊗ … ⊗ π_t (t ≥ 2) of a Levi GL_{n_1} × … × GL_{n_t}, the trace tr(f_{τ,h} | π) is computed from the traces of the functions f_{τ,h_i} of the smaller groups on π_i (Scholze 2010 Lemmas 6.1–6.3); hence, if Theorem 1.2 holds for all n′ < n, the character identity of ET.6/scholze-local-langlands (a) holds for π with σ(π) = σ(π_1) ⊕ … ⊕ σ(π_t) (Theorem 6.4). (c) (Reduction by types) If (o) Theorem 1.2(a),(b) hold for all n′ < n, (i) the identity holds for all properly induced π, and (ii) for every essentially square-integrable or generalised Speh π there is a ℚ-linear combination rec(π) of representations with non-negative coefficients, total dimension n, satisfying the trace identity, and (iii) for supercuspidal π this rec_un(π) is a ℤ-linear virtual representation, then Theorem 1.2(a),(b) hold for n; the proof uses the theory of types to find h with prescribed traces on tempered representations and Kazhdan's density theorem (Scholze 2010 Lemmas 3.1–3.2).

Hypotheses and conventions:

- induction on n
- F finite over ℚ_p

Proof plan:

- (a): analyse the étale part of the universal deformation and Drinfeld structures (Scholze 2010 §5).
- (b): compute the twisted trace of φ_{τ,h} on the base change of an induced representation by the Jacquet module along the parabolic, matching the connected–étale decomposition (Scholze 2010 §6; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module, SR.2/geometric-lemma).
- (c): Bernstein centre and types (SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks) with Kazhdan's density theorem (Scholze 2010 §3).
- Condition (iii) is essential: positivity with rational coefficients alone does not make a genuine representation. ET.6/lubin-tate-comparison supplies integrality independently of the completed local correspondence.

Direct prerequisites:

- `ET.6/scholze-test-functions`
- `ET.6/norm-maps-and-base-change-identities`
- `ET.6/zelevinsky-classification`
- `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`
- `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`
- `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §3, Lemmas 3.1–3.2, pp. 9–10. reduces Theorem 1.2 to properly induced, essentially square-integrable and generalised Speh representations using types and Kazhdan's density theorem
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §5, Proposition 5.1, p. 13; §6, Lemmas 6.1–6.3 and Theorem 6.4, pp. 15–16. proves geometric and harmonic descent and the compatibility of the trace identity with parabolic induction

Checks:

- For n = 1 there is no proper Levi and (b) is vacuous.
- For π = χ_1 × χ_2 an irreducible principal series of GL_2, (b) gives σ(π) = σ(χ_1) ⊕ σ(χ_2).
- Condition (ii) of (c) only asks for a ℚ-linear combination with non-negative coefficients, not yet a representation.

### ET.6.13 Shimura varieties of the division-algebra unitary groups at Drinfeld level

Target `ET.6/division-algebra-shimura-varieties` (construction).

With the data (F = F_0K, D, *, G) of ET.4/simple-division-algebra-trace-identity (Scholze 2010 Lemma 8.1), a prime p split in K and a place w of F above p with F_w ≅ the given p-adic field, G(ℚ_p) ≅ GL_n(F_w) × (D′)^× × ℚ_p^× with D′ the product of the other local factors. For K^p ⊂ G(𝔸_f^p) small and m ≥ 0, the PEL moduli problem of abelian varieties with D-action, polarization, prime-to-p level K^p and Drinfeld level-ϖ^m structure on the one-dimensional part of the p-divisible group is representable by a projective scheme Sh_{K^p,m} over O_{F_w}, flat, with smooth generic fibre equal to the canonical model of the Shimura variety of (G, h^{-1}) at level K^p × K_{p,m}, and its completed local rings at closed points are the spaces R_{β,m} (ET.6/drinfeld-level-deformation-spaces) times the étale part (Scholze 2010 Lemma 9.2); the cohomology H_ξ = Σ_i (−1)^i lim H^i(Sh ⊗ ℚ̄, L_ξ) carries commuting actions of G(𝔸_f) and Gal(F̄_w/F_w), and π_*Rψ F_{K^p,m} ≅ (π_*Rψ ℚ̄_ℓ) ⊗ F_{K^p,0} (Lemma 9.1).

Hypotheses and conventions:

- D a division algebra; signature (1, n−1) at one infinite place; p split in K; K^p small
- Use exactly the auxiliary field, signature and division-place conditions of ET.4/simple-division-algebra-trace-identity; w differs from x,xᶜ. The level-zero model is smooth. Drinfeld-level local factors and the coefficient comparison require the formal-geometric suppliers recorded as gaps.

Proof plan:

- Representability and the generic fibre: PEL moduli of PELModuli:M2/representability, M4/canonical-model-identification, extended to Drinfeld level at w by the determinant condition (Scholze 2010 §8, citing Kottwitz and Harris–Taylor Lemma III.1.2).
- Properness: D division (PELModuli:M2/properness-when-division).
- Local structure: Serre–Tate and the comparison of ET.6/comparison-of-two-functions identify completed local rings with R_{β,m} (Scholze 2010 Lemmas 9.1–9.2).

Direct prerequisites:

- `ET.4/simple-division-algebra-trace-identity`
- `ET.6/drinfeld-level-deformation-spaces`
- `ET.6/comparison-of-two-functions`
- `PELModuli:M2/representability`
- `PELModuli:M2/properness-when-division`
- `PELModuli:M4/canonical-model-identification`
- `LefschetzPencilsAndVanishingCycles:LPV.6`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8, Lemma 8.1 and Remarks 8.2–8.3, p. 19; §8, pp. 19–22. constructs the Shimura data and the integral models at Drinfeld level with the determinant condition
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §9, Lemmas 9.1–9.2, pp. 23–24. identifies nearby cycles at level m and completed local rings with the deformation spaces

Planning API:

- `DivisionAlgebraShimuraVariety` (constructor): Sh_{K^p,m} over O_{F_w}, representing the PEL problem at Drinfeld level ϖ^m.
- `DivisionAlgebraShimuraVariety.proper` (characterisation): Sh_{K^p,m} is projective over O_{F_w}.
- `DivisionAlgebraShimuraVariety.genericFibre` (compatibility): The generic fibre is the canonical model of Sh(G, h^{-1}) at level K^p K_{p,m}.
- `DivisionAlgebraShimuraVariety.completedLocalRing` (characterisation): Completed local rings are R_{β,m} times the étale part.
- `DivisionAlgebraShimuraVariety.cohomology` (data): H_ξ with G(𝔸_f) × Gal(F̄_w/F_w)-action.
- `DivisionAlgebraShimuraVariety.nearbyCycles_level` (relation): π_*Rψ F_{K^p,m} ≅ (π_*Rψ ℚ̄_ℓ) ⊗ F_{K^p,0}.

Uses:

- Scholze 2010 Theorem 9.3: the Langlands–Kottwitz point count at Drinfeld level
- Scholze 2010 §§10–11: Galois representations and the comparison with the Lubin–Tate tower

Unit tests:

- `DivisionAlgebraShimuraVariety.level_zero_smooth` (degenerate): At m = 0 the integral model is smooth over O_{F_w}.
- `DivisionAlgebraShimuraVariety.dimension` (computation): The relative dimension is n − 1.
- `DivisionAlgebraShimuraVariety.local_ring_n1` (compatibility): For n = 1 the completed local rings are the Lubin–Tate rings of ET.6/drinfeld-level-deformation-spaces.
- `DivisionAlgebraShimuraVariety.split_not_proper` (non-example): Replacing D by a split algebra leaves the hypotheses of this construction. Division proves properness here; splitting alone does not prove every other unitary Shimura datum nonproper.

Checks:

- At m = 0 the integral model is smooth over O_{F_w}.
- The relative dimension is n − 1.
- For n = 1 the completed local rings are the Lubin–Tate rings of ET.6/drinfeld-level-deformation-spaces.
- Replacing D by a split algebra leaves the hypotheses of this construction. Division proves properness here; splitting alone does not prove every other unitary Shimura datum nonproper.

### ET.6.14 Badulescu's Langlands–Jacquet map on Grothendieck groups ★

Target `ET.6/badulescu-langlands-jacquet-map` (construction). Planet: Badulescu's Langlands–Jacquet map.

For G′=GL_r(D), n=rd, Badulescu defines a surjective additive map LJ_r:Groth(GL_n(F))→Groth(G′) by the standard-module basis. Every essentially square-integrable representation of GL_n(F) transfers uniquely by classical JL, and LJ_r(JL(δ′))=δ′. Characters satisfy Θ_{LJ_r(V)}(g′)=(−1)^(n−r)Θ_V(g) on all corresponding regular semisimple elements. The kernel is spanned by standard representations induced from Levis that do not transfer to G′. The family over all r commutes with normalized induction and Jacquet functors for corresponding Levis, as the Hopf-algebra quotient of Theorem 3.6. For a generic irreducible product of square-integrable factors, LJ is zero if the inducing Levi does not transfer; otherwise it is the irreducible product of their JL inverses (Proposition 3.3). In particular generic principal series vanish for d>1. LJ is an additive Grothendieck-group map, not a bijection of irreducibles or the map used to attach inner-form parameters. This 2007 source states the general signed-irreducibility assertion only as Conjecture 3.11; it is not imported as a theorem here.

Hypotheses and conventions:

- F of characteristic 0
- D a central division algebra; inner forms of products of general linear groups

Proof plan:

- Use the Langlands standard-module bases of Badulescu §2.1–2.2 pp. 5–6. His additive injection JL_r of Theorem 3.1 pp. 9–10 extends classical JL; Proposition 3.2 p. 11 gives the quotient LJ_r and its all-regular-semisimple character identity.
- The kernel description makes the map surjective. Across all ranks the quotient is compatible with product and coproduct (Theorem 3.6 pp. 13–15); each displayed Jacquet or induction identity must use corresponding Levis.
- Apply Proposition 3.3 p. 11 for generic irreducibles. Generic principal series use a diagonal split Levi, which does not transfer when d>1. This is not a proof by elliptic characters alone.

Direct prerequisites:

- `ET.6/local-jacquet-langlands`
- `ET.6/zelevinsky-classification`
- `ET.4/padic-character-distributions`
- `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`
- `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1 and Lemma 5.4.3 with proof, pp. 739–741. uses Badulescu's Langlands–Jacquet map in the definition of Red^b and proves that generic principal series map to 0 for non-quasi-split inner forms (citing Badulescu 2007 Theorem 3.1 and Proposition 3.3)
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, p. 65. uses Badulescu's results on the Jacquet–Langlands correspondence for all inner forms of general linear groups to attach semisimple parameters
- [A. I. Badulescu, Jacquet–Langlands et unitarisabilité](https://imag.umontpellier.fr/~ioan-badulescu/Files/jimj.pdf), §2.1–2.2 pp. 5–6; Theorem 3.1 pp. 9–10; Propositions 3.2–3.3 p. 11; Theorem 3.6 pp. 13–15; Conjecture 3.11 p. 17. standard bases, quotient and generic transfer; distinguishes the additive map from Q and from a conjecture

Planning API:

- `langlandsJacquet` (constructor): LJ : Groth(GL_n(F)) → Groth(GL_r(D)).
- `langlandsJacquet_character` (characterisation): Θ_{LJ(π)}(g′) = (−1)^{n−r} Θ_π(g) on corresponding regular elements.
- `langlandsJacquet_essSqInt` (simp): LJ(JL(π′)) = π′ for π′ essentially square-integrable on GL_r(D).
- `langlandsJacquet_induction` (functoriality): LJ ∘ n-Ind = n-Ind ∘ LJ_M.
- `langlandsJacquet_jacquet` (functoriality): LJ_M ∘ r_P = r_{P′} ∘ LJ for corresponding parabolics.
- `langlandsJacquet_generic_ps` (relation): LJ kills irreducible generic principal series when D ≠ F.
- `langlandsJacquet_split` (simp): For D = F, LJ = id.
- `langlandsJacquet_surjective` (relation): Every virtual representation of GL_r(D) is LJ_r(V) for some virtual V.
- `langlandsJacquet_kernel` (relation): The kernel is spanned by standard modules with nontransferring inducing Levi.

Uses:

- Caraiani–Scholze 2017 Remark 5.4.1: step (3) of Red^b_n⃗ is LJ from M_b to J_b
- ET.7b/newton-reduction (ET.6a packet): the signed normalised Newton reduction uses LJ
- IgusaVarietiesAndTorsionConcentration:IG.5: the rational Igusa trace comparison and the genericity obstruction

Unit tests:

- `langlandsJacquet.gl2_steinberg` (computation): For n = 2, LJ(St_2) = 1_{D^×}.
- `langlandsJacquet.gl2_trivial` (computation): For n = 2, LJ(1_{GL_2}) = −1_{D^×}.
- `langlandsJacquet.principal_series` (non-example): LJ(χ_1 × χ_2) = 0 for an irreducible principal series; a map sending irreducibles to non-zero irreducibles would be wrong.
- `langlandsJacquet.split_test` (degenerate): For d = 1 the map is the identity of Groth(GL_n(F)).

Checks:

- For n = 2, LJ(St_2) = 1_{D^×}.
- For n = 2, LJ(1_{GL_2}) = −1_{D^×}.
- LJ(χ_1 × χ_2) = 0 for an irreducible principal series; a map sending irreducibles to non-zero irreducibles would be wrong.
- For d = 1 the map is the identity of Groth(GL_n(F)).

### ET.6.15 The Langlands–Kottwitz point count at Drinfeld level

Target `ET.6/drinfeld-level-point-count` (theorem).

With Sh_{K^p,m} and H_ξ as in ET.6/division-algebra-shimura-varieties, for τ ∈ Frob^j I_{F_w}, h ∈ C_c^∞(GL_n(O_{F_w})), h′ ∈ C_c^∞(O_{D′}^×) and f^p ∈ C_c^∞(G(𝔸_f^p)): tr(τ × h^∨ × h′ × e_{ℤ_p^×} × f^p | [H_ξ]) = Σ_{(γ_0;γ,δ)} c(γ_0;γ,δ) O_γ(f^p) TO_{δσ_0}(φ_{τ,h,h′} × e_{p^{−1}W(κ_r)^×}) tr(γ_0 | ξ), the sum over Kottwitz triples with vanishing Kottwitz invariant, and consequently n·tr(τ × h^∨ × h′ × e × f^p | [H_ξ]) = tr(f^∨_{τ,h} ⊗ h′ × e′ × f^p | [H_ξ]) (Scholze 2010 Theorem 9.3 and Corollary 9.4).

Hypotheses and conventions:

- τ over a positive power of geometric Frobenius
- the hypotheses of ET.6/division-algebra-shimura-varieties
- Write r′=[κ(F_w):𝔽_p] and r=j r′. Normalize e as the characteristic idempotent of ℤ_p× and e′ as the characteristic idempotent of p^(−j r′)ℤ_p×. The point-count coefficients c(γ₀;γ,δ) use the ordinary Shimura Kottwitz-triple weights, not the Igusa indexing set of Shin 2009. An explicit lower-tier supplier for those weights is still required.

Proof plan:

- Apply the Fujiwara–Varshavsky trace formula (EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula) to the Frobenius-twisted Hecke correspondences on Sh_{K^p,m} ⊗ 𝔽̄ with coefficients π_*Rψ (Scholze 2010 §9; Varshavsky Theorem 2.3.2).
- Compute local terms at fixed points through the completed local rings (ET.6/division-algebra-shimura-varieties) and ET.6/comparison-of-two-functions, giving twisted orbital integrals of φ_{τ,h,h′}.
- Parametrise isogeny classes of points by Kottwitz triples using Honda–Tate theory (AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate) and Kottwitz's arguments for PEL varieties (Kottwitz 1992), which Scholze checks apply at Drinfeld level (Scholze 2010 p. 23).
- Stabilisation is trivial for these groups (ET.4/simple-division-algebra-trace-identity), and the twisted orbital integrals become orbital integrals of f^∨_{τ,h} ⊗ h′ by ET.6/norm-maps-and-base-change-identities (Corollary 9.4).

Direct prerequisites:

- `ET.6/division-algebra-shimura-varieties`
- `ET.6/comparison-of-two-functions`
- `ET.6/norm-maps-and-base-change-identities`
- `ET.4/simple-division-algebra-trace-identity`
- `EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula`
- `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`
- `AbelianSchemesAndArithmeticModuliPartII:F0/tate-hom`
- `ET.0/global-kottwitz-obstruction`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §9 Theorem 9.3 and Corollary 9.4 p. 25; coefficient convention and applicability of Kottwitz’s arguments pp. 23–24. proves the Langlands–Kottwitz formula at Drinfeld level with test function φ_{τ,h,h′} at p, and rewrites it with f^∨_{τ,h} ⊗ h′

Checks:

- For m = 0 and h = 1, φ_{τ,h} is Kottwitz's φ_j and the identity is Kottwitz's point count at good reduction.
- The normalising factor on the left side of Corollary 9.4 is Scholze's; a consumer takes it from there and does not set it to 1.
- Without the vanishing of the Kottwitz invariant, a triple contributes no points.

### ET.6.16 Galois representations in the cohomology of the division-algebra Shimura varieties

Target `ET.6/global-galois-input` (theorem).

(a) For π_f occurring in ξ-cohomology, with multiplicity a(π_f), π_p=π_w⊗π_{w^p}⊗π_{p,0} and π_{p,0} unramified, Scholze Corollary 10.1 gives tr(f^∨_{τ,h}|π_w)=a(π_f)⁻¹ tr(τ|[W_ξ(π_f)]⊗χ_{π_{p,0}}) tr(h^∨|π_w). The unramified character χ evaluates the correctly normalized central p-power. The cohomological multiplicity is not silently replaced by 1. (b) Theorem 10.2 globalizes an unramified twist of every essentially square-integrable or generalized Speh π; its local component need not equal π before twisting. Corollary 10.3 produces rec_un(π), a ℚ-linear combination of W_F-representations with nonnegative coefficients and total dimension n satisfying the character identity. This is the early positive input to Lemma 3.2, before integrality and bijectivity.

Hypotheses and conventions:

- the hypotheses of ET.6/division-algebra-shimura-varieties
- Π conjugate self-dual, regular algebraic, square-integrable at x

Proof plan:

- Combine the point-count identity and the simple trace formula; keep the contragredient, similitude twist and multiplicity a(π_f) (Corollary 10.1 p. 26).
- Use a simple-trace-formula globalization with a pseudocoefficient, which gives the local representation only up to unramified twist (Theorem 10.2 p. 26).
- Read Corollary 10.3 p. 27 with total dimension n. Theorem 10.6 is a later consequence of the completed character identity and is moved to ET.6/post-correspondence-global-galois.

Direct prerequisites:

- `ET.6/drinfeld-level-point-count`
- `ET.4/simple-division-algebra-trace-identity`
- `ET.1/pseudocoefficients`
- `ET.6/segment-representations`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10 Corollary 10.1 and Theorem 10.2 p. 26; Corollary 10.3 p. 27. Corollary 10.1 keeps the multiplicity and duals; Theorem 10.2 globalizes up to an unramified twist, and Corollary 10.3 gives the early positive rational rec_un.

Checks:

- For n = 1 the representation R(Π) is the Galois character of the algebraic Hecke character Π.
- For Π_x not square-integrable, (c) is not asserted here.
- The non-negative combination in (b) need not be an honest representation until Theorem 1.2 is proved.

### ET.6.17 Relation to the Lubin–Tate tower

Target `ET.6/lubin-tate-comparison` (theorem).

Let [Rψ] be the alternating sum of global sections of nearby cycles of the Lubin–Tate tower, a virtual representation of GL_n(O)×(D××W_F)^0, where the superscript 0 is the valuation-zero kernel; compactly induce in D××W_F to obtain [Rψ̃] on GL_n(O)×D××W_F. (a) Each R^iψ is an admissible smooth representation of GL_n(O), smooth for O_D^×, continuous for I_F, and vanishes outside 0 ≤ i ≤ n−1 (Scholze 2010 Theorem 11.1). (b) φ_{τ,h}(β) = tr(τ × d^{-1} × h^∨ | [Rψ]) for d the element of D^× attached to β (Proposition 11.2). (c) If ρ is an irreducible representation of D^× with π = JL(ρ) supercuspidal (ET.6/local-jacquet-langlands), then as virtual GL_n(O) × W_F-representations [Rψ̃](ρ^∨) = (−1)^{n−1} π^∨|_{GL_n(O)} ⊗ rec_un(π) (Corollary 11.3); consequently rec_un(π) of a supercuspidal π is a ℤ-linear combination of representations (Corollary 11.5, using newvectors). The statement is a virtual identity over GL_n(O); the full GL_n(F) × W_F-equivariant concentration in one degree is the separate two-tower realisation of ET.6a.

Hypotheses and conventions:

- π supercuspidal for (c); the Jacquet–Langlands correspondence of ET.6/local-jacquet-langlands
- The valuation-zero subgroup is {(d,τ):v_D(d)+v_W(τ)=0}; a division uniformizer and geometric Frobenius both have valuation 1.

Proof plan:

- (a): Berkovich's comparison for formal schemes and Harris–Taylor Lemma II.2.8 (Scholze 2010 Theorem 11.1).
- (b): compare the definition of φ_{τ,h} with the Lubin–Tate tower, which does not depend on β after base change to k̄ (Proposition 11.2).
- Apply the early positive rational identity of ET.6/global-galois-input to supercuspidal π, use tempered cyclic base change and classical Jacquet–Langlands, and compare the division-algebra integral (Proposition 11.2, Corollary 11.3). This proof does not assume ET.6/scholze-local-langlands. Newvectors give a multiplicity-one GL_n(O)-type and hence integral coefficients (Corollary 11.5 p. 30); the required primary newvector supplier is a gap.

Direct prerequisites:

- `ET.6/drinfeld-level-deformation-spaces`
- `ET.6/local-jacquet-langlands`
- `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`
- `ET.6/global-galois-input`
- `ET.6/norm-maps-and-base-change-identities`
- `ET.4/local-cyclic-base-change`
- `ET.4/twisted-characters`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §11, Theorem 11.1, Proposition 11.2, Corollaries 11.3 and 11.5 and Remark 11.4, pp. 28–30. relates the test functions to the cohomology of the Lubin–Tate tower and realises rec(π) for supercuspidal π virtually over GL_n(O)

Checks:

- For n = 1, [Rψ] is the Lubin–Tate realisation of local class field theory.
- For n = 2 and ρ trivial on D^×, JL(ρ) is the Steinberg representation (not supercuspidal), so (c) does not apply.
- The sign (−1)^{n−1} is the Kottwitz sign of D^×.

### ET.6.18 Scholze's characterization of the local Langlands correspondence ★

Target `ET.6/scholze-local-langlands` (theorem). Planet: Scholze's characterization of local Langlands.

For each irreducible smooth π of GL_n(F), there is a unique n-dimensional semisimple W_F-representation rec_un(π) with tr(f_{τ,h}|π)=tr(τ|rec_un(π))tr(h|π), for τ over positive powers of geometric Frobenius and rational-valued h∈C_c^∞(GL_n(O)). Define σ(π)=rec_un(π)⊗|·|^((1−n)/2). For any irreducible subquotient of normalized induction, σ is the direct sum of the inducing σ-parameters. These are Scholze Theorem 1.2(a),(b), equivalently Theorem 2.7(a),(b). Bijectivity and factors are separate later targets ET.6/supercuspidal-bijection and ET.6/l-epsilon-of-pairs. The symbol rec_F in ET.6/full-wd-local-langlands denotes the normalized full Weil–Deligne parameter, not rec_un.

Hypotheses and conventions:

- F a finite extension of ℚ_p (characteristic 0)
- ℓ ≠ p and a fixed isomorphism ℚ̄_ℓ ≅ ℂ

Proof plan:

- Induct on n using the complete reduction of Lemma 3.2: harmonic descent for induced representations, ET.6/global-galois-input for positive rational rec_un and ET.6/lubin-tate-comparison for integrality on supercuspidals.
- Use Lemma 3.1 and density to extend the identity to all irreducibles; positive Frobenius traces determine the semisimple representation. This stage does not use the later bijectivity or pair-factor theorem.

Direct prerequisites:

- `ET.6/scholze-test-functions`
- `ET.6/test-function-descent`
- `ET.6/global-galois-input`
- `ET.6/zelevinsky-classification`
- `ET.6/lubin-tate-comparison`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, Theorem 1.2 (pp. 3–4) and Theorem 2.7 (p. 9). Character identity and normalized parabolic-induction compatibility only, parts (a),(b); parts (c),(d) are separately planned later.
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, footnotes 1–2, p. 2. notes that rec(π) is the Weil-group part of the Weil–Deligne parameter and that the monodromy operator is ignored

Checks:

- For n = 1, rec(χ) = χ ∘ Art_F^{-1} (local class field theory).
- For the Steinberg representation of GL_2, σ(St) = 1 ⊕ |·| up to the twist convention, the semisimplification of Sp_2 (monodromy is invisible to (a)).
- rec is not injective on all irreducibles: π and its Zelevinsky dual have the same semisimple parameter (e.g. trivial and Steinberg of GL_2).

### ET.6.19 Global Galois representations after the character identity

Target `ET.6/post-correspondence-global-galois` (theorem).

For the division-algebra CM datum of ET.4/simple-division-algebra-trace-identity, let Π be cuspidal conjugate self-dual regular algebraic, with Π_x essentially square-integrable. After ET.6/scholze-local-langlands, Scholze Theorem 10.6 constructs an actual ℓ-adic representation R(Π) of dimension a n for some positive integer a, with [R(Π)|W_{F_v}]=a[rec_un(Π_v)] at every finite v∤ℓ, in the Grothendieck group. The equality is of semisimple Weil representations; no monodromy statement is made. Theorem 10.7 globalizes an unramified twist of each square-integrable π at w and a supercuspidal component at x. For regular L-algebraic Π, the further twist of Corollary 13.2 gives a system matching a·σ(Π_v), with a possibly greater than 1.

Hypotheses and conventions:

- Use every field, signature and division-place restriction of Scholze §8 and Theorem 10.5; w≠x,xᶜ.
- Theorem 10.6 applies after Theorem 1.2(a),(b), not as its positive-input proof.

Proof plan:

- Descend Π to the unitary similitude cohomology by Theorem 10.5, retain the multiplier character ψ and use Corollary 10.1 after the local character identity is proved.
- Apply Chebotarev and varying split auxiliary primes to compare all finite v∤ℓ (Theorem 10.6 pp. 27–28).
- Theorem 10.7 p. 28 globalizes only up to unramified twist. Corollary 13.2 p. 33 adjusts algebraic normalization by a Hecke character.

Direct prerequisites:

- `ET.6/scholze-local-langlands`
- `ET.4/unitary-gl-base-change-descent`
- `ET.4/global-cyclic-base-change`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10 Theorems 10.6–10.7 pp. 27–28; §13 Corollary 13.2 p. 33. later global Galois identity, with dimension a n and normalization

Checks:

- The dimension is a n with a positive integral multiplicity; do not replace a by 1.
- Theorem 10.6 is used only after the local character identity.
- Local equality is semisimple at every finite v∤ℓ and says nothing about N.

### ET.6.20 Bijectivity on supercuspidal representations

Target `ET.6/supercuspidal-bijection` (theorem).

The normalized σ of ET.6/scholze-local-langlands satisfies naturality and all five conditions of Scholze Theorem 12.1, including unramified parameter ⇒ Iwahori-fixed vectors. Hence it is a functorial extension of class field theory (Definition 12.2). For any such extension, its restriction to supercuspidals is injective with image exactly the irreducible n-dimensional representations of W_F (Theorem 12.3).

Hypotheses and conventions:

- F finite over ℚ_p

Proof plan:

- Rank one and induction are available from the construction. Twisting and supercuspidal prime-degree cyclic base change use the later global-Galois identity after the character identity has been proved. For the Iwahori condition reduce to supercuspidals of n≥2 and show σ(π)^I=0 using the basic Lubin–Tate trace and absence of O_D×-invariants (Scholze pp. 30–31).
- Theorem 12.3 pp. 31–32 proves both directions constructively. Condition (v) supplies a finite chain of cyclic extensions; at the first nonsupercuspidal base change use the full Galois orbit from AC Lemma 6.10 and induction in rank. For existence start with an irreducible Weil representation, lift its first reducible restriction using AC Theorem 6.2, and descend the chain, correcting character twists. AC Proposition 6.7 supplies uniqueness. No numerical equality of bounded-conductor counts is invoked.

Direct prerequisites:

- `ET.6/scholze-local-langlands`
- `ET.6/lubin-tate-comparison`
- `ET.6/llc-characterizing-properties`
- `ET.4/local-cyclic-base-change`
- `ET.4/twisted-characters`
- `ET.6/post-correspondence-global-galois`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, Theorem 12.1, Definition 12.2 and Theorem 12.3 with proof, pp. 30–32. Five functorial properties, including the unramified-to-Iwahori implication, and constructive cyclic descent proving irreducibility, existence and uniqueness.

Checks:

- For n = 1 the statement is local class field theory.
- For n = 2 and p odd, dihedral supercuspidals correspond to induced representations Ind_{W_E}^{W_F} χ.
- σ(Steinberg) is reducible, consistent with Steinberg not being supercuspidal.

### ET.6.21 Harris's non-Galois automorphic induction

Target `ET.6/non-galois-automorphic-induction` (theorem).

A cuspidal Π on GL_n over a number field is potentially abelian when an n-dimensional representation Σ of the global Weil group is associated to Π at every finite and infinite place (Scholze Definition 13.1 p. 32); agreement at almost all places alone is weaker. Lemmas 13.3–13.4 p. 33 construct ℓ-adic realizations of algebraic Σ. For the CM datum, Π conjugate self-dual, regular L-algebraic and Π_x supercuspidal, Theorem 13.5(i) p. 34 upgrades association at infinity and almost all finite places to all finite places. Part (ii) descends potential abelianity along prime-degree cyclic F′/F when x has exactly one extension x′ and Π′_{x′} is supercuspidal. In Theorem 13.6 p. 34 let F₃⁰⊃F₂⁰⊃F₁⁰ be totally real of even degree over ℚ with F₃⁰/F₁⁰ solvable Galois, F_i=F_i⁰K for an imaginary quadratic K, and n=[F₂⁰:F₁⁰]. Choose x of F₁ split over F₁⁰ and inert in F₃. Require χ⁻¹=χ∘c, χ_τ(z)=z^{p_τ}z̄^{−p_τ} with distinct integral p_τ, and Stab_{Gal(F₃/F₁)}(χ_x∘Norm_{F₃/F₂})=Gal(F₃/F₂). Then there is a potentially abelian cuspidal induction on GL_n/F₁ associated at every place to Ind_{W_{F₂}}^{W_{F₁}}χ. An arbitrary algebraic χ without these hypotheses is not covered.

Hypotheses and conventions:

- CM fields with totally real subfields of even degree; solvable Galois closure

Proof plan:

- Use the archimedean dictionary and ℓ-adic realizations of algebraic Hecke characters in Lemmas 13.3–13.4; these require explicit suppliers, recorded as gaps.
- Theorem 13.5 uses Chebotarev and the post-correspondence Galois system, with the supercuspidal place choosing the extension uniquely.
- Induct on the solvable tower using cyclic base change and induction. The stabilizer condition controls cuspidality at x, and the distinct archimedean weights ensure regularity (Theorem 13.6 pp. 34–35).

Direct prerequisites:

- `ET.4/global-cyclic-base-change`
- `ET.4/cyclic-automorphic-induction`
- `ET.6/scholze-local-langlands`
- `ET.6/post-correspondence-global-galois`
- `ET.6/supercuspidal-bijection`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §13, Definition 13.1, Corollary 13.2, Lemmas 13.3–13.4, Theorems 13.5–13.6, pp. 32–35. repeats Harris's construction of cuspidal automorphic representations by non-Galois automorphic induction and proves compatibility with the local correspondence

Checks:

- For n = 1 the induction is the Hecke character itself.
- For F^3_0 = F^2_0 Galois over F^1_0, the result reduces to cyclic or solvable automorphic induction.
- A non-algebraic Hecke character has no ℓ-adic realisation, so (a) needs regular L-algebraicity.

### ET.6.22 Compatibility of the correspondence with L- and ε-factors of pairs

Target `ET.6/l-epsilon-of-pairs` (theorem).

The correspondence π ↦ σ(π) on supercuspidal representations (extended additively to the Grothendieck group of W_F) has the following properties: (i) in degree 1 it is local class field theory; (ii) σ(π ⊗ χ) = σ(π) ⊗ σ(χ); (iii) σ(π^∨) = σ(π)^∨; (iv) det σ(π) = σ(ω_π); (v) for supercuspidal π_1, π_2, L(s, π_1 × π_2) = L(s, σ(π_1) ⊗ σ(π_2)) and ε(s, π_1 × π_2, ψ) = ε(s, σ(π_1) ⊗ σ(π_2), ψ), with the Jacquet–Piatetski-Shapiro–Shalika factors on the left (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor) and the Deligne–Langlands factors on the right (ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor). Consequently it is the correspondence characterised by Henniart, and part (iii) follows from (v) by comparing poles.

Hypotheses and conventions:

- π₁ and π₂ are supercuspidal. This node does not assert the extension to arbitrary irreducibles; ET.6/full-wd-local-langlands records the separate segment-pair and monodromy input.

Proof plan:

- Globalise π_1, π_2 as local components of potentially abelian cuspidal representations Π_1, Π_2 over a CM field with all other ramified components controlled (Scholze 2010 Lemma 14.2, using ET.6/non-galois-automorphic-induction and automorphic induction of Hecke characters).
- Compare the global functional equations of L(s, Π_1 × Π_2) (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation) and of the Artin–Hecke L-function of Σ_1 ⊗ Σ_2, whose local factors agree at all other places by construction; twist by highly ramified characters (Henniart's method) to separate the remaining place (Scholze 2010 Theorem 14.1 and proof).

Direct prerequisites:

- `ET.6/supercuspidal-bijection`
- `ET.6/non-galois-automorphic-induction`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`
- `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`
- `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`
- `AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §14, Theorem 14.1 and Lemma 14.2, pp. 35–36. proves twisting, duality, determinant and L- and ε-factor compatibility by globalising with potentially abelian representations and comparing functional equations
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, p. 5. explains the use of Harris's non-Galois automorphic induction and Henniart's twisting with highly ramified characters

Checks:

- For n_1 = n_2 = 1 (v) is Tate's local functional equation (AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation).
- For π_2 the trivial character of GL_1, (v) gives the Godement–Jacquet factors of π_1 (AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation).
- L(s, π × π^∨) has a pole at s = 0, matching the trivial constituent of σ(π) ⊗ σ(π)^∨.

### ET.6.23 Weil–Deligne parameters of segments and multisegments

Target `ET.6/segment-wd-parameter` (construction).

Use the Weil–Deligne representations of ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation over ℂ (or ℚ̄_ℓ via a fixed isomorphism), with |·| : W_F → ℝ_{>0} sending geometric Frobenius to q^{−1}. Import the unnormalised special object ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object: for k ≥ 1, Sp_k = ⊕_{i=0}^{k−1} ℂ e_i with r(w)e_i = |w|^i e_i and N e_i = e_{i+1} (N e_{k−1} = 0); then r(w) N r(w)^{-1} = |w| N, N is a single Jordan block, and Sp_k is indecomposable and Frobenius-semisimple. For an irreducible representation σ of W_F, σ ⊗ Sp_k is indecomposable; every Frobenius-semisimple Weil–Deligne representation is uniquely a direct sum of such blocks (ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-special-block-classification). Given the normalized bijection σ_0=σ of ET.6/supercuspidal-bijection (not Scholze’s rec_un), which respects twists by ET.6/l-epsilon-of-pairs, from supercuspidals of GL_d(F) to irreducible d-dimensional representations of W_F, attach to a segment Δ = [ρ, ν^{k−1}ρ] the block WD(Δ) = σ_0(ρ) ⊗ Sp_k, and to a multisegment m the sum WD(m) = ⊕_{Δ∈m} WD(Δ). Then m ↦ WD(m) is a bijection from multisegments of degree n to n-dimensional Frobenius-semisimple Weil–Deligne representations, WD(m)^{ss} restricted to W_F is ⊕_{ρ ∈ supp(m)} σ_0(ρ) (with σ_0(ν^j ρ) = σ_0(ρ)|·|^j), and the monodromy operator of WD(m) is nilpotent with Jordan type consisting of d copies of a block of length k for each segment based on GL_d.

Hypotheses and conventions:

- The normalized supercuspidal bijection σ of ET.6/supercuspidal-bijection, with twisting compatibility proved in ET.6/l-epsilon-of-pairs; |Frob_geo|=q⁻¹. The unnormalised special object is imported from R01.2.

Proof plan:

- Compute r(w)Ne_i = |w|^{i+1}e_{i+1} = |w| N r(w) e_i to get the covariance.
- Indecomposability and the block decomposition are R01.2/frobenius-semisimple-special-block-classification and R01.2/unnormalised-special-object.
- Bijectivity: blocks σ ⊗ Sp_k with σ irreducible correspond to segments [σ_0^{-1}(σ), …] of length k, and multisets of blocks to multisegments.

Direct prerequisites:

- `ET.6/cuspidal-segment`
- `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`
- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-special-block-classification`
- `ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object`
- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`
- `ET.6/supercuspidal-bijection`
- `ET.6/l-epsilon-of-pairs`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, footnotes 1–2, p. 2; Theorem 1.2(b), p. 3. works with the Weil-group (semisimple) part of the parameter, ignores the monodromy operator, and proves compatibility with parabolic induction, which determines the semisimplification of WD(m)
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, Remark 5.1.1, p. 65. defines the semisimple parameter of a Frobenius-semisimple Weil–Deligne representation by restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2}))
- [A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §10, pp. 204–206. describes the conjectural reciprocity law as a bijection between irreducible representations and pairs (σ, N), with segments corresponding to indecomposable objects T(Δ)

Planning API:

- `specialWD` (constructor): Imported API of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object. Sp_k with r(w)e_i = |w|^i e_i and Ne_i = e_{i+1}.
- `specialWD_comm` (relation): Imported API of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object. r(w) N r(w)^{-1} = |w| N on Sp_k.
- `specialWD_indecomposable` (characterisation): Imported API of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object. σ ⊗ Sp_k is indecomposable for σ irreducible.
- `segmentWD` (constructor): WD(Δ) = σ_0(ρ) ⊗ Sp_k.
- `multisegmentWD` (constructor): WD(m) = ⊕_{Δ∈m} WD(Δ).
- `multisegmentWD_bijective` (equivalence): m ↦ WD(m) is a bijection onto n-dimensional Frobenius-semisimple Weil–Deligne representations.
- `multisegmentWD_ss` (simp): The Weil-group semisimplification of WD(m) is ⊕_{ρ∈supp m} σ_0(ρ).
- `multisegmentWD_twist` (functoriality): WD(χ ⊗ m) = WD(m) ⊗ rec_1(χ).

Uses:

- ET.6/full-wd-local-langlands: assembles rec_F from the supercuspidal bijection and the Langlands classification
- Atobe–Kondo–Yasuda Lemma 2.9: π^ram corresponds to V/(V^I ∩ ker N)
- ET.6a/fs-normalization-contract (ET.6a packet): the action dictionary needs the Weil–Deligne normalisation fixed here

Unit tests:

- `specialWD_two` (computation): Sp_2 has N of rank 1 and r(Frob) = diag(1, q^{-1}) for geometric Frobenius.
- `segmentWD_length_one` (degenerate): WD({ρ}) = σ_0(ρ) with N = 0.
- `multisegmentWD_same_support` (non-example): {[1,ν]} and {[1],[ν]} have equal semisimplifications but WD differ (N ≠ 0 versus N = 0): a definition through semisimplified parameters alone is not injective.
- `specialWD_compat` (compatibility): Sp_k is the special object of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object.

Checks:

- Sp_2 has N of rank 1 and r(Frob) = diag(1, q^{-1}) for geometric Frobenius.
- WD({ρ}) = σ_0(ρ) with N = 0.
- {[1,ν]} and {[1],[ν]} have equal semisimplifications but WD differ (N ≠ 0 versus N = 0): a definition through semisimplified parameters alone is not injective.
- Sp_k is the special object of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object.

### ET.6.24 The local Langlands correspondence for GL_n with full Weil–Deligne parameters ★

Target `ET.6/full-wd-local-langlands` (theorem). Planet: Local Langlands correspondence for GL_n.

Let F be a finite extension of ℚ_p. There is a unique family of bijections rec_F : Irr(GL_n(F)) → {n-dimensional Frobenius-semisimple Weil–Deligne representations of W_F}, n ≥ 1, such that: (a) on supercuspidals rec_F = σ (ET.6/supercuspidal-bijection), with N = 0; (b) for a segment Δ = [ρ, ν^{k−1}ρ], rec_F(L(Δ)) = rec_F(ρ) ⊗ Sp_k (ET.6/segment-wd-parameter); (c) for a multisegment m, rec_F(L(m)) = ⊕_{Δ∈m} rec_F(L(Δ)), L(m) the Langlands quotient (ET.6/zelevinsky-classification); then rec_F is bijective, compatible with twists, central characters (det), contragredients, and L- and ε-factors of pairs (defined on the Galois side through Weil–Deligne representations with monodromy), and conductors (ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation). (d) The restriction of rec_F(π) to W_F, semisimplified, is σ(π) of ET.6/scholze-local-langlands; equivalently the semisimple Langlands parameter of rec_F(π) (ET.6/semisimple-langlands-parameter) is the point of the Bernstein centre of π. (e) The Steinberg representation St_n = L([ν^{(1−n)/2}, ν^{(n−1)/2}]) corresponds to |·|^{(1−n)/2} ⊗ Sp_n; an unramified principal series corresponds to the sum of unramified characters with its Satake parameters (SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter); generic π correspond to Weil–Deligne representations with no two blocks linked. Equal-characteristic local fields are not covered.

Hypotheses and conventions:

- F of characteristic 0 (equal-characteristic F requires a separately checked construction)
- Art_F normalised by geometric Frobenius

Proof plan:

- Define rec_F by (a)–(c); bijectivity from ET.6/segment-wd-parameter and ET.6/zelevinsky-classification (multisegments ↔ irreducibles ↔ Frobenius-semisimple Weil–Deligne representations).
- Compatibility of the semisimplification with σ: ET.6/scholze-local-langlands (b) and the cuspidal support of L(m) (ET.6/zelevinsky-classification (f)).
- The general pair-factor and conductor conclusions require an additional essentially-square-integrable segment-pair formula, with ker N and the monodromy correction, followed by multiplicativity across Langlands blocks. Multiplicativity over individual cuspidal support does not supply it: St₂ and the trivial representation have identical semisimple support but different ker N. ET.6/l-epsilon-of-pairs proves only the supercuspidal case. The missing primary proof and explicit supplier are recorded as a real gap, rather than claimed as a reduction already completed.
- Uniqueness: Henniart's characterization on supercuspidals and the forced extension by (b)–(c).

Direct prerequisites:

- `ET.6/supercuspidal-bijection`
- `ET.6/segment-wd-parameter`
- `ET.6/zelevinsky-classification`
- `ET.6/l-epsilon-of-pairs`
- `ET.6/scholze-local-langlands`
- `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`
- `SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`

Sources:

- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, Theorem 1.2 and footnotes 1–2, pp. 2–3. establishes the semisimple correspondence and its standard properties; the monodromy operator is left aside and is reconstructed here from segments
- [A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §10, pp. 204–206. Formulates the reciprocity law with monodromy via segments; §10 is not a proof of the modern full pair-factor theorem.
- [H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), Lemma 2.9, §2.6. uses the full Weil–Deligne correspondence including N with geometric Frobenius

Checks:

- rec_F(trivial of GL_2) = |·|^{-1/2} ⊕ |·|^{1/2} (N = 0) and rec_F(St_2) = |·|^{-1/2} ⊗ Sp_2 with N ≠ 0: the two differ only by N.
- For n = 1, rec_F is local class field theory.
- rec_F(π^∨) = rec_F(π)^∨ on a supercuspidal π of GL_2 with non-trivial central character.

### ET.6.25 Ladder determinantal formula and constituent criteria

Target `ET.6/ladder-and-constituent-theorems` (theorem).

(a) (Ladder formula, Lapid–Mínguez as used by Atobe–Kondo–Yasuda) For a type-χ ladder [x_1,y_1] + … + [x_t,y_t], in the Grothendieck group Z(m) = Σ_{w ∈ S_t} sgn(w) Z([x_{w(1)}, y_1]_χ) × … × Z([x_{w(t)}, y_t]_χ), empty segments giving the trivial representation of GL_0 and segments of negative length giving 0. (b) (Multiplicity one) Z(m_1 + m_2) occurs with multiplicity one in Z(m_1) × Z(m_2). (c) (Truncated constituent criterion, degree-one form) For type-χ multisegments, if Z(m) occurs in Z(m_1) × Z(m_2) then Z(m^−) occurs in Z(m_1^−) × Z(m_2^−) iff |m| = |m_1| + |m_2| (cardinalities). (d) (Weil–Deligne interpretation of ram) For π unipotent irreducible with Weil–Deligne parameter (V, N) under ET.6/full-wd-local-langlands (geometric Frobenius), π^ram = Z(m^ram) corresponds to the quotient V/(V^I ∩ ker N).

Hypotheses and conventions:

- type-χ (unramified, degree-one) multisegments in (a), (c), (d); general multisegments in (b)

Proof plan:

- (a): Atobe–Kondo–Yasuda §6.1, proof of Proposition 6.1, citing Lapid–Mínguez.
- (b): Zelevinsky 1980 Proposition 8.4 (and Atobe–Kondo–Yasuda Lemma 6.5).
- (c): Atobe–Kondo–Yasuda Lemma 6.6 via highest derivatives (ET.6/zelevinsky-classification (d)); only the degree-one form is used, because the printed proof for general cuspidal degree needs degree-weighted cardinalities (recorded in gap 'Truncated constituent criterion beyond degree one').
- For unipotent π use AKY Lemma 2.9 p. 12 and the full parameter including N. On an unramified special block, quotient by ker N shortens the segment at its end; transfer this operation through the Zelevinsky dual. The semisimple parameter alone cannot compute this quotient.

Direct prerequisites:

- `ET.6/multisegment-operations`
- `ET.6/zelevinsky-classification`
- `ET.6/segment-wd-parameter`
- `ET.6/full-wd-local-langlands`

Sources:

- [H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), Proposition 6.1 and determinant identity p. 28; Lemmas 6.5–6.6 pp. 33–34; §2.6 Lemma 2.9 p. 12. states the ladder determinantal formula, the multiplicity-one and truncated constituent lemmas, and the Weil–Deligne meaning of ram
- [A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Proposition 8.4, p. 196. proves multiplicity one of Z(m_1 + … + m_p) in the product

Checks:

- For t = 1 (a) is the identity Z([x,y]) = Z([x,y]).
- For m_1 = m_2 = {[0,0]_χ}, Z({[0,0],[0,0]}) occurs once in χ × χ.
- For the Steinberg representation V = Sp_2, V^I ∩ ker N is the line of the highest-weight vector and the quotient is one-dimensional.

### ET.6.26 Explicit local Langlands and Jacquet–Langlands in level zero

Target `ET.6/level-zero-explicit` (theorem).

Use the specific setting of Newton–Thorne Lemma 3.6: n=2m, q≡−1 (mod p) for an odd auxiliary prime p distinct from the residue characteristic, D/F of degree n, and a character χ of order p of 𝔽_{q²}×. Inflate χ∘Norm_{𝔽_{qⁿ}/𝔽_{q²}} to a character σ of O_D×. If σ occurs in ρ|O_D× for an irreducible ρ of D×, the composite of classical JL and full LLC places JL(ρ) in the Bernstein component specified by the type τ_s (Newton–Thorne proof of Lemma 3.6 p. 18). This node does not give a general degree-n induced parameter for every depth-zero ρ: for example 1_{D×} transfers to St_n and has nonzero monodromy. The explicit Bushnell–Henniart rectifier formulas needed for a general level-zero theorem were not independently read and remain a gap.

Hypotheses and conventions:

- Exactly Newton–Thorne §3 Lemma 3.6 pp. 17–18, including its τ_s and congruence hypotheses. This is a specific Bernstein-component assertion, not the full depth-zero classification.

Proof plan:

- Apply the explicitly cited composite LLC/JL calculation to this residue-field norm character, as in Newton–Thorne Lemma 3.6 p. 18. The underlying Bushnell–Henniart formula and its generalization must be checked from its primary source before closing the gap.

Direct prerequisites:

- `ET.6/full-wd-local-langlands`
- `ET.6/local-jacquet-langlands`

Sources:

- [J. Newton and J. A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/abs/2212.03595v2), §3 Lemma 3.6 and proof pp. 17–18, arXiv:2212.03595v2. uses that the composite of local Langlands and Jacquet–Langlands is explicit on level-zero representations of D^× and identifies the Bernstein component of π_{τ_s}

Checks:

- For n = 1 the statement is the tame part of local class field theory.
- The trivial representation of D^× corresponds to Steinberg, which is not of level-zero supercuspidal type: the formula is about supercuspidal level-zero representations of GL_n(F) and the non-trivial-character part of D^×.
- A character of D^× trivial on O_D^× corresponds to an unramified twist of Steinberg.

### ET.6.27 Inner-form parameter through the Langlands quotient Q

Target `ET.6/inner-form-langlands-parameter` (construction).

For π′ irreducible on GL_r(D), write it as the unique Langlands quotient of an ordered standard induction of essentially square-integrable δ′_i (Badulescu §2.1 p. 5). Let Q(π′) be the Langlands quotient of the split standard module with factors JL(δ′_i), with exactly the same real exponents (Badulescu §3.3 p. 15). Q is injective on irreducibles (Proposition 3.9 p. 16). Define rec_{G′}(π′)=rec_F(Q(π′)) and its semisimple parameter by restriction. For products of inner forms take direct sums. This is not an inverse of the Grothendieck-group map LJ: in the 2007 source LJ(Q(π′)) can contain lower terms, and equality is Conjecture 3.10. The split case is Q=id.

Hypotheses and conventions:

- Normalized standard induction; ordered essentially square-integrable Langlands data for GL_r(D).
- Use the same geometric-Frobenius convention as rec_F.

Proof plan:

- Use uniqueness of inner-form Langlands data and the classical JL bijection on each factor, so the split Langlands quotient is independent of the permitted ordering.
- Apply rec_F to Q and add parameters for a product Levi. Compatibility of semisimple parameters with standard induction follows from the direct-sum formula on the factors. No inverse of LJ on irreducibles is constructed.

Direct prerequisites:

- `ET.6/local-jacquet-langlands`
- `ET.6/full-wd-local-langlands`
- `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`

Sources:

- [A. I. Badulescu, Jacquet–Langlands et unitarisabilité](https://imag.umontpellier.fr/~ioan-badulescu/Files/jimj.pdf), §2.1 p. 5; §3.3 definition of Q p. 15 and Proposition 3.9 p. 16; Conjecture 3.10 p. 17. inner-form standard data and the irreducible split Langlands quotient Q

Planning API:

- `innerFormLanglandsLift` (constructor): Q(π′) is the split Langlands quotient of JL-transferred square-integrable standard data.
- `innerFormLanglandsLift_independent` (relation): Permitted reorderings of Langlands data give isomorphic Q(π′).
- `innerFormLanglandsLift_split` (relation): For d=1, Q(π′)=π′.
- `innerFormWDParameter` (constructor): rec_F(Q(π′)); for product Levis use direct sums.
- `innerFormWDParameter_essSqInt` (relation): For square-integrable π′, this is rec_F(JL(π′)).

Uses:

- EndoscopicTransferAndUnitaryTraceComparison:ET.6: Normalization and constructors used by the dependent targets identified in the review.

Unit tests:

- `innerFormLanglandsLift.quaternion` (computation): For quaternion D, Q(1_{D×})=St₂, whereas LJ(1_{GL₂})=−1_{D×}; the negative virtual class is not the parameter construction.
- `innerFormLanglandsLift.split` (computation): For d=1, each standard factor and its quotient are unchanged, so Q=id.
- `innerFormWDParameter.block_size` (computation): For square-integrable δ′ on GL_s(D), rec_F(JL(δ′)) has dimension sd, not s; direct sums preserve the total dimension rd.

Checks:

- For quaternion D, Q(1_{D×})=St₂, whereas LJ(1_{GL₂})=−1_{D×}; the negative virtual class is not the parameter construction.
- For d=1, each standard factor and its quotient are unchanged, so Q=id.
- For square-integrable δ′ on GL_s(D), rec_F(JL(δ′)) has dimension sd, not s; direct sums preserve the total dimension rd.

### ET.6.28 Semisimple Langlands parameters, also for inner forms of Levi subgroups

Target `ET.6/semisimple-langlands-parameter` (definition).

(a) The semisimple Langlands parameter of a Frobenius-semisimple Weil–Deligne representation, viewed as W_F × SL_2(ℂ) → GL_m(ℂ), is its restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})); for π irreducible of GL_m(F) set σ_π^{ss} = this restriction of rec_F(π). It is compatible with normalised parabolic induction and depends only on the cuspidal support: it is exactly a point of the Bernstein centre, and non-trivial extensions exist only between irreducibles with the same semisimple parameter. (b) For J an inner form of a Levi subgroup M of GL_m(F) (for instance J_{b_v}(F_v) of ET.5/jb-endoscopic-levi-data) and π an irreducible smooth representation of J, the semisimple L-parameter σ_π : W_F → GL_m(ℚ̄_ℓ) is defined through the irreducible Langlands-quotient map Q of ET.6/inner-form-langlands-parameter followed by (a).

Hypotheses and conventions:

- Frobenius-semisimple Weil–Deligne representations; inner forms of products of general linear groups

Proof plan:

- (a): Caraiani–Scholze non-compact Remark 5.1.1, using ET.6/full-wd-local-langlands (d).
- Use inner-form Langlands standard data, transfer its square-integrable factors by JL and take the split Langlands quotient Q (ET.6/inner-form-langlands-parameter). Apply rec_F and then restrict to the semisimple Weil representation. Badulescu’s additive LJ is not inverted.

Direct prerequisites:

- `ET.6/full-wd-local-langlands`
- `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`
- `ET.6/inner-form-langlands-parameter`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, Remark 5.1.1, p. 65. defines the semisimple Langlands parameter by restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})), notes its compatibility with parabolic induction and that it is a point of the Bernstein centre, and attaches it to representations of J_{b_v}(F_v) via Badulescu

Planning API:

- `semisimpleParameter` (constructor): σ^{ss} of a Frobenius-semisimple Weil–Deligne representation by restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})).
- `semisimpleParameter_induction` (relation): σ^{ss}(n-Ind(π_1 ⊗ π_2)) = σ^{ss}(π_1) ⊕ σ^{ss}(π_2).
- `semisimpleParameter_bernstein` (characterisation): σ^{ss}(π) depends only on the cuspidal support of π.
- `semisimpleParameter_ext` (relation): If Ext^1(π, π′) ≠ 0 then σ^{ss}(π) = σ^{ss}(π′).
- `innerFormSemisimpleParameter` (constructor): The semisimple Weil parameter of rec_F(Q(π′)), with Q constructed from JL-transferred square-integrable Langlands data. It is not obtained by inverting LJ.
- `innerFormSemisimpleParameter_split` (compatibility): For the split inner form it agrees with semisimpleParameter.

Uses:

- Caraiani–Scholze non-compact Theorem 5.1.2: the semisimple parameter of π_{j,v}|·|^{1/2−n} matches the Galois representation at p
- Scholze–Shin §6 (stable Bernstein centre): semisimple parameters index the stable Bernstein centre
- ET.7b/local-factorization (ET.6a packet): virtual coefficients are separated by semisimple parameters

Unit tests:

- `semisimpleParameter_unramified` (computation): For an unramified principal series with Satake parameters (α_i), σ^{ss} = ⊕ unramified characters with Frobenius eigenvalues α_i.
- `semisimpleParameter_steinberg_trivial` (characterisation): σ^{ss}(St_2) = σ^{ss}(1_{GL_2}).
- `semisimpleParameter_not_injective` (non-example): σ^{ss} is not injective on irreducibles (trivial and Steinberg of GL_2 share it), so it cannot replace rec_F.
- `innerFormSemisimpleParameter_quaternion` (computation): For D^× the quaternion units, σ_{1_{D^×}} = σ^{ss}(St_2).

Checks:

- For an unramified principal series with Satake parameters (α_i), σ^{ss} = ⊕ unramified characters with Frobenius eigenvalues α_i.
- σ^{ss}(St_2) = σ^{ss}(1_{GL_2}).
- σ^{ss} is not injective on irreducibles (trivial and Steinberg of GL_2 share it), so it cannot replace rec_F.
- For D^× the quaternion units, σ_{1_{D^×}} = σ^{ss}(St_2).

### ET.6.29 Generic principal series parameters do not transfer to non-split inner forms

Target `ET.6/inner-form-nontransfer` (theorem).

Let J be a non-quasi-split inner form of a Levi M of GL_m(F) (for example J_{b_v}(F_v) when b_v has a non-integral slope), and λ = χ_1 ⊕ … ⊕ χ_m a semisimple parameter that is a sum of characters with χ_i χ_j^{-1} ≠ |·|^{±1} for i ≠ j (a generic principal series parameter). Then no irreducible smooth representation π of J has σ_π = λ (ET.6/semisimple-langlands-parameter), and LJ_M(π_M) = 0 for every irreducible π_M of M whose parameter is λ. Consequently, if a representation π_p^n⃗ of an endoscopic group of a unitary group transfers at a place p_i to a generic principal series of GL_n(F_{p_i}) while J_{b_i} is a non-quasi-split inner form of M_{b_i}, then Red^b_n⃗(π^n⃗_p) = 0 (Caraiani–Scholze 2017 Lemma 5.4.3).

Hypotheses and conventions:

- J not quasi-split
- λ generic in the stated sense

Proof plan:

- Use Q and the inner-form Langlands data. If λ is a sum of characters with no distinct ratio |·| or |·|⁻¹, no monodromy chain of length at least 2 can join its characters. Thus every split square-integrable standard factor would have degree 1. A nonsplit GL_s(D) factor transfers square-integrable data of dimension sd with d>1, and such degree-one data cannot occur. This proves absence of λ for the nonsplit inner factor. Separately, Proposition 3.3 kills the generic principal series induced from the nontransferring split diagonal Levi. Vanishing under LJ alone does not prove parameter absence.
- For Red^b: the L-morphism ^LM_{G_n⃗} → ^LM_b restricts η̃, so the image of π^n⃗_p in Groth(M_b(ℚ_p)) has only generic principal series components at p_i, which lie in the kernel of LJ (Caraiani–Scholze 2017 proof of Lemma 5.4.3).

Direct prerequisites:

- `ET.6/badulescu-langlands-jacquet-map`
- `ET.6/semisimple-langlands-parameter`
- `ET.6/full-wd-local-langlands`
- `ET.6/inner-form-langlands-parameter`

Sources:

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Lemma 5.4.3 and proof, p. 741. proves that Red^b kills representations transferring to generic principal series when J_{b_i} is a non-quasi-split inner form
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, proof of Corollary 5.1.3, p. 66. uses that generic principal series parameters (no ratio equal to the cyclotomic character) do not occur for non-trivial inner forms of Levi subgroups

Checks:

- For M = GL_2 and J = D^×: an irreducible principal series χ_1 × χ_2 with χ_1χ_2^{-1} ≠ |·|^{±1} has no Jacquet–Langlands partner.
- If J is quasi-split (J = M) the statement is false: the principal series itself has parameter λ.
- If χ_1χ_2^{-1} = |·|, the parameter is that of Steinberg/trivial and does transfer to D^×.

### ET.6.30 Worked checks for the local correspondence and inner forms

Target `ET.6/acceptance-examples` (application).

(1) GL_1: rec_F = local class field theory with Art_F sending uniformizers to geometric Frobenius. (2) GL_2 unramified principal series χ_1 × χ_2 (χ_1χ_2^{-1} ≠ |·|^{±1}): rec_F = χ_1 ⊕ χ_2 with N = 0, and the Satake parameters match (SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter). (3) GL_2 Steinberg and trivial: rec_F(St_2) = |·|^{-1/2} ⊗ Sp_2 (N of rank 1) and rec_F(1) = |·|^{-1/2} ⊕ |·|^{1/2} (N = 0); Scholze's semisimple σ does not distinguish them. (4) Quaternion inner form: JL(1_{D^×}) = St_2 with character sign −1; LJ(1_{GL_2}) = −1_{D^×}; LJ kills irreducible principal series (ET.6/inner-form-nontransfer). (5) Tadić: for real α with α≠±1/2, the irreducible ν^α×ν^{−α} on GL₂ is unitary exactly when |α|<1/2; α=0 is the tempered endpoint and ±1/2 are reducibility points. (6) Segment linking: [1, ν] × [ν, ν²]-type products are reducible exactly when the segments are linked (Zelevinsky Theorem 4.2).

Hypotheses and conventions:

- the data of the cited nodes

Proof plan:

- Each check specialises the named node.

Direct prerequisites:

- `ET.6/full-wd-local-langlands`
- `ET.6/local-jacquet-langlands`
- `ET.6/inner-form-nontransfer`
- `ET.6/tadic-unitary-dual`
- `ET.6/zelevinsky-classification`

Sources:

- [A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Theorem 4.2, p. 184. gives the irreducibility criterion used in check (6)
- [M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), Theorem 7.5, p. 370. gives the complementary-series range used in check (5)

Checks:

- A wrong Frobenius normalisation (1), a missing monodromy operator (3), a missing sign (4), or a wrong complementary-series range (5) is detected.

## Exact supplier contracts

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Deformation theory of p-divisible groups with O-action over complete local rings with perfect residue field (Grothendieck–Messing or Dieudonné-theoretic form), in the generality of one-dimensional ϖ-divisible O-modules of height n and of D-groups, as used for R_β and for the D-groups of Scholze 2010 §§2, 4 and 7.

Used by `ET.6/drinfeld-level-deformation-spaces`, `ET.6/norm-maps-and-base-change-identities`.

### ClassicalAdicEtaleCohomology:H1:formal-adic-comparison

Berkovich's nearby cycles for formal schemes locally of finite type over a complete discrete valuation ring and their comparison with algebraic nearby cycles (used for R_β,m and for the Lubin–Tate tower, Scholze 2010 Theorems 2.5 and 11.1).

Used by `ET.6/drinfeld-level-deformation-spaces`, `ET.6/lubin-tate-comparison`.

### LefschetzPencilsAndVanishingCycles:LPV.6

Nearby cycles of schemes over a henselian discrete valuation ring with constructible ℓ-adic coefficients, compatibility with proper pushforward and with completion at closed points (Scholze 2010 Lemmas 9.1–9.2).

Used by `ET.6/drinfeld-level-deformation-spaces`, `ET.6/division-algebra-shimura-varieties`, `ET.5/igusa-fixed-point-formula`.

### EtaleDualityAndPerverseSheaves:EDC.5

The scheme perverse/recollement interface formerly imported through ET.2a:duality-perversity (RS-19 link EDC.5 → ET.5), as the coefficient framework for the Igusa correspondences.

Used by `ET.5/igusa-fixed-point-formula`.

### EtaleDualityAndPerverseSheaves:EDC.6

Coefficient realization of the duality operations formerly imported through ET.2a:duality-perversity (RS-19 link EDC.6 → ET.5).

Used by `ET.5/igusa-fixed-point-formula`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group

The local Weil group W_F with its topology, inertia, the degree map to ℤ and the norm |·| : W_F → ℝ_{>0}, as the carrier of Weil–Deligne parameters.

Used by `ET.6/segment-wd-parameter`, `ET.6/llc-characterizing-properties`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

Import the existing arithmetic-Frobenius reciprocity isomorphism. Define Art_geo(x)=Art_arith(x⁻¹) in W_F^ab and verify the convention used by rank-one LLC. Do not ask the upstream roadmap to replan an already existing geometric-normalized carrier.

Used by `ET.6/llc-characterizing-properties`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Global class field theory for cyclic extensions: the character ω of 𝔸_F^×/F^×N(𝔸_E^×) attached to a cyclic extension E/F.

Used by `ET.4/global-cyclic-base-change`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Maximal tori, Levi subgroups and anisotropic tori of connected reductive groups over ℚ and ℝ, used to define cuspidal groups.

Used by `ET.4/cuspidal-levi-subsets`.

### SmoothRepresentationsOfLocalGroups:SR.5

A precise multiplicity-one GL_n(O)-newvector/type statement for supercuspidals, used by Scholze Corollary 11.5 p. 30; the current mirabolic-derivative definition alone does not supply it.

Used by `ET.6/lubin-tate-comparison`.

### AutomorphicLFunctionsAndLocalFactors:AL.3

An essentially-square-integrable segment-pair L/ε formula with monodromy and conductor correction, and its Langlands-block extension to the chosen nongeneric convention; current rs-local-factor is generic only.

Used by `ET.6/full-wd-local-langlands`.

### AutomorphicSpectralTheory:AS.4

Number-field GL_n unitary discrete residual Speh classification, its global multiplicity one, and the induced Levi data used in Shin Proposition 4.8; the existing function-field/unramified specialization does not supply it. Read Mœglin–Waldspurger 1989 main theorem pp. 605–606 and provide its full primary proof chain.

Used by `ET.4/twisted-spectral-side`, `ET.4/cohomological-unitary-weak-base-change`.

### AutomorphicFormsOnReductiveGroups:AF.1

For GL_n(ℝ) and GL_n(ℂ), normalized parabolic induction of arbitrary irreducible unitary GL-block representations is irreducible, and the normalized intertwiner is holomorphic/invertible at the unitary point. Mœglin–Waldspurger §I.1.1(3) pp. 607–608 invokes Vogan/Bernstein; generic-unitary classification alone does not cover residual Speh data. For nonarchimedean blocks use the existing ET.6/tadic-unitary-dual supplier.

Used by `ET.4/twisted-spectral-side`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic

Import the already planned real/complex continuous-character classification for the infinity component of ϖ: its restriction to ℝ× forces odd angular exponent and zero norm exponent. This is an existing roadmap import, not a request to plan that classification again.

Used by `ET.4/quadratic-character-extension`.

## Proof obligations retained by the plan

These are endpoints of target-level prerequisite chains. They prevent a closed coverage claim. ET.5/ET.6 obligations are retained for their separate owners.

### Unitary classification primary proof chain

KMSW v1 Theorem* 1.6.1, §1.6.4 and Theorem* 1.7.1 have been read: the bounded local theorem and positive-exponent packet construction are now separate targets, and generic pure-inner global classification retains its correct scope. The complete quasi-split Mok proof, inner-form local intertwining relations and global stabilized comparison underlying these results were not traced to primary proofs in this run. Supply exact character-normalization and stabilization suppliers; ordinary twisted spherical FL does not establish a weighted FL. General nongeneric/arbitrary-inner assertions are outside this target, not silently upgraded.

Needed by `ET.4/unitary-endoscopic-classification`, `ET.4/tempered-unitary-local-packets`, `ET.4/extended-unitary-local-packets`.

### Harris–Taylor §VI and Kottwitz's simple Shimura varieties read only through citing papers

The base change and descent statements Harris–Taylor Lemma VI.2.10, Theorem VI.2.9 and Corollaries VI.2.7–VI.2.8, and Kottwitz's results on simple Shimura varieties (Invent. Math. 108, 1992), are planned from their statements as used in Scholze 2010 §§8–10 and Shin 2011 §6.2. The Harris–Taylor book is not freely available and is not in the cleared library (the same source-access request as the ET.6a packet). The proofs must be matched with internal locators once a copy is registered; Labesse's Changement de base CM et séries discrètes (2011) is the public alternative for the unitary base change.

Needed by `ET.4/unitary-gl-base-change-descent`, `ET.4/simple-division-algebra-trace-identity`, `ET.6/global-galois-input`, `ET.6/post-correspondence-global-galois`.

### Primary sources cited through secondary statements

Inherited ET.6 obligations: full classical Deligne–Kazhdan–Vignéras JL proof; Drinfeld deformation and level theory; Berkovich and Mieda nearby-cycle comparison; Harris non-Galois induction and Henniart characterization. Badulescu 2007 §§2–3 and Scholze §12 were read by the independent reviewer. Scholze Theorem 12.3 uses constructive cyclic descent, not numerical counts. The ET.4 primary sources are now read and their exact underlying proof obligations are recorded separately.

Needed by `ET.6/local-jacquet-langlands`, `ET.6/non-galois-automorphic-induction`, `ET.6/drinfeld-level-deformation-spaces`.

### Bushnell–Henniart level-zero formulas not read

The explicit level-zero composite of local Langlands and Jacquet–Langlands (Bushnell–Henniart, J. Number Theory 2011) is stated from its use in Newton–Thorne 2026 (proof of Lemma 3.6) as recorded by the accepted extraction; the twisting characters were not read and the node's statement is only as precise as that use.

Needed by `ET.6/level-zero-explicit`.

### Truncated constituent criterion beyond degree one

Independently checked in the published AKY 2022 §6.3 Lemma 6.6 pp. 33–34. The displayed derivative order equals the cardinality only when every cuspidal degree is one. This packet keeps precisely that type-χ form. A higher-degree consumer must replace cardinality by the sum of cuspidal degrees and prove the revised criterion; no such generalization is claimed here.

Needed by `ET.6/ladder-and-constituent-theorems`.

### Missing current-tier algebraic and Igusa geometry

ET is tier 14, IG tier 19, and BG outside the 94. WORKERS.md forbids those upward imports. Plan the required B(G), representable J_b, decency, Newton/Kottwitz maps and slope pieces here, together with the required completely slope-divisible Igusa moduli, finite levels, Hecke actions and Frobenius descent. Each definition requires its own API and three discriminating tests. The review removes the illegal prerequisites but supplies no replacement proof; these nodes are not dependency-closed. Higher BG/IG plans must later import the new owner, not duplicate it.

Needed by `ET.5/acceptable-test-functions`, `ET.5/igusa-fixed-point-formula`, `ET.5/igusa-kottwitz-triples`, `ET.5/p-adic-types`, `ET.5/fixed-points-and-effective-triples`, `ET.5/igusa-counting-formula`, `ET.5/stabilization-away-from-p`, `ET.5/jb-endoscopic-levi-data`, `ET.5/transfer-at-p`, `ET.5/igusa-endoscopic-test-function`, `ET.5/stable-igusa-trace-formula`, `ET.5/acceptable-functions-determine`, `ET.5/unitary-igusa-trace-formula`.

### Trace-correspondence boundary and normalization supplier

EDC.8/fujiwara-varshavsky-trace-formula requires the actual leg properness/quasi-finiteness and a compactification with invariant boundary; EDC.8/frobenius-twist-contracting is the general theorem, not the Igusa application. Supply the geometry and the correct volume-normalized double-coset trace. Ordinary Shimura triple weights in Scholze §9 also require their own Kottwitz coefficient/effectivity supplier; Shin 2009 Remark 13.3 does not identify the indexing sets.

Needed by `ET.5/igusa-fixed-point-formula`, `ET.6/drinfeld-level-point-count`.

### Formal geometry and Drinfeld-level representability

R07.2, LPV.6 and the requested H1 formal-adic comparison are stage-level requests, not exact supplying nodes. Plan or resolve formal deformation and level regularity, algebraization along a finite subscheme and the Berkovich comparison. PELModuli:M2/representability only gives a smooth algebraic space at good level, and M2/properness-when-division only properness at good primes; they do not prove projective Drinfeld-level representability. Name a precise projectivity/Drinfeld-level supplier with the determinant condition.

Needed by `ET.6/drinfeld-level-deformation-spaces`, `ET.6/norm-maps-and-base-change-identities`, `ET.6/division-algebra-shimura-varieties`, `ET.6/lubin-tate-comparison`.

### Missing archimedean base-change and Hecke-character realizations

Inherited ET.6 obligation: Scholze §13 Lemmas 13.3–13.4 need ℓ-adic realizations of algebraic Hecke characters and normalization conversion. ET.4/global-cyclic-base-change now imports the exact AF.1/archimedean-llc-gln supplier for the real/complex parameter dictionary; this does not supply the ℓ-adic realization.

Needed by `ET.6/non-galois-automorphic-induction`.

### Zelevinsky dual algorithm primary proof

Zelevinsky 1980 §9 pp. 199–203 does not prove the later Mœglin–Waldspurger algorithm. AKY §2.3 pp. 7–8 uses the dual with references. Read a primary proof of the algorithm, state it exactly and plan its inputs before claiming the algorithm is established.

Needed by `ET.6/zelevinsky-classification`, `ET.6/multisegment-operations`.

### Lubin–Tate multiplicity-one newvector input

Scholze Corollary 11.5 p. 30 uses a GL_n(O)-representation occurring with multiplicity one in π∨. None of the direct suppliers states that newvector theorem. Add its precise primary statement and supplier to obtain the integrality needed by Lemma 3.2(iii).

Needed by `ET.6/lubin-tate-comparison`.

### Full Weil–Deligne segment-pair factors and conductor

The supercuspidal equality of factors in Scholze §14 is insufficient for the asserted full theorem. Need the essentially-square-integrable segment-pair L/ε formula including ker N and the monodromy conductor correction, then multiplicativity over Langlands blocks and the nongeneric factor convention. AL.3/rs-local-factor is stated for generic inputs. Equality of semisimple cuspidal support cannot prove this: St₂ and 1 have different monodromy. Read and cite the relevant primary factor proof; Zelevinsky §10 is not that proof.

Needed by `ET.6/full-wd-local-langlands`.

### Character-theorem Howe support and real harmonic inputs

Clozel 1987 Theorems 1–3 and the support proof §§3.5–3.9 were read. His Lemma 6 uses Howe’s small-compact orbit parametrization/intertwining result and Cartan estimates; their primary proofs were not read here. Delorme–Mezo Theorems 3/4 use the real tempered classification, normalized analytic intertwiners and the induction/spectral relations of their main Paley–Wiener theorem. SR.2 induction and AF.1 classification give carriers but not these full analytic support statements. Name the exact supplying results and match their extension-scalar convention before treating these proof chains as closed.

Needed by `ET.4/padic-character-distributions`, `ET.4/twisted-characters`, `ET.4/twisted-character-support-and-paley-wiener`.

### Classical inner-form Tamagawa and Hasse proof

Kottwitz 1984 §5 pp. 625–626 supplies the relative formula; Lai 1980 Theorem 7.2 pp. 187–188 supplies only the quasi-split simply connected branch. Need the classical Weil/Kneser primary proof of τ=1 for the inner SL/SU covers of the elliptic centralizers, the simply connected Hasse principle and the approximation inputs used in Kottwitz–Rogawski Lemma 1. AA.2 supplies measures and Ono’s general formula interface, not this inner-form number-one computation. Do not infer that an inner centralizer is quasi-split or that its ker¹ vanishes.

Needed by `ET.4/classical-simply-connected-tamagawa`, `ET.4/tamagawa-number-formula`, `ET.4/elliptic-stabilization`, `ET.4/twisted-character-support-and-paley-wiener`.

### Central elliptic complement

Kottwitz 1986 Theorem 9.6 pp. 394–396 proves the noncentral formula, with (G,H)-regular endoscopic classes and omitted central classes for the inner datum. The new complement target states exactly the additional identity needed for the full displayed elliptic formula. A primary proof of the omitted central/nonregular terms with the same quotient measures and transfer normalization remains required. Regular matching alone does not close this singular identity.

Needed by `ET.4/central-elliptic-stabilization`, `ET.4/elliptic-stabilization`.

### Real character boundary and central quotient transport

Clozel–Labesse 2011 Theorems 2.2, 4.1 and 5.1 provide the pure-unitary Lefschetz construction and singular stable orbital formula, including the centralizer sign; Morel corrected v2 Proposition 8.2.3 and Lemmas 8.2.5/8.2.6 give the invariant vanishing proof. That proof uses Clozel’s real θ-discrete character growth and boundary results (Morel [Cl2] Theorems 5.1 and 7.2), Arthur’s connected-centralizer unipotent limits and differential-equation induction. These exact primary proofs, and the product/similitude quotient-measure transport to this packet’s GU central-character spaces, were not independently read. ET.1 real transfer supplies matching, not those analytic estimates.

Needed by `ET.4/archimedean-lefschetz-functions`, `ET.4/archimedean-invariant-vanishing`, `ET.4/twisted-geometric-side`.

### Number-field residual spectrum and all-unitary induction

Mœglin–Waldspurger 1989 §I.1.1(3) pp. 607–608 supplies irreducibility of unitary GL induction and regular invertible normalized operators at the unitary point, but invokes Bernstein/Vogan primary proofs. AS.4 currently supplies a function-field everywhere-unramified residual classification rather than the needed number-field discrete Speh classification and multiplicity one. The two exact supplier requests below are prerequisites of the spectral proof. Restricting to cuspidal data or generic unitary induction would lose residual Speh terms.

Needed by `ET.4/twisted-spectral-side`, `ET.4/cohomological-unitary-weak-base-change`.

### GSp4 classification and weighted twisted stabilization

Gee–Taïbi Proposition 6.1.7, Remark 6.1.8 and Theorem 7.4.1 pp. 507–514 were read. Their chain uses the Sp₄/SO₅ classification, local packet restriction/normalization, twisted weighted stabilization and the exterior/symmetric-square pole argument. The primary proofs of these underlying inputs were not traced here; the introduction p. 472 retains the weighted fundamental-lemma assumption. Record a precise conditional supplier for those inputs. The unitary classification is not a substitute. ML.4 should import the general-type ET.4 theorem, keeping its own full-classification application; it must not duplicate this target or be an upward dependency.

Needed by `ET.4/gsp4-gl4-transfer`.

## Source corrections

### EndoscopicTransferAndUnitaryTraceComparison/E2

§5.5, definition of 𝒢^+_n⃗, p. 72 (arXiv:1909.01898v2).

The source defines θ by θ(λ, g)θ^{-1} = (λ^c, λ^c g^♯) with g^♯ = Φ_n⃗ ᵗg^c Φ_n⃗^{-1}, i.e. without an inverse.

g^♯ = Φ_n⃗ ᵗ(g^c)^{-1} Φ_n⃗^{-1}, as in Shin 2011 §4 before (4.2), p. 21, where the map is g ↦ Φ_n⃗ ᵗg^{−c} Φ_n⃗^{-1}.

θ must be an automorphism of order 2 whose fixed points are the unitary similitude group G_n⃗; without the inverse, g ↦ Φ ᵗg^c Φ^{-1} is an anti-automorphism (it reverses products), so θ would not be a group automorphism.

The same slip in Caraiani–Scholze 2017 §5.3 p. 736 is recorded as erratum E69 of the accepted extraction PAPER-CARAIANI-SCHOLZE-17; for the non-compact sequel it is new here.

### EndoscopicTransferAndUnitaryTraceComparison/E3

Appendix A.1.1, pp. 120, 122–123; correction in Clozel–Labesse 2011 §5 p. 115.

Several displayed orbital-integral formulas omit the Kottwitz sign of the semisimple twisted centralizer.

Retain e(I_δ) in the stable singular formula; for GL_n(ℂ) base change from U(p,q), the nonzero value is e(I_δ)2^n times the coefficient character at the norm.

The centralizer Euler–Poincaré value depends on its real form. Clozel–Labesse Theorems 4.1/5.1 and their published correction supply the required sign.

Published correction by Clozel and Labesse, Clay Mathematics Proceedings 13 (2011), p. 115, identifying the affected lines of Labesse 1999.

### EndoscopicTransferAndUnitaryTraceComparison/E4

§4.5, proof of Proposition 4.5, p. 27.

The prose cuspidality criterion reverses the existence of an anisotropic maximal real torus modulo the split centre.

A cuspidal connected group has such an anisotropic maximal torus modulo A_M; for a twisted Levi subset test this on its associated fixed unitary Levi.

Morel Definition 3.1.1 and §8.2 give the positive-existence criterion. Shin’s subsequent split-centre rank argument rules out proper cuspidal Levis only with that criterion.

No independently verified published erratum located in this run; this record concerns only the cited primary copy.

## Ownership and independent review

The early character prefix remains in ET.4 until the existing restructuring decision establishes a single SR Part II owner. The number-field residual-spectrum and all-unitary real induction inputs are requested from AS.4 and AF.1, respectively. The archimedean GL parameter dictionary is already planned in AF.1 and is imported. ML.4 should import ET.4's general-type GSp₄ transfer, while keeping its full-classification application. ET.6a and later packets must repoint their interfaces to the reviewed exact nodes; this revision does not claim those edits.

The previous independent review object and its node ledger remain unchanged. In particular this revision does not replace unverifiable by verified or accept its own work. The next reviewer should assess the new ET.4 targets and refined source obligations against the primary locators, and check that the inherited ET.5/ET.6 corrections remain present in this reader.
