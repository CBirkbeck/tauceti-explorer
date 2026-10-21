# K-theory of schemes, localisation and operations, Part II: supported formal K-theory and derived intersection degrees

Intersection numbers on regular formal schemes — on the Rapoport–Zink spaces of the arithmetic fundamental lemma and of the Kudla–Rapoport conjecture, for instance — are defined as Euler–Poincaré characteristics of derived tensor products of structure sheaves, in Grothendieck groups with supports. Zhang's Appendix B to his proof of the arithmetic fundamental lemma records the definitions, by transposing Gillet–Soulé's theory from schemes to formal schemes, together with two lemmas, and Li–Zhang, Li–Liu and He–Li–Shi–Yang build on it. This roadmap develops that theory once, with the conventions a formal scheme forces: dimension, codimension and support are read on stalks and on powers of ideals, never on underlying topological spaces, since |Spf ℤ_p⟦t⟧| is a single point although the formal scheme has dimension 2.

It builds the Grothendieck group K′₀ of coherent modules and the Gillet–Soulé group K₀^Y of strict complexes with formal support on noetherian formal schemes, the homology class map, the cup product and the Tor pairing; the regular comparison K₀^Y(X) ≅ K′₀(Y) under finite dimension and the resolution property, the codimension and dimension filtrations and their comparison, rational multiplicativity of the filtration on affine regular formal schemes, and the extension of all of this to locally noetherian formal schemes by noetherian exhaustion; Zhang's Lemma B.1 on closed unions and Lemma B.2 on Tor vanishing; and the Euler degree of a scheme proper over Spf A with the derived Euler–Poincaré pairing (B.4), its base change and pushforward behaviour, the length-times-rank formula for zero-dimensional classes and the pairing with Cartier divisors.

## Scope and ownership

This roadmap is the Part II of K-theory of schemes, localisation and operations (`SchemeKTheoryOperations`) and starts where it stops. That roadmap owns, for schemes: perfect complexes and K- and G-theory (S.1–S.2), supports, localisation and dévissage (S.3), the coniveau filtration (S.4), products, λ- and Adams operations and the rational multiplicativity of the support filtration in Gillet–Soulé's strict model (S.6), and cycle classes, the γ-filtration and Riemann–Roch (S.7). Here the same objects are built on formal schemes, and every affine statement is transported from Spec A rather than proved again (`FK.1/affine-transport`).

| Supplier | What is imported | Boundary |
| --- | --- | --- |
| `AdicSpacesPartII` F0 (upstream: AdicSpacesPartIII F0, Tau Ceti pull request #813) | Locally noetherian formal schemes, ideals of definition, completed localisations, closed formal subschemes, coherent formal modules and their affine description, proper formal morphisms, morphisms into Spf A | Formal geometry and coherent sheaves are owned there; coherence of higher direct images along proper morphisms of formal schemes (EGA III₁ (3.4.2)) is requested from F0 |
| `SchemeKTheoryOperations` S.2, S.3, S.4, S.6, S.7 | Gillet–Soulé's strict support group on schemes and its comparison with Thomason–Trobaugh, regular dévissage, products with supports, rational multiplicativity of the support filtration, G₀ pushforward and base change | Scheme statements are cited and transported, never re-planned |
| `SchemeAndStackFoundations` SF.0, SF.3, SF.4 | Catenary and Cohen–Macaulay rings, regular schemes (the local stalk-dimension convention here is separate) | Commutative algebra is cited |
| `EnhancedDerivedSheaves` E1 | The Koszul complex and its regular-sequence resolution; ordinary derived tensor, ringed pushforward and perfect projection formula | Cited |
| `GeneralAlgebraicKTheory` K.3 | Quillen's dévissage and resolving-subcategory theorems | Cited in degree 0 |
| Consumers: the Kudla–Rapoport and arithmetic fundamental lemma Part IIs (`GrossZagierAndArithmeticHeightsPartII`, `EndoscopicTransferAndUnitaryTraceComparisonPartII`) and Li–Liu's arithmetic inner product formula | Special cycles, derived cycle classes and intersection numbers | They import K₀^Y, the filtrations, Lemmas B.1–B.2 and the (B.4) pairing from here |

On TauCetiRoadmap main, Scheme and stack foundations §5.7 states K₀, G₀, the K-theoretic pushforward and the projection formula for noetherian schemes, and GrothendieckEulerForms owns the finite-resolution comparison (`TauCeti.cartanEquiv` at the pin); nothing upstream treats formal schemes or supports, and the scheme inputs used here are cited through `SchemeKTheoryOperations`, which plans them with supports.

Multiplicativity of the codimension filtration under cup product on non-affine formal schemes — Zhang's (B.3) for formal schemes — is open in the source (it is stated only as expected) and is not a target: `FK.2/affine-filtration-product` proves the affine case by transport and `FK.4/zero-dimensional-pairing` the case in which one factor is zero-dimensional, which are the cases the consumers use (Zhang, Remark 5.3; Li–Zhang, §1.8 and Remark 6.4.11). Continuous K-theory of the thickenings of a formal scheme is a different object and is not constructed.

The Cartier-divisor specialization imports degree and the tensor/dual formula for arbitrary proper curves from `SchemeAndStackFoundations:SF.3/vector-bundle-degree` (Stacks 0AYR and 0AYX); no new curve-degree theory is planned here.

## Conventions

1. Formal schemes are locally noetherian (`AdicSpacesPartII:F0/locally-noetherian-formal-scheme`); "noetherian" adds quasi-compactness. A closed formal subscheme Y = V(𝒥) is given by a coherent ideal 𝒥; Y ∩ Z := V(𝒥_Y + 𝒥_Z) and Y ∪ Z := V(𝒥_Y ∩ 𝒥_Z).
2. Dimension is local-ring dimension: dim_x X = dim O_{X,x}, dim X = sup_x dim_x X, codim_z(Z, X) = dim O_{X,z} − dim O_{Z,z}, codim_X Z = inf_z codim_z(Z, X). For noetherian X, pure dimension d means dim O_{X,x} = d at every closed point; this forces dim X = d. Local dim_x is stalk dimension and differs from neighbourhood dimension (at the generic point of A¹_k the two values are 0 and 1).
3. Support is formal: a coherent F is supported on Y if a power of 𝒥 kills it locally. On Spf A this is support in V(J) ⊆ Spec A.
4. K₀^Y(X) is Gillet–Soulé's strict group: global bounded complexes of locally free coherent modules with formally supported homology, modulo short exact sequences and quasi-isomorphisms. The comparison with K′₀(Y) is stated under the resolution property, which affine formal schemes have.
5. Lengths are over a complete discrete valuation ring A (residue field k) over which the relevant supports are proper schemes; a scheme proper over Spf A lives over some Spec A/ϖ^n.
6. Coefficients are integral unless ℚ is written.
7. The local power-series formal spectra in the examples carry the maximal-ideal-adic topology unless another ideal of definition is specified; in particular the examples whose underlying formal space is a point use this topology.

## Sources

- W. Zhang, *Weil representation and arithmetic fundamental lemma*, Ann. of Math. 193 (2021), 863–978, Appendix B (pp. 971–975) and its uses in §§3–5; the published PDF was read (page numbers are the journal's).
- C. Li and W. Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, arXiv:1908.01701v3 (J. Amer. Math. Soc. 35 (2022)), §1.8, §2.4, Corollary 2.8.2, §5.2, §10.4–10.5.
- A. Grothendieck, EGA I (Publ. IHÉS 4), Ch. 0 §7.6 and Ch. I §§10.1, 10.10; EGA III₁ (Publ. IHÉS 11), §3.4.
- The Stacks project (tags cited at each target).

The packet records independent verdicts on the source findings: E1 (the compressed proof of Lemma B.2(ii)) is rejected as a source mistake, while its prime-level expansion is retained below; E2 is confirmed as a missing resolution hypothesis for the global strict comparison; E3 records that the reduced-map criterion for properness in Li–Zhang’s preprint §1.8 is too weak for coherent pushforward. Properness here always includes EGA’s adic finite-type hypothesis. E3 is scoped to arXiv v3; the publisher PDF refused access. The extraction’s PAPER-ZHANG-21/E26 (non-affine formal (B.3)) and E60 (limits of cokernels) remain respected. All descriptions are paraphrases.

## How to read the build

| Layer | Content | Main targets |
| --- | --- | --- |
| FK.0 | Local algebra and formal supports | local dimension, regular formal schemes, codimension formula, regular immersions, formal support, Tor sheaves |
| FK.1 | Grothendieck groups and products | K′₀, dévissage, strict complexes, K₀^Y, affine transport, homology class map, cup product, Tor pairing |
| FK.2 | Regular comparison and filtrations | K₀^Y ≅ K′₀(Y), codimension and dimension filtrations, affine (B.3), noetherian exhaustion |
| FK.3 | Lemmas B.1 and B.2 | closed-union decomposition, Tor vanishing, componentwise Tor vanishing, Cartier pullback |
| FK.4 | Euler degree and (B.4) | Euler degree, derived Euler–Poincaré pairing, base change, zero-dimensional and Cartier pairings, proper pushforward |

<a id="layer-fk0"></a>

## Layer FK.0: Local algebra and formal supports on locally noetherian formal schemes

On a scheme, dimension, codimension and support can be read on the underlying space; on a formal scheme they cannot. The underlying space of Spf ℤ_p⟦t⟧ is a point, yet V(t) and V(p, t) must have codimensions 1 and 2, and the structure sheaf of Spf ℤ_p has topological support equal to V(p) without being p-power torsion. This layer therefore reads everything on stalks, which the stalk-comparison lemma ties to the localisations A_p of an affine formal open Spf A, and on powers of ideals. It also constructs the Tor sheaves of coherent modules, glued from the modules Tor_j^A through the flatness of completed localisations, which every derived intersection below uses.

**Targets of the layer.**

Fix the local algebra that formal schemes need. Prove that the stalk of Spf A at an open prime p, the localisation A_p and the completed localisation share their completion, so that dimension, regularity and the Cohen–Macaulay property can be read on A_p. Define the local dimension dim_x X = dim O_{X,x}, the dimension and pure dimension of a formal scheme, and the local and global codimension of a closed formal subscheme, measured through stalks and not through the underlying space. Define regular and Cohen–Macaulay formal schemes (Spf A regular iff A regular) and prove the codimension formula codim_X Z = d − dim Z on noetherian Cohen–Macaulay formal schemes of pure dimension d, which identifies codimension on Spf A with height in Spec A. Define regular immersions and effective Cartier divisors of formal schemes with their local Koszul resolutions. Define formal support (a power of the ideal kills the module), its Serre subcategory Coh_Y(X), and its affine description by supports in Spec A, distinguishing it from topological support. Construct the Tor sheaves Tor_j^{O_X}(F, G) of coherent modules, glued from Tor_j^A over affine formal opens through the flatness of completed localisations, with stalks, long exact sequences, formal supports and the vanishing above the dimension on regular formal schemes.

**Planets.** Local dimension of a formal scheme; Regular formal scheme; Formal support; Tor sheaves on formal schemes.

### Stalks of Spf A, localisations of A and completed localisations share their completion

**Target `SchemeKTheoryOperationsPartII:FK.0/stalk-completion-comparison` (lemma).** Let A be a noetherian adic ring with ideal of definition I, X = Spf A, and let x ∈ |X| correspond to the open prime p ⊇ I. The canonical maps A_p → O_{X,x} → A{A∖p} (the last is the completed localisation lim_n (A/I^n)_p) are local homomorphisms of noetherian local rings, both flat, and each induces isomorphisms modulo I^n for every n ≥ 1: A_p/I^nA_p ≅ O_{X,x}/I^nO_{X,x} ≅ (A/I^n)_p. Consequently the three rings have isomorphic maximal-ideal-adic completions, and hence the same Krull dimension, and one of them is regular (respectively Cohen–Macaulay) if and only if all three are. Every maximal ideal of A contains I, so the closed points of |Spf A| are exactly the maximal ideals of A.

**Hypotheses and conventions.**

- A noetherian and complete and separated for its I-adic topology (an adic noetherian ring, AdicSpacesPartII:F0/adic-ring).
- x is a point of the formal spectrum, i.e. an open prime ideal p of A (p ⊇ I).

**Proof outline.**

1. The stalk of the structure sheaf of Spf A at x is the colimit of the completed localisations A_{f} over f ∉ p (EGA I (10.1.5)); it is a noetherian local ring with residue field k(p) (EGA I (10.1.6)), and A_p → A{A∖p} is local and faithfully flat (EGA 0_I (7.6.17)–(7.6.18)). The map A_p → O_{X,x} is flat because it is the filtered colimit of the flat completed localisations; O_{X,x} → A{A∖p} is its I-adic completion map and is flat by EGA 0_I (7.6.16). The local maps are faithful.
2. Modulo I^n every term becomes the stalk of the scheme Spec(A/I^n) at p, namely (A/I^n)_p (AdicSpacesPartII:F0/completed-localization: A_{f}/I^nA_{f} ≅ (A/I^n)_f, and colimits commute with quotients).
3. For a noetherian local ring R with maximal ideal m ⊇ I, R/m^n is a quotient of R/I^n by the image of m^n; hence two such rings with the same quotients R/I^n compatibly have the same m-adic completion.
4. Dimension, regularity and the Cohen–Macaulay property of a noetherian local ring are those of its completion (Stacks 07NV, 07NY, 07NX).
5. I-adic completeness puts I in the Jacobson radical of A (Stacks 05GI applied to the complete ring A), so every maximal ideal is open.

**Inputs.** `AdicSpacesPartII:F0/adic-ring`, `AdicSpacesPartII:F0/completed-localization`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `mathlib:ringKrullDim`, `mathlib:IsRegularLocalRing`, `mathlib:IsAdicComplete`, `mathlib:Ideal.jacobson`, `mathlib:AdicCompletion`, `SchemeAndStackFoundations:SF.0/cohen-macaulay`.

**Checks.**

- For A = ℤ_p⟦t⟧ and x the closed point, all three rings are ℤ_p⟦t⟧ itself.
- For A = ℤ_p⟨t⟩ (p-adic completion of ℤ_p[t]) and p = (p), A_p is a discrete valuation ring, O_{X,x} is a discrete valuation ring with the same completion, and all have dimension 1, while the maximal ideals (p, f(t)) have height 2.

**Sources.**

- EGA-I, Ch. 0, (7.6.15)–(7.6.18), pp. 74–75; Ch. I, (10.1.5)–(10.1.6), p. 182. The completed localisation at an open prime is a local ring, faithfully flat over the ordinary localisation when A is adic noetherian; the stalks of Spf A are the colimits of the completed localisations, noetherian local rings with residue field k(p).
- STACKS, Tags 07NV, 07NY, 07NX (Lemmas 15.44.1, 15.44.4, 15.44.3). A noetherian local ring and its completion have the same dimension, and one is regular, respectively Cohen–Macaulay, exactly when the other is.
- STACKS, Tag 05GI (Lemma 10.96.6). For the completion of a ring along I, the extended ideal lies in the Jacobson radical; applied to an I-adically complete ring this puts I in every maximal ideal.

### Local dimension and codimension on locally noetherian formal schemes

**Target `SchemeKTheoryOperationsPartII:FK.0/formal-local-dimension` (definition).** Let X be a locally noetherian formal scheme (AdicSpacesPartII:F0/locally-noetherian-formal-scheme). For x ∈ |X| put dim_x X := ringKrullDim O_{X,x} (a noetherian local ring), and dim X := sup_x dim_x X, with dim ∅ = ⊥. For noetherian X, X has pure dimension d if dim_x X = d at every closed point x of |X|. For a closed formal subscheme Z ⊆ X (AdicSpacesPartII:F0/closed-formal-subscheme) and z ∈ |Z|, the local codimension is codim_z(Z, X) := dim O_{X,z} − dim O_{Z,z}, and codim_X Z := inf_{z ∈ |Z|} codim_z(Z, X) (= ⊤ for Z = ∅). These are dimensions of local rings, not topological dimensions of |X|: on X = Spf A, dim_x X = dim A_p for the open prime p of x, dim Spf A = ringKrullDim A, and dim Spf(A/𝔞) = ringKrullDim(A/𝔞) (FK.0/stalk-completion-comparison).

**Named signature.** `TauCeti.FormalScheme.localDim`.

**Hypotheses and conventions.**

- X locally noetherian, so every stalk is a noetherian local ring (EGA I (10.1.6)) and has finite Krull dimension.
- Codimension is measured in the ambient X, never relative to an intermediate support.
- IsPureDim is used here for noetherian X and finite d. This ensures that every point specialises to a closed point; the closed-point condition alone is not a purity convention on arbitrary locally noetherian spaces.
- The local symbol dim_x means stalk dimension, not the infimum of dimensions of open neighbourhoods (the different convention of SchemeAndStackFoundations:SF.0/local-dimension).

**Construction.**

1. dim_x X is ringKrullDim of the stalk; on an affine formal open Spf A it equals dim A_p by FK.0/stalk-completion-comparison.
2. Every maximal ideal of A is a closed point of |Spf A| and dimensions of local rings increase under specialisation, so dim Spf A = sup over maximal ideals of dim A_m = ringKrullDim A; the same applied to A/𝔞 gives dim Spf(A/𝔞).
3. For a locally noetherian scheme Y regarded as a formal scheme, stalks are unchanged, so localDim (ofScheme Y) y = dim O_{Y,y}, and the global supremum agrees with the usual dimension of Y. This does not identify localDim with the supplier’s neighbourhood-dimension function: at the generic point of A¹_k those values are 0 and 1 respectively.

**Inputs.** `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`, `AdicSpacesPartII:F0/closed-formal-subscheme`, `SchemeKTheoryOperationsPartII:FK.0/stalk-completion-comparison`, `mathlib:ringKrullDim`.

**API.**

- `TauCeti.FormalScheme.localDim` (data): For x ∈ |X|, localDim X x := ringKrullDim (X.presheaf.stalk x).
- `TauCeti.FormalScheme.dim` (data): dim X := ⨆ x, localDim X x, with value ⊥ on the empty formal scheme.
- `TauCeti.FormalScheme.IsPureDim` (characterisation): For noetherian X and d : ℕ, IsPureDim X d ↔ ∀ x closed in |X|, localDim X x = d.
- `TauCeti.FormalScheme.localCodim` (data): For a closed immersion Z → X and z ∈ |Z|, localCodim Z X z := localDim X z − localDim Z z.
- `TauCeti.FormalScheme.codim` (data): codim Z X := ⨅ z ∈ |Z|, localCodim Z X z (⊤ if Z = ∅).
- `TauCeti.FormalScheme.localDim_Spf` (compatibility): For A adic noetherian and an open prime p, localDim (Spf A) p = ringKrullDim (Localization.AtPrime p).
- `TauCeti.FormalScheme.dim_Spf` (compatibility): dim (Spf A) = ringKrullDim A, and dim (Spf (A ⧸ 𝔞)) = ringKrullDim (A ⧸ 𝔞).
- `TauCeti.FormalScheme.dim_ofScheme` (compatibility): For a locally noetherian scheme Y, localDim (ofScheme Y) y is the Krull dimension of O_{Y,y}.
- `TauCeti.FormalScheme.codim_anti` (relation): If Z ⊆ Z′ are closed formal subschemes of X then codim Z′ X ≤ codim Z X.

**Unit tests.**

- `dim_Spf_powerSeries` (computation): dim (Spf ℤ_p⟦t⟧) = 2.
- `codim_Spf_powerSeries` (computation): In Spf ℤ_p⟦t⟧: codim V(t) = 1, codim V(p, t) = 2 and codim V(t·(t − p)) = 1.
- `dim_not_topological` (non-example): The underlying space of Spf ℤ_p⟦t⟧ is a single point, so a definition by the Krull dimension of the topological space |X| gives 0 instead of 2, and would give every closed formal subscheme codimension 0.
- `dim_ofScheme_affineLine` (compatibility): For the scheme 𝔸¹_k regarded as a formal scheme, dim = 1, agreeing with the scheme dimension.
- `dim_empty` (degenerate): dim ∅ = ⊥ and codim ∅ X = ⊤.
- `localDim_generic_affineLine` (non-example): At the generic point η of A¹_k with the discrete topology on its structure sheaf, localDim (ofScheme A¹_k) η = dim k(t) = 0, while every open neighbourhood has dimension 1. This distinguishes stalk dimension from neighbourhood dimension.

**Uses.**

- Zhang 2021, (B.1), p. 972: F^iK_0^Y(X) is generated by supports Z ⊆ Y with codim_X Z ≥ i
- Zhang 2021, Lemma B.2, p. 974: expected dimension: codim_X(Z_1 ∩ Z_2) = codim_X Z_1 + codim_X Z_2 at every point
- Li–Zhang, §1.8, p. 9: X regular of pure dimension n; Σ r_i ≥ n in the (B.3) criterion
- SchemeKTheoryOperationsPartII:FK.2/codimension-filtration: indexes the filtration
- SchemeKTheoryOperationsPartII:FK.4/derived-euler-pairing: dimension of the support W of a pairing

**Checks.**

- dim Spf ℤ_p⟦t⟧ = 2 although its underlying space is one point.
- In Spf ℤ_p⟦t⟧: codim V(t) = codim V(t − p) = 1, codim V(p, t) = 2, codim V(t(t − p)) = 1.

**Sources.**

- ZHANG21, Appendix B.1, (B.1), p. 972; Lemma B.2, p. 974. The codimension filtration is indexed by codim_X Z for closed formal subschemes Z, and Lemma B.2 asks for pure-dimensional formal schemes and for codimension equalities at every point; the paper does not define these for formal schemes, so the local-ring convention is fixed here.
- EGA-I, (10.1.6), p. 182. Stalks of a locally noetherian formal scheme are noetherian local rings, so their Krull dimensions are finite.

### Regular and Cohen–Macaulay formal schemes

**Target `SchemeKTheoryOperationsPartII:FK.0/regular-and-cohen-macaulay-formal-schemes` (definition).** A locally noetherian formal scheme X is regular (respectively Cohen–Macaulay) if every stalk O_{X,x}, x ∈ |X|, is a regular local ring in Mathlib's sense IsRegularLocalRing (respectively a Cohen–Macaulay local ring, SchemeAndStackFoundations:SF.0/cohen-macaulay). A closed formal subscheme is regular or Cohen–Macaulay when it is so as a formal scheme. For X = Spf A with A adic noetherian: X is regular if and only if A is a regular ring (IsRegularRing A), and Cohen–Macaulay if and only if every localisation of A at a maximal ideal is Cohen–Macaulay.

**Named signature.** `TauCeti.FormalScheme.IsRegular`.

**Hypotheses and conventions.**

- X locally noetherian.
- Regularity is a condition on all stalks, closed or not; on each affine formal open it suffices to check the points given by maximal ideals of its coordinate ring. Globally closed points suffice when X is noetherian.

**Construction.**

1. By FK.0/stalk-completion-comparison, O_{X,x} is regular (Cohen–Macaulay) iff A_p is, for the open prime p of x.
2. Every maximal ideal of A is open (I lies in the Jacobson radical), and localisations of regular local rings are regular (Stacks 0AFS) and of Cohen–Macaulay local rings are Cohen–Macaulay, so the condition at all open primes is equivalent to the condition at all primes, i.e. IsRegularRing A.
3. Regular local rings are domains (Stacks 00NP) and Cohen–Macaulay (Stacks 00O7 with depth = dimension).

**Inputs.** `SchemeKTheoryOperationsPartII:FK.0/stalk-completion-comparison`, `SchemeKTheoryOperationsPartII:FK.0/formal-local-dimension`, `mathlib:IsRegularLocalRing`, `mathlib:IsRegularRing`, `SchemeAndStackFoundations:SF.0/cohen-macaulay`, `SchemeAndStackFoundations:SF.4/regular-scheme`.

**API.**

- `TauCeti.FormalScheme.IsRegular` (characterisation): X.IsRegular ↔ ∀ x, IsRegularLocalRing (X.presheaf.stalk x).
- `TauCeti.FormalScheme.IsCohenMacaulay` (characterisation): X.IsCohenMacaulay ↔ every stalk is a Cohen–Macaulay local ring.
- `TauCeti.FormalScheme.isRegular_Spf_iff` (compatibility): For A adic noetherian, (Spf A).IsRegular ↔ IsRegularRing A.
- `TauCeti.FormalScheme.isRegular_ofScheme_iff` (compatibility): For a locally noetherian scheme Y, (ofScheme Y).IsRegular ↔ Y is regular (SchemeAndStackFoundations:SF.4/regular-scheme).
- `TauCeti.FormalScheme.IsRegular.isCohenMacaulay` (relation): A regular formal scheme is Cohen–Macaulay.
- `TauCeti.FormalScheme.IsRegular.isDomain_stalk` (relation): Every stalk of a regular formal scheme is a domain.
- `TauCeti.FormalScheme.IsRegular.restrict` (functoriality): Open formal subschemes of a regular formal scheme are regular.

**Unit tests.**

- `isRegular_Spf_powerSeries` (computation): (Spf ℤ_p⟦t⟧).IsRegular.
- `not_isRegular_node` (non-example): Spf k⟦x, y⟧/(xy) is Cohen–Macaulay (a hypersurface) but not regular: its maximal ideal needs two generators while its dimension is 1.
- `isCohenMacaulay_planes_fails` (non-example): Spf k⟦x, y, z, w⟧/((x, y) ∩ (z, w)), the union of two planes meeting in a point, is not Cohen–Macaulay: it has dimension 2 and depth 1.
- `isRegular_ofScheme_affineSpace` (compatibility): 𝔸ⁿ_{ℤ_p} regarded as a formal scheme is regular, as the scheme is.

**Uses.**

- Zhang 2021, Appendix B.1, p. 972: hypothesis of K_0^Y(X) ≅ K′_0(Y) and of F^{d−i} ≅ F_i
- Zhang 2021, Lemma B.2, p. 974: Z_2 Cohen–Macaulay; Z_1 → X regular immersion (e.g. X, Z_1 regular)
- Li–Zhang, §1.8, p. 9: 'Now let X be regular': the Rapoport–Zink spaces N_n are regular formal schemes
- SchemeKTheoryOperationsPartII:FK.1/tor-pairing: finite Tor-dimension of regular stalks

**Checks.**

- Spf ℤ_p⟦t_1, …, t_n⟧ and Spf of every complete regular local ring are regular; so is the p-adic completion of a smooth ℤ_p-scheme.
- Spf k⟦x, y⟧/(xy) is Cohen–Macaulay but not regular.

**Sources.**

- ZHANG21, Appendix B.1, p. 972 ('From now on we assume that X is regular of pure dimension d'); Lemma B.2, p. 974. The regular comparison K_0^Y(X) ≅ K′_0(Y) and the filtration comparison are stated for regular formal schemes of pure dimension d, and Lemma B.2 asks that Z_2 be Cohen–Macaulay.
- STACKS, Tags 0AFS (Lemma 10.110.6), 00NP (Lemma 10.106.2), 00O7 (Proposition 10.110.1). Localisations of regular local rings are regular; regular local rings are domains of finite global dimension.

### Codimension formula on Cohen–Macaulay formal schemes

**Target `SchemeKTheoryOperationsPartII:FK.0/formal-codimension-formula` (theorem).** Let X be a noetherian formal scheme all of whose stalks are Cohen–Macaulay (for instance a regular one), and Z ⊆ X a nonempty closed formal subscheme. (a) The infimum defining codim_X Z is attained at a closed point, and on every affine formal open Spf A meeting Z, with Z ∩ Spf A = Spf(A/𝔞), codim_{Spf A}(Z ∩ Spf A) = height(𝔞) := min over the minimal primes q of 𝔞 of ht q, the codimension of V(𝔞) in Spec A. (b) If moreover X has pure dimension d, then codim_X Z = d − dim Z.

**Hypotheses and conventions.**

- X is noetherian, so every point has a closed specialisation in X. The affine height identity also applies on each affine formal open of a locally noetherian X.
- All stalks Cohen–Macaulay (catenary and equidimensional).
- (b) only: pure dimension d, i.e. dim O_{X,x} = d at every closed point.

**Proof outline.**

1. For a Cohen–Macaulay local ring R and a prime P, dim R = dim R_P + dim R/P (Stacks 00NA); hence for an ideal 𝔞 of R, dim R − dim R/𝔞 = min over minimal primes of ht P = ht 𝔞.
2. On Spf A, replace stalks by localisations A_p (FK.0/stalk-completion-comparison): codim_z(Z, X) = dim A_p − dim (A/𝔞)_p = min over the minimal primes of 𝔞 contained in p of their heights. For a generalisation p′ ⊆ p this minimum runs over a subset, so local codimension does not decrease under generalisation and the local infimum is attained at the maximal ideals. On noetherian X every point has a globally closed specialisation, giving the global assertion too.
3. Every minimal prime of 𝔞 lies in a maximal ideal, and all maximal ideals are closed points of Spf A, so the infimum over maximal ideals is min ht q = height(𝔞): this is (a).
4. (b) At a closed point z, codim_z(Z, X) = d − dim O_{Z,z}; the infimum over closed points is d − sup_z dim O_{Z,z} = d − dim Z, dimensions of stalks increasing under specialisation.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.0/formal-local-dimension`, `SchemeKTheoryOperationsPartII:FK.0/regular-and-cohen-macaulay-formal-schemes`, `SchemeKTheoryOperationsPartII:FK.0/stalk-completion-comparison`, `SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary`, `SchemeAndStackFoundations:SF.0/catenary-ring`, `mathlib:Ideal.height`.

**Checks.**

- Spf ℤ_p⟦t⟧ (d = 2): Z = V(t) has dim 1 and codim 1; Z = V(p, t) has dim 0 and codim 2.
- The height description fails without the Cohen–Macaulay hypothesis: in Spf k⟦x, y, z⟧/(xz, yz) (a plane union a line through the origin, not equidimensional) the line V(x, y) is an irreducible component, of height 0 in the coordinate ring, while dim O_{X,x} − dim O_{L,x} = 2 − 1 = 1 at the closed point.

**Sources.**

- STACKS, Tag 00NA (Lemma 10.104.4). In a Cohen–Macaulay local ring, dim R = dim R_p + dim R/p for every prime p.
- ZHANG21, Appendix B.1, p. 972. The filtration comparison F^{d−i}K_0^Y(X) ≅ F_iK′_0(Y) for regular X of pure dimension d needs codim_X Z ≥ d − i exactly when dim Z ≤ i, which is this formula.

### Regular immersions and effective Cartier divisors of formal schemes

**Target `SchemeKTheoryOperationsPartII:FK.0/formal-regular-immersion` (definition).** A closed immersion i : Z → X of locally noetherian formal schemes with coherent ideal 𝒜 ⊆ O_X is a regular immersion if for every z ∈ |Z| the ideal 𝒜_z ⊆ O_{X,z} is generated by a regular sequence (RingTheory.Sequence.IsRegular) f_1, …, f_m of O_{X,z}; m = codim_z(Z, X) is then locally constant on |Z|. An effective Cartier divisor is a closed formal subscheme D whose ideal is invertible (locally generated by one nonzerodivisor), i.e. a regular immersion of codimension 1. On Spf A with Z = Spf(A/𝔞), i is a regular immersion iff 𝔞 is locally on Spec A near every maximal ideal generated by a regular sequence; if X and Z are both regular, every closed immersion Z → X is a regular immersion.

**Named signature.** `TauCeti.FormalScheme.Hom.IsRegularImmersion`.

**Hypotheses and conventions.**

- X locally noetherian.
- The local equations are taken in the formal stalks O_{X,z}; by faithful flatness of A_p → O_{X,z} (FK.0/stalk-completion-comparison) this is equivalent to the condition in A_p.

**Construction.**

1. A regular sequence in the noetherian local ring O_{X,z} drops the dimension by exactly one at each step (Stacks 00KW), so m = dim O_{X,z} − dim O_{Z,z} = codim_z(Z, X).
2. Regularity of a sequence descends and ascends along the faithfully flat local maps A_p → O_{X,z} (Koszul homology commutes with flat base change and is detected faithfully).
3. If O_{X,z} and O_{Z,z} = O_{X,z}/𝒜_z are regular local, 𝒜_z is generated by part of a regular system of parameters, which is a regular sequence.
4. The Koszul complex of a regular sequence is a resolution of the quotient (Stacks 062F; EnhancedDerivedSheaves:E1/koszul-complex), so O_Z has a local finite free resolution of length m.

**Inputs.** `AdicSpacesPartII:F0/closed-formal-subscheme`, `SchemeKTheoryOperationsPartII:FK.0/formal-local-dimension`, `SchemeKTheoryOperationsPartII:FK.0/stalk-completion-comparison`, `mathlib:RingTheory.Sequence.IsRegular`, `EnhancedDerivedSheaves:E1/koszul-complex`.

**API.**

- `TauCeti.FormalScheme.Hom.IsRegularImmersion` (characterisation): i.IsRegularImmersion ↔ i is a closed immersion and for every z the kernel ideal at z is generated by a regular sequence of the stalk.
- `TauCeti.FormalScheme.Hom.IsRegularImmersion.codimAt` (data): The length m(z) of a local regular sequence, independent of the choice and equal to localCodim Z X z.
- `TauCeti.FormalScheme.IsEffectiveCartier` (characterisation): D is an effective Cartier divisor ↔ its ideal sheaf is an invertible O_X-module ↔ D → X is a regular immersion of codimension 1.
- `TauCeti.FormalScheme.Hom.IsRegularImmersion.of_isRegular` (relation): If X and Z are regular, every closed immersion Z → X is a regular immersion.
- `TauCeti.FormalScheme.Hom.IsRegularImmersion.Spf_iff` (compatibility): For Spf (A ⧸ 𝔞) → Spf A: regular immersion ↔ 𝔞 is generated by a regular sequence locally at every maximal ideal of A.
- `TauCeti.FormalScheme.Hom.IsRegularImmersion.koszul` (other): Locally the Koszul complex of the regular sequence (EnhancedDerivedSheaves:E1/koszul-complex) is a finite free resolution of O_Z.

**Unit tests.**

- `isEffectiveCartier_graph` (computation): V(t − p) ⊂ Spf ℤ_p⟦t⟧ is an effective Cartier divisor, and V(t − p) ≅ Spf ℤ_p.
- `isEffectiveCartier_nonreduced` (characterisation): V(t²) ⊂ Spf ℤ_p⟦t⟧ is an effective Cartier divisor although it is not reduced: the definition must not require reducedness.
- `isRegularImmersion_id` (degenerate): The identity of X is a regular immersion of codimension 0 (empty sequence).
- `not_isRegularImmersion_node_point` (non-example): The closed point of Spf k⟦x, y⟧/(xy) is not a regular immersion: its maximal ideal needs two generators, but the ring has dimension and depth 1, so it cannot be generated by a regular sequence.

**Uses.**

- Zhang 2021, Lemma B.2(i), p. 974: Z_1 → X regular immersion gives the Koszul resolution of O_{Z_1}
- Zhang 2021, proof of Lemma 4.4, p. 889: the graph Γ_g′ and N_{n−1} × N_{n−1} are local complete intersections in N_n × N_n
- Li–Zhang, §1.8 and §2.4, pp. 9–11: the special divisors Z(x) are Cartier divisors on N, so O_{Z(x)} ∈ F^1
- SchemeKTheoryOperationsPartII:FK.3/cartier-pullback: pullback of Cartier divisor classes

**Checks.**

- V(t − p) ⊂ Spf ℤ_p⟦t⟧ is an effective Cartier divisor isomorphic to Spf ℤ_p.
- The closed point of Spf k⟦x, y⟧/(xy) is not a regular immersion: the ring has depth 1, so its maximal ideal contains no regular sequence of length 2 = number of generators.

**Sources.**

- ZHANG21, Lemma B.2 and its proof, pp. 974–975. The closed immersion Z_1 → X is assumed to be a regular immersion (for example X and Z_1 regular), so Z_1 is cut out at each point of Z_1 ∩ Z_2 by a regular sequence of the local ring of X, whose Koszul complex is a free resolution.
- LIZHANG22, §1.8, p. 9; Lemma 10.4.2, p. 67. A closed formal subscheme is a Cartier divisor if its ideal sheaf is invertible; Kudla–Rapoport divisors are Cartier divisors and their pullbacks along maps with injective local homomorphisms between regular formal schemes stay Cartier.
- STACKS, Tags 00KW (Lemma 10.60.13), 062F (Lemma 15.31.2). A nonzerodivisor in the maximal ideal drops the dimension by one; a regular sequence is Koszul-regular.

### Formal support of a coherent module

**Target `SchemeKTheoryOperationsPartII:FK.0/formal-support` (definition).** Let X be a locally noetherian formal scheme, Y ⊆ X the closed formal subscheme with coherent ideal 𝒥 (AdicSpacesPartII:F0/closed-formal-subscheme). A coherent O_X-module F is formally supported on Y if every point of |X| has an open neighbourhood U with 𝒥^n·F|_U = 0 for some n; on noetherian X one n works globally. Coh_Y(X) ⊆ Coh(X) is the full subcategory of such F; it is a Serre subcategory. On X = Spf A with Y = Spf(A/J) and F = M^Δ (M a finite A-module): F is formally supported on Y iff J^nM = 0 for some n iff Supp_A(M) ⊆ V(J) ⊆ Spec A. Formal support depends on 𝒥 only through its radical, and it is not detected by the topological support Supp F ⊆ |X|.

**Named signature.** `TauCeti.FormalScheme.IsFormallySupported`.

**Hypotheses and conventions.**

- X locally noetherian; 𝒥 a coherent ideal.
- Supports are formal (power of the ideal kills), not topological.

**Construction.**

1. Extension closure: if 𝒥^aF′ = 0 and 𝒥^bF″ = 0 for 0 → F′ → F → F″ → 0 then 𝒥^{a+b}F = 0; subobjects and quotients are clear, and coherence is stable (AdicSpacesPartII:F0/coherent-formal-module-properties).
2. Affine case: Γ(Spf A, ·) is an equivalence between Coh(Spf A) and finite A-modules (AdicSpacesPartII:F0/affine-coherent-equivalence), and for a finite module over a noetherian ring, J^nM = 0 for some n iff Supp M ⊆ V(J) (Stacks 00L6).
3. Radical: if √𝒥 = √𝒥′ then each contains a power of the other on quasi-compact opens.
4. For F formally supported on Y and G on Z, F ⊗ G and Tor sheaves are killed by 𝒥_Y^a + 𝒥_Z^b ⊇ (𝒥_Y + 𝒥_Z)^{a+b−1}, i.e. formally supported on Y ∩ Z := V(𝒥_Y + 𝒥_Z).

**Inputs.** `AdicSpacesPartII:F0/coherent-formal-module`, `AdicSpacesPartII:F0/coherent-formal-module-properties`, `AdicSpacesPartII:F0/closed-formal-subscheme`, `AdicSpacesPartII:F0/affine-coherent-equivalence`, `mathlib:Module.support`, `mathlib:Submodule.annihilator`.

**API.**

- `TauCeti.FormalScheme.IsFormallySupported` (characterisation): IsFormallySupported 𝒥 F ↔ locally some power 𝒥^n kills F.
- `TauCeti.FormalScheme.CohSupp` (data): Coh_Y(X) as a full subcategory of Coh X (ObjectProperty).
- `TauCeti.FormalScheme.CohSupp.isSerre` (structure): Coh_Y(X) is closed under subobjects, quotients and extensions.
- `TauCeti.FormalScheme.isFormallySupported_Spf_iff` (compatibility): On Spf A, IsFormallySupported J^Δ M^Δ ↔ Module.support A M ⊆ zeroLocus J.
- `TauCeti.FormalScheme.IsFormallySupported.mono` (functoriality): Formally supported on Y and Y ⊆ Y′ implies formally supported on Y′.
- `TauCeti.FormalScheme.IsFormallySupported.tensor` (relation): F on Y and G on Z give F ⊗ G formally supported on Y ∩ Z.
- `TauCeti.FormalScheme.isFormallySupported_radical` (relation): Formal support on V(𝒥) depends only on the radical of 𝒥.
- `TauCeti.FormalScheme.IsFormallySupported.pushforward` (constructor): For i : Y_n = V(𝒥^n) → X, i_* maps Coh(Y_n) into Coh_Y(X).
- `TauCeti.FormalScheme.IsFormallySupportedModule` (characterisation): Affine form on sections: for an ideal J of A and an A-module M, some power of J kills M; IsFormallySupported J^Δ M^Δ on Spf A ↔ IsFormallySupportedModule J M.
- `TauCeti.FormalScheme.IsFormallySupportedModule.mono` (functoriality): J′ ≤ J and IsFormallySupportedModule J M imply IsFormallySupportedModule J′ M (enlarging the support V(J) ⊆ V(J′)).

**Unit tests.**

- `isFormallySupported_quotient` (computation): On Spf A, (A ⧸ J^n)^Δ is formally supported on V(J).
- `not_isFormallySupported_structureSheaf` (non-example): On Spf ℤ_p with Y = V(p), O is not formally supported on Y although its topological support is |Y|: a definition by topological support accepts it.
- `isFormallySupported_whole_empty` (degenerate): Every coherent F is formally supported on Y = X; only F = 0 is formally supported on Y = ∅ (𝒥 = O_X).
- `isFormallySupported_ofScheme_iff` (compatibility): For a noetherian scheme X, a coherent F is formally supported on Y iff its set-theoretic support lies in |Y|.

**Uses.**

- Zhang 2021, Appendix B.1, pp. 971–972: the homology sheaves of complexes defining K_0^Y(X) are formally supported on Y
- Zhang 2021, proof of Lemma B.1, p. 974: the Tor_1 term and E ⊗ O_{X_1 ∩ X_2} lie in K′_0(X_1 ∩ X_2)
- Li–Zhang, §1.8, p. 9: complexes acyclic outside Y; derived products land in K_0^{Z_1∩⋯∩Z_m}
- SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage: K_0(Coh_Y(X)) ≅ K′_0(Y)

**Checks.**

- On Spf ℤ_p with Y = V(p) = Spec F_p, O itself has topological support all of |Spf ℤ_p| = |Y| but is not p-power torsion, so it is not formally supported on Y.
- (A/J^n)^Δ is formally supported on V(J) for every n.

**Sources.**

- ZHANG21, Appendix B.1, p. 971. A coherent sheaf on a noetherian formal scheme is formally supported on a closed formal subscheme if a power of the defining ideal kills it; for the completion of Spec A along A/I and Y defined by J this means the module of sections has support in Spec(A/J).
- STACKS, Tag 00L6 (Lemma 10.62.4). For a finite module over a noetherian ring, a power of I kills M exactly when Supp M ⊆ V(I).

### Tor sheaves of coherent modules on a locally noetherian formal scheme

**Target `SchemeKTheoryOperationsPartII:FK.0/formal-tor-sheaves` (construction).** For a locally noetherian formal scheme X and coherent O_X-modules F, G, there are coherent O_X-modules Tor_j^{O_X}(F, G), j ≥ 0, with Tor_0 = F ⊗ G, such that on every affine formal open Spf A with F = M^Δ, G = N^Δ one has Tor_j|_{Spf A} ≅ Tor_j^A(M, N)^Δ, compatibly with restriction to smaller affine formal opens; their stalks are Tor_j^{O_{X,x}}(F_x, G_x). They are symmetric in F and G, give long exact sequences in each variable, are formally supported on Y ∩ Z when F is formally supported on Y and G on Z, vanish for j > d when every stalk has global dimension ≤ d (for instance X regular of dimension d), and vanish for j > 0 when F is locally free. When the pair has a uniform finite Tor bound (for example X regular of finite dimension, or one input perfect), the derived tensor class is [F ⊗^L G] := Σ_j (−1)^j [Tor_j^{O_X}(F, G)].

**Named signature.** `TauCeti.FormalScheme.Tor`.

**Hypotheses and conventions.**

- X locally noetherian; F, G coherent.
- Tor is taken over O_X itself, never over a thickening X_n = V(𝒥^{n+1}) or over the reduction.
- Each Tor_j exists without finite amplitude. An alternating class is defined only when all sufficiently high Tor_j vanish uniformly; for locally noetherian exhaustion constructions this bound may instead be checked on each noetherian member.

**Construction.**

1. Affine definition: Tor_j^A(M, N) is a finite A-module (A noetherian), so (·)^Δ gives a coherent module on Spf A (AdicSpacesPartII:F0/associated-formal-module).
2. Compatibility: for f ∈ A the completed localisation A_{f} is flat over A (AdicSpacesPartII:F0/completed-localization), so Tor_j^A(M, N) ⊗_A A_{f} ≅ Tor_j^{A_{f}}(M_{f}, N_{f}), matching the restriction of (·)^Δ; glue over an affine formal cover (AdicSpacesPartII:F0/formal-scheme-gluing).
3. Stalks: A → O_{X,x} is flat (FK.0/stalk-completion-comparison), so Tor commutes with passing to the stalk.
4. Long exact sequences and symmetry from the module statements (Stacks 00M0, 00M3); support from FK.0/formal-support; vanishing above d from Stacks 00O7 applied stalkwise, a coherent sheaf with zero stalks being zero.

**Inputs.** `AdicSpacesPartII:F0/affine-coherent-equivalence`, `AdicSpacesPartII:F0/associated-formal-module`, `AdicSpacesPartII:F0/completed-localization`, `AdicSpacesPartII:F0/formal-scheme-gluing`, `AdicSpacesPartII:F0/coherent-formal-module-properties`, `SchemeKTheoryOperationsPartII:FK.0/stalk-completion-comparison`, `SchemeKTheoryOperationsPartII:FK.0/formal-support`, `SchemeKTheoryOperationsPartII:FK.0/regular-and-cohen-macaulay-formal-schemes`, `mathlib:CategoryTheory.Tor`, `mathlib:Module.Flat`.

**API.**

- `TauCeti.FormalScheme.Tor` (data): Tor j F G : Coh X for j : ℕ, functorial in F and G.
- `TauCeti.FormalScheme.Tor_zero` (simp): Tor 0 F G ≅ F ⊗ G.
- `TauCeti.FormalScheme.Tor_Spf` (compatibility): On Spf A, Tor j M^Δ N^Δ ≅ (Tor_j^A M N)^Δ, naturally.
- `TauCeti.FormalScheme.Tor_stalk` (compatibility): (Tor j F G)_x ≅ Tor_j^{O_{X,x}}(F_x, G_x).
- `TauCeti.FormalScheme.Tor_comm` (relation): Tor j F G ≅ Tor j G F.
- `TauCeti.FormalScheme.Tor_longExact` (relation): A short exact sequence in either variable gives the long exact Tor sequence.
- `TauCeti.FormalScheme.Tor_isFormallySupported` (relation): F on Y and G on Z give Tor j F G formally supported on Y ∩ Z.
- `TauCeti.FormalScheme.Tor_eq_zero_of_isRegular` (relation): If X is regular of dimension ≤ d then Tor j F G = 0 for j > d.
- `TauCeti.FormalScheme.Tor_ofScheme` (compatibility): For X a noetherian scheme these are the usual Tor sheaves.

**Unit tests.**

- `Tor_one_self_divisor` (computation): On Spf ℤ_p⟦t⟧, Tor 1 (O/(t)) (O/(t)) ≅ O/(t).
- `Tor_one_transverse` (computation): On Spf ℤ_p⟦t⟧, Tor 1 (O/(t)) (O/(t − p)) = 0 and Tor 0 ≅ O/(t, p) ≅ F_p.
- `Tor_structureSheaf` (degenerate): Tor j O_X G = 0 for j ≥ 1 and Tor 0 O_X G ≅ G.
- `Tor_not_over_reduction` (non-example): On Spf ℤ_p, Tor 1 F_p F_p ≅ F_p, whereas Tor over the reduction Spec F_p vanishes: a definition through the thickenings or the reduction is wrong.
- `Tor_dual_numbers_unbounded` (non-example): For R = k[ε]/(ε²), Tor_j^R(k,k) ≅ k for every j ≥ 0, from the resolution with every differential multiplication by ε. Thus coherence of every Tor sheaf does not justify an infinite alternating sum in K′_0.

**Uses.**

- Zhang 2021, (B.4)–(B.5), p. 973: χ(X, F ⊗^L G) is the alternating sum of lengths of R^iπ_* Tor_j^{O_X}(F, G); Y ∩^L Z = O_Y ⊗^L O_Z
- Zhang 2021, Lemma B.2, p. 974: Tor_i^{O_X}(O_{Z_1}, O_{Z_2}) = 0 for i > 0 in expected dimension
- Li–Zhang, §1.8, p. 9: the derived product Z_1 ∩^L ⋯ ∩^L Z_m
- SchemeKTheoryOperationsPartII:FK.1/tor-pairing: the pairing K′_0(Y) × K′_0(Z) → K′_0(Y ∩ Z)

**Checks.**

- On Spf ℤ_p⟦t⟧: Tor_1(O/(t), O/(t)) ≅ O/(t) and Tor_1(O/(t), O/(t − p)) = 0.
- Computing over the reduction gives the wrong answer: Tor_1^{F_p}(F_p, F_p) = 0, while Tor_1^{ℤ_p}(F_p, F_p) ≅ F_p on Spf ℤ_p.

**Sources.**

- ZHANG21, Appendix B.1, (B.4)–(B.5), p. 973; proof of Lemma B.1, p. 974. The Euler–Poincaré characteristic of a derived tensor product is the alternating sum over the sheaves Tor_j^{O_X}(F, G); the proof of Lemma B.1 tensors an exact sequence with E and uses the first Tor sheaf.
- EGA-I, (10.10.2), (10.10.8), pp. 201–203. Coherent modules on Spf A are the M^Δ of finite A-modules, with ⊗ and pullback computed on modules.
- STACKS, Tags 00M0 (Lemma 10.75.2), 00M3 (Lemma 10.75.5), 00O7 (Proposition 10.110.1). Long exact Tor sequences and symmetry of Tor; finite global dimension of regular local rings.

### Dependencies

Within this roadmap: none. Other suppliers: `AdicSpacesPartII:F0`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.4`, `EnhancedDerivedSheaves:E1`.

### Acceptance for the layer

- dim Spf ℤ_p⟦t⟧ = 2; in it codim V(t) = 1, codim V(p, t) = 2.
- Spf ℤ_p⟦t⟧ is regular, Spf k⟦x, y⟧/(xy) is Cohen–Macaulay but not regular.
- O on Spf ℤ_p is not formally supported on V(p).
- Tor_1(O/(t), O/(t)) ≅ O/(t) and Tor_1(O/(t), O/(t − p)) = 0 on Spf ℤ_p⟦t⟧; Tor over the reduction is wrong.

<a id="layer-fk1"></a>

## Layer FK.1: Grothendieck groups, cup product and Tor pairing of noetherian formal schemes

The Grothendieck groups. K′₀ is the abelian K₀ of coherent modules; formally supported modules have classes in K′₀ of the support by dévissage. K₀^Y is Gillet–Soulé's group of strict complexes with formally supported homology, with relations from short exact sequences and from quasi-isomorphisms. On Spf A every object is literally the corresponding object of Spec A, which is what lets this roadmap import the parent's affine results instead of proving them again. The layer ends with the cup product and, on regular formal schemes, the Tor pairing and the derived intersection Y ∩ᴸ Z, which the homology class map intertwines.

**Targets of the layer.**

Define K′₀(X) as the Grothendieck group of the abelian category of coherent modules on a noetherian formal scheme, with restriction, closed pushforward, flat pullback, and K′₀(Spf A) ≅ G₀(A). Prove the dévissage K₀(Coh_Y(X)) ≅ K′₀(Y) for formally supported modules. Define the category of bounded complexes of locally free coherent modules with formally supported homology, closed under cones, tensor products and pullback, and the Gillet–Soulé group K₀^Y(X) with the short-exact-sequence and quasi-isomorphism relations, support enlargement, restriction and pullback. Prove the affine transport: on Spf A all these objects are those of Spec A with support V(J), so the parent's affine results apply. Construct the homology class map K₀^Y(X) → K′₀(Y), the supported cup product K₀^Y × K₀^Z → K₀^{Y∩Z}, and, on regular formal schemes, the Tor pairing K′₀(Y) × K′₀(Z) → K′₀(Y ∩ Z) with the derived intersection Y ∩^L Z and its compatibility with the cup product.

**Planets.** Coherent K-group K′₀ of a formal scheme; Supported K-group K₀^Y; Supported cup product; Derived intersection product.

### The Grothendieck group K′₀ of coherent modules on a noetherian formal scheme

**Target `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group` (definition).** For a noetherian formal scheme X, K′_0(X) := AbelianK0(Coh X) (TauCeti.AbelianK0), the free abelian group on isomorphism classes of coherent O_X-modules modulo [F] = [F′] + [F″] for every short exact sequence 0 → F′ → F → F″ → 0; K′_0(X)_ℚ := K′_0(X) ⊗ ℚ. It is functorial for restriction to open formal subschemes, for pushforward along closed immersions (i_* is exact), and for pullback along flat morphisms. For X = Spf A, Γ(X, ·) gives K′_0(Spf A) ≅ G_0(A) := ExactK0(finiteModulesExactStructure A) (TauCeti); for a noetherian scheme regarded as a formal scheme, K′_0 is π_0 of the parent's G-theory (SchemeKTheoryOperations:S.2/g-theory-of-a-scheme).

**Named signature.** `TauCeti.FormalScheme.K0Coh`.

**Hypotheses and conventions.**

- X noetherian (quasi-compact and locally noetherian), so Coh X is an essentially small abelian category (AdicSpacesPartII:F0/coherent-formal-module-properties): finitely many affine formal opens, finite modules and gluing data.
- Integral coefficients; rational coefficients only by explicit tensoring.

**Construction.**

1. Coh X is abelian (AdicSpacesPartII:F0/coherent-formal-module-properties) and essentially small, so TauCeti.AbelianK0 applies.
2. Exact functors induce maps on AbelianK0: restriction to opens, i_* for closed immersions, f^* for flat f (flatness of the stalk maps makes f^* exact on coherent modules).
3. On Spf A the equivalence Coh(Spf A) ≃ finite A-modules (AdicSpacesPartII:F0/affine-coherent-equivalence) is exact, so it identifies the abelian K_0 with TauCeti's G_0 of finite modules.
4. For a noetherian scheme the coherent categories agree (AdicSpacesPartII:F0/coherent-formal-module, compatibility with ofScheme) and the parent identifies G_0 with π_0 G.

**Inputs.** `AdicSpacesPartII:F0/coherent-formal-module`, `AdicSpacesPartII:F0/coherent-formal-module-properties`, `AdicSpacesPartII:F0/affine-coherent-equivalence`, `tauceti:TauCeti.AbelianK0`, `tauceti:TauCeti.AbelianK0.of`, `tauceti:TauCeti.ExactK0`, `tauceti:TauCeti.finiteModulesExactStructure`, `SchemeKTheoryOperations:S.2/g-theory-of-a-scheme`.

**API.**

- `TauCeti.FormalScheme.K0Coh` (data): K0Coh X := AbelianK0 (Coh X) for a noetherian formal scheme X.
- `TauCeti.FormalScheme.K0Coh.of` (constructor): The class [F] of a coherent module.
- `TauCeti.FormalScheme.K0Coh.of_shortExact` (relation): [F] = [F′] + [F″] for 0 → F′ → F → F″ → 0.
- `TauCeti.FormalScheme.K0Coh.restrict` (functoriality): Restriction K0Coh X → K0Coh U to an open formal subscheme, with restrict_id and restrict_comp.
- `TauCeti.FormalScheme.K0Coh.closedPushforward` (functoriality): i_* : K0Coh Z → K0Coh X for a closed immersion, with [F] ↦ [i_*F], compatible with composition.
- `TauCeti.FormalScheme.K0Coh.flatPullback` (functoriality): f^* : K0Coh X → K0Coh X′ for a flat morphism.
- `TauCeti.FormalScheme.K0Coh.SpfEquiv` (equivalence): K0Coh (Spf A) ≃+ ExactK0 (finiteModulesExactStructure A), [M^Δ] ↦ [M].
- `TauCeti.FormalScheme.K0Coh.ofSchemeEquiv` (compatibility): For a noetherian scheme Y, K0Coh (ofScheme Y) ≃+ G_0(Y) of SchemeKTheoryOperations:S.2/g-theory-of-a-scheme.
- `TauCeti.FormalScheme.K0CohSpf` (data): The affine model K′_0(Spf A) := ExactK0 (finiteModulesExactStructure A), the target of K0Coh.SpfEquiv.
- `TauCeti.FormalScheme.K0Coh.lift` (universal-property): An assignment of object classes to an abelian group satisfying the short exact sequence relations extends uniquely to an additive homomorphism from this group.
- `TauCeti.FormalScheme.K0Coh.hom_ext` (extensionality): Two additive homomorphisms are equal if they agree on every generating class [E].
- `TauCeti.FormalScheme.K0Coh.induction` (other): To prove an additive subgroup contains every element, it suffices to show that it contains the generating classes; zero, addition and negation give the induction principle.

**Unit tests.**

- `K0Coh_Spf_padic` (computation): K0Coh (Spf ℤ_p) ≃+ ℤ by generic rank, and [F_p] = 0.
- `K0Coh_Spf_node` (computation): K0Coh (Spf k⟦x, y⟧/(xy)) ≃+ ℤ², sending [M] to the ranks at the minimal primes (x) and (y); [k] = 0 and [O] = (1, 1).
- `K0Coh_empty` (degenerate): K0Coh ∅ = 0.
- `K0Coh_point` (compatibility): For a field k, K0Coh (Spf k) = K0Coh (Spec k) ≃+ ℤ by dimension, as TauCeti's G_0 of k.
- `K0Coh_not_thickenings` (non-example): The pushforward system G_0(Spec ℤ/p^{n+1}) is canonically ℤ by length, with [F_p] = 1. Its map to K0Coh (Spf ℤ_p) ≅ ℤ by generic rank sends that generator to 0. Both abstract groups are ℤ, but the marked comparison is not an isomorphism.

**Uses.**

- Zhang 2021, Appendix B.1, pp. 972–973: target of the regular comparison, the dimension filtration F_iK′_0, and the degree map K′_0(W) → ℤ
- Zhang 2021, Lemma B.1, p. 974: the cokernels of K′_0(X_1 ∩ X_2) → K′_0(X), K′_0(X_i)
- Zhang 2021, Proposition 4.6, p. 890: the equality ∆ ∩^L (id × g′)∆ = LN^g_{n−1} ∩^L Z(u) holds in K′_0(N^g_{n−1} ∩ Z(u))
- Li–Zhang, Lemma 10.4.2, p. 67: pullbacks of Cartier divisor classes compared in K′_0(π^{-1}(Y(x))) ≃ K_0^{π^{-1}(Y(x))}

**Checks.**

- K′_0(Spf ℤ_p) ≅ ℤ via generic rank, with [F_p] = 0 (from 0 → ℤ_p → ℤ_p → F_p → 0).
- K′_0(Spf k⟦x, y⟧/(xy)) ≅ ℤ², detected by the ranks at the two minimal primes; [k] = 0.

**Sources.**

- ZHANG21, Appendix B.1, p. 972. K′_0(X) denotes the Grothendieck group of coherent O_X-modules on a noetherian formal scheme, the definitions of Gillet–Soulé for noetherian schemes carrying over.
- LIZHANG22, §1.8, p. 9. K′_0(X) is the Grothendieck group of coherent sheaves of O_X-modules on a formal scheme, with proper pushforward and the regular identification K_0^Y(X) ≅ K′_0(Y).

### Dévissage for formally supported coherent modules

**Target `SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage` (theorem).** Let X be a noetherian formal scheme and Y = V(𝒥) a closed formal subscheme. Pushforward along i : Y → X induces an isomorphism K′_0(Y) ≅ K_0(Coh_Y(X)) (abelian K_0 of the Serre subcategory of FK.0/formal-support). Hence K′_0(V(𝒥^n)) ≅ K′_0(Y) for every n ≥ 1, and K′_0(Y) depends only on the radical of 𝒥; every coherent F formally supported on Y has a class [F] ∈ K′_0(Y).

**Hypotheses and conventions.**

- X noetherian, so a single power of 𝒥 kills each object of Coh_Y(X).

**Proof outline.**

1. Each F in Coh_Y(X) has the finite filtration F ⊇ 𝒥F ⊇ 𝒥²F ⊇ ⋯ ⊇ 𝒥^nF = 0 whose quotients are killed by 𝒥, i.e. are pushforwards of coherent O_Y-modules.
2. Quillen's dévissage theorem (GeneralAlgebraicKTheory:K.3/devissage-theorem; in degree 0 the inverse is F ↦ Σ_k [𝒥^kF/𝒥^{k+1}F], independent of the filtration by Schreier refinement) gives the isomorphism.
3. Applying it to Y and to V(𝒥^n), which have the same formally supported objects, gives K′_0(V(𝒥^n)) ≅ K′_0(Y); the radical statement follows from FK.0/formal-support.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.0/formal-support`, `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `AdicSpacesPartII:F0/closed-formal-subscheme`, `SchemeKTheoryOperations:S.3/coherent-support-devissage`.

**Checks.**

- For Y = V(p) ⊂ Spf ℤ_p, K′_0(Spec F_p) ≅ ℤ ≅ K_0(Coh_Y(Spf ℤ_p)), generated by [F_p], and [ℤ/p^n] = n[F_p].

**Sources.**

- ZHANG21, Appendix B.1, p. 972 and (B.5), p. 973. The homology of a supported complex is regarded as an element of K′_0(Y), and O_Y ⊗^L O_Z is viewed in K′_0(Y ∩ Z) ≃ K_0^{Y∩Z}(X), which uses that formally supported coherent modules have classes in K′_0 of the support.
- STACKS, Tag 00L6 (Lemma 10.62.4). On a noetherian ring a power of the ideal kills every finite module supported in V(I), which makes the 𝒥-adic filtration finite.

### Strict complexes with formal support

**Target `SchemeKTheoryOperationsPartII:FK.1/strict-supported-complexes` (definition).** For a noetherian formal scheme X and a closed formal subscheme Y, C^b_Y(X) is the category of bounded chain complexes of locally free coherent O_X-modules of finite rank whose homology sheaves are formally supported on Y (FK.0/formal-support), with chain maps as morphisms. It is closed under shifts, mapping cones, finite direct sums and degreewise split extensions; E ⊗ F ∈ C^b_{Y∩Z}(X) for E ∈ C^b_Y(X), F ∈ C^b_Z(X); and for any morphism g : X′ → X of noetherian formal schemes, g^*E ∈ C^b_{g^{-1}Y}(X′) with g^{-1}Y := V(g^*𝒥·O_{X′}). On X = Spf A, Γ identifies C^b_{Spf(A/J)}(Spf A) with the bounded complexes of finite projective A-modules whose homology is supported in V(J) ⊆ Spec A, i.e. with Gillet–Soulé's strict category of Spec A with support V(J).

**Named signature.** `TauCeti.FormalScheme.StrictSuppComplex`.

**Hypotheses and conventions.**

- Global strict complexes: a perfect complex need not be quasi-isomorphic to one of these unless X has the resolution property (FK.2/regular-supported-comparison).
- Support is formal: acyclicity 'outside Y' means homology killed by a power of the ideal of Y.

**Construction.**

1. Homology of a cone and of a degreewise split extension sits in long exact sequences, and Coh_Y(X) is a Serre subcategory.
2. Tensor product: on Spf A, E ⊗ F is a bounded complex of finite projectives; its homology is supported in V(J_Y) ∩ V(J_Z) because E is exact after localising at any prime outside V(J_Y), hence so is E ⊗ F (Künneth over a localisation where E is contractible).
3. Pullback: on affine charts A → A′, a bounded complex of finite projectives exact at all primes outside V(J) stays exact at all primes of A′ outside V(JA′), since such a prime lies over a prime outside V(J) and localisations commute with base change; the homology of E ⊗_A A′ is then supported in V(JA′) (Stacks 00L6).
4. Locally free coherent modules on Spf A are the M^Δ with M finite projective (AdicSpacesPartII:F0/affine-coherent-equivalence and local freeness at every maximal ideal).

**Inputs.** `SchemeKTheoryOperationsPartII:FK.0/formal-support`, `AdicSpacesPartII:F0/affine-coherent-equivalence`, `AdicSpacesPartII:F0/coherent-formal-module-properties`, `mathlib:HomologicalComplex`, `mathlib:Module.Projective`, `SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison`, `EnhancedDerivedSheaves:E1/koszul-complex`.

**API.**

- `TauCeti.FormalScheme.StrictSuppComplex` (structure): Bounded complexes of locally free coherent modules with homology formally supported on Y, as a full subcategory of chain complexes.
- `TauCeti.FormalScheme.StrictSuppComplex.shift` (constructor): Closure under shift.
- `TauCeti.FormalScheme.StrictSuppComplex.cone` (constructor): Closure under mapping cones of chain maps.
- `TauCeti.FormalScheme.StrictSuppComplex.tensor` (constructor): E ⊗ F ∈ C^b_{Y∩Z} for E ∈ C^b_Y, F ∈ C^b_Z.
- `TauCeti.FormalScheme.StrictSuppComplex.pullback` (functoriality): g^* maps C^b_Y(X) to C^b_{g⁻¹Y}(X′), compatibly with composition.
- `TauCeti.FormalScheme.StrictSuppComplex.Spf_iff` (compatibility): On Spf A, membership ↔ bounded complex of finite projective A-modules with Module.support of each homology module ⊆ zeroLocus J.
- `TauCeti.FormalScheme.StrictSuppComplex.koszul` (constructor): For f_1, …, f_r ∈ Γ(X, O_X) the Koszul complex lies in C^b_{V(f_1,…,f_r)}(X).

**Unit tests.**

- `koszul_mem_padic` (computation): On Spf ℤ_p, [O →p O] ∈ C^b_{V(p)}.
- `not_mem_zero_map` (non-example): On Spf ℤ_p, [O →0 O] ∉ C^b_{V(p)}: its homology is O in two degrees, formally supported only on Y = X, although its topological support is |V(p)|.
- `acyclic_mem_empty` (degenerate): An exact bounded complex of locally free modules lies in C^b_∅(X), and C^b_∅(X) consists exactly of these.
- `pullback_koszul` (compatibility): For g : Spf ℤ_p⟦t⟧ → Spf ℤ_p the pullback of [O →p O] is [O →p O] ∈ C^b_{V(p)}(Spf ℤ_p⟦t⟧).

**Uses.**

- Zhang 2021, Appendix B.1, p. 972: generators of K_0^Y(X) and of the cup product
- Li–Zhang, §1.8, p. 9: pullback of locally free complexes along morphisms of formal schemes
- Li–Liu 2021, §8, (8.3) (paper item PAPER-LI-LIU-21/43): K-theory classes of special cycles built from the classes of the divisors N(x_i)

**Checks.**

- On Spf ℤ_p the Koszul complex [O →p O] lies in C^b_{V(p)}(Spf ℤ_p); [O →0 O] does not, its homology O being supported on |V(p)| only topologically.

**Sources.**

- ZHANG21, Appendix B.1, p. 972. K_0^Y(X) is built from finite complexes of coherent locally free O_X-modules acyclic outside Y, meaning that the homology sheaves are supported on Y.
- LIZHANG22, §1.8, p. 9. K_0^Y(X) is generated by finite complexes of coherent locally free O_X-modules acyclic outside Y, and pulling back locally free sheaves along a morphism π gives π^* : K_0^Z(Y) → K_0^{π^{-1}(Z)}(X).

### The Gillet–Soulé group K₀^Y of a noetherian formal scheme

**Target `SchemeKTheoryOperationsPartII:FK.1/supported-k-zero` (definition).** For a noetherian formal scheme X and a closed formal subscheme Y, K_0^Y(X) is the free abelian group on isomorphism classes of objects of C^b_Y(X) (FK.1/strict-supported-complexes) modulo [E] = [E′] + [E″] for every degreewise exact sequence 0 → E′ → E → E″ → 0 in C^b_Y(X), and [E] = [F] whenever E and F are quasi-isomorphic by a chain map. K_0(X) := K_0^X(X). Consequences: exact complexes have class 0, [E[1]] = −[E], and [cone(u)] = [F] − [E] for u : E → F. Maps: support enlargement K_0^Y(X) → K_0^{Y′}(X) for Y ⊆ Y′; restriction to open formal subschemes; pullback g^* : K_0^Y(X) → K_0^{g⁻¹Y}(X′) for every morphism g of noetherian formal schemes. K_0(X) is a commutative ring and K_0^Y(X) a K_0(X)-module under the cup product (FK.1/supported-cup-product). This is not the exact K_0 of the category of complexes: the quasi-isomorphism relation is essential.

**Named signature.** `TauCeti.FormalScheme.K0Supp`.

**Hypotheses and conventions.**

- X noetherian; Y closed formal subscheme.
- Global strict model; without the resolution property it may differ from a K_0 of locally perfect complexes, and nothing here asserts otherwise.

**Construction.**

1. The relations are compatible with ⊗, pullback and support enlargement because these preserve degreewise exact sequences and quasi-isomorphisms of complexes of locally free modules.
2. An exact complex E is quasi-isomorphic to 0; [E[1]] + [E] = [cone(id_E)] = 0 from the degreewise split sequence E → cone(id_E) → E[1].
3. On Spf A the group is Gillet–Soulé's K_0^{V(J)}(Spec A) (FK.1/affine-transport), which the parent identifies with Thomason–Trobaugh's K_0(Spec A on V(J)) (SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison).

**Inputs.** `SchemeKTheoryOperationsPartII:FK.1/strict-supported-complexes`, `tauceti:TauCeti.ExactK0`, `SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison`, `SchemeKTheoryOperations:S.3/support-k-theory`.

**API.**

- `TauCeti.FormalScheme.K0Supp` (data): K0Supp X Y : the group K_0^Y(X).
- `TauCeti.FormalScheme.K0Supp.of` (constructor): The class [E] of E ∈ C^b_Y(X).
- `TauCeti.FormalScheme.K0Supp.of_shortExact` (relation): [E] = [E′] + [E″] for a degreewise exact sequence.
- `TauCeti.FormalScheme.K0Supp.of_quasiIso` (relation): [E] = [F] for a quasi-isomorphism E → F.
- `TauCeti.FormalScheme.K0Supp.of_exact` (simp): [E] = 0 for E exact.
- `TauCeti.FormalScheme.K0Supp.of_shift` (simp): [E[1]] = −[E].
- `TauCeti.FormalScheme.K0Supp.supportEnlarge` (functoriality): K0Supp X Y → K0Supp X Y′ for Y ⊆ Y′, with supportEnlarge_id and supportEnlarge_comp.
- `TauCeti.FormalScheme.K0Supp.restrict` (functoriality): Restriction to an open formal subscheme U, landing in K0Supp U (Y ∩ U).
- `TauCeti.FormalScheme.K0Supp.pullback` (functoriality): g^* : K0Supp X Y → K0Supp X′ (g⁻¹ Y), with pullback_id and pullback_comp.
- `TauCeti.FormalScheme.K0Supp.instCommRing` (instance): K0Supp X X is a commutative ring under the cup product, with unit [O_X].
- `TauCeti.FormalScheme.K0Supp.lift` (universal-property): An assignment of object classes to an abelian group satisfying the degreewise exact sequence and quasi-isomorphism relations extends uniquely to an additive homomorphism from this group.
- `TauCeti.FormalScheme.K0Supp.hom_ext` (extensionality): Two additive homomorphisms are equal if they agree on every generating class [E].
- `TauCeti.FormalScheme.K0Supp.induction` (other): To prove an additive subgroup contains every element, it suffices to show that it contains the generating classes; zero, addition and negation give the induction principle.

**Unit tests.**

- `K0Supp_empty` (degenerate): K0Supp X ∅ = 0: an object of C^b_∅(X) is exact.
- `K0_Spf_local` (computation): For A a noetherian complete local ring, K0Supp (Spf A) (Spf A) ≃+ ℤ by alternating sum of ranks.
- `K0Supp_koszul_padic` (computation): On Spf ℤ_p, the class of [O →p O] in K0Supp (Spf ℤ_p) (V(p)) is nonzero and maps to 1 under the homology class map to K0Coh (Spec F_p) ≃ ℤ.
- `K0Supp_not_exactK0` (non-example): In the exact K_0 of bounded complexes with degreewise split sequences but without the quasi-isomorphism relation, [O →id O] = [O] + [O[1]] ≠ 0 (that group is ⊕_n K_0(X) by degree); in K0Supp it is 0.
- `K0Supp_ofScheme` (compatibility): For a separated noetherian regular scheme of finite dimension with the resolution property, K0Supp agrees with the parent's strict support group (SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison).

**Uses.**

- Zhang 2021, (B.1)–(B.3), p. 972: the codimension filtration and the cup product live on K_0^Y(X)
- Li–Zhang, Definition 2.4.1, p. 11: ^LZ(L) is the image of O_{Z(x_1)} ⊗^L ⋯ ⊗^L O_{Z(x_r)} ∈ F^rK_0^{Z(L)}(N) in Gr^r
- Li–Zhang, (5.2.0.1) and Corollary 5.2.2, p. 24: change of support Gr^{n−1}K_0^{Z(L♭)_V}(N_n) → Gr^{n−1}K_0^{N_{n,red}}(N_n)
- He–Li–Shi–Yang 2023, Definitions 2.9–2.10 (paper item PAPER-HE-LI-SHI-ETAL-23/9): derived special cycles ^𝕃Z(L) ∈ K_0^{Z(L)}(N) and Int(L)

**Checks.**

- K_0^∅(X) = 0.
- For A local, K_0(Spf A) ≅ ℤ by rank, every finite projective A-module being free.

**Sources.**

- ZHANG21, Appendix B.1, p. 972. K_0^Y(X) is the Grothendieck group of finite complexes of coherent locally free O_X-modules acyclic outside Y, as in Gillet–Soulé §1.2, and K_0(X) = K_0^X(X).
- LIZHANG22, §1.8, p. 9. The same group K_0^Y(X) for noetherian formal schemes, with its codimension filtration, extended to locally noetherian formal schemes by exhaustion, and with pullback π^*.

### Affine transport: K-groups of Spf A are those of Spec A

**Target `SchemeKTheoryOperationsPartII:FK.1/affine-transport` (comparison).** Let A be a noetherian adic ring, J ⊆ A an ideal, X = Spf A and Y = Spf(A/J). (i) Γ(X, ·) is an equivalence from C^b_Y(X) onto the category of bounded complexes of finite projective A-modules with homology supported in V(J), compatible with ⊗, shifts, cones and quasi-isomorphisms. (ii) Hence K_0^Y(Spf A) ≅ K_0^{V(J)}(Spec A) in Gillet–Soulé's strict model, compatibly with cup products, support enlargement and pullback along continuous maps A → A′. (iii) K′_0(Spf(A/J)) ≅ G_0(A/J) ≅ G_0(Spec(A/J)). (iv) If A is regular of finite Krull dimension, closed formal subschemes Spf(A/𝔞) ⊆ Spf A and closed subschemes V(𝔞) ⊆ Spec A have the same codimension (FK.0/formal-codimension-formula), so the codimension filtrations correspond. Every statement the parent proves for the affine scheme Spec A of a noetherian regular ring of finite dimension therefore holds for Spf A.

**Hypotheses and conventions.**

- A noetherian adic; Spec A is affine, hence separated and has the resolution property.
- No such transport is asserted for non-affine formal schemes.

**Proof outline.**

1. Coherent modules on Spf A are finite A-modules and locally free ones are finite projective (AdicSpacesPartII:F0/affine-coherent-equivalence); homology commutes with Γ by exactness.
2. Formal support of M^Δ on V(J) is Supp M ⊆ V(J) (FK.0/formal-support), the support condition of Gillet–Soulé's strict model on Spec A.
3. The two presentations have the same generators and relations, so the groups coincide; products and maps are defined by the same formulas.
4. Codimension: FK.0/formal-codimension-formula on Spf A and the height description on Spec A.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.1/strict-supported-complexes`, `SchemeKTheoryOperationsPartII:FK.1/supported-k-zero`, `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group`, `SchemeKTheoryOperationsPartII:FK.0/formal-codimension-formula`, `SchemeKTheoryOperationsPartII:FK.0/formal-support`, `AdicSpacesPartII:F0/affine-coherent-equivalence`, `SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison`, `SchemeKTheoryOperations:S.3/affine-support-comparison`, `SchemeKTheoryOperations:S.6/supported-codimension-filtration`.

**Checks.**

- For A = ℤ_p⟦t⟧ and J = (p, t): K_0^{V(p,t)}(Spf A) ≅ K_0^{V(p,t)}(Spec A) ≅ ℤ, generated by the Koszul complex of (p, t).

**Sources.**

- ZHANG21, Appendix B.1, pp. 971–972. For the formal completion of Spec A along Spec A/I with Y defined by J, formal support means support of the module of sections in Spec(A/J), and Gillet–Soulé's definitions for noetherian schemes carry over to noetherian formal schemes.
- EGA-I, (10.10.2), (10.10.5), pp. 201–202. Γ and (·)^Δ are inverse equivalences between coherent modules on Spf A and finite A-modules.

### The homology class map K₀^Y(X) → K′₀(Y)

**Target `SchemeKTheoryOperationsPartII:FK.1/homology-class-map` (construction).** For a noetherian formal scheme X and a closed formal subscheme Y, h_Y : K_0^Y(X) → K′_0(Y), [E] ↦ Σ_i (−1)^i [H_i(E)], where H_i(E) ∈ Coh_Y(X) has a class in K′_0(Y) by FK.1/formal-supported-devissage. It is well defined, compatible with support enlargement (on the right, pushforward K′_0(Y) → K′_0(Y′)), with restriction to opens and with flat pullback. For Y = X it is the formal Cartan map K_0(X) → K′_0(X); on Spf A it is Gillet–Soulé's map with supports and, for Y = X, TauCeti.cartanMap.

**Named signature.** `TauCeti.FormalScheme.K0Supp.homologyClass`.

**Hypotheses and conventions.**

- X noetherian.
- h_Y is not an isomorphism in general (FK.2/regular-supported-comparison gives the regular case).

**Construction.**

1. A degreewise exact sequence of complexes gives the long exact homology sequence, whose alternating sum of classes vanishes in K_0(Coh_Y(X)).
2. A quasi-isomorphism induces isomorphisms on homology.
3. Compatibilities: homology commutes with restriction and flat pullback, and support enlargement only changes the ambient Serre subcategory.
4. On Spf A transport to finite modules (FK.1/affine-transport); for Y = X the composite with the identification K_0(A) of projectives is TauCeti.cartanMap.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.1/supported-k-zero`, `SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage`, `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group`, `SchemeKTheoryOperationsPartII:FK.1/affine-transport`, `tauceti:TauCeti.cartanMap`, `EnhancedDerivedSheaves:E1/koszul-complex`.

**API.**

- `TauCeti.FormalScheme.K0Supp.homologyClass` (data): h_Y : K0Supp X Y →+ K0Coh Y.
- `TauCeti.FormalScheme.K0Supp.homologyClass_of` (simp): h_Y [E] = Σ_i (−1)^i [H_i E].
- `TauCeti.FormalScheme.K0Supp.homologyClass_supportEnlarge` (compatibility): h_{Y′} ∘ supportEnlarge = closedPushforward ∘ h_Y.
- `TauCeti.FormalScheme.K0Supp.homologyClass_restrict` (compatibility): h commutes with restriction to open formal subschemes.
- `TauCeti.FormalScheme.K0Supp.homologyClass_Spf` (compatibility): On Spf A with Y = X, h is TauCeti.cartanMap under the affine identifications.
- `TauCeti.FormalScheme.K0Supp.homologyClass_koszul` (simp): For a regular sequence f, h [K(f)] = [O/(f)].

**Unit tests.**

- `homologyClass_koszul_padic` (computation): On Spf ℤ_p, h [O →p O] = [F_p], i.e. 1 in K0Coh (Spec F_p) ≃ ℤ.
- `homologyClass_cartan` (compatibility): For X = Spf A and Y = X, homologyClass equals TauCeti.cartanMap A under K0Supp (Spf A) (Spf A) ≅ K_0(proj A) and K0Coh (Spf A) ≅ G_0(A).
- `homologyClass_node_not_surjective` (non-example): For X = Spf k⟦x, y⟧/(xy) and Y = X, h : ℤ → ℤ² sends 1 to (1, 1) and is not surjective: without regularity h is not an isomorphism.
- `homologyClass_empty` (degenerate): For Y = ∅ both sides are 0.

**Uses.**

- Zhang 2021, Appendix B.1, p. 972: the identification K_0^Y(X) ≅ K′_0(Y) for regular X
- Zhang 2021, (B.5), p. 973: Y ∩^L_X Z viewed in K′_0(Y ∩ Z) ≃ K_0^{Y∩Z}(X)
- SchemeKTheoryOperationsPartII:FK.2/filtration-comparison: F^{d−i}K_0^Y(X) corresponds to F_iK′_0(Y)

**Checks.**

- The Koszul complex of a regular sequence f_1, …, f_r has class mapping to [O/(f_1, …, f_r)].

**Sources.**

- ZHANG21, Appendix B.1, p. 972; (B.5), p. 973. For X regular of pure dimension d there are natural isomorphisms K_0^Y(X) ≅ K′_0(Y), and O_Y ⊗^L O_Z is viewed in K′_0(Y ∩ Z) ≃ K_0^{Y∩Z}(X); the map is the alternating sum of homology classes.
- LIZHANG22, Lemma 10.4.2, p. 67. Equalities of pulled-back divisor classes are stated in K_0^{π⁻¹(Y(x))}(Ñ) ≃ K′_0(π⁻¹(Y(x))), through the homology identification.

### The supported cup product

**Target `SchemeKTheoryOperationsPartII:FK.1/supported-cup-product` (construction).** For a noetherian formal scheme X and closed formal subschemes Y, Z, the tensor product of complexes induces a biadditive map ∪ : K_0^Y(X) × K_0^Z(X) → K_0^{Y∩Z}(X), [E] ∪ [F] = [Tot(E ⊗ F)], where Y ∩ Z := V(𝒥_Y + 𝒥_Z). It is associative, graded-commutative (commutative on these K_0's), unital with unit [O_X] ∈ K_0(X), compatible with support enlargement and restriction, and with pullback: g^*(a ∪ b) = g^*a ∪ g^*b. On Spf A it is the Gillet–Soulé product of Spec A with supports.

**Named signature.** `TauCeti.FormalScheme.K0Supp.cup`.

**Hypotheses and conventions.**

- X noetherian.
- The product is derived: its homology is computed by Tor, not by tensoring homology.

**Construction.**

1. E ⊗ F ∈ C^b_{Y∩Z}(X) by FK.1/strict-supported-complexes.
2. Tensoring with a complex of locally free modules preserves degreewise exact sequences and quasi-isomorphisms, so the relations of FK.1/supported-k-zero are respected in each variable.
3. Associativity and commutativity from the canonical isomorphisms of total tensor complexes (with the Koszul sign), unit from O_X ⊗ E ≅ E; pullback commutes with ⊗.
4. On Spf A transport (FK.1/affine-transport) identifies the product with the parent's (SchemeKTheoryOperations:S.6/support-product-pairings).

**Inputs.** `SchemeKTheoryOperationsPartII:FK.1/supported-k-zero`, `SchemeKTheoryOperationsPartII:FK.1/strict-supported-complexes`, `SchemeKTheoryOperationsPartII:FK.1/affine-transport`, `SchemeKTheoryOperations:S.6/support-product-pairings`, `tauceti:TauCeti.SheafOfModules.tensorProduct`.

**API.**

- `TauCeti.FormalScheme.K0Supp.cup` (data): cup : K0Supp X Y →+ K0Supp X Z →+ K0Supp X (Y ⊓ Z).
- `TauCeti.FormalScheme.K0Supp.cup_of` (simp): [E] ∪ [F] = [Tot (E ⊗ F)].
- `TauCeti.FormalScheme.K0Supp.cup_assoc` (relation): (a ∪ b) ∪ c = a ∪ (b ∪ c) under (Y ⊓ Z) ⊓ W = Y ⊓ (Z ⊓ W).
- `TauCeti.FormalScheme.K0Supp.cup_comm` (relation): a ∪ b = b ∪ a under Y ⊓ Z = Z ⊓ Y.
- `TauCeti.FormalScheme.K0Supp.one_cup` (simp): [O_X] ∪ a = a.
- `TauCeti.FormalScheme.K0Supp.cup_supportEnlarge` (compatibility): Support enlargement in either factor commutes with ∪.
- `TauCeti.FormalScheme.K0Supp.pullback_cup` (functoriality): g^*(a ∪ b) = g^*a ∪ g^*b.
- `TauCeti.FormalScheme.K0Supp.cup_Spf` (compatibility): On Spf A the cup product is the Gillet–Soulé product of Spec A (SchemeKTheoryOperations:S.6/support-product-pairings).

**Unit tests.**

- `cup_koszul_transverse` (computation): On Spf ℤ_p⟦t⟧, homologyClass ([K(t)] ∪ [K(t − p)]) = [F_p] in K0Coh (Spec F_p) ≃ ℤ, i.e. 1.
- `cup_self_divisor` (non-example): On Spf ℤ_p⟦t⟧, homologyClass ([K(t)] ∪ [K(t)]) = 0 in K0Coh (V(t)) ≃ ℤ, while [H(K(t)) ⊗ H(K(t))] = [O/(t)] = 1: the product is not the tensor product of homologies.
- `cup_one` (degenerate): [O_X] ∪ a = a and [0] ∪ a = 0.
- `cup_Spf_compat` (compatibility): For X = Spf A the product agrees with the parent's support product on Spec A.

**Uses.**

- Zhang 2021, (B.3), p. 972: multiplicativity of the codimension filtration is a statement about ∪
- Li–Zhang, Definition 2.4.1, p. 11: O_{Z(x_1)} ⊗^L ⋯ ⊗^L O_{Z(x_r)} ∈ K_0^{Z(L)}(N)
- Li–Zhang, Corollary 2.8.2, p. 14: independence of the basis: the class of O_{Z(x_1)} ⊗^L ⋯ ⊗^L O_{Z(x_r)} in K_0^{Z(L)}(N) depends only on L
- Li–Liu 2021, §8, footnote 17 (paper item PAPER-LI-LIU-21/43): ^K N(x) = [N(x_1)] ∪ ⋯ ∪ [N(x_m)] in K_0^{N(x)}(N)
- SchemeKTheoryOperationsPartII:FK.2/affine-filtration-product: F^a ∪ F^b ⊆ F^{a+b} on affine regular formal schemes

**Checks.**

- On Spf ℤ_p⟦t⟧: [K(t)] ∪ [K(t − p)] = [K(t, t − p)], whose homology class is [F_p].
- [K(t)] ∪ [K(t)] has homology class [O/(t)] − [O/(t)] = 0 in K′_0(V(t)) ≅ ℤ, whereas the class of the underived tensor product of homologies is [O/(t)] ≠ 0.

**Sources.**

- ZHANG21, Appendix B.1, p. 972. The tensor product of complexes of locally free sheaves induces the cup product K_0^Y(X) × K_0^Z(X) → K_0^{Y∩Z}(X), [F] ∪ [G] = [F ⊗ G], following Gillet–Soulé §1.4.
- LIZHANG22, §1.8, p. 9; Definition 2.4.1, p. 11. Derived products Z_1 ∩^L ⋯ ∩^L Z_m are viewed in K_0^{Z_1∩⋯∩Z_m}(X); the derived Kudla–Rapoport cycle is the product of the classes of the Cartier divisors Z(x_i).

### The Tor pairing and derived intersections on a regular formal scheme

**Target `SchemeKTheoryOperationsPartII:FK.1/tor-pairing` (construction).** Let X be a regular noetherian formal scheme of finite dimension. For closed formal subschemes Y, Z there is a biadditive pairing K′_0(Y) × K′_0(Z) → K′_0(Y ∩ Z), [F] ·^L [G] := Σ_j (−1)^j [Tor_j^{O_X}(i_*F, i_*G)] (FK.0/formal-tor-sheaves; finite since Tor_j = 0 for j > dim X), symmetric, associative and unital with unit [O_X], compatible with pushforward along closed immersions Y ⊆ Y′. The derived intersection is Y ∩^L_X Z := [O_Y] ·^L [O_Z] ∈ K′_0(Y ∩ Z). It is compatible with the cup product: h_{Y∩Z}(a ∪ b) = h_Y(a) ·^L h_Z(b) for a ∈ K_0^Y(X), b ∈ K_0^Z(X). On a regular noetherian scheme it is the parent's K-module pairing on G_0 (SchemeKTheoryOperations:S.2/tensor-product-pairings).

**Named signature.** `TauCeti.FormalScheme.torPairing`.

**Hypotheses and conventions.**

- X regular (finite Tor-dimension of every stalk) and noetherian of finite dimension.
- Without regularity the alternating sum need not be finite and the pairing is not defined.

**Construction.**

1. Bilinearity: a short exact sequence in either variable gives the long exact Tor sequence, which is finite, and its alternating sum vanishes in K_0(Coh_{Y∩Z}(X)) ≅ K′_0(Y ∩ Z) (FK.1/formal-supported-devissage).
2. Use the ordinary homotopy-category shadow of EnhancedDerivedSheaves:E1/presentability-and-derived-tensor on the ringed space (|X|, O_X). Truncation triangles give finite global hyper-Tor spectral sequences of coherent sheaves for the two bracketings of F ⊗^L G ⊗^L H. Their Euler classes agree with the iterated pairings by dévissage, and derived associativity identifies the abutments. Equality of K′_0 classes is obtained globally; K′_0 classes are not detected by stalks or by an affine cover.
3. For strict E and F, filter the global derived tensor by their bounded homology truncations. The finite hyper-Tor spectral sequences have terms Tor_p(H_q(E), H_r(F)) and abutment H_*(E ⊗ F); their Euler classes in the supported coherent category give homologyClass_cup. Finite dimension bounds Tor uniformly.
4. Scheme case: Tor sheaves agree (FK.0/formal-tor-sheaves) and the parent's pairing is [E ⊗^L F] on K_0 × G_0.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.0/formal-tor-sheaves`, `SchemeKTheoryOperationsPartII:FK.0/regular-and-cohen-macaulay-formal-schemes`, `SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage`, `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group`, `SchemeKTheoryOperationsPartII:FK.1/homology-class-map`, `SchemeKTheoryOperationsPartII:FK.1/supported-cup-product`, `SchemeKTheoryOperations:S.2/tensor-product-pairings`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**API.**

- `TauCeti.FormalScheme.torPairing` (data): torPairing : K0Coh Y →+ K0Coh Z →+ K0Coh (Y ⊓ Z) for X regular.
- `TauCeti.FormalScheme.torPairing_of` (simp): torPairing [F] [G] = Σ_j (−1)^j [Tor j F G].
- `TauCeti.FormalScheme.torPairing_comm` (relation): torPairing a b = torPairing b a.
- `TauCeti.FormalScheme.torPairing_assoc` (relation): Associativity under (Y ⊓ Z) ⊓ W = Y ⊓ (Z ⊓ W).
- `TauCeti.FormalScheme.torPairing_one` (simp): torPairing [O_X] b = b (via pushforward to X ⊓ Z = Z).
- `TauCeti.FormalScheme.derivedIntersection` (data): derivedIntersection Y Z := torPairing [O_Y] [O_Z] ∈ K0Coh (Y ⊓ Z).
- `TauCeti.FormalScheme.homologyClass_cup` (compatibility): homologyClass (a ∪ b) = torPairing (homologyClass a) (homologyClass b).
- `TauCeti.FormalScheme.torPairing_closedPushforward` (functoriality): Pushforward along Y ⊆ Y′ commutes with torPairing in the first variable.
- `TauCeti.FormalScheme.torPairing_ext` (extensionality): A biadditive pairing out of K0Coh Y × K0Coh Z is determined by its values on ([F],[G]) for coherent F on Y and G on Z.

**Unit tests.**

- `derivedIntersection_transverse` (computation): On Spf ℤ_p⟦t⟧, derivedIntersection V(t) V(t − p) = [O_{Spec F_p}] = 1 in K0Coh (Spec F_p) ≃ ℤ.
- `derivedIntersection_self_divisor` (non-example): On Spf ℤ_p⟦t⟧, derivedIntersection V(t) V(t) = 0 in K0Coh (V(t)) ≃ ℤ: the derived self-intersection of a divisor with trivial normal bundle is not its structure sheaf.
- `torPairing_unit` (degenerate): torPairing [O_X] [G] = [G].
- `torPairing_ofScheme` (compatibility): For a regular noetherian scheme, torPairing is the G_0-module pairing [E ⊗^L F] of SchemeKTheoryOperations:S.2/tensor-product-pairings.

**Uses.**

- Zhang 2021, (B.4)–(B.5), p. 973: the derived intersection whose degree is χ(X, F ⊗^L G)
- Zhang 2021, (3.7)–(3.8), p. 881: Int(g) = χ(N_{n−1,n}, O_∆ ⊗^L O_{g∆})
- Zhang 2021, proof of Proposition 5.2, p. 897: equalities of derived tensor products π_*O_{C̃} ⊗^L O_{Z(u)} in K′_0(N^g_n ∩ Z(u))
- Li–Zhang, §1.8, p. 9: Z_1 ∩^L ⋯ ∩^L Z_m := O_{Z_1} ⊗^L ⋯ ⊗^L O_{Z_m}

**Checks.**

- On Spf ℤ_p⟦t⟧: V(t) ∩^L V(t − p) = [Spec F_p] = 1 and V(t) ∩^L V(t) = [O_{V(t)}] − [O_{V(t)}] = 0 in K′_0(V(t)) ≅ ℤ.

**Sources.**

- ZHANG21, (B.4)–(B.5), p. 973. For X regular with closed formal subschemes Y, Z, the derived tensor product of coherent sheaves gives a pairing through the alternating sum of Tor sheaves, and Y ∩^L_X Z := O_Y ⊗^L_{O_X} O_Z ∈ K′_0(Y ∩ Z) ≃ K_0^{Y∩Z}(X).
- ZHANG21, Proposition 4.6, p. 890. ∆ ∩^L (id × g′)∆ and LN^g_{n−1} ∩^L Z(u) are compared as elements of K′_0(N^g_{n−1} ∩ Z(u)).
- STACKS, Tag 00O7 (Proposition 10.110.1). Regular local rings have finite global dimension, bounding the Tor sheaves.

### Dependencies

Within this roadmap: `SchemeKTheoryOperationsPartII:FK.0`. Other suppliers: `SchemeKTheoryOperations:S.2`, `SchemeKTheoryOperations:S.3`, `SchemeKTheoryOperations:S.6`, `GeneralAlgebraicKTheory:K.3`, `AdicSpacesPartII:F0`, `EnhancedDerivedSheaves:E1`.

### Acceptance for the layer

- K′₀(Spf ℤ_p) ≅ ℤ with [F_p] = 0; K′₀(Spf k⟦x, y⟧/(xy)) ≅ ℤ².
- K₀^∅(X) = 0; the acyclic complex [O →id O] has class 0 in K₀^Y but not in the naive K₀ of complexes.
- [K(t)] ∪ [K(t − p)] has homology class 1 and [K(t)] ∪ [K(t)] has homology class 0 on Spf ℤ_p⟦t⟧.
- The homology class map for Spf k⟦x, y⟧/(xy) is ℤ → ℤ², not surjective.

<a id="layer-fk2"></a>

## Layer FK.2: Regular comparison, filtrations and noetherian exhaustion

Regular formal schemes satisfy dévissage for supports: the homology class map K₀^Y(X) → K′₀(Y) is an isomorphism, provided X has the resolution property (automatic on affine formal schemes); the source asserts this without proof for formal schemes (source issue E2). The codimension filtration of K₀^Y and the dimension filtration of K′₀ then correspond. Rational multiplicativity of the filtration is proved on affine regular formal schemes by transport; the general formal case is not asserted. Finally all groups are extended to locally noetherian formal schemes, such as Rapoport–Zink spaces, by inverse limits over noetherian open exhaustions.

**Targets of the layer.**

Prove the regular supported dévissage: for a regular noetherian formal scheme of finite dimension with the resolution property (for example an affine one), the homology class map K₀^Y(X) → K′₀(Y) is an isomorphism, inverted by finite locally free resolutions. Define the codimension filtration F^iK₀^Y(X) by supports of ambient codimension ≥ i and the dimension filtration F_iK′₀(X), with their graded pieces and rationalisations, and prove that F^{d−i} corresponds to F_i on regular formal schemes of pure dimension d. Prove the rational multiplicativity F^a ∪ F^b ⊆ F^{a+b} on affine regular formal schemes by transport to Spec A (its Euler-characteristic consequence appears in FK.4); the non-affine case is not asserted. Define the K-groups, filtrations and products of a locally noetherian formal scheme as inverse limits over a noetherian open exhaustion, prove their independence of the exhaustion and their stabilisation for quasi-compact supports when the exhaustion members are regular of finite dimension with the resolution property.

**Planets.** Regular supported dévissage; Codimension filtration; Affine multiplicativity (B.3); K-groups of locally noetherian formal schemes.

### Regular supported dévissage: K₀^Y(X) ≅ K′₀(Y)

**Target `SchemeKTheoryOperationsPartII:FK.2/regular-supported-comparison` (theorem).** Let X be a regular noetherian formal scheme of finite dimension d with the resolution property: every coherent O_X-module is a quotient of a locally free coherent one (automatic for X = Spf A). Then for every closed formal subscheme Y ⊆ X the homology class map h_Y : K_0^Y(X) → K′_0(Y) (FK.1/homology-class-map) is an isomorphism. Its inverse sends [F], for F ∈ Coh_Y(X), to the class of any finite resolution E → F by locally free coherent modules (of length ≤ d), which lies in C^b_Y(X). Consequently K_0^Y(X) is identified with K′_0(Y), K_0(X) ≅ K′_0(X), and for an open U ⊆ X containing Y and also having the resolution property, the restriction K_0^Y(X) → K_0^Y(U) is an isomorphism.

**Hypotheses and conventions.**

- X regular of finite Krull dimension d, noetherian.
- Resolution property for X (for example X affine). Without it the theorem is not asserted; a locally perfect model of K-theory would be needed.
- The statement is false without regularity (FK.1/homology-class-map, node non-example).

**Proof outline.**

1. Existence of resolutions: by the resolution property choose locally free E_0 → F surjective, then E_1 → ker, and so on; the d-th syzygy has stalks of projective dimension 0, since regular local rings of dimension ≤ d have global dimension ≤ d (Stacks 00O7), hence is locally free (a coherent module with free stalks is locally free: on Spf A a finite module free at every maximal ideal is projective).
2. Use finite resolutions of bounded coherent complexes and of finite diagrams, constructed by successive epimorphisms from locally free sheaves onto the required fibre products. Common refinements and mapping cones compare resolutions and give additivity, using the resolving-subcategory argument (GeneralAlgebraicKTheory:K.3/resolution-theorem; GrothendieckEulerForms Layer 3). Vector bundles are closed under extensions and kernels of epimorphisms between vector bundles locally, but need not be projective objects of Coh X; do not invoke a projective horseshoe lemma or assume arbitrary lifts to preselected resolutions.
3. Apply that bounded-complex resolution argument with the quasi-isomorphisms whose homology is formally supported on Y. It compares the strict presentation with the bounded coherent derived category supported on Y. Bounded truncations identify its K_0 with K_0(Coh_Y(X)); dévissage then gives K′_0(Y). On a coherent sheaf h of any chosen resolution is its class, and the truncation Euler identity proves the reverse composite for every strict complex.
4. On X = Spf A this is the parent's comparison for the affine regular scheme Spec A transported by FK.1/affine-transport (SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison together with SchemeKTheoryOperations:S.3/regular-support-devissage).
5. Restriction: h commutes with restriction to U, and K′_0(Y) is the same whether computed in X or in U ⊇ Y; apply the theorem to X and to U.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.1/homology-class-map`, `SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage`, `SchemeKTheoryOperationsPartII:FK.1/affine-transport`, `SchemeKTheoryOperationsPartII:FK.0/regular-and-cohen-macaulay-formal-schemes`, `SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison`, `SchemeKTheoryOperations:S.3/regular-support-devissage`, `mathlib:IsRegularLocalRing`, `tauceti:TauCeti.cartanMap_bijective`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`.

**Checks.**

- X = Spf ℤ_p⟦t⟧, Y = V(p, t): K_0^Y(X) ≅ K′_0(Spec F_p) ≅ ℤ, generated by the Koszul complex of (p, t).
- Spf k⟦x, y⟧/(xy) (not regular): h_X : ℤ → ℤ² is not surjective.

**Sources.**

- ZHANG21, Appendix B.1, p. 972. From the assumption that X is regular of pure dimension d the paper records natural isomorphisms K_0^Y(X) ≅ K′_0(Y), the definitions of Gillet–Soulé carrying over; no proof is given for formal schemes, and the resolution hypothesis is made explicit here.
- LIZHANG22, §1.8, p. 9. For X regular there is a natural isomorphism K_0^Y(X) ≃ K′_0(Y), used throughout to view derived products in K′_0 of the intersection.
- STACKS, Tag 00O7 (Proposition 10.110.1). Every finite module over a regular local ring of dimension d has a finite free resolution of length ≤ d.

### Codimension filtration on K₀^Y and dimension filtration on K′₀

**Target `SchemeKTheoryOperationsPartII:FK.2/codimension-filtration` (definition).** Let X be a noetherian formal scheme and Y ⊆ X a closed formal subscheme. F^iK_0^Y(X) := Σ_{Z ⊆ Y, codim_X Z ≥ i} im(K_0^Z(X) → K_0^Y(X)), the sum over closed formal subschemes Z of Y with ambient codimension at least i (FK.0/formal-local-dimension); the union is directed (Z_1 ∪ Z_2 = V(𝒥_1 ∩ 𝒥_2) has codimension ≥ min), so F^i is a subgroup. It is descending, F^0 = K_0^Y(X), when dim X = d < ∞ one has F^i = 0 for i > d, and Gr^iK_0^Y(X) := F^i/F^{i+1}. Dually F_iK′_0(X) := Σ_{Z ⊆ X, dim Z ≤ i} im(K′_0(Z) → K′_0(X)), ascending, F_{−1} = 0, when dim X = d < ∞ one has F_d = K′_0(X), Gr_i := F_i/F_{i−1}. Rational versions F^i_ℚ, Gr^i_ℚ are obtained by tensoring with ℚ. Codimension and dimension are those of local rings, never of the underlying spaces.

**Named signature.** `TauCeti.FormalScheme.K0Supp.codimFiltration`.

**Hypotheses and conventions.**

- X noetherian; its global Krull dimension need not be finite. Any bound using a natural number dim X assumes separately dim X = d < ∞.
- Integral filtrations; ℚ only where stated.

**Construction.**

1. Directedness: codim_X(Z_1 ∪ Z_2) = min(codim_X Z_1, codim_X Z_2), computed stalkwise (dimension of a union is the maximum).
2. F^0 = K_0^Y(X) taking Z = Y; for i > dim X no nonempty Z qualifies and K_0^∅ = 0.
3. Support enlargement preserves F^i by the defining sum. The dimension-drop codimension convention on arbitrary formal schemes does not justify flat-pullback monotonicity merely by going down. No such extra flat-pullback assertion is needed here.
4. A coherent module F with dim Supp F ≤ i (formal support V(Ann F)) has [F] ∈ F_iK′_0(X) by FK.1/formal-supported-devissage.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.0/formal-local-dimension`, `SchemeKTheoryOperationsPartII:FK.1/supported-k-zero`, `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group`, `SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage`, `SchemeKTheoryOperations:S.6/supported-codimension-filtration`, `SchemeKTheoryOperations:S.4/coherent-codimension-filtration`.

**API.**

- `TauCeti.FormalScheme.K0Supp.codimFiltration` (data): dimFiltration X i : AddSubgroup (K0Coh X), monotone in i; if dim X = d < ∞, then F_d = ⊤.
- `TauCeti.FormalScheme.K0Supp.mem_codimFiltration_iff` (characterisation): a ∈ F^i ↔ a is a finite sum of images of classes supported on closed Z ⊆ Y with codim Z X ≥ i.
- `TauCeti.FormalScheme.K0Supp.codimFiltration_antitone` (relation): i ≤ j → F^j ≤ F^i.
- `TauCeti.FormalScheme.K0Supp.codimFiltration_zero` (simp): F^0 = ⊤.
- `TauCeti.FormalScheme.K0Supp.codimFiltration_eq_bot` (simp): dim X < i → F^i = ⊥.
- `TauCeti.FormalScheme.K0Supp.codimGraded` (data): Gr^i := F^i ⧸ F^{i+1}, and its rationalisation.
- `TauCeti.FormalScheme.K0Supp.supportEnlarge_codimFiltration` (functoriality): dimFiltration X i : AddSubgroup (K0Coh X), monotone in i; if dim X = d < ∞, then F_d = ⊤.
- `TauCeti.FormalScheme.K0Coh.dimFiltration` (data): dimFiltration X i : AddSubgroup (K0Coh X), monotone in i; if dim X = d < ∞, then F_d = ⊤.
- `TauCeti.FormalScheme.K0Coh.of_mem_dimFiltration` (relation): dimFiltration X i : AddSubgroup (K0Coh X), monotone in i; if dim X = d < ∞, then F_d = ⊤.
- `TauCeti.FormalScheme.K0Supp.codimFiltration_Spf` (compatibility): On Spf A with A regular, F^i corresponds to the parent's filtration on K_0^{V(J)}(Spec A) under FK.1/affine-transport.

**Unit tests.**

- `codimFiltration_point_powerSeries` (computation): On Spf ℤ_p⟦t⟧ with Y = V(p, t): F^2 = ⊤ and F^3 = ⊥.
- `codimFiltration_divisor` (computation): On Spf ℤ_p⟦t⟧, [K(t)] ∈ F^1 K0Supp (V(t)) and its image in Gr^1 is nonzero (it maps to 1 ∈ K0Coh (V(t)) ≃ ℤ).
- `codimFiltration_degenerate` (degenerate): F^0 = ⊤; if dim X = d < ∞, then F^{d+1} = ⊥; for Y = ∅ all terms are ⊥.
- `codimFiltration_not_topological` (non-example): With topological codimension of |Z| in |X| (both a point for every Z ⊆ Spf ℤ_p⟦t⟧) every class would lie in F^0 only, and [K(p, t)] would not lie in F^2; the local-ring codimension puts it in F^2.
- `codimFiltration_ofScheme` (compatibility): For a separated regular noetherian scheme of finite dimension with the resolution property, F^i agrees with SchemeKTheoryOperations:S.6/supported-codimension-filtration.

**Uses.**

- Zhang 2021, proof of Proposition 5.2, pp. 896–897: LN^g_n lies in F^{n−1} and is represented in Gr^{n−1} by Σ mult_C [O_C]
- Li–Zhang, Definition 2.4.1, p. 11: ^LZ(L) is the image of the derived product in Gr^rK_0^{Z(L)}(N)
- Li–Zhang, (5.2.0.1), p. 24: Gr^{n−1}K_0^{Z(L♭)} splits into horizontal and vertical parts
- SchemeKTheoryOperationsPartII:FK.2/affine-filtration-product: statement of (B.3) for affine regular formal schemes
- SchemeKTheoryOperationsPartII:FK.4/zero-dimensional-pairing: classes in F^1 pair to zero with zero-dimensional classes

**Checks.**

- On Spf ℤ_p⟦t⟧ (dimension 2) with Y = V(p, t): F^2K_0^Y = K_0^Y ≅ ℤ and F^3 = 0.
- [K(t)] ∈ F^1K_0^{V(t)}(Spf ℤ_p⟦t⟧) and its image in Gr^1 is nonzero.

**Sources.**

- ZHANG21, Appendix B.1, (B.1)–(B.2), p. 972. The descending filtration F^iK_0^Y(X) is the union of the images of K_0^Z(X) over closed formal Z ⊆ Y of codimension at least i, with graded pieces Gr^i; the ascending filtration F_iK′_0(X) uses closed Z of dimension at most i.
- LIZHANG22, §1.8, p. 9; Corollary 5.2.2, p. 24. The codimension filtration and its graded pieces on K_0^Y(X) for (locally) noetherian formal schemes; the vertical part of the derived cycle is a rational combination of classes of curves in Gr^{n−1}.

### Codimension filtration versus dimension filtration

**Target `SchemeKTheoryOperationsPartII:FK.2/filtration-comparison` (theorem).** Let X be a regular noetherian formal scheme of pure dimension d with the resolution property, and Y ⊆ X a closed formal subscheme. Under h_Y : K_0^Y(X) ≅ K′_0(Y) (FK.2/regular-supported-comparison), F^{d−i}K_0^Y(X) corresponds to F_iK′_0(Y) for every i, so Gr^{d−i}K_0^Y(X) ≅ Gr_iK′_0(Y).

**Hypotheses and conventions.**

- X regular, noetherian, pure of dimension d, with the resolution property.

**Proof outline.**

1. h is compatible with support enlargement: h_Y ∘ (K_0^Z(X) → K_0^Y(X)) = (K′_0(Z) → K′_0(Y)) ∘ h_Z (FK.1/homology-class-map), and h_Z is an isomorphism, so the image of K_0^Z(X) corresponds to the image of K′_0(Z).
2. For nonempty Z, codim_X Z ≥ d − i ⇔ dim Z ≤ i by FK.0/formal-codimension-formula (regular implies Cohen–Macaulay).
3. Sum over Z on both sides.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.2/regular-supported-comparison`, `SchemeKTheoryOperationsPartII:FK.2/codimension-filtration`, `SchemeKTheoryOperationsPartII:FK.0/formal-codimension-formula`, `SchemeKTheoryOperationsPartII:FK.1/homology-class-map`.

**Checks.**

- Spf ℤ_p⟦t⟧ (d = 2), Y = V(t): F^1K_0^Y ↔ F_1K′_0(V(t)) = K′_0(Spf ℤ_p) ≅ ℤ and F^2K_0^Y ↔ F_0K′_0(Spf ℤ_p) = 0, since [F_p] = 0 there.

**Sources.**

- ZHANG21, Appendix B.1, p. 972. For X regular of pure dimension d, besides K_0^Y(X) ≅ K′_0(Y), the codimension filtration F^{d−i} corresponds to the dimension filtration F_i of K′_0(Y).

### Rational multiplicativity of the codimension filtration on affine regular formal schemes

**Target `SchemeKTheoryOperationsPartII:FK.2/affine-filtration-product` (theorem).** Let A be a regular noetherian adic ring of finite Krull dimension, X = Spf A, and Y, Z closed formal subschemes. Then F^aK_0^Y(X)_ℚ ∪ F^bK_0^Z(X)_ℚ ⊆ F^{a+b}K_0^{Y∩Z}(X)_ℚ for all a, b ≥ 0. For non-affine formal schemes this inclusion is not asserted. The Euler-characteristic consequence is stated later in FK.4/derived-euler-pairing.

**Hypotheses and conventions.**

- A regular, noetherian, adic, of finite Krull dimension; affine X only.
- Rational coefficients.
- The non-affine formal case is open in the source (PAPER-ZHANG-21/E26) and is not used by the consumers, who follow Zhang's Remark 5.3 and Li–Zhang's Remark 6.4.11.

**Proof outline.**

1. Transport to Spec A by FK.1/affine-transport, which matches cup products and, A being regular, codimension filtrations.
2. Apply the parent's theorem for the separated regular noetherian scheme Spec A of finite dimension, which has the resolution property (SchemeKTheoryOperations:S.6/rational-supported-filtration-product, via Adams operations and the weight splitting).

**Inputs.** `SchemeKTheoryOperationsPartII:FK.1/affine-transport`, `SchemeKTheoryOperationsPartII:FK.2/codimension-filtration`, `SchemeKTheoryOperationsPartII:FK.1/supported-cup-product`, `SchemeKTheoryOperationsPartII:FK.0/formal-codimension-formula`, `SchemeKTheoryOperations:S.6/rational-supported-filtration-product`, `SchemeKTheoryOperations:S.6/supported-codimension-weight-splitting`.

**Checks.**

- On Spf ℤ_p⟦t, u⟧ (dimension 3), the classes of the Cartier divisors V(t) and V(tu) meet in the codimension-one V(t); their product is the Koszul class of (t, tu) = (t, 0) up to change of basis, which is 0, consistent with the predicted membership in F^2.
- For transverse divisors V(t), V(u) the product [K(t, u)] lies in F^2 because its support V(t, u) has codimension 2; the theorem says the same holds after any excess.

**Sources.**

- ZHANG21, Appendix B.1, (B.3), p. 972. When X is a scheme, Gillet–Soulé's Adams operations give the rational inclusion F^{j_1} · F^{j_2} ⊆ F^{j_1+j_2}; for formal schemes the paper only expects the same argument to work, uses that case only in Proposition 5.2, and gives an alternative proof (Remark 5.3).
- LIZHANG22, §1.8, p. 9. If F_i ∈ F^{r_i} with Σ r_i ≥ n then χ(X, ⊗^L F_i) depends only on the images in Gr^{r_i}; the paper needs this only when X is a scheme (Remark 6.4.11) and, for formal X, only when some r_i = dim X.

### K-groups of locally noetherian formal schemes by noetherian exhaustion

**Target `SchemeKTheoryOperationsPartII:FK.2/noetherian-exhaustion-k-groups` (construction).** Let X be a locally noetherian formal scheme which is the increasing union of a directed family (X_i)_{i∈I} of noetherian open formal subschemes. Define K′_0(X) := lim_i K′_0(X_i), K_0(X) := lim_i K_0(X_i) and, for a closed formal subscheme Y with Y_i := Y ∩ X_i, K_0^Y(X) := lim_i K_0^{Y_i}(X_i), along restriction maps; F^jK_0^Y(X) := lim_i F^jK_0^{Y_i}(X_i) ⊆ K_0^Y(X) and F_jK′_0(X) likewise, with Gr^j := F^j/F^{j+1} of these limits. Cup products, homology class maps, pullbacks along morphisms compatible with exhaustions, and Tor pairings (on regular members of finite dimension) pass to the limit. The groups do not depend on the exhaustion: they are canonically the limits over all quasi-compact open formal subschemes. If Y is quasi-compact, Y ⊆ X_{i_0}, and all X_i are regular of finite dimension with the resolution property, then K_0^Y(X) ≅ K_0^Y(X_{i_0}) ≅ K′_0(Y).

**Named signature.** `TauCeti.FormalScheme.K0Supp.ofExhaustion`.

**Hypotheses and conventions.**

- X locally noetherian and exhausted by noetherian opens (for instance any locally noetherian formal scheme whose underlying space is a countable increasing union of quasi-compact opens).
- These are limits over open subschemes, not over the thickenings X_n of an ideal of definition; they are not continuous K-theory of thickenings (RefinedTraceMethodsPartII's concern).
- Gr^j of the limits is not asserted to be the limit of the Gr^j.

**Construction.**

1. Restriction maps are compatible with composition, so the inverse systems are defined; all structure maps commute with restriction.
2. Independence: a quasi-compact open lies in finitely many X_i, hence in one by directedness; so each exhaustion is cofinal in the poset of quasi-compact opens, and the limits agree canonically.
3. Stabilisation: for i ≥ i_0 the restriction K_0^Y(X_i) → K_0^Y(X_{i_0}) is an isomorphism by FK.2/regular-supported-comparison (both are K′_0(Y)), so the system is eventually constant.
4. The closed-union decomposition of FK.3/closed-union-decomposition passes to the limit of the noetherian isomorphisms, but not to cokernels of limits (lim¹ terms; PAPER-ZHANG-21/E60).

**Inputs.** `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group`, `SchemeKTheoryOperationsPartII:FK.1/supported-k-zero`, `SchemeKTheoryOperationsPartII:FK.1/supported-cup-product`, `SchemeKTheoryOperationsPartII:FK.1/homology-class-map`, `SchemeKTheoryOperationsPartII:FK.2/codimension-filtration`, `SchemeKTheoryOperationsPartII:FK.2/regular-supported-comparison`, `AdicSpacesPartII:F0/locally-noetherian-formal-scheme`.

**API.**

- `TauCeti.FormalScheme.NoetherianExhaustion` (structure): A directed family of noetherian open formal subschemes with union X.
- `TauCeti.FormalScheme.K0Coh.ofExhaustion` (data): lim_i K0Coh (X_i) along restrictions.
- `TauCeti.FormalScheme.K0Supp.ofExhaustion` (data): lim_i K0Supp (X_i) (Y ∩ X_i), with its filtration and cup product.
- `TauCeti.FormalScheme.K0Supp.ofExhaustion_equiv` (equivalence): Two exhaustions give canonically isomorphic groups, compatible with all structure maps.
- `TauCeti.FormalScheme.K0Supp.ofExhaustion_single` (simp): For a noetherian X and the one-member exhaustion, ofExhaustion ≃ K0Supp X Y.
- `TauCeti.FormalScheme.K0Supp.ofExhaustion_projection` (projection): The projection to each member X_i, compatible with restriction.
- `TauCeti.FormalScheme.K0Supp.ofExhaustion_stable` (relation): For quasi-compact Y ⊆ X_{i_0} and regular members of finite dimension with the resolution property, ofExhaustion ≃ K0Supp X_{i_0} Y ≃ K0Coh Y.

**Unit tests.**

- `exhaustion_single` (degenerate): For X noetherian, the exhaustion {X} gives K0Coh X and K0Supp X Y.
- `exhaustion_disjoint_union` (computation): For X = ⊔_{n∈ℕ} Spf ℤ_p, K0Coh.ofExhaustion X ≃ ∏_n ℤ (not ⊕_n ℤ).
- `exhaustion_independent` (characterisation): The exhaustion of ⊔_n Spf ℤ_p by the unions of the first N pieces and the exhaustion by the unions of the first N pieces in a reordered enumeration give canonically isomorphic limits.
- `exhaustion_not_thickenings` (non-example): For Spf ℤ_p, the one-member open exhaustion gives G_0 ≅ ℤ by generic rank and [F_p] = 0. Under pushforward along the closed thickenings, each G_0(Spec ℤ/p^{n+1}) ≅ ℤ by length and [F_p] = 1. Thus these marked constructions differ; no underived pullback inverse system on coherent G_0 is assumed.

**Uses.**

- Zhang 2021, Appendix B.1, p. 973: K-groups of the Rapoport–Zink spaces N_n, which are locally noetherian but not noetherian
- Zhang 2021, proof of Proposition 5.2, p. 897: work on a fixed noetherian open N°_n containing the relevant support
- Li–Zhang, §1.8, p. 9: K_0^Y(N) for the unitary Rapoport–Zink space N
- SchemeKTheoryOperationsPartII:FK.4/derived-euler-pairing: the pairing is computed on any noetherian open containing the proper support

**Checks.**

- For X = ⊔_{n∈ℕ} Spf ℤ_p, exhausted by finite unions, K′_0(X) ≅ ∏_n ℤ.
- For X noetherian, the one-member exhaustion recovers the noetherian groups.

**Sources.**

- ZHANG21, Appendix B.1, p. 973. For locally noetherian formal schemes written as an increasing union of noetherian open formal subschemes, the K-groups and K_0^Y are defined as inverse limits, the filtrations have the same properties, and the groups depend only on X.
- LIZHANG22, §1.8, p. 9. The definitions of K_0^Y(X), F^iK_0^Y(X) and Gr^iK_0^Y(X) extend to locally noetherian formal schemes that are increasing unions of open noetherian formal subschemes.

### Dependencies

`SchemeKTheoryOperationsPartII:FK.1`, `SchemeKTheoryOperations:S.3`, `SchemeKTheoryOperations:S.4`, `SchemeKTheoryOperations:S.6`, `GeneralAlgebraicKTheory:K.3`.

### Acceptance for the layer

- K₀^{V(p,t)}(Spf ℤ_p⟦t⟧) ≅ ℤ = F² and F³ = 0.
- [K(t)] ∈ F¹ with nonzero image in Gr¹.
- For ⊔_n Spf ℤ_p, K′₀ is ∏_n ℤ.
- Open exhaustions are not thickenings: [F_p] = 0 in K′₀(Spf ℤ_p) but not in the thickenings' K′₀.

<a id="layer-fk3"></a>

## Layer FK.3: Closed unions and Tor vanishing (Zhang's Lemmas B.1 and B.2)

Zhang's two lemmas. Lemma B.1 decomposes K′₀ of a union of two closed formal subschemes modulo the overlap; the overlap maps need not be injective and, for locally noetherian formal schemes, only limits of cokernels are compared. Lemma B.2 makes derived intersections underived: in expected dimension, with a regular immersion meeting a Cohen–Macaulay subscheme, all higher Tor sheaves vanish (part (i)), and on an expected-dimensional part of a union they vanish modulo the overlap (part (ii)), with the localisation done at primes of stalks because distinct formal components can share all their points. The pullback of a Cartier divisor class is the layer's last target.

**Targets of the layer.**

Prove Lemma B.1: for a noetherian formal scheme that is the union of two closed formal subschemes, restriction to the two pieces gives an isomorphism of cokernels of K′₀ of the overlap, the overlap maps need not be injective, and for locally noetherian formal schemes the statement holds for inverse limits of cokernels. Prove Lemma B.2(i): if Z₁ → X is a regular immersion, Z₂ is Cohen–Macaulay and the intersection has the expected codimension at every point, the higher Tor sheaves of O_{Z₁} and O_{Z₂} vanish; and Lemma B.2(ii): on an expected-dimensional part Y of Z₁ ∩ Z₂ = Y ∪ Y′ they vanish modulo K′₀(Y ∩ Y′), with the localisation done at primes of the stalks. Prove that the pullback of the class of an effective Cartier divisor whose preimage is again Cartier is the class of the preimage.

**Planets.** Closed-union decomposition (Lemma B.1); Tor vanishing in expected dimension; Componentwise Tor vanishing.

### Closed-union decomposition of K′₀ modulo the overlap (Lemma B.1)

**Target `SchemeKTheoryOperationsPartII:FK.3/closed-union-decomposition` (theorem).** (a) Let X be a noetherian formal scheme and X = X_1 ∪ X_2 a union of closed formal subschemes X_k = V(𝒥_k) with 𝒥_1 ∩ 𝒥_2 = 0; put X_12 := V(𝒥_1 + 𝒥_2). For coherent E on X the sheaves Tor_1^{O_X}(E, O_{X_k}) and E ⊗ O_{X_12} are formally supported on X_12, and [E] ↦ ([E ⊗ O_{X_1}], [E ⊗ O_{X_2}]) induces an isomorphism coker(K′_0(X_12) → K′_0(X)) ≅ coker(K′_0(X_12) → K′_0(X_1)) ⊕ coker(K′_0(X_12) → K′_0(X_2)), whose inverse is induced by (a_1, a_2) ↦ i_{1*}a_1 + i_{2*}a_2. The maps K′_0(X_12) → K′_0(X_k) need not be injective; the quotients are cokernels. (b) If X is locally noetherian with a noetherian exhaustion (X_i), the isomorphisms of (a) for the X_i form an isomorphism of inverse systems, giving lim_i coker_i(X) ≅ lim_i coker_i(X_1) ⊕ lim_i coker_i(X_2); the comparison of the cokernel of a limit with the limit of cokernels is not asserted.

**Hypotheses and conventions.**

- (a) X noetherian; 𝒥_1 ∩ 𝒥_2 = 0 (scheme-theoretic union).
- (b) Cokernels of inverse limits may differ from inverse limits of cokernels by lim¹ terms (PAPER-ZHANG-21/E60); the paper's one-line reduction to the noetherian case is replaced by the statement about limits of cokernels.

**Proof outline.**

1. Well-definedness: E ↦ E ⊗ O_{X_1} is right exact, and for 0 → E′ → E → E″ → 0 the defect is the image of Tor_1(E″, O_{X_1}). On an affine formal open Spf A, after localising at a prime q of A not containing 𝔧_1 + 𝔧_2, one of 𝔧_1, 𝔧_2 becomes the unit ideal and the other zero (their product lies in 𝔧_1 ∩ 𝔧_2 = 0), so O_{X_1} is a direct factor of O_X there and Tor_1 vanishes; hence Tor_1 is supported in V(𝔧_1 + 𝔧_2) ⊆ Spec A and formally supported on X_12 (FK.0/formal-support). The localisation is at primes of the coordinate ring, not at points of |X|, which may all lie in |X_12|.
2. Classes of modules formally supported on X_12 lie in the image of K′_0(X_12) (FK.1/formal-supported-devissage), so the map is well defined on cokernels.
3. Tensor the exact sequence 0 → O_X/(𝒥_1 ∩ 𝒥_2) → O_X/𝒥_1 ⊕ O_X/𝒥_2 → O_X/(𝒥_1 + 𝒥_2) → 0 with E: the four-term sequence Tor_1(E, O_{X_12}) → E → (E ⊗ O_{X_1}) ⊕ (E ⊗ O_{X_2}) → E ⊗ O_{X_12} → 0 shows i_{1*}[E ⊗ O_{X_1}] + i_{2*}[E ⊗ O_{X_2}] = [E] modulo K′_0(X_12).
4. Conversely for an O_{X_1}-module F, F ⊗ O_{X_1} = F and F ⊗ O_{X_2} = F/𝒥_2F is an O_{X_12}-module, so the other composite is the identity.
5. (b): restriction maps commute with all maps in (a); finite direct sums commute with inverse limits.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.0/formal-support`, `SchemeKTheoryOperationsPartII:FK.0/formal-tor-sheaves`, `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group`, `SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage`, `SchemeKTheoryOperationsPartII:FK.2/noetherian-exhaustion-k-groups`, `AdicSpacesPartII:F0/closed-formal-subscheme`.

**Checks.**

- X = Spf k⟦x, y⟧/(xy) = V(x) ∪ V(y), X_12 = Spec k: K′_0(X_12) ≅ ℤ maps to 0 in K′_0(V(x)) ≅ K′_0(Spf k⟦y⟧) ≅ ℤ (since [k] = 0 there), so the overlap map is not injective; both sides of (a) are ℤ ⊕ ℤ, matching K′_0(X) ≅ ℤ² with [k] = 0.
- If X_1 ∩ X_2 = ∅, (a) is the additivity K′_0(X_1 ⊔ X_2) ≅ K′_0(X_1) ⊕ K′_0(X_2).

**Sources.**

- ZHANG21, Lemma B.1, its proof and footnote 11, p. 974. For X the union of two closed formal subschemes, tensoring with O_{X_1} and O_{X_2} gives a natural isomorphism of the cokernels of K′_0(X_1 ∩ X_2); the proof tensors the Mayer–Vietoris type exact sequence of structure sheaves with E, and footnote 11 says the quotients are cokernels since the overlap maps need not be injective.
- STACKS, Tag 00L6 (Lemma 10.62.4). A finite module whose support lies in V(I) is killed by a power of I.

### Tor vanishing in the expected dimension (Lemma B.2(i))

**Target `SchemeKTheoryOperationsPartII:FK.3/expected-dimension-tor-vanishing` (theorem).** Let X be a locally noetherian formal scheme, Z_1 → X a regular immersion (FK.0/formal-regular-immersion) and Z_2 ⊆ X a Cohen–Macaulay closed formal subscheme. Suppose that at every point z ∈ |Z_1 ∩ Z_2|, codim_z(Z_1 ∩ Z_2, X) = codim_z(Z_1, X) + codim_z(Z_2, X). Then Tor_i^{O_X}(O_{Z_1}, O_{Z_2}) = 0 for all i > 0, so on every noetherian open the finite Tor class satisfies O_{Z_1} ⊗^L O_{Z_2} = O_{Z_1} ⊗ O_{Z_2} = O_{Z_1∩Z_2} in K′_0(Z_1 ∩ Z_2), and Z_1 ∩ Z_2 → Z_2 is again a regular immersion.

**Hypotheses and conventions.**

- Z_1 → X regular immersion, for example X and Z_1 regular.
- Z_2 Cohen–Macaulay; the conclusion fails without it.
- Codimensions are those of FK.0/formal-local-dimension; pure-dimensionality, assumed in the source, is not needed for this part.

**Proof outline.**

1. Stalks: Tor sheaves are computed on stalks (FK.0/formal-tor-sheaves), and a coherent sheaf with zero stalks at all points of |X| is zero; away from |Z_1 ∩ Z_2| some argument is killed by a unit.
2. At z with R = O_{X,z}, the ideal of Z_1 is generated by a regular sequence f_1, …, f_m (m = codim_z(Z_1, X)), whose Koszul complex K(f) is a free resolution of O_{Z_1,z} (Stacks 062F; EnhancedDerivedSheaves:E1/koszul-complex). Hence Tor_i^R(O_{Z_1,z}, O_{Z_2,z}) = H_i(K(f̄; O_{Z_2,z})).
3. The hypothesis says dim O_{Z_2,z}/(f̄) = dim O_{Z_2,z} − m; in the Cohen–Macaulay local ring O_{Z_2,z} this means f̄ is a regular sequence (Stacks 02JN), so its Koszul complex is exact in positive degrees.
4. H_0 = O_{Z_2,z}/(f̄) = O_{Z_1∩Z_2,z}, and f̄ regular gives the last claim.
5. On each noetherian open the locally constant regular-immersion ranks have a finite upper bound, so the Tor Euler class is a finite sum there. For non-quasi-compact X take the inverse-limit class, rather than an unbounded global sum.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.0/formal-regular-immersion`, `SchemeKTheoryOperationsPartII:FK.0/regular-and-cohen-macaulay-formal-schemes`, `SchemeKTheoryOperationsPartII:FK.0/formal-tor-sheaves`, `SchemeKTheoryOperationsPartII:FK.0/formal-local-dimension`, `EnhancedDerivedSheaves:E1/koszul-complex`, `SchemeAndStackFoundations:SF.0/cohen-macaulay`, `mathlib:RingTheory.Sequence.IsRegular`.

**Checks.**

- On Spf ℤ_p⟦t⟧: Z_1 = V(t), Z_2 = V(t − p) meet in Spec F_p of the expected codimension 2, and Tor_1 = 0.
- Serre's example: in Spf k⟦x, y, z, w⟧ let Z_2 = V(x, y) ∪ V(z, w) (not Cohen–Macaulay) and Z_1 = V(x − z, y − w). The intersection is the closed point, of the expected codimension 4, but O_{Z_1∩Z_2} = k⟦x, y⟧/(x², xy, y²) has length 3 while the Euler characteristic is 2, so Tor_1 ≠ 0.

**Sources.**

- ZHANG21, Lemma B.2(i) and its proof, pp. 974–975. With Z_1 → X a regular immersion and Z_2 Cohen–Macaulay, expected codimension at every point of Z_1 ∩ Z_2 forces the higher Tor sheaves to vanish: the Koszul complex of the local equations of Z_1 stays a resolution after restriction to Z_2.
- ZHANG21, proof of Lemma 4.4, p. 889. Applied with the graph Γ_g′ and N_{n−1} × N_{n−1}, local complete intersections in N_n × N_n meeting in the expected dimension, to get vanishing of higher Tor.
- STACKS, Tags 062F (Lemma 15.31.2), 02JN (Lemma 10.104.2). Regular sequences are Koszul-regular; in a Cohen–Macaulay local ring a sequence in the maximal ideal is regular exactly when it cuts the dimension by its length.

### Tor vanishing on an expected-dimensional part (Lemma B.2(ii))

**Target `SchemeKTheoryOperationsPartII:FK.3/componentwise-tor-vanishing` (theorem).** Under the hypotheses of FK.3/expected-dimension-tor-vanishing except the dimension condition, let X be noetherian and Z_1 ∩ Z_2 = Y ∪ Y′ (𝒥_Y ∩ 𝒥_{Y′} = 𝒥_{Z_1∩Z_2}) with Y of the expected dimension: codim_z(Y, X) = codim_z(Z_1, X) + codim_z(Z_2, X) at every z ∈ |Y|. Then for every i > 0 the restriction Tor_i^{O_X}(O_{Z_1}, O_{Z_2}) ⊗ O_Y is formally supported on Y ∩ Y′, so its class lies in the image of K′_0(Y ∩ Y′) → K′_0(Y); equivalently, under FK.3/closed-union-decomposition the Y-component of [Tor_i] vanishes in coker(K′_0(Y ∩ Y′) → K′_0(Y)). Hence the Y-component of O_{Z_1} ⊗^L O_{Z_2} is the class of O_Y modulo the image of K′_0(Y ∩ Y′). The sheaf Tor_i ⊗ O_Y itself need not vanish.

**Hypotheses and conventions.**

- Z_1 → X regular immersion, Z_2 Cohen–Macaulay, X noetherian (for the locally noetherian case use FK.2/noetherian-exhaustion-k-groups).
- The localisation away from Y′ must be done at primes of the stalks O_{Z_2,z}, not at points of |X|: in Spf ℤ_p⟦s, t⟧, Y = V(s, t) and Y′ = V(s, t − p) have the same underlying point.
- This expands the compressed proof of the source; review rejects E1 as an allegation of a source mistake, since the printed argument never restricts localisation to topological points.

**Proof outline.**

1. Fix z ∈ |Y| and work in the Cohen–Macaulay local ring B = O_{Z_2,z}, where Z_1 is cut out by f̄_1, …, f̄_m and Tor_i ⊗ O_Y is a finite B-module.
2. Let P be a prime of B in V(I_Y) not containing I_{Y′}. Near P, Z_1 ∩ Z_2 = Y. By Krull's height theorem (Stacks 0BBZ) every minimal prime of (f̄) has height ≤ m, so every component of Y through P has dimension ≥ dim B − m; with the expected dimension at z (Stacks 00NA, B Cohen–Macaulay) every such component has dimension exactly dim B − m, hence dim B_P/(f̄) = dim B_P − m.
3. So f̄ is a regular sequence in the Cohen–Macaulay local ring B_P (Stacks 02JN) and the Koszul homology H_i(K(f̄; B))_P = 0 for i > 0.
4. Thus Supp_B(Tor_i ⊗ O_Y) ⊆ V(I_Y + I_{Y′}); being finite, it is killed by a power of that ideal (Stacks 00L6), i.e. formally supported on Y ∩ Y′, and FK.1/formal-supported-devissage puts its class in the image of K′_0(Y ∩ Y′).
5. The last claim follows from the long exact sequences and FK.3/closed-union-decomposition.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.3/expected-dimension-tor-vanishing`, `SchemeKTheoryOperationsPartII:FK.3/closed-union-decomposition`, `SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage`, `SchemeKTheoryOperationsPartII:FK.0/formal-support`, `SchemeKTheoryOperationsPartII:FK.0/formal-local-dimension`, `SchemeAndStackFoundations:SF.0/cohen-macaulay-universally-catenary`, `SchemeAndStackFoundations:SF.0/cohen-macaulay`.

**Checks.**

- If Y′ = ∅ the statement is FK.3/expected-dimension-tor-vanishing.
- Consumer pattern: for the Kudla–Rapoport cycle of a rank n−1 lattice, Z(L♭) = Z(L♭)_H ∪ Z(L♭)_V with the horizontal part of expected dimension, so the horizontal component of the derived cycle in Gr^{n−1} is represented by the structure sheaf of Z(L♭)_H (Li–Zhang, Definition 5.2.1).

**Sources.**

- ZHANG21, Lemma B.2(ii) and its proof, pp. 974–975. If the intersection is a union of Y and Y′ with Y of the expected dimension, the higher Tor sheaves restricted to Y vanish modulo K′_0(Y ∩ Y′); the paper says this is proved like (i) by combining with Lemma B.1.
- LIZHANG22, §5.2, Definition 5.2.1, p. 24. The horizontal part of the derived Kudla–Rapoport cycle has the expected dimension and is represented by its structure sheaf by Lemma B.2(ii).
- STACKS, Tags 0BBZ (Lemma 10.60.12), 00NA (Lemma 10.104.4), 02JN (Lemma 10.104.2), 00L6 (Lemma 10.62.4). Krull's height theorem, the dimension formula in Cohen–Macaulay local rings, the dimension criterion for regular sequences, and finite modules supported in V(I) are killed by a power of I.

### Pullback of the class of an effective Cartier divisor

**Target `SchemeKTheoryOperationsPartII:FK.3/cartier-pullback` (theorem).** Let g : X′ → X be a morphism of noetherian formal schemes and D ⊆ X an effective Cartier divisor such that g^{-1}D := V(g^*𝒥_D · O_{X′}) is an effective Cartier divisor of X′, i.e. the pulled-back local equations are nonzerodivisors of the stalks of X′ (for instance X, X′ regular and g^♯ injective on the stalks at points of g^{-1}D). Then g^*[K(D)] = [K(g^{-1}D)] in K_0^{g^{-1}D}(X′), where K(D) = [O_X(−D) → O_X] is the Koszul class, and h(g^*[K(D)]) = [O_{g^{-1}D}] in K′_0(g^{-1}D): Tor_1^{O_X}(O_D, O_{X′}) = 0. Without the nonzerodivisor condition, h(g^*[K(D)]) = [O_{g^{-1}D}] − [Tor_1^{O_X}(O_D, O_{X′})].

**Hypotheses and conventions.**

- The nonzerodivisor condition on X′ is essential.

**Proof outline.**

1. K(D) is a resolution of O_D (FK.0/formal-regular-immersion); g^* of it is the two-term complex [O_{X′}(−g^{-1}D) → O_{X′}] given locally by multiplication by g^♯(f).
2. Its H_1 is the annihilator of g^♯(f), which is 0 exactly when g^♯(f) is a nonzerodivisor; its H_0 is O_{g^{-1}D}.
3. If X, X′ are regular, stalks are domains (FK.0/regular-and-cohen-macaulay-formal-schemes), so an injective g^♯ sends the nonzero f to a nonzero element, a nonzerodivisor.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.0/formal-regular-immersion`, `SchemeKTheoryOperationsPartII:FK.0/regular-and-cohen-macaulay-formal-schemes`, `SchemeKTheoryOperationsPartII:FK.1/supported-k-zero`, `SchemeKTheoryOperationsPartII:FK.1/homology-class-map`, `SchemeKTheoryOperationsPartII:FK.1/strict-supported-complexes`, `SchemeKTheoryOperationsPartII:FK.0/formal-tor-sheaves`.

**Checks.**

- Pulling D back along its own inclusion D → X: the local equation becomes 0, Tor_1 = O_D(−D) ≠ 0, and h(i^*[K(D)]) = [O_D] − [O_D(−D)].

**Sources.**

- LIZHANG22, Lemma 10.4.2 and its proof, p. 67. For a morphism of regular formal schemes injective on local rings, the preimage of a Cartier divisor is a Cartier divisor, and the pullback of the class of O_D is the class of the structure sheaf of the preimage (by the argument of Zhang's Lemma B.2(i), even when the map is not a closed immersion).

### Dependencies

Within this roadmap: `SchemeKTheoryOperationsPartII:FK.2`. Other suppliers: `SchemeAndStackFoundations:SF.0`, `EnhancedDerivedSheaves:E1`.

### Acceptance for the layer

- Spf k⟦x, y⟧/(xy) = V(x) ∪ V(y): the overlap map ℤ → K′₀(V(x)) is zero and both sides of Lemma B.1 are ℤ ⊕ ℤ.
- Transverse divisors in Spf ℤ_p⟦t⟧ have no higher Tor; Serre's two planes in Spf k⟦x, y, z, w⟧ (not Cohen–Macaulay) have Tor_1 ≠ 0.
- V(s, t) and V(s, t − p) in Spf ℤ_p⟦s, t⟧ share their only point.
- Pulling a Cartier divisor back to itself produces Tor_1 = O_D(−D).

<a id="layer-fk4"></a>

## Layer FK.4: Euler degree and the derived Euler–Poincaré pairing (B.4)

Intersection numbers. A scheme proper over Spf A lives over a thickening Spec A/ϖ^n, so coherent cohomology has finite length and defines the Euler degree. The derived Euler–Poincaré pairing (B.4) is the degree of the Tor pairing; it is local near the intersection, symmetric and biadditive, and through the cup product it is defined on K₀^Y. The layer computes it in the two situations the consumers meet constantly — against a zero-dimensional class (length times generic rank, so supports of codimension ≥ 1 pair to zero) and against an effective Cartier divisor (degree of the restricted line bundle) — and records its behaviour under proper pushforward, change of discrete valuation ring and the projection formula.

**Targets of the layer.**

Show that a scheme proper over Spf A lives over a thickening Spec A/ϖ^n, and define its Euler degree K′₀(W) → ℤ as the alternating sum of A-lengths of cohomology. Define the derived Euler–Poincaré pairing χ(X, F ⊗^L G) = Σ(−1)^{i+j} length R^iπ_* Tor_j(F, G) for coherent sheaves F on Y and G on Z in a regular formal scheme X, with the closed formal subschemes Y, Z meeting in a scheme proper over Spf A, as a symmetric biadditive pairing on K′₀ and on K₀^Y through the cup product, computed on any noetherian open containing the intersection. Prove the functoriality of the degree under proper pushforward and its behaviour under finite extensions of the discrete valuation ring (factor f) and flat base change (factor e). Prove that the pairing of a zero-dimensional class with any coherent module is length times generic rank, so it vanishes on supports of codimension ≥ 1, and that the pairing with an effective Cartier divisor is deg[F] − deg[F(−D)], the degree of the restricted line bundle on a proper curve. Extend the pairing to power-annihilated sheaves by dévissage, using ambient cohomology only with a compatible A-structure. Construct proper pushforward on K′₀ of formal schemes and prove the projection formula. General proper formal coherent higher direct images remain a precise supplier request to AdicSpacesPartII F0. The layer is planned at target level, with this recorded gap; it is not closed.

**Planets.** Euler degree; Derived Euler–Poincaré pairing (B.4); Pairing with zero-dimensional classes.

### Schemes proper over Spf A live over a thickening

**Target `SchemeKTheoryOperationsPartII:FK.4/schemes-over-formal-base` (lemma).** Let A be a noetherian adic ring with ideal of definition I (for example a complete discrete valuation ring with uniformiser ϖ, I = (ϖ)) and π : W → Spf A a morphism of formal schemes with W a quasi-compact scheme. Then π factors through Spec(A/I^n) ↪ Spf A for some n, π is proper in the sense of EGA III (3.4.1) iff W → Spec(A/I^n) is proper for one (equivalently every) such n, and, assuming π proper, for coherent E on W the higher direct images along W → Spec(A/I^n) are finite A/I^n-modules, independent of n. If A is a complete discrete valuation ring, they have finite length.

**Hypotheses and conventions.**

- W a quasi-compact scheme (discretely ringed), not merely a formal scheme.
- A noetherian adic.
- For the cohomology and finiteness conclusions π is proper. Factoring a quasi-compact scheme through a thickening alone does not give finite cohomology.
- Proper uses EGA’s adic finite-type hypothesis as well as proper reductions. Properness of the induced reduced map alone is insufficient.

**Proof outline.**

1. Morphisms into Spf A correspond to continuous ring maps A → Γ(W, O_W) (AdicSpacesPartII:F0/spf-morphism-correspondence); Γ(W, O_W) is discrete for a scheme, so continuity means some I^n maps to 0 on each affine open, hence on W by quasi-compactness.
2. Use the adic finite-type definition of AdicSpacesPartII:F0/proper-formal-morphism. For a morphism factoring through Spec(A/I^n), properness is equivalent to properness of the scheme morphism to this thickening; properness is invariant under nilpotent thickenings. Properness of the reduced map alone, for an arbitrary non-adic formal morphism, is not this definition.
3. Coherence of higher direct images for the proper morphism of noetherian schemes W → Spec(A/I^n) (SchemeKTheoryOperations:S.2/proper-pushforward-coherent); a finite module over the artinian ring A/ϖ^n has finite length; changing n composes with a closed immersion, which does not change the modules.

**Inputs.** `AdicSpacesPartII:F0/spf-morphism-correspondence`, `AdicSpacesPartII:F0/proper-formal-morphism`, `SchemeKTheoryOperations:S.2/proper-pushforward-coherent`, `mathlib:Module.length`.

**Checks.**

- P¹_{F_p} → Spf ℤ_p is proper and factors through Spec F_p; Spec ℤ/p^3 → Spf ℤ_p factors through n = 3.
- Spf ℤ_p itself is not a scheme, and its global sections ℤ_p have infinite length.
- W = A¹_k over Spf A factors through Spec k but H^0(W,O_W) = k[t] has infinite A-length; the cohomology claim must require properness.

**Sources.**

- ZHANG21, Appendix B.1, p. 973. For W a scheme proper over Spf A with A a complete discrete valuation ring, the higher direct images of coherent sheaves are torsion coherent sheaves and so have finite length.
- LIZHANG22, §1.8, p. 9. Spf O_F̆-schemes are O_F̆-schemes on which ϖ is locally nilpotent.
- EGA-III1, (3.4.1), p. 119. A morphism of locally noetherian formal schemes is proper when it is of finite type and its reduction modulo ideals of definition is a proper morphism of schemes.

### The Euler degree of a scheme proper over Spf A

**Target `SchemeKTheoryOperationsPartII:FK.4/euler-degree` (definition).** Let A be a complete discrete valuation ring and π : W → Spf A proper with W a noetherian scheme. The Euler degree is deg_W : K′_0(W) → ℤ, [E] ↦ Σ_i (−1)^i length_A H^i(W, E) = Σ_i (−1)^i length_A R^iπ_*E; equivalently deg_W = length_A ∘ π_*, where π_* : K′_0(W) → K′_0(Spec A/ϖ^n) ≅ ℤ (FK.4/schemes-over-formal-base). It is additive, independent of n, and extends to classes of coherent modules on a formal scheme X formally supported on W (via K_0(Coh_W(X)) ≅ K′_0(W), FK.1/formal-supported-devissage).

**Named signature.** `TauCeti.FormalScheme.eulerDegree`.

**Hypotheses and conventions.**

- W a scheme; the degree is not defined for formal W such as Spf A, whose cohomology has infinite length.
- Lengths over A, so a closed point with residue field k′ contributes [k′ : k].

**Construction.**

1. Finiteness and vanishing of H^i for i > dim W by FK.4/schemes-over-formal-base and Grothendieck vanishing.
2. Additivity: a short exact sequence of coherent sheaves gives a long exact cohomology sequence of finite-length A-modules.
3. The description length_A ∘ π_* is the parent's formula for proper pushforward on G_0 (SchemeKTheoryOperations:S.7/pushforward-euler-class), composed with K′_0(Spec A/ϖ^n) ≅ ℤ by length (dévissage).

**Inputs.** `SchemeKTheoryOperationsPartII:FK.4/schemes-over-formal-base`, `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group`, `SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage`, `SchemeKTheoryOperations:S.7/pushforward-euler-class`, `mathlib:Module.length`.

**API.**

- `TauCeti.FormalScheme.eulerDegree` (data): eulerDegree W : K0Coh W →+ ℤ for W a scheme proper over Spf A.
- `TauCeti.FormalScheme.eulerDegree_of` (simp): eulerDegree [E] = Σ_i (−1)^i length_A H^i(W, E).
- `TauCeti.FormalScheme.eulerDegree_eq_length_pushforward` (characterisation): eulerDegree = length_A ∘ π_* through K0Coh (Spec A/ϖ^n) ≃ ℤ.
- `TauCeti.FormalScheme.eulerDegree_closedPushforward` (compatibility): For a closed immersion W′ ⊆ W, eulerDegree W (i_* a) = eulerDegree W′ a.
- `TauCeti.FormalScheme.eulerDegree_ofSupported` (constructor): The degree of a coherent module on a formal X formally supported on W.
- `TauCeti.FormalScheme.eulerDegree_indep` (relation): Independent of the thickening Spec A/ϖ^n through which π factors.

**Unit tests.**

- `eulerDegree_torsion_module` (computation): For W = Spec A/ϖ^n, eulerDegree [O_W] = n (the degree of a torsion module over the discrete valuation ring).
- `eulerDegree_projectiveLine` (computation): For W = P¹_k, eulerDegree [O(m)] = m + 1.
- `eulerDegree_residue_extension` (computation): For W = Spec k′ with [k′ : k] = f, eulerDegree [O_W] = f.
- `eulerDegree_empty` (degenerate): For W = ∅, eulerDegree = 0.
- `eulerDegree_not_formal` (non-example): For W = Spf A (formal, not a scheme) H^0 = A has infinite length over A: the hypothesis that W be a scheme cannot be dropped.

**Uses.**

- Zhang 2021, (B.4), p. 973: the derived Euler–Poincaré characteristic is the degree of the derived intersection
- Zhang 2021, (3.7)–(3.8), p. 881: Int(g) is finite because ∆ ∩ g∆ is a proper scheme over Spf O_F̆
- Li–Zhang, Definition 2.4.2, p. 11: Int(L) := χ(N, ^LZ(L)) for L of rank n
- He–Li–Shi–Yang 2023, Lemma 2.11 (paper item PAPER-HE-LI-SHI-ETAL-23/9): Z(L) proper over Spf O_F̆ so Int(L) is finite

**Checks.**

- deg[O_{Spec A/ϖ^n}] = n.
- deg[O_{P¹_k}(m)] = m + 1 for P¹_k ⊂ Spf A over the residue field k.
- deg[O_{Spec k′}] = [k′ : k] for a finite extension k′ of the residue field.

**Sources.**

- ZHANG21, Appendix B.1, p. 973. For π : W → Spf A proper with W a scheme, the degree map K′_0(W) → ℤ sends [E] to the alternating sum of the lengths of R^iπ_*E, independent of the representative.
- LIZHANG22, §1.8, p. 9. The Euler–Poincaré characteristic χ(X, F) := Σ (−1)^{i+j} length_{O_F̆} H^i(X, H^j(F)) for a finite complex F, when the lengths are finite.

### The derived Euler–Poincaré pairing χ(X, F ⊗ᴸ G) (B.4)

**Target `SchemeKTheoryOperationsPartII:FK.4/derived-euler-pairing` (construction).** Let A be a complete discrete valuation ring, X a regular locally noetherian formal scheme of finite dimension with a noetherian exhaustion, and Y, Z ⊆ X closed formal subschemes such that W := Y ∩ Z is a scheme with a proper morphism π : W → Spf A. For coherent sheaves F on Y and G on Z, the Tor sheaves T_j := Tor_j^{O_X}(i_*F,i_*G) are annihilated by 𝒥_Y + 𝒥_Z, so are coherent O_W-modules. Define χ(X,F ⊗^L G) := Σ_{i,j}(−1)^{i+j} length_A H^i(W,T_j) = deg_W([F] ·^L [G]). This gives a symmetric biadditive pairing K′_0(Y) × K′_0(Z) → ℤ, and through h a pairing K_0^Y(X) × K_0^Z(X) → ℤ given by deg_W h(a ∪ b). It is computed on any noetherian open containing W. For merely formally supported sheaves, define the pairing of their dévissage classes in these groups; the displayed π_* formula does not directly apply to those sheaves. If X is over Spf A compatibly with π, the extension also equals the Euler characteristic of the ambient derived tensor on a proper nilpotent thickening of W. Write ⟨Y,Z⟩_X for the pairing of the structure sheaves. As a later application of FK.2/affine-filtration-product, on affine regular X of pure dimension n the Euler characteristic of a cup product of classes in F^{r_i}_ℚ with Σr_i ≥ n depends only on their Gr^{r_i} images, whenever the common support is a proper scheme.

**Named signature.** `TauCeti.FormalScheme.derivedEuler`.

**Hypotheses and conventions.**

- X regular (finitely many nonzero Tor sheaves).
- W = Y ∩ Z a scheme proper over Spf A; if W is only a formal scheme (e.g. Y = Z = V(t) in Spf ℤ_p⟦t⟧, W = Spf ℤ_p) the pairing is not defined.
- The cohomology formula takes F ∈ Coh Y and G ∈ Coh Z, not merely F ∈ Coh_Y(X), G ∈ Coh_Z(X). For the latter use dévissage. Ambient cohomology for power-annihilated sheaves additionally uses X → Spf A extending the given base map on W.

**Construction.**

1. For genuine O_Y- and O_Z-modules, both annihilator ideals act as zero on Tor: the action through either factor agrees. Thus T_j is a coherent O_W-module, with finite cohomology over A by FK.4/schemes-over-formal-base and uniform finite Tor amplitude by regularity and finite dimension.
2. Biadditivity from FK.1/tor-pairing and additivity of the degree; symmetry from Tor_comm.
3. Compatibility with ∪ is FK.1/tor-pairing (homologyClass_cup).
4. Locality: Tor sheaves and lengths of cohomology of sheaves supported in an open U ⊇ W are computed on U; the noetherian members containing W are cofinal (FK.2/noetherian-exhaustion-k-groups).
5. For sheaves killed only by powers, first use formal-supported dévissage and biadditivity. When an ambient A-structure is given, Tor is killed by a power of 𝒥_W and lives on some W_N = V(𝒥_W^N), a scheme proper over Spf A: W is a scheme and properness is invariant under nilpotent thickenings. Filtering by 𝒥_W gives equality of its cohomological Euler characteristic with the degree of its dévissage class.
6. For the affine graded-class application, changing one representative by F^{r_i+1} changes the cup product by F^{Σr_i+1}, which is zero because its index exceeds n. Apply deg_W h; no FK.4 result is an input to the earlier FK.2 theorem.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.1/tor-pairing`, `SchemeKTheoryOperationsPartII:FK.4/euler-degree`, `SchemeKTheoryOperationsPartII:FK.0/formal-tor-sheaves`, `SchemeKTheoryOperationsPartII:FK.1/homology-class-map`, `SchemeKTheoryOperationsPartII:FK.1/supported-cup-product`, `SchemeKTheoryOperationsPartII:FK.2/noetherian-exhaustion-k-groups`, `SchemeKTheoryOperationsPartII:FK.0/regular-and-cohen-macaulay-formal-schemes`, `SchemeKTheoryOperationsPartII:FK.2/affine-filtration-product`, `SchemeKTheoryOperationsPartII:FK.4/schemes-over-formal-base`, `SchemeKTheoryOperationsPartII:FK.1/formal-supported-devissage`.

**API.**

- `TauCeti.FormalScheme.derivedEuler` (data): derivedEuler X Y Z : K0Coh Y →+ K0Coh Z →+ ℤ when Y ⊓ Z is a scheme proper over Spf A.
- `TauCeti.FormalScheme.derivedEuler_of` (simp): For F ∈ Coh Y and G ∈ Coh Z, derivedEuler [F] [G] = Σ_{i,j}(−1)^{i+j} length_A H^i(W, Tor_j^{O_X}(i_*F,i_*G)); each Tor is an O_W-module.
- `TauCeti.FormalScheme.derivedEuler_eq_eulerDegree` (characterisation): derivedEuler a b = eulerDegree (torPairing a b).
- `TauCeti.FormalScheme.derivedEuler_comm` (relation): derivedEuler a b = derivedEuler b a.
- `TauCeti.FormalScheme.derivedEuler_cup` (compatibility): For a ∈ K0Supp X Y, b ∈ K0Supp X Z: eulerDegree (homologyClass (a ∪ b)) = derivedEuler (homologyClass a) (homologyClass b).
- `TauCeti.FormalScheme.derivedEuler_restrict` (compatibility): Computed on any noetherian open containing Y ⊓ Z.
- `TauCeti.FormalScheme.derivedEuler_transverse` (relation): If Tor j (O_Y) (O_Z) = 0 for j > 0 then ⟨Y, Z⟩ = eulerDegree [O_{Y ⊓ Z}].
- `TauCeti.FormalScheme.derivedEuler_ofSupported` (compatibility): For sheaves formally supported on Y and Z, evaluate on their dévissage classes. If X → Spf A extends π, this is the ambient cohomological Euler characteristic on a proper nilpotent thickening of W.

**Unit tests.**

- `derivedEuler_transverse_power` (computation): On Spf ℤ_p⟦t⟧ over ℤ_p, ⟨V(t), V(t − p^n)⟩ = n.
- `derivedEuler_excess_point_divisor` (computation): On Spf ℤ_p⟦t⟧, ⟨V(p, t), V(t)⟩ = 0 although Tor_1 ≅ F_p ≠ 0 (excess intersection retaining Tor).
- `derivedEuler_structureSheaf` (degenerate): For Z = X, derivedEuler [F] [O_X] = eulerDegree [F].
- `derivedEuler_not_scheme` (non-example): On Spf ℤ_p⟦t⟧, Y = Z = V(t) gives Y ∩ Z = Spf ℤ_p, not a scheme; the lengths are infinite and the pairing is undefined, so the scheme hypothesis on Y ∩ Z is needed.
- `derivedEuler_power_support` (non-example): On X = Spf A and W = Spec k = V(ϖ), F = A/ϖ² is formally supported on W but is not an O_W-module. With G = O_X, its extended Euler degree is 2, computed on Spec(A/ϖ²) or by dévissage; applying π_* to F as an O_W-module is ill-typed.

**Uses.**

- Zhang 2021, (3.7)–(3.8), p. 881: Int(g) = χ(N_{n−1,n}, O_∆ ⊗^L O_{g∆})
- Zhang 2021, Proposition 5.2, p. 896: Int(g, u) = χ(N_n, LN^g_n ∩^L Z(u)) is locally constant in u
- Li–Zhang, Definition 2.4.2, p. 11: Int(L) = χ(N, ^LZ(L))
- Li–Zhang, proof of Theorem 10.5.1, p. 71: Int′(L) computed on a finite flat cover through the projection formula
- He–Li–Shi–Yang 2023, Definition 2.10 (paper item PAPER-HE-LI-SHI-ETAL-23/9): Int(L) = χ(N, ^𝕃Z(L))

**Checks.**

- X = Spf ℤ_p⟦t⟧ over A = ℤ_p: ⟨V(t), V(t − p^n)⟩ = n.
- X = Spf ℤ_p⟦t⟧, Y = V(p, t), Z = V(t): Tor_0 ≅ Tor_1 ≅ F_p and the pairing is 1 − 1 = 0, an excess intersection whose Tor_1 survives.

**Sources.**

- ZHANG21, (B.4)–(B.5), p. 973. For X regular with closed formal subschemes Y, Z whose intersection is a scheme proper over Spf A, the derived Euler–Poincaré characteristic is the alternating sum over i, j of the lengths of R^iπ_* of the Tor_j sheaves, giving a pairing K_0^Y(X) × K_0^Z(X) → ℤ.
- ZHANG21, (3.7)–(3.8), p. 881; Proposition 5.2, pp. 896–897. Int(g) and Int(g, u) are defined as such derived Euler–Poincaré characteristics on the Rapoport–Zink spaces.
- LIZHANG22, §1.8, p. 9; Definition 2.4.2, p. 11. χ(X, F) of a finite complex and Int(L) = χ(N, O_{Z(x_1)} ⊗^L ⋯ ⊗^L O_{Z(x_n)}).

### Functoriality and base change of the Euler degree

**Target `SchemeKTheoryOperationsPartII:FK.4/euler-degree-base-change` (theorem).** (a) For a proper morphism g : W_1 → W_2 of schemes proper over Spf A, deg_{W_2}(g_*a) = deg_{W_1}(a) for a ∈ K′_0(W_1). (b) Let A → A′ be a finite extension of complete discrete valuation rings with ramification index e and residue degree f. If W is a scheme proper over Spf A′, hence over Spf A, then deg_{W/A} = f · deg_{W/A′}. (c) More generally let A → A′ be any flat local map of complete discrete valuation rings with ϖ_A A′ = (ϖ_{A′}^e), allowing an infinite residue-field extension. If W is a scheme proper over Spf A and W′ := W ×_{Spf A} Spf A′ (a scheme proper over Spf A′), then deg_{W′/A′}(a_{A′}) = e · deg_{W/A}(a), where a_{A′} is the flat pullback of a. In particular unramified extensions such as O_F → O_F̆ multiply degrees by 1 under base change.

**Hypotheses and conventions.**

- Part (b) assumes a finite extension of complete discrete valuation rings, with finite residue degree f. Part (c) only assumes a flat local map with finite ramification index e; finiteness of A′ over A is not required.

**Proof outline.**

1. (a) Leray: π_{W_1*} = π_{W_2*} ∘ g_* on K′_0 (SchemeKTheoryOperations:S.2/g-theory-proper-pushforward with functoriality of pushforward).
2. (b) For a finite-length A′-module M, length_A M = f · length_{A′} M, since the residue field of A′ has length f over A.
3. (c) Flat base change of cohomology (Stacks 02KH) gives H^i(W′, E ⊗_A A′) = H^i(W, E) ⊗_A A′, and length_{A′}(M ⊗_A A′) = e · length_A M because A′ ⊗_A k = A′/ϖ_A A′ has length e over A′.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.4/euler-degree`, `SchemeKTheoryOperations:S.2/g-theory-proper-pushforward`, `SchemeKTheoryOperations:S.2/k-theory-base-change`, `mathlib:Module.length`.

**Checks.**

- W = Spec k: over A′ = A[ϖ^{1/2}] (e = 2, f = 1), W′ = Spec(A′/ϖA′) has degree 2 = e · 1.
- W = Spec k′ with [k′ : k] = f regarded over A has degree f, over A′ unramified with residue field k′ degree 1.
- For A′ = the completion of the maximal unramified extension of A, e = 1 and base change preserves Euler degree; part (b) does not assert restriction-of-scalars finiteness for this infinite extension.

**Sources.**

- STACKS, Tag 02KH (Lemma 30.5.2). Flat base change: for a flat base change of a quasi-compact quasi-separated morphism, cohomology of the pulled-back quasi-coherent sheaf is the base change of cohomology.
- ZHANG21, Appendix B.1, p. 973. The degree of a class on W proper over Spf A is an alternating sum of lengths over A, independent of the representative; its behaviour under change of the discrete valuation ring is the bookkeeping recorded here.

### Pairing with zero-dimensional classes: length times generic rank

**Target `SchemeKTheoryOperationsPartII:FK.4/zero-dimensional-pairing` (theorem).** Let A be a complete discrete valuation ring with residue field k, X a regular locally noetherian formal scheme over Spf A, F a coherent O_X-module formally supported on a zero-dimensional scheme W_F proper over Spf A (so F has finite length and is supported at finitely many closed points x), and G any coherent O_X-module. Then χ(X, F ⊗^L G) = Σ_x length_{O_{X,x}}(F_x) · [k(x) : k] · rk(G_x), where rk(G_x) is the rank of G_x over the domain O_{X,x} (the alternating sum of the ranks in a finite free resolution). In particular χ(X, F ⊗^L G) = 0 whenever G is formally supported in codimension ≥ 1 (for example G = O_D for an effective Cartier divisor D), and χ(X, F ⊗^L ·) on K_0^Z(X) factors through Gr^0. This is the case 'some r_i = dim X' of (B.3), proved without Adams operations.

**Hypotheses and conventions.**

- X regular, so stalks are regular local domains of finite global dimension.
- F of finite length at closed points with residue fields finite over k (automatic for W_F proper over Spf A).

**Proof outline.**

1. Both sides are additive in F, so by a composition series of each F_x reduce to F = k(x) at one closed point x.
2. Since Tor sheaves of a module supported at x are computed on the stalk, χ = [k(x) : k] · Σ_j (−1)^j dim_{k(x)} Tor_j^{O_{X,x}}(k(x), G_x).
3. With a minimal finite free resolution of G_x (Stacks 00O7), dim Tor_j(k(x), G_x) is the j-th Betti number, and the alternating sum of the ranks of a finite free resolution is the rank of G_x at the generic point of the domain O_{X,x} (Stacks 00NP).
4. If G is formally supported in codimension ≥ 1, G_x is torsion and its rank is 0; for Z with codim_X Z ≥ 1, every class of F^1K_0^Z(X) is a sum of such.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.4/derived-euler-pairing`, `SchemeKTheoryOperationsPartII:FK.4/euler-degree`, `SchemeKTheoryOperationsPartII:FK.0/formal-tor-sheaves`, `SchemeKTheoryOperationsPartII:FK.0/regular-and-cohen-macaulay-formal-schemes`, `SchemeKTheoryOperationsPartII:FK.2/codimension-filtration`, `mathlib:IsRegularLocalRing`, `mathlib:Module.length`.

**Checks.**

- On Spf ℤ_p⟦t⟧: ⟨V(p, t), V(t)⟩ = 1 · 1 · rk(O/(t)) = 0, and ⟨V(p, t), X⟩ = 1.
- For F = k(x) and G = O_X^r, χ = r[k(x) : k].

**Sources.**

- LIZHANG22, §1.8, p. 9. For formal X the (B.3) assertion holds trivially when one of the r_i equals dim X, and this special case is used repeatedly.
- ZHANG21, proof of Proposition 5.2, p. 897. Since Z(u) is a Cartier divisor, the Euler–Poincaré characteristic of Z ∩^L Z(u) vanishes for a noetherian zero-dimensional subscheme Z.
- STACKS, Tags 00O7 (Proposition 10.110.1), 00NP (Lemma 10.106.2). Finite modules over a regular local ring have finite free resolutions, and regular local rings are domains.

### Pairing with an effective Cartier divisor

**Target `SchemeKTheoryOperationsPartII:FK.4/cartier-divisor-pairing` (theorem).** Let A, X be as in FK.4/derived-euler-pairing, D ⊆ X an effective Cartier divisor, and F a coherent O_X-module formally supported on a scheme W proper over Spf A. Then χ(X, F ⊗^L O_D) = deg_W[F] − deg_W[F ⊗ O_X(−D)], with no hypothesis on the position of D relative to W. If moreover ϖF = 0 and F = O_C for a proper curve C over k (a closed formal subscheme which is a proper scheme of dimension ≤ 1 over the residue field), then χ(X, O_C ⊗^L O_D) = deg_C(O_X(D)|_C), the degree of an invertible module on a proper curve (χ(C, L) − χ(C, O_C)), whether or not C ⊆ D.

**Hypotheses and conventions.**

- X regular (any X with D Cartier suffices for the first formula); W a scheme proper over Spf A.

**Proof outline.**

1. O_D has the locally free resolution 0 → O_X(−D) → O_X → O_D → 0 (FK.0/formal-regular-immersion), so F ⊗^L O_D is represented by [F(−D) → F] and χ(F ⊗^L O_D) = deg[F] − deg[F(−D)].
2. For ϖO_C = 0, lengths over A are dimensions over k, and deg_W[O_C] − deg_W[O_C(−D)] = χ(C, O_C) − χ(C, L^{-1}) with L = O_X(D)|_C; by the definition of the degree and the rank-one tensor formula on arbitrary proper schemes of dimension at most one (SchemeAndStackFoundations:SF.3/vector-bundle-degree; Stacks 0AYR, 0AYX), deg L^{-1} = −deg L, the difference is deg L.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.4/derived-euler-pairing`, `SchemeKTheoryOperationsPartII:FK.4/euler-degree`, `SchemeKTheoryOperationsPartII:FK.0/formal-regular-immersion`, `SchemeKTheoryOperationsPartII:FK.1/tor-pairing`, `SchemeAndStackFoundations:SF.3/vector-bundle-degree`.

**Checks.**

- If D meets the proper curve C ⊄ D transversally in r k-rational points, the pairing is r.
- Let X be the completion of the total space of O(a) over P¹_{ℤ_p} along the zero section of the special fibre, D the zero section (a Cartier divisor) and C = P¹_{F_p} ⊆ D: O_X(D)|_C ≅ O(a), so the pairing is a although C ⊆ D.

**Sources.**

- LIZHANG22, §1.8, p. 9; §2.4, p. 11. Kudla–Rapoport divisors Z(x) are Cartier divisors on N; intersection numbers with them are Euler–Poincaré characteristics of derived tensor products, and for vertical curves these reduce to degrees of the restricted line bundles.
- ZHANG21, proof of Proposition 5.2, pp. 897–898. Euler–Poincaré characteristics χ(N_n, C ∩^L Z(u)) with the Cartier divisor Z(u) are computed curve by curve.
- STACKS, Tags 0AYR (Definition 33.44.1), 0AYX (Lemma 33.44.7). Degree is χ(L) − χ(O) on a proper scheme of dimension at most one, and the rank-one tensor formula gives deg(L^{-1}) = −deg L, including nonreduced and singular curves.

### Proper pushforward on K′₀ of formal schemes and the projection formula

**Target `SchemeKTheoryOperationsPartII:FK.4/proper-pushforward-projection` (theorem).** Let p : X′ → X be a proper morphism of noetherian formal schemes (EGA III (3.4.1)). Then p_* : K′_0(X′) → K′_0(X), [F] ↦ Σ_q (−1)^q [R^qp_*F], is a well-defined homomorphism (the sum is finite), functorial for composition, compatible with closed pushforward and, for supports, with the Euler degree: if X′ and X are over Spf A, p respects these maps, Y′ ⊆ X′ is a scheme proper over Spf A and its closed image W = p(Y′) is also a scheme proper over Spf A, then deg_{p(Y′)}(p_*a) = deg_{Y′}(a). If X and X′ are regular of finite dimension, define Lp^* : K′_0(Y) → K′_0(p^{-1}Y), [F] ↦ Σ_j (−1)^j [Tor_j^{p^{-1}O_X}(p^{-1}F, O_{X′})]; then the projection formula p_*(Lp^*a ·^L b) = a ·^L p_*b holds in K′_0(Y ∩ p(Z′)) for a ∈ K′_0(Y), b ∈ K′_0(Z′). For p finite and flat of degree d and a supported on a zero-dimensional scheme, deg(p_*Lp^*a) = d · deg(a).

**Hypotheses and conventions.**

- p proper in EGA’s sense: adic, of finite type, with proper reductions. A proper reduced map alone is insufficient (source issue E3).
- Coherence of R^qp_* for proper morphisms of locally noetherian formal schemes is EGA III (3.4.2), requested from AdicSpacesPartII:F0.
- The projection formula needs the regularity of X (finite Tor dimension) to define Lp^*.
- Support degree identities use compatible A-structures and a proper scheme target support W containing p(Y′). For the projection formula, p_* of a supported coherent class is taken by supported dévissage; the result lies in K′_0(Y ∩ p(Z′)).

**Proof outline.**

1. Use the requested coherent higher-direct-image theorem EGA III₁ (3.4.2), and its inverse-limit comparison (3.4.3) with the Mittag–Leffler condition. To get a uniform finite cohomological bound, cover the noetherian target by finitely many affine formal opens. Over each, choose a finite affine formal cover of its proper preimage. Properness gives separatedness, so intersections are affine; affine coherent acyclicity and the finite Čech complex give a bound independent of F and of the reduction level. Take the maximum of these finite bounds. Additivity follows from the resulting bounded long exact sequence.
2. Functoriality follows from the bounded coherent Leray spectral sequence of the ringed-space derived pushforwards. For the degree identity on scheme supports use the compatible A-structures and FK.4/euler-degree-base-change (a), with supported dévissage as needed.
3. Use EnhancedDerivedSheaves:E1/projection-formula for the underlying ringed spaces, with F perfect on the regular finite-dimensional target: Rp_*(Lp^*F ⊗^L G) ≅ F ⊗^L Rp_*G. The comparison is a global derived morphism; its being an isomorphism can be checked locally using bounded finite free models for F. The finite global spectral-sequence Euler identities then give equality in the supported coherent K_0. Do not compare K_0 classes merely by restriction, and do not replace derived tensor over O_X by underived reductions modulo an ideal of definition.
4. Finite flat case: p_*O_{X′} is locally free of rank d, so locally near the finitely many points of the support p_*Lp^*a = a ⊗ p_*O_{X′} ≅ a^{⊕ d}.

**Inputs.** `SchemeKTheoryOperationsPartII:FK.1/coherent-grothendieck-group`, `SchemeKTheoryOperationsPartII:FK.1/tor-pairing`, `SchemeKTheoryOperationsPartII:FK.4/euler-degree-base-change`, `SchemeKTheoryOperationsPartII:FK.4/euler-degree`, `AdicSpacesPartII:F0/proper-formal-morphism`, `AdicSpacesPartII:F0`, `SchemeKTheoryOperations:S.6/product-pullback-compatibility`, `SchemeKTheoryOperations:S.2/g-theory-proper-pushforward`, `EnhancedDerivedSheaves:E1/projection-formula`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

**Checks.**

- p = the identity: p_* = id and Lp^* = id.
- The finite flat map Spf ℤ_p⟦s⟧ → Spf ℤ_p⟦t⟧, t ↦ s² (degree 2): for a = [F_p] at the closed point, deg p_*Lp^*a = deg[F_p⟦s⟧/(s²)] = 2.
- The map Spf k⟦t⟧ → Spec k has a proper reduced map (a point to a point), but its direct image of O has sections k⟦t⟧, not a finite k-module. It is not adic finite type and is outside this pushforward theorem.

**Sources.**

- EGA-III1, (3.4.1)–(3.4.3), pp. 119–120. For a proper morphism of locally noetherian formal schemes the higher direct images of a coherent module are coherent and are the inverse limits of the higher direct images of its reductions.
- LIZHANG22, §1.8, p. 9; proof on p. 71. The source describes pushforward by alternating coherent higher direct images and uses degree scaling for a finite flat map. Its reduced-map parenthetical in §1.8 omits EGA’s adic finite-type hypothesis; see E3. The theorem here keeps that hypothesis.

### Dependencies

`SchemeKTheoryOperationsPartII:FK.2`, `SchemeKTheoryOperationsPartII:FK.3`, `SchemeKTheoryOperations:S.2`, `SchemeKTheoryOperations:S.6`, `SchemeKTheoryOperations:S.7`, `AdicSpacesPartII:F0`, `EnhancedDerivedSheaves:E1`, `SchemeAndStackFoundations:SF.3`.

### Acceptance for the layer

- deg[O_{Spec A/ϖ^n}] = n; deg[O_{P¹_k}(m)] = m + 1.
- ⟨V(t), V(t − p^n)⟩ = n and ⟨V(p, t), V(t)⟩ = 0 with Tor_1 ≠ 0 on Spf ℤ_p⟦t⟧.
- The pairing is undefined for V(t) ∩ V(t) = Spf ℤ_p, which is not a scheme.
- Base change to a ramified quadratic extension doubles degrees; residue extension of degree f multiplies by f.

## Requests to other roadmaps

- `AdicSpacesPartII:F0` (upstream AdicSpacesPartIII F0, PR #813): For an adic proper finite-type morphism p : X′ → X of locally noetherian formal schemes and coherent F, every R^q p_* F is coherent, the system of higher direct images on reductions is Mittag–Leffler, and R^q p_*F ≅ lim_n R^q(p_n)_*(F_n) (EGA III₁ (3.4.2)–(3.4.3), pp. 119–120). Include H^q(Spf B,M^Δ)=0 for q>0 and finite B-modules M (the affine case), so finite affine Čech covers of separated noetherian formal schemes give a uniform finite cohomological bound. Owned upstream by AdicSpacesPartIII F0, PR #813; no existing atlas node supplies this general statement. No unsupported relative fibre-dimension bound is requested.

All five layers are planned at target level in the sense of PROTOCOL §0. FK.4 has the recorded supplier gap above and is not closed; no lemma-by-lemma expansion is required. Non-affine formal filtration multiplicativity remains outside the stated targets.

## The suggested Lean file

Neither pinned library has formal schemes, so `research/blueprint/suggested/SchemeKTheoryOperationsPartII.lean` states, over carriers that exist at the pins, the affine and local-algebra incarnations of the targets above: the affine predicate `TauCeti.FormalScheme.IsFormallySupportedModule` with `isFormallySupported_Spf_iff` and its tests; the stalk inputs `ringKrullDim_adicCompletion` and `isRegularLocalRing_adicCompletion_iff`; the local codimension formula `height_add_ringKrullDim_quotient`; the local form of Lemma B.2(i), `tor_quotient_ofList_isZero`, for Mathlib's `CategoryTheory.Tor` on `ModuleCat`; the affine model `TauCeti.FormalScheme.K0CohSpf` of K′₀(Spf A) as Tau Ceti's exact K₀ of finitely generated modules, with the computations for Spf ℤ_p and the node; the regular comparison for Y = X on Spf A through `TauCeti.cartanMap`, and its failure on the node; the local form of the zero-dimensional pairing, `eulerChar_tor_residueField_eq_rank`; and the Euler-degree computations `eulerDegree_torsion_module`, `length_restrictScalars_eq` and `length_baseChange_eq`. The formal-scheme declarations named in the API lists (`K0Coh`, `K0Supp`, `torPairing`, `eulerDegree`, `derivedEuler`, …) are targets of this document; they must restrict on Spf A to the statements of the file. The file elaborates at the pins with admitted proofs as its only warnings.

## Downstream consumers

- The Kudla–Rapoport Part II (`GrossZagierAndArithmeticHeightsPartII`, route UnitaryKudlaRapoportCycles): derived Kudla–Rapoport cycles in K₀^{Z(L)}(N), their graded classes, the horizontal/vertical splitting through Lemma B.2(ii), Int(L) as a (B.4) pairing, the zero-dimensional and Cartier pairings.
- The arithmetic fundamental lemma Part II (`EndoscopicTransferAndUnitaryTraceComparisonPartII`, Zhang's §§3–5): Int(g) and Int(g, u) as (B.4) pairings, Lemma B.2(i) in the proof of Lemma 4.4, the zero-dimensional pairing in the proof of Proposition 5.2.
- Li–Liu's arithmetic inner product formula and its K-theory classes of special cycles (paper items PAPER-LI-LIU-21/43, /75).
