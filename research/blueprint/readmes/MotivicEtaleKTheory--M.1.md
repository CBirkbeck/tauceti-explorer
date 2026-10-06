# Motivic and étale methods for arithmetic K-theory — M.1 to M.5c

This document is the reader for the blueprint packet
`research/blueprint/packets/MotivicEtaleKTheory--M.1.json` (job BP-MotivicEtaleKTheory--M.1).
It plans the first part of the roadmap, stages M.1, M.2, M.3, M.4, M.5, M.5a, M.5b and M.5c, at
target level; the second part (M.5d, M.6, M.6a, M.6b, M.7, M.8) is the sibling packet
`MotivicEtaleKTheory--M.5d.json`. Every node is a plan: nothing here is formalised, and every
implementation status is unchecked.

## Purpose and scope

The roadmap supplies the motivic and étale machinery that arithmetic K-theory consumes: the
coefficient modules and their cohomology (M.1), the arithmetic duality consequences at the real
places and in degree two (M.2), Tate's theorem relating K₂ to Galois cohomology (M.3), Bloch's
cycle complexes and motivic cohomology (M.4), and the norm residue theorem of Rost and
Voevodsky with the constructions of its proof (M.5, M.5a–M.5c). Consumers include
ArithmeticKTheory (N.4–N.8), K2SymbolsBrauer T.7, KTheoryFiniteLocalFields, HabiroNumberFields,
K3BlochGroups, SpecialValuesBirchTate, MotivesAndAlgebraicCycles MC.4, Polylogarithms P.5,
GeneralizedHeegnerCycles and PadicHodgeRegulators.

## Boundaries (RS-08 and the red-team findings)

The accepted restructuring RS-08 keeps all fourteen M stages. It narrows M.1 to the K-theory
realisation of arithmetic coefficients in imported carriers and M.2 to the comparison diagrams
and real-place bookkeeping; continuous and derived cohomology, Poitou–Tate, finiteness and cd
bounds are imported from ArithmeticGaloisDuality (R02.1–R02.4, D7) and ProfiniteCohomology
(Layers 10–11). RS-08 assigns to this roadmap the higher Chow complexes (M.4) and finite
correspondences, transfers and the effective motivic category (M.5a); MotivesAndAlgebraicCycles
owns Chow correspondences (MC.0), pure Chow motives (MC.1) and the packaged
mixed-motive/higher-Chow comparison (MC.4); SchemeAndStackFoundations SF.5 owns ordinary Chow
groups.

- RT-AREA-ktheory-1/2 (Beilinson–Lichtenbaum): the sibling packet plans it as
  `M.7/beilinson-lichtenbaum` (for X smooth over a field, Z/m(j) ≃ τ≤j Rα_*μ_m^{⊗j}) and
  `M.7/dedekind-motivic-comparison` for the Dedekind base. This part supplies its inputs: M.4's
  cycle complexes over fields and Dedekind bases, M.5a's transfer-compatible comparison input
  and étale comparison, and M.5c's mod-l theorem.
- RT-AREA-ktheory-1/8 (M.3 versus T.7): M.3 owns the Galois symbol for every field, its symbol
  formula and the cohomological Steinberg relation, and Tate's local, global and S-integer
  theorems as separate declarations; K2SymbolsBrauer T.7 imports them (its packet already says
  so).
- RT-AREA-ktheory-1/12 (norms and reciprocity for Nesterenko–Suslin–Totaro):
  `M.4/nesterenko-suslin-totaro` imports K2SymbolsBrauer `T.4/milnor-transfer-transitivity`
  (Kato's norm) and `T.4/weil-reciprocity` (Suslin's reciprocity in all degrees); the edge T.4
  → M.4 is proposed in the packet's `restructure`.
- RT-AREA-ktheory-1/14 (degree one and the Galois symbol in M.5): M.5's degree-one case is
  ProfiniteCohomology Layer 9's Kummer isomorphism; `M.5c/galois-symbol-all-degrees` is defined
  from it, Layer 12's cup product and `M.3/cohomological-steinberg`; the edges Layer 9 → M.5c
  and M.3 → M.5c are proposed.
- RT-AREA-ktheory-2/41 (edges out of S.6/S.7): M.4 uses no λ- or Adams operations; the packet
  proposes to replace SchemeKTheoryOperations:S.6 → M.4 by S.6 → M.6b. The Z.5/Z.6 edges
  concern other roadmaps and are unchanged by this part.

## Conventions

- F^s is a separable closure and G_F = Gal(F^s/F); Galois cohomology is continuous cohomology
  (Mathlib's continuousCohomology), agreeing in degrees ≤ 2 with Tau Ceti's explicit model.
- m is always invertible in the field or on the scheme; ℓ is a prime different from the
  characteristic. The twist μ_m^{⊗j} acts through χ_m^j; ℤ_ℓ(j)/ℓ^ν = μ_{ℓ^ν}^{⊗j}; ℚ/ℤ(j) is
  primewise.
- Motivic cohomology of M.4 is H^p(X, Z(q)) = CH^q(X, 2q − p) with the cohomological indexing
  Z(q) = z^q(−, •)[−2q]; M.5a's H^{p,q}(X, R) is Zariski hypercohomology of R(q) =
  C_*R_tr(𝔾_m^{∧q})[−q].
- The tame symbol and higher residues are K2SymbolsBrauer T.3's (∂^{tame}_v{u, π} = ū); the
  cohomological residue satisfies ∂_v(κ(π)) = 1 and ∂_v(κ(u) ∪ x) = −κ(ū) ∪ ∂_v(x), so ∂_v ∘
  h_F = −κ ∘ ∂^{tame}_v.
- Real places: α^n_S is restriction to the decomposition groups of the real places; H̃^n = ker
  α^n; H^n_+ is the cohomology of the fibre of α.

## Sources

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, Author draft dated 29
  August 2013 (printed page = PDF page - 8).
  https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf (SHA-256 a04f53c9393b2067…, read
  2026-10-06). Read: III.6.9-6.10 (norm residue symbol, Galois symbol, Proposition 6.10.3,
  Remark 6.10.4), printed pp. 241-243; VI.1.7 Tate twists and VI.2.1 the e-invariant, printed
  pp. 468-469; VI.4 Theorem 4.1, Corollary 4.1.1, Theorem 4.2, Remark 4.2.2, Edge map 4.3,
  printed pp. 480-481; VI.8 Classical data 8.1, (8.1.1), Theorem 8.2, Corollary 8.3, Example
  8.5 and Exercises 8.1-8.3, printed pp. 513-516; VI.9 Theorem 9.1, (9.2), Lemma 9.3, Theorem
  9.4, (9.6), Definition 9.6.1, (9.6.2), Lemma 9.6.3 and Exercises 9.1-9.2, printed pp.
  517-521, 525.
- John Tate, *Relations between K2 and Galois cohomology*, Inventiones mathematicae 36 (1976),
  257-274; GDZ scan LOG_0020 (PDF page = printed page - 255).
  https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf (SHA-256
  5d1ee68e3f9cc49b…, read 2026-10-06). Read: §1 introduction, pp. 257-258; §3 (3.1) Theorem,
  (3.2) Lemma, diagram (3.3), (3.4) Lemma, (3.5) Theorem and Corollary, pp. 262-265; §4
  (4.1)-(4.5) and the Corollary for locally compact fields, pp. 265-268; §5 (5.1) Theorem,
  (5.2) Lemma, sequence (5.3), (5.4) Theorem, pp. 268-270; §6 (6.1) Theorem, (6.2) Theorem,
  (6.3) Theorem, (6.4) Lemma, pp. 270-271.
- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*, Clay
  Mathematics Monographs 2, AMS/CMI 2006; CMI PDF (printed page = PDF page - 15).
  https://www.claymath.org/library/monographs/cmim02c.pdf (SHA-256 fb20ff2f30cefe0b…, read
  2026-10-06). Read: Lectures 1-6 (finite correspondences, presheaves with transfers, motivic
  complexes, weight one, Milnor K on the diagonal, étale sheaves with transfers); Lecture 10
  (étale motivic cohomology, Theorem 10.2); Lectures 13-14 (Nisnevich sheaves with transfers,
  Theorem 13.8, Definition 14.1, Theorem 14.11, Proposition 14.16); Lecture 16 (Theorem 16.25);
  Lectures 17 and 19 (Definition 17.1, Theorem 17.21, Theorem 19.1); Lecture 20 (Proposition
  20.1).
- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Annals of Mathematics 174
  (2011), 401-438; arXiv:0805.4430v2 (read). https://arxiv.org/pdf/0805.4430v2 (SHA-256
  9f4b7ed2624a8b41…, read 2026-10-06). Read: §1 introduction; §3 Lemma 3.1-Theorem 3.8; §4
  Lemma 4.1, Lemma 4.3, Theorem 4.4; §5 Lemmas 5.7-5.15, Theorem 5.16, Corollary 5.17,
  Proposition 5.18; §6 Theorem 6.1, Definition 6.2, Theorem 6.3, Lemmas 6.4-6.15, Proposition
  6.11, Theorems 6.16-6.18.
- Vladimir Voevodsky, *Reduced power operations in motivic cohomology*, Publications
  Mathématiques de l'IHÉS 98 (2003), 1-57; arXiv:math/0107109v1 (read).
  https://arxiv.org/pdf/math/0107109v1 (SHA-256 a47880bd5aaf51b8…, read 2026-10-06). Read: §6
  Theorems 6.10, 6.14, 6.16; §9 Theorems 9.3-9.4, Lemmas 9.5, 9.7, 9.8, Proposition 9.6; §10
  Adem relations; §13 Milnor operations.
- Vladimir Voevodsky, *Cancellation theorem*, Documenta Mathematica, Extra Volume Suslin
  (2010), 671-685; arXiv:math/0202012v1 (read). https://arxiv.org/pdf/math/0202012v1 (SHA-256
  834de6dc40560395…, read 2026-10-06). Read: §1 introduction and main theorem; §4 proof of the
  cancellation theorem.
- Burt Totaro, *Milnor K-theory is the simplest part of algebraic K-theory*, K-Theory 6 (1992),
  177-189 (author's scan). https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf
  (SHA-256 3447b12c9108d375…, read 2026-10-06). Read: §1 cubical higher Chow groups and
  products; §2 statement of Theorem 1; §§3-4 the maps K^M_n(F) -> CH^n(F,n) and back, using
  norms and Weil reciprocity.
- Thomas Geisser, *Motivic cohomology over Dedekind rings*, Mathematische Zeitschrift 248
  (2004), 773-794 (author's copy). https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf (SHA-256
  88b92df6124b0e3a…, read 2026-10-06). Read: §1 Theorems 1.1-1.3 and notation; §3 Theorem 3.2
  and Corollary 3.3 (localization); §4 Theorem 4.2 and Corollary 4.3 (Gersten).
- Markus Spitzweck, *A commutative P^1-spectrum representing motivic cohomology over Dedekind
  domains*, Mémoires de la SMF 157 (2018); arXiv:1207.4078v3 (read).
  https://arxiv.org/pdf/1207.4078v3 (SHA-256 7da11119650a216f…, read 2026-10-06). Read:
  Introduction (Bloch–Levine cycle complexes over a Dedekind domain, Levine's moving lemma); §2
  cycle complexes M_X(r), flat pullback.
- Christian Haesemeyer, Charles Weibel, *Norm varieties and the chain lemma (after Markus
  Rost)*, Algebraic Topology, Abel Symposia 4 (2009), 95-130 (author's copy).
  https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf (SHA-256
  355cc3d96da367fa…, read 2026-10-06). Read: Introduction: Theorem 0.1 (Chain Lemma),
  Definition 0.2, Theorem 0.3 (Norm Principle), Definitions 0.4-0.5, Theorem 0.7.
- Jürgen Neukirch, Alexander Schmidt, Kay Wingberg, *Cohomology of Number Fields*, Second
  edition, corrected electronic version 2.3 (May 2020).
  https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf (SHA-256 abbb7cdefc9ecb33…,
  read 2026-10-06). Read: II §7 (2.7.5)-(2.7.6) continuous cohomology of inverse limits; VIII
  §6 (8.6.10) Poitou-Tate sequence and its proof.
- James S. Milne, *Arithmetic Duality Theorems*, Second edition (2006), electronic version.
  https://www.jmilne.org/math/Books/ADTnot.pdf (SHA-256 2c6195ec76a974f3…, read 2026-10-06).
  Read: I §4 Theorem 4.10 and the remarks on scd_p(G_S); II §2 Proposition 2.9 (étale
  cohomology of U versus Galois cohomology of G_S).

## M.1 — Coefficient modules and continuous arithmetic cohomology

M.1 makes the coefficients of arithmetic K-theory precise as objects of the imported continuous
carriers (RS-08 narrows M.1 to exactly this). The finite twists μ_m^{⊗j} are built on Tau
Ceti's KummerCoeff with the action through the mod-m cyclotomic character; the ℓ-adic twists
ℤ_ℓ(j), ℚ_ℓ(j), ℚ_ℓ/ℤ_ℓ(j) come with their coefficient sequences, and the correct inclusion
μ_{ℓ^a}^{⊗j} → μ_{ℓ^{a+b}}^{⊗j} is multiplication by ℓ^b on ℤ_ℓ(j), not the factorwise
inclusion. ℚ/ℤ(j) is the primewise sum of the ℓ-adic divisible twists, never the tensor power
of ℚ/ℤ. Continuous and derived cohomology, Mittag-Leffler and Milnor sequences are imported
from ArithmeticGaloisDuality R02.1 and D7; the all-degree discrete theory, cup products and
Kummer interface from ProfiniteCohomology Layers 3, 4, 9, 10 and 12. On the scheme side the
layer supplies the étale twists, continuous étale cohomology as a derived limit, the field and
S-integer comparisons with Galois cohomology, the étale Kummer sequences, henselian rigidity
and the localization (Gysin) sequence of a Dedekind scheme with its residue maps. The higher
Chern and regulator maps out of K-theory are M.8's (sibling packet).

**Declarations.** `finite-tate-twist`, `adic-tate-twist`, `primewise-q-mod-z-twist`, `twisted-cohomology-ring`, `continuous-limit-comparison`, `etale-twist-sheaf`, `field-etale-galois-comparison`, `s-integer-galois-comparison`, `etale-kummer-sequences`, `henselian-residue-comparison`, `localization-gysin-sequence`.

**Planets.** Finite Tate twists, ℓ-adic Tate twists, Continuous ℓ-adic cohomology, Étale–Galois comparison, Étale localization sequence.

**Dependencies inside the roadmap.** none outside the stage.

**Dependencies on other roadmaps.** `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `ArithmeticGaloisDuality:R02.1/mittag-leffler`, `ArithmeticGaloisDuality:R02.1/rationalization`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `ArithmeticGaloisDuality:R02.3/restricted-ramification-group`, `ArithmeticGaloisDuality:R02.4/global-finiteness`, `ClassicalAdicEtaleCohomology:H1:henselian/affine-henselian-comparison-3-2-5`, `EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-3-the-comparison-isomorphisms`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-4-the-finite-quotient-colimit-description`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.

**Coverage.** planned. Refinements: Read Jannsen, 'Continuous étale cohomology' (Math. Ann. 280, 1988) and cite it beside the K-book for the derived-limit model of etale-twist-sheaf. Lemma-level split of twisted-cohomology-ring into the cup-product, restriction and corestriction declarations once ProfiniteCohomology Layer 12 is built.

### `M.1/finite-tate-twist` — Finite Tate twists of the roots of unity ★

*Kind:* construction. *Planet:* Finite Tate twists. *Library:* `TauCeti/NumberTheory/GaloisCohomology/TateTwist`, namespace `TauCeti.TateTwist`.

Let F be a field with separable closure F^s and absolute Galois group G_F, let m ≥ 1 be an
integer invertible in F, and let j ∈ ℤ. The finite Tate twist μ_m^{⊗j} is the discrete
G_F-module defined as follows. For j = 0 it is ℤ/m with trivial action. For j = 1 it is Tau
Ceti's KummerCoeff F m, the group μ_m(F^s) written additively, with its discrete topology. For
j ≥ 2 it is the j-fold tensor product over ℤ/m of μ_m with the diagonal action. For j < 0 it is
Hom_{ℤ/m}(μ_m^{⊗(−j)}, ℤ/m) with g·φ = φ ∘ g^{−1}. In every case the underlying group is free
of rank one over ℤ/m, and g ∈ G_F acts as multiplication by χ_m(g)^j, where χ_m : G_F → (ℤ/m)^×
is the mod-m cyclotomic character (Mathlib's modularCyclotomicCharacter on the automorphisms of
F^s). The action factors through Gal(F(μ_m)/F), so it is continuous for the discrete topology.
The construction comes with equivariant ℤ/m-bilinear pairings μ_m^{⊗i} × μ_m^{⊗j} →
μ_m^{⊗(i+j)} for all i, j ∈ ℤ, which are associative and graded-symmetric through the swap
isomorphism.

**Hypotheses.**

- F a field; m ≥ 1 with m invertible in F; j ∈ ℤ.
- Twists are taken over ℤ/m; no primitive m-th root of unity is assumed to lie in F.

**Construction and proof.**

1. Take μ_m = KummerCoeff F m (the m-th roots of unity in the separable closure, discrete) and
   form tensor powers over ℤ/m with the diagonal action; for negative j use the ℤ/m-dual with
   the contragredient action (Tate §3 defines the ℓ-adic analogue inductively by Z_l(m+1) =
   Z_l(m) ⊗ Z_l(1) and Z_l(m−1) = Hom(Z_l(1), Z_l(m))).
2. Show the underlying group is free of rank one over ℤ/m: μ_m(F^s) is cyclic of order m
   because m is invertible in F, and tensor powers and duals of a free rank-one module are free
   of rank one.
3. Compute the action on a generator ζ^{⊗j}: g(ζ^{⊗j}) = (ζ^{χ_m(g)})^{⊗j} = χ_m(g)^j ζ^{⊗j};
   it factors through the finite quotient Gal(F(μ_m)/F), hence is continuous for the discrete
   topology.
4. Define the pairings by concatenation of tensors (and evaluation for negative twists), check
   equivariance on generators, and record associativity and the swap symmetry.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.TateTwist.finite` | constructor | For a field F, m invertible in F and j ∈ ℤ, the discrete G_F-module μ_m^{⊗j}. |
| `TauCeti.TateTwist.finite_one` | equivalence | μ_m^{⊗1} ≅ KummerCoeff F m as discrete G_F-modules. |
| `TauCeti.TateTwist.finite_zero` | equivalence | μ_m^{⊗0} ≅ ℤ/m with the trivial action. |
| `TauCeti.TateTwist.smul_eq_cyclotomic` | characterisation | g • x = χ_m(g)^j • x for g ∈ G_F and x ∈ μ_m^{⊗j}. |
| `TauCeti.TateTwist.card_finite` | simp | The underlying group of μ_m^{⊗j} has exactly m elements and is free of rank one over ℤ/m. |
| `TauCeti.TateTwist.pairing` | constructor | The equivariant ℤ/m-bilinear pairing μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)}. |
| `TauCeti.TateTwist.pairing_assoc` | relation | The pairings are associative under the canonical identifications of iterated twists. |
| `TauCeti.TateTwist.pairing_comm` | relation | pairing(x, y) corresponds to pairing(y, x) under the swap isomorphism μ_m^{⊗(i+j)} ≅ μ_m^{⊗(j+i)}; on μ_m ⊗ μ_m the swap is the identity of the underlying cyclic group. |
| `TauCeti.TateTwist.trivialise` | equivalence | If ζ ∈ F is a primitive m-th root of unity, 1 ↦ ζ^{⊗j} is a G_F-equivariant isomorphism ℤ/m ≅ μ_m^{⊗j} (the change-of-root rule itself is K2SymbolsBrauer T.7's). |
| `TauCeti.TateTwist.res` | functoriality | For a field extension E/F with chosen embedding of separable closures, the restriction of μ_m^{⊗j}(F) along G_E → G_F is μ_m^{⊗j}(E); identity and composition laws hold. |
| `TauCeti.TateTwist.reduce` | functoriality | For m ∣ m', the reduction μ_{m'}^{⊗j} → μ_m^{⊗j}, ζ ↦ ζ^{m'/m} on each factor, is a surjective equivariant map; reductions compose. |

**Used by.**

- Kbook2013 III.6.10.3 (Galois symbol): μ_m^{⊗2} is the target H²(F, μ_m^{⊗2}) of the Galois
  symbol built in M.3.
- K2SymbolsBrauer:T.7/twisted-roots-of-unity and T.7/symbol-formula: T.7 trivialises μ_m^{⊗j}
  by a primitive root and lands explicitCup11 of two Kummer classes in H²(F, μ_m^{⊗2}); it
  requests exactly these twists with their pairings.
- ArithmeticKTheory:N.4 and N.6, HabiroNumberFields:HB.1, KTheoryFiniteLocalFields:L.6:
  Coefficients μ_m^{⊗j} of the étale cohomology groups that compute K-groups with finite
  coefficients.
- MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees: The graded target ⊕_j H^j(F, μ_m^{⊗j}) of
  the all-degree norm residue map uses the pairings μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)}.

**Unit tests.**

- `TateTwist.test_zero_trivial` (degenerate): For j = 0, every g ∈ G_F acts trivially on
  μ_m^{⊗0} = ℤ/m.
- `TateTwist.test_m_one` (degenerate): For m = 1, μ_1^{⊗j} = 0 for every j.
- `TateTwist.test_kummer_coeff` (compatibility): μ_m^{⊗1} is TauCeti.KummerCoeff F m, with the
  same action and discrete topology.
- `TateTwist.test_rat_three_square` (computation): For F = ℚ and m = 3, complex conjugation
  acts trivially on μ_3^{⊗2} and by −1 on μ_3^{⊗1}.
- `TateTwist.test_not_trivial_without_root` (non-example): For F = ℚ and m = 4, μ_4^{⊗1} and
  ℤ/4 (trivial action) are not isomorphic G_ℚ-modules, since complex conjugation acts by −1 on
  μ_4.

**Acceptance.**

- For F = ℚ and m = 3, complex conjugation acts on μ_3 by −1 and on μ_3^{⊗2} trivially; the
  computation goes through χ_3(c) = −1 and (−1)^2 = 1.
- The j = 1 twist is literally Tau Ceti's KummerCoeff F m, so Tau Ceti's kummerMap takes values
  in H¹(F, μ_m^{⊗1}).

**Depends on.** `tauceti:TauCeti.KummerCoeff`, `mathlib:modularCyclotomicCharacter`, `mathlib:rootsOfUnity`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, III.6.10 (Sketch of
  Galois cohomology), printed p. 242 (PDF p. 250): “We can also make the tensor product of two
  discrete modules into a discrete module, with G acting diagonally.” — The K-book defines
  μ_m^{⊗2} as the diagonal tensor square and notes Z/m, μ_m, μ_m^{⊗2} share an underlying
  group; the node extends this to all j ∈ ℤ.
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, III.6.10, printed p.
  242 (PDF p. 250): “have the same underlying abelian group, but are isomorphic GF -modules
  only when µm ⊂ F” — Source of the non-example test: the twists must not be identified with
  ℤ/m without a root of unity in F.

### `M.1/adic-tate-twist` — ℓ-adic Tate twists and their coefficient sequences ★

*Kind:* construction. *Planet:* ℓ-adic Tate twists. *Library:* `TauCeti/NumberTheory/GaloisCohomology/TateTwist`, namespace `TauCeti.TateTwist`.

Let F be a field, ℓ a prime different from the characteristic of F, and j ∈ ℤ. Define the
compact G_F-module ℤ_ℓ(1) = lim_ν μ_{ℓ^ν} (transition maps ζ ↦ ζ^ℓ), a free ℤ_ℓ-module of rank
one on which g ∈ G_F acts by Mathlib's cyclotomicCharacter ℓ (g) ∈ ℤ_ℓ^×; ℤ_ℓ(j) = ℤ_ℓ(1)^{⊗j}
for j ≥ 0 and ℤ_ℓ(j) = Hom_{ℤ_ℓ}(ℤ_ℓ(−j), ℤ_ℓ) for j < 0, with the ℓ-adic topology; ℚ_ℓ(j) =
ℤ_ℓ(j) ⊗ ℚ_ℓ; and the discrete module ℚ_ℓ/ℤ_ℓ(j) = colim_ν μ_{ℓ^ν}^{⊗j}. The canonical
identifications are ℤ_ℓ(j)/ℓ^ν ≅ μ_{ℓ^ν}^{⊗j}, ℚ_ℓ/ℤ_ℓ(j) ≅ ℚ_ℓ(j)/ℤ_ℓ(j) and μ_{ℓ^ν}^{⊗j} ≅
ℚ_ℓ/ℤ_ℓ(j)[ℓ^ν]. The coefficient sequences 0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j} → 0, 0 →
ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0, 0 → μ_{ℓ^ν}^{⊗j} → ℚ_ℓ/ℤ_ℓ(j) --ℓ^ν--> ℚ_ℓ/ℤ_ℓ(j) → 0 and 0 →
μ_{ℓ^a}^{⊗j} --ι--> μ_{ℓ^{a+b}}^{⊗j} → μ_{ℓ^b}^{⊗j} → 0 are exact, where ι is the map induced
by multiplication by ℓ^b on ℤ_ℓ(j), ℤ_ℓ(j)/ℓ^a → ℤ_ℓ(j)/ℓ^{a+b}. For |j| ≥ 2 this ι is not the
map induced factorwise by the inclusions μ_{ℓ^a} ⊂ μ_{ℓ^{a+b}}.

**Hypotheses.**

- F a field, ℓ a prime with ℓ ≠ char F, j ∈ ℤ, ν, a, b ≥ 1.
- ℤ_ℓ(j) and ℚ_ℓ(j) carry the ℓ-adic topology; ℚ_ℓ/ℤ_ℓ(j) and μ_{ℓ^ν}^{⊗j} are discrete.

**Construction and proof.**

1. Build ℤ_ℓ(1) as the inverse limit of finite-tate-twist for m = ℓ^ν along the ℓ-th power
   maps; the limit of free rank-one ℤ/ℓ^ν-modules with surjective transitions is free of rank
   one over ℤ_ℓ (Tate §3: 'Z_l(1) = lim (μ_{l^i}) is a free Z_l-module of rank 1').
2. Identify the action with cyclotomicCharacter ℓ: both are the limit of the mod-ℓ^ν
   characters.
3. Define the other twists by tensor powers and duals as in Tate §3 and check the quotient
   identifications on a generator.
4. Exactness of the coefficient sequences is exactness for free rank-one modules over ℤ_ℓ,
   ℤ/ℓ^ν; the map ι is multiplication by ℓ^b, and on generators the factorwise inclusion sends
   ζ_{ℓ^a}^{⊗j} to ℓ^{bj} times a generator, which is ℓ^{b(j−1)}·ι(generator).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.TateTwist.adic` | constructor | The compact G_F-module ℤ_ℓ(j), free of rank one over ℤ_ℓ. |
| `TauCeti.TateTwist.adic_smul` | characterisation | g • x = (cyclotomicCharacter ℓ g)^j • x on ℤ_ℓ(j). |
| `TauCeti.TateTwist.adicQuotientEquiv` | equivalence | ℤ_ℓ(j)/ℓ^ν ≅ μ_{ℓ^ν}^{⊗j} as discrete G_F-modules, compatibly in ν. |
| `TauCeti.TateTwist.adicLimitEquiv` | equivalence | ℤ_ℓ(j) ≅ lim_ν μ_{ℓ^ν}^{⊗j} as topological G_F-modules. |
| `TauCeti.TateTwist.rational` | constructor | ℚ_ℓ(j) = ℤ_ℓ(j) ⊗_{ℤ_ℓ} ℚ_ℓ with the ℓ-adic topology. |
| `TauCeti.TateTwist.divisible` | constructor | ℚ_ℓ/ℤ_ℓ(j) = colim_ν μ_{ℓ^ν}^{⊗j}, discrete, with ℚ_ℓ/ℤ_ℓ(j)[ℓ^ν] = μ_{ℓ^ν}^{⊗j}. |
| `TauCeti.TateTwist.coeffInclusion` | data | ι : μ_{ℓ^a}^{⊗j} → μ_{ℓ^{a+b}}^{⊗j}, induced by multiplication by ℓ^b on ℤ_ℓ(j); it is injective with cokernel μ_{ℓ^b}^{⊗j}. |
| `TauCeti.TateTwist.shortExact_mul` | relation | 0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j} → 0 is exact and admits a continuous set-theoretic section. |
| `TauCeti.TateTwist.shortExact_rational` | relation | 0 → ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0 is exact. |
| `TauCeti.TateTwist.adic_pairing` | constructor | Equivariant pairings ℤ_ℓ(i) × ℤ_ℓ(j) → ℤ_ℓ(i+j) reducing mod ℓ^ν to the finite pairings. |

**Used by.**

- Tate1976 (3.1): Target H²(F, ℤ_ℓ(2)) of Tate's adic Galois symbol (M.3/adic-galois-symbol).
- ArithmeticKTheory:N.5/edge-normalised-chern-torsion and N.6: Continuous coefficient sequences
  for ℤ_ℓ(j), ℚ_ℓ(j), ℚ_ℓ/ℤ_ℓ(j) and their connecting maps.
- PadicHodgeRegulators:D.2/etale-regulator: Target H¹(F, ℤ_p(n)) = lim H¹(F, μ_{p^ν}^{⊗n}) of
  the continuous étale regulator.
- MotivicEtaleKTheory:M.5d/prime-power-norm-residue: The coefficient triangle with the correct
  inclusion map ι drives the Bockstein induction from ℓ to ℓ^r.

**Unit tests.**

- `TateTwist.test_adic_zero` (degenerate): ℤ_ℓ(0) = ℤ_ℓ with trivial G_F-action.
- `TateTwist.test_adic_char` (compatibility): On ℤ_ℓ(1), g acts by Mathlib's
  cyclotomicCharacter ℓ g.
- `TateTwist.test_rat_three_w2` (computation): H⁰(ℚ, ℚ_3/ℤ_3(2)) ≅ ℤ/3.
- `TateTwist.test_factorwise_inclusion_wrong` (non-example): For j = 2 and a = b = 1, the
  factorwise inclusion μ_ℓ ⊗ μ_ℓ → μ_{ℓ²} ⊗ μ_{ℓ²} is the zero map, whereas ι is injective.

**Acceptance.**

- For F = ℚ, ℓ = 3 and j = 2, H⁰(ℚ, ℚ_3/ℤ_3(2)) is cyclic of order 3 (the 3-part of w_2(ℚ) =
  24).
- ℤ_ℓ(0) = ℤ_ℓ with trivial action and ℚ_ℓ/ℤ_ℓ(0) = ℚ_ℓ/ℤ_ℓ.

**Depends on.** `MotivicEtaleKTheory:M.1/finite-tate-twist`, `mathlib:cyclotomicCharacter`, `mathlib:TopRep`, `ArithmeticGaloisDuality:R02.1/mittag-leffler`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, §3, p. 262: “Since the maps
  μ_{l^{i+1}} → μ_{l^i} are surjective this last sequence is exact, and Z_l(1) = lim (μ_{l^i})
  is a free Z_l-module of rank 1.” — Tate's definition of Z_l(1) and of Z_l(m) for m ∈ ℤ
  (Z_l(m+1) = Z_l(m) ⊗ Z_l(1), Z_l(m−1) = Hom(Z_l(1), Z_l(m))); excerpt typed from the scan.
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.8.2 proof and
  Corollary 8.3, printed pp. 513-514 (PDF pp. 521-522): “Immediate from 8.2 since H 2 (R, Zℓ (i
  + 1))/ℓ ∼ = H 2 (R, µ⊗i+1 )” — The K-book uses ℤ_ℓ(i) with ℤ_ℓ(i)/ℓ ≅ μ_ℓ^{⊗i}; the
  coefficient sequences are the ones its proofs use.

### `M.1/primewise-q-mod-z-twist` — The primewise twist ℚ/ℤ(j) and the numbers w_j(F)

*Kind:* construction. *Library:* `TauCeti/NumberTheory/GaloisCohomology/TateTwist`, namespace `TauCeti.TateTwist`.

Let F be a field of characteristic p ≥ 0 and j ∈ ℤ. Define the discrete G_F-module ℚ/ℤ(j) =
⊕_{ℓ ≠ p} ℚ_ℓ/ℤ_ℓ(j), the sum of the divisible ℓ-adic twists of adic-tate-twist over the primes
ℓ different from p. Equivalently ℚ/ℤ(j) is the group μ(F^s) of all roots of unity of F^s, with
g ∈ G_F acting by ζ ↦ g^j(ζ) in the sense of K-book Definition VI.1.7. It is not the tensor
power (ℚ/ℤ)^{⊗j}, which vanishes for j ≥ 2. When H⁰(F, ℚ/ℤ(j)) is finite, w_j(F) denotes its
order and w_j^{(ℓ)}(F) the order of its ℓ-primary part.

**Hypotheses.**

- F a field of characteristic p ≥ 0 (p = 0 allowed); j ∈ ℤ.

**Construction and proof.**

1. Form the direct sum over ℓ ≠ p of the discrete modules ℚ_ℓ/ℤ_ℓ(j) of adic-tate-twist.
2. Identify it with μ(F^s) twisted by g ↦ g^j (K-book VI.1.7) through the Sylow decomposition
   μ(F^s) = ⊕_{ℓ≠p} μ_{ℓ^∞}.
3. Show (ℚ/ℤ) ⊗_ℤ (ℚ/ℤ) = 0 (a divisible group tensored with a torsion group), so the
   tensor-power definition is wrong for j ≥ 2.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.TateTwist.ratModInt` | constructor | The discrete G_F-module ℚ/ℤ(j) = ⊕_{ℓ ≠ char F} ℚ_ℓ/ℤ_ℓ(j). |
| `TauCeti.TateTwist.ratModIntEquivRootsOfUnity` | equivalence | ℚ/ℤ(j) ≅ μ(F^s) with g acting by ζ ↦ g^j(ζ). |
| `TauCeti.TateTwist.ratModInt_primary` | projection | The ℓ-primary part of ℚ/ℤ(j) is ℚ_ℓ/ℤ_ℓ(j). |
| `TauCeti.TateTwist.w` | data | w_j(F) = #H⁰(F, ℚ/ℤ(j)) when finite, and w_j^{(ℓ)}(F) its ℓ-part. |
| `TauCeti.TateTwist.w_eq_prod` | relation | w_j(F) = ∏_ℓ w_j^{(ℓ)}(F) when H⁰(F, ℚ/ℤ(j)) is finite. |

**Used by.**

- ArithmeticKTheory:N.4/the-w-invariant: W_j(F) = H⁰(F, ℚ/ℤ(j)) is defined from this module
  (N.1 packet request to M.1).
- Kbook2013 VI.2.1 (e-invariant): The e-invariant takes values in µ(i)^G = H⁰(F, ℚ/ℤ(i)).
- HabiroNumberFields:HB.1/the-chern-class-map-c-zeta: ℚ_p/ℤ_p(m) and its invariants w_m(F) (CGZ
  §3.1).

**Unit tests.**

- `TateTwist.test_w2_rat` (computation): w_2(ℚ) = 24.
- `TateTwist.test_ratModInt_zero` (degenerate): ℚ/ℤ(0) has trivial action, so H⁰(F, ℚ/ℤ(0)) =
  ⊕_{ℓ≠p} ℚ_ℓ/ℤ_ℓ is infinite.
- `TateTwist.test_one_roots` (compatibility): ℚ/ℤ(1) ≅ μ(F^s) with its natural action, whose
  m-torsion is KummerCoeff F m.
- `TateTwist.test_tensor_square_zero` (non-example): (ℚ/ℤ) ⊗_ℤ (ℚ/ℤ) = 0, so ℚ/ℤ(2) is not the
  tensor square of ℚ/ℤ(1).

**Acceptance.**

- w_2(ℚ) = 24 (K-book Lemma VI.2.4: the denominator of B_1/4).
- For F separably closed, H⁰(F, ℚ/ℤ(j)) = ℚ/ℤ(j) is infinite.

**Depends on.** `MotivicEtaleKTheory:M.1/adic-tate-twist`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, Definition VI.1.7,
  printed p. 468 (PDF p. 476): “we shall write µ(i) for the abelian group µ, made into a Aut(F
  )-module by letting g ∈ Aut(F ) act as ζ 7→ g i (ζ).” — Definition of the twist by the j-th
  power of the action; the Sylow decomposition µ(i) = ⊕Z/ℓ∞(i) is the primewise description.
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, Definition VI.2.1,
  printed p. 469 (PDF p. 477): “If µ(i)G is a finite group it is cyclic, and we write wi (F )
  for its order” — Definition of w_i(F).

### `M.1/twisted-cohomology-ring` — The Galois cohomology ring of the twists

*Kind:* construction. *Library:* `TauCeti/NumberTheory/GaloisCohomology/TateTwist`, namespace `TauCeti.TateTwist`.

For a field F and m invertible in F, set H^{i}(F, μ_m^{⊗j}) = the continuous cohomology
(Mathlib's continuousCohomology) of G_F with coefficients in the discrete module μ_m^{⊗j} of
finite-tate-twist, and H^{i}(F, ℤ_ℓ(j)), H^{i}(F, ℚ_ℓ(j)), H^{i}(F, ℚ_ℓ/ℤ_ℓ(j)) likewise for
the modules of adic-tate-twist. The cup product of ProfiniteCohomology Layer 12 composed with
the twist pairings gives an associative bigraded product H^{i}(F, μ_m^{⊗a}) × H^{k}(F,
μ_m^{⊗b}) → H^{i+k}(F, μ_m^{⊗(a+b)}), graded-commutative with the sign (−1)^{ik}. In particular
H^{*}(F, μ_m^{⊗*}) = ⊕_{n} H^{n}(F, μ_m^{⊗n}) is a graded-commutative ℤ/m-algebra. For an open
subgroup G_E ⊂ G_F (E/F finite separable) the restriction is a ring map, the corestriction is a
module map over it (projection formula cor(res(a) ∪ b) = a ∪ cor(b)) and cor ∘ res is
multiplication by [E : F]. In degrees ≤ 2 these groups and maps agree with Tau Ceti's explicit
H1/H2 model and its explicitCup11, explicitCor and explicitRes, through ProfiniteCohomology
Layer 3.

**Hypotheses.**

- F a field; E/F finite separable inside F^s; m invertible in F; ℓ ≠ char F.

**Construction and proof.**

1. Instantiate Layer 10's continuous cohomology at the topological G_F-modules of
   finite-tate-twist and adic-tate-twist (TopRep of the absolute Galois group).
2. Compose Layer 12's graded cup product with TateTwist.pairing; associativity and graded
   commutativity follow from Layer 12 and pairing_assoc/pairing_comm.
3. Restriction and corestriction at open subgroups, the projection formula and cor ∘ res =
   index are Layer 10's and Layer 12's statements applied to these coefficients; in degree
   (1,1) the projection formula is Tau Ceti's explicitCup_projection11.
4. Compare with Tau Ceti's low-degree model by Layer 3's comparison isomorphisms.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.TateTwist.H` | constructor | H^{i}(F, M) for the twist modules, as Layer 10's continuous cohomology of G_F. |
| `TauCeti.TateTwist.cup` | constructor | The bigraded cup product H^{i}(μ_m^{⊗a}) × H^{k}(μ_m^{⊗b}) → H^{i+k}(μ_m^{⊗(a+b)}). |
| `TauCeti.TateTwist.cup_assoc` | relation | The cup product is associative. |
| `TauCeti.TateTwist.cup_comm` | relation | x ∪ y = (−1)^{ik} y ∪ x for x of degree i and y of degree k, through the twist swap. |
| `TauCeti.TateTwist.res_cup` | functoriality | Restriction to G_E is multiplicative. |
| `TauCeti.TateTwist.cor_res` | relation | cor_{E/F} ∘ res_{E/F} = [E : F] on H^{i}(F, μ_m^{⊗j}). |
| `TauCeti.TateTwist.projection_formula` | relation | cor_{E/F}(res(a) ∪ b) = a ∪ cor_{E/F}(b). |
| `TauCeti.TateTwist.H_le_two_equiv` | compatibility | For i ≤ 2 the groups and the (1,1) cup agree with Tau Ceti's H1, H2 and explicitCup11. |

**Used by.**

- MotivicEtaleKTheory:M.3/galois-symbol: Defines h_F{a, b} = κ(a) ∪ κ(b) in H²(F, μ_m^{⊗2}).
- MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees: The graded target of the norm residue
  ring homomorphism K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}).
- Tate1976 Lemma (3.2): Projection formula tr_{E/F}(a, b)_E = (a, N_{E/F} b)_F, used for norm
  compatibility.

**Unit tests.**

- `TateTwist.test_H0` (degenerate): H⁰(F, μ_m^{⊗0}) = ℤ/m and the unit of the ring is 1 ∈ ℤ/m.
- `TateTwist.test_real_mod_two` (computation): For F = ℝ, m = 2: H^{n}(ℝ, μ_2^{⊗n}) ≅ ℤ/2 for
  all n ≥ 0, generated by κ(−1)^n.
- `TateTwist.test_explicitCup11` (compatibility): For i = k = 1 the cup product equals
  TauCeti.ContCohomology.explicitCup11 at the twist pairing.
- `TateTwist.test_not_commutative` (non-example): For F = ℝ and m = 2 the degree-one class x =
  κ(−1) has x ∪ x ≠ 0, so the ring is not exterior on degree one (graded commutativity does not
  force x² = 0 when 2 = 0).

**Acceptance.**

- κ(a) ∪ κ(b) ∈ H²(F, μ_m^{⊗2}) for a, b ∈ F^×, with κ the Kummer map, is the explicitCup11 of
  two Kummer classes for the pairing KummerCoeff × KummerCoeff → μ_m^{⊗2}.
- For F = ℝ and m = 2, H^{*}(ℝ, μ_2^{⊗*}) = 𝔽_2[κ(−1)] with κ(−1) of degree one.

**Depends on.** `MotivicEtaleKTheory:M.1/finite-tate-twist`, `MotivicEtaleKTheory:M.1/adic-tate-twist`, `mathlib:continuousCohomology`, `tauceti:TauCeti.ContCohomology.explicitCup11`, `tauceti:TauCeti.ContCohomology.explicitCup_projection11`, `tauceti:TauCeti.ContCohomology.explicitCor2_comp_res2`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-3-the-comparison-isomorphisms`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, III.6.10, (6.10.2),
  printed p. 242 (PDF p. 250): “There are also natural cup products in cohomology, such as the
  product” — The product F^× ⊗ F^× → H¹ ⊗ H¹ → H²(F; μ_m^{⊗2}) and its projection formula tr(a
  ∪ b) = a ∪ N(b) are the degree-(1,1) case of this node.
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI Corollary 4.1.1,
  printed p. 480 (PDF p. 488): “They form a ring isomorphism” — The graded ring ⊕ H^i(k,
  μ_m^{⊗i}) is the target of the norm residue ring isomorphism.

### `M.1/continuous-limit-comparison` — Continuous cohomology of ℓ-adic twists as limits ★

*Kind:* theorem. *Planet:* Continuous ℓ-adic cohomology.

Let F be a field, ℓ ≠ char F prime and j ∈ ℤ. (a) There is a natural short exact sequence 0 →
lim^1_ν H^{i−1}(F, μ_{ℓ^ν}^{⊗j}) → H^{i}(F, ℤ_ℓ(j)) → lim_ν H^{i}(F, μ_{ℓ^ν}^{⊗j}) → 0; if
H^{i−1}(F, μ_{ℓ^ν}^{⊗j}) is finite for every ν, then H^{i}(F, ℤ_ℓ(j)) ≅ lim_ν H^{i}(F,
μ_{ℓ^ν}^{⊗j}). (b) H^{i}(F, ℚ_ℓ/ℤ_ℓ(j)) ≅ colim_ν H^{i}(F, μ_{ℓ^ν}^{⊗j}). (c) If H^{i}(F,
ℤ_ℓ(j)) is a finitely generated ℤ_ℓ-module then H^{i}(F, ℚ_ℓ(j)) ≅ H^{i}(F, ℤ_ℓ(j)) ⊗ ℚ_ℓ. (d)
The coefficient sequences of adic-tate-twist give natural long exact sequences, among them … →
H^{i}(F, ℤ_ℓ(j)) --ℓ^ν--> H^{i}(F, ℤ_ℓ(j)) → H^{i}(F, μ_{ℓ^ν}^{⊗j}) → H^{i+1}(F, ℤ_ℓ(j)) → …
and the Bockstein sequence for ι.

**Hypotheses.**

- F a field, ℓ ≠ char F, j ∈ ℤ, i ≥ 0.
- In (c), finite generation over ℤ_ℓ is a hypothesis to be verified in each application (for
  S-integers it is M.2/adic-s-integer-cohomology).

**Construction and proof.**

1. (a) is the Milnor sequence of ArithmeticGaloisDuality R02.1 applied to the tower of cochain
   complexes C^•(G_F, μ_{ℓ^ν}^{⊗j}), together with R02.1's comparison of continuous cochains
   into ℤ_ℓ(j) = lim μ_{ℓ^ν}^{⊗j} with the limit of cochains; finiteness makes the tower
   Mittag-Leffler (Tate's (2.2), NSW (2.7.6)).
2. (b) is the finite-quotient colimit description of discrete cohomology (ProfiniteCohomology
   Layers 4 and 10): cohomology commutes with filtered colimits of discrete modules.
3. (c) is R02.1's rationalisation theorem.
4. (d) uses R02.1's long exact sequence for coefficient sequences with continuous sections; the
   sections exist because the quotient maps are maps of profinite or discrete spaces.

**Acceptance.**

- For F a finite field 𝔽_q with ℓ ∤ q and j ≠ 0: H¹(𝔽_q, ℤ_ℓ(j)) ≅ ℤ_ℓ/(q^j − 1), the limit of
  H¹(𝔽_q, μ_{ℓ^ν}^{⊗j}) = μ_{ℓ^ν}^{⊗j}/(Frob − 1).

**Depends on.** `MotivicEtaleKTheory:M.1/adic-tate-twist`, `MotivicEtaleKTheory:M.1/twisted-cohomology-ring`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `ArithmeticGaloisDuality:R02.1/rationalization`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-4-the-finite-quotient-colimit-description`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

**Source.**

- Jürgen Neukirch, Alexander Schmidt, Kay Wingberg, *Cohomology of Number Fields*, II §7,
  (2.7.6) Corollary, PDF p. 156: “If H i (G, An ) is finite for all n, then i+1 Hcts (G, A) =
  lim H i+1 (G, An ).” — The finite-coefficient case of (a).
- John Tate, *Relations between K2 and Galois cohomology*, §2, pp. 258-261: “In this section we
  review the basic definitions and properties of the cohomology theory which is used in the
  sequel.” — Tate's §2 is the source of the limit and exact-sequence properties of continuous
  cochain cohomology used throughout M.3; excerpt typed from the scan.

### `M.1/etale-twist-sheaf` — Étale Tate twists on schemes and continuous étale cohomology

*Kind:* construction. *Library:* `TauCeti/AlgebraicGeometry/Etale/TateTwist`, namespace `TauCeti.EtaleTwist`.

Let X be a scheme and m ≥ 1 with m invertible in Γ(X, O_X). The étale sheaf μ_m on the small
étale site X_et (Mathlib's smallEtaleTopology) is U ↦ μ_m(Γ(U, O_U)), a locally free sheaf of
ℤ/m-modules of rank one; μ_m^{⊗j} is its j-th tensor power over ℤ/m for j ≥ 0 and the ℤ/m-dual
of μ_m^{⊗(−j)} for j < 0. Étale cohomology H^{i}_et(X, μ_m^{⊗j}) is Mathlib's sheaf cohomology
Sheaf.H of this sheaf. For a prime ℓ invertible on X, continuous ℓ-adic étale cohomology is
H^{i}_cont(X, ℤ_ℓ(j)) = H^{i}(R lim_ν RΓ_et(X, μ_{ℓ^ν}^{⊗j})), the cohomology of the derived
limit of the tower of complexes with transition maps induced by ℤ_ℓ(j)/ℓ^{ν+1} → ℤ_ℓ(j)/ℓ^ν; it
sits in the Milnor sequence 0 → lim^1 H^{i−1}_et(X, μ_{ℓ^ν}^{⊗j}) → H^{i}_cont(X, ℤ_ℓ(j)) → lim
H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) → 0. H^{i}_cont(X, ℚ_ℓ(j)) = H^{i}_cont(X, ℤ_ℓ(j)) ⊗ ℚ and
H^{i}_et(X, ℚ_ℓ/ℤ_ℓ(j)) = colim_ν H^{i}_et(X, μ_{ℓ^ν}^{⊗j}). All are contravariant in X, and
the pairings of finite-tate-twist give cup products.

**Hypotheses.**

- X a scheme; m invertible on X; ℓ a prime invertible on X; j ∈ ℤ.
- The derived limit is taken in the derived category of abelian groups; no left-completeness of
  the étale topos is assumed.

**Construction and proof.**

1. Define μ_m as the kernel of the m-th power map on the étale sheaf G_m; it is locally free of
   rank one because étale locally m-th roots of unity exist once m is invertible.
2. Form tensor powers and duals in sheaves of ℤ/m-modules; the stalk at a geometric point x̄ is
   μ_m(κ(x̄))^{⊗j}.
3. Use Mathlib's Sheaf.H (Ext from the constant sheaf) for H^{i}_et; obtain the derived-limit
   model of continuous cohomology from a functorial injective (or Godement) resolution of the
   tower and R02.1's Milnor sequence for towers of complexes.
4. Pullback along X' → X maps μ_m to μ_m and so acts on all the groups; cup products come from
   the pairings.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.EtaleTwist.sheaf` | constructor | The étale sheaf μ_m^{⊗j} on X_et for m invertible on X. |
| `TauCeti.EtaleTwist.stalk` | characterisation | The stalk at a geometric point x̄ is μ_m(κ(x̄))^{⊗j}, free of rank one over ℤ/m. |
| `TauCeti.EtaleTwist.H` | constructor | H^{i}_et(X, μ_m^{⊗j}) := Sheaf.H of the sheaf. |
| `TauCeti.EtaleTwist.Hcont` | constructor | H^{i}_cont(X, ℤ_ℓ(j)) as cohomology of R lim_ν RΓ_et(X, μ_{ℓ^ν}^{⊗j}). |
| `TauCeti.EtaleTwist.milnor_sequence` | relation | 0 → lim^1 H^{i−1}_et(X, μ_{ℓ^ν}^{⊗j}) → H^{i}_cont(X, ℤ_ℓ(j)) → lim H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) → 0. |
| `TauCeti.EtaleTwist.pullback` | functoriality | Pullback along f : X' → X, with id and composition laws. |
| `TauCeti.EtaleTwist.cup` | constructor | Cup products H^{i}_et(X, μ_m^{⊗a}) × H^{k}_et(X, μ_m^{⊗b}) → H^{i+k}_et(X, μ_m^{⊗(a+b)}). |
| `TauCeti.EtaleTwist.coeff_long_exact` | relation | Long exact sequences for the coefficient sequences of adic-tate-twist, natural in X. |

**Used by.**

- MotivicEtaleKTheory:M.5d request to M.1: Finite/adic Tate twists as coherent coefficient
  objects and continuous étale hypercohomology after derived inverse limits.
- MotivicEtaleKTheory:M.3/tate-s-integer: Target H²_et(O_{F,S}, μ_{ℓ^r}^{⊗2}) of Tate's
  S-integer comparison.
- Kbook2013 VI.8.2-8.4: H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) computes K_{2i}(O_S){ℓ}.
- HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift: H¹_et(O_L[1/p], μ_n) in the étale
  Kummer sequence.

**Unit tests.**

- `EtaleTwist.test_empty` (degenerate): For X = ∅ every H^{i}_et(X, μ_m^{⊗j}) and H^{i}_cont(X,
  ℤ_ℓ(j)) is zero.
- `EtaleTwist.test_field_H0` (compatibility): For X = Spec F, H⁰_et(X, μ_m^{⊗j}) =
  (μ_m^{⊗j})^{G_F}, the H⁰ of finite-tate-twist.
- `EtaleTwist.test_finite_field_H1` (computation): For X = Spec 𝔽_5, m = 4, j = 1: H¹_et(X,
  μ_4) ≅ 𝔽_5^×/(𝔽_5^×)^4 ≅ ℤ/4.
- `EtaleTwist.test_cont_not_naive_limit` (non-example): For X = Spec 𝔽_q with ℓ | q − 1, the
  étale sheaf of the discrete G-module ℤ_ℓ(1) has H¹ = 0 (no nonzero continuous cocycles into a
  torsion-free discrete module on which Frobenius acts by q ≠ 1), whereas H¹_cont(X, ℤ_ℓ(1)) ≅
  ℤ_ℓ/(q − 1) ≠ 0.

**Acceptance.**

- For X = Spec F, F a field, H⁰_et(X, μ_m^{⊗j}) = H⁰(F, μ_m^{⊗j})
  (field-etale-galois-comparison).
- For X = Spec 𝔽_q and j = 1, H¹_cont(X, ℤ_ℓ(1)) ≅ ℤ_ℓ/(q − 1).

**Depends on.** `MotivicEtaleKTheory:M.1/finite-tate-twist`, `MotivicEtaleKTheory:M.1/adic-tate-twist`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.Sheaf.H`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `SchemeAndStackFoundations:SF.2`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.4, printed p. 480
  (PDF p. 488): “For any smooth X, there is a natural map H n (X, Z/m(i)) → Het” — The étale
  twists μ_m^{⊗i} on schemes are the targets of the motivic-to-étale map; this node provides
  them.
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.8.2 proof, printed
  p. 514 (PDF p. 522): “The same argument works for ℓ-adic coefficients Zℓ” — The K-book uses
  continuous ℓ-adic étale cohomology H_et(R, ℤ_ℓ(i)) of S-integer rings.

### `M.1/field-etale-galois-comparison` — Étale cohomology of a field is Galois cohomology ★

*Kind:* theorem. *Planet:* Étale–Galois comparison.

Let F be a field, F^s a separable closure, and M a discrete G_F-module. The functor sending an
étale sheaf 𝓕 on Spec F to colim_{E} 𝓕(Spec E) (E/F finite separable inside F^s) is an
equivalence between étale sheaves of abelian groups on Spec F and discrete G_F-modules, and it
induces natural isomorphisms H^{i}_et(Spec F, 𝓕) ≅ H^{i}(G_F, 𝓕(F^s)). For 𝓕 = μ_m^{⊗j} (m
invertible in F) this identifies H^{i}_et(Spec F, μ_m^{⊗j}) with H^{i}(F, μ_m^{⊗j}) of
twisted-cohomology-ring, and H^{i}_cont(Spec F, ℤ_ℓ(j)) with H^{i}(F, ℤ_ℓ(j)). The
identification is compatible with long exact sequences, cup products, and, for a field
extension F → F' with compatible separable closures, with pullback on the left and restriction
on the right. Two invariance properties follow: for a filtered colimit of fields F = colim F_α,
H^{i}(F, μ_m^{⊗j}) = colim_α H^{i}(F_α, μ_m^{⊗j}); and for E/F purely inseparable, restriction
H^{i}(F, μ_m^{⊗j}) → H^{i}(E, μ_m^{⊗j}) is an isomorphism, because G_E → G_F is an isomorphism
of profinite groups.

**Hypotheses.**

- F a field; M a discrete G_F-module; m, ℓ invertible in F.

**Construction and proof.**

1. Étale F-schemes are disjoint unions of spectra of finite separable extensions, so a sheaf is
   determined by the discrete G_F-module of its values on F^s (Galois descent).
2. Global sections correspond to G_F-invariants; both sides are δ-functors, effaceable in
   positive degrees, so the derived functors agree.
3. Naturality in F and compatibility with cup products follow from the uniqueness of morphisms
   of universal δ-functors; continuous ℓ-adic cohomology is compared through the derived limits
   of both sides (continuous-limit-comparison).
4. Filtered colimits: G_F = lim G_{F_α} and discrete cohomology of a limit of profinite groups
   with compatible discrete coefficients is the colimit (ProfiniteCohomology Layer 10). Purely
   inseparable E/F: E^s = E·F^s and restriction Gal(E^s/E) → Gal(F^s/F) is bijective and
   bicontinuous.

**Acceptance.**

- For F = 𝔽_q, H¹_et(Spec 𝔽_q, ℤ/n) ≅ ℤ/n, matching H¹(Ẑ, ℤ/n) = ℤ/n.
- For F separably closed, H^{i}_et(Spec F, 𝓕) = 0 for i > 0.

**Depends on.** `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/twisted-cohomology-ring`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `mathlib:CategoryTheory.Sheaf.H`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, III.6.10, printed p.
  242 (PDF p. 250): “The Galois cohomology groups 0 i (F ; M ) (F ; M ) are defined to be its
  right derived functors.” — The K-book writes Galois cohomology as H_et(F; M); this node
  proves that the étale cohomology of Spec F computes it.
- James S. Milne, *Arithmetic Duality Theorems*, II §2, Proposition 2.9, PDF p. 178: “H r .U; F
  /.`/ D H r .GS ; M /.`/ for all r if ` is invertible on U” — The S-integer analogue
  (s-integer-galois-comparison); the field case is its limit over S.

### `M.1/s-integer-galois-comparison` — Étale cohomology of S-integers is cohomology of G_{F,S}

*Kind:* theorem.

Let F be a global field, S a nonempty set of places containing the archimedean places (S ⊇ S_∞
for number fields), O_{F,S} the ring of S-integers, U = Spec O_{F,S}, and G_{F,S} the Galois
group of the maximal extension F_S of F unramified outside S (ArithmeticGaloisDuality R02.3).
Let M be a finite discrete G_{F,S}-module whose order is invertible on U, and 𝓕 the
corresponding locally constant étale sheaf on U. Then H^{i}_et(U, 𝓕) ≅ H^{i}(G_{F,S}, M) for
all i, naturally in M and compatibly with cup products and with enlarging S. In particular, for
m invertible on U, H^{i}_et(U, μ_m^{⊗j}) ≅ H^{i}(G_{F,S}, μ_m^{⊗j}), and passing to limits,
H^{i}_cont(U, ℤ_ℓ(j)) ≅ H^{i}(G_{F,S}, ℤ_ℓ(j)) for ℓ invertible on U.

**Hypotheses.**

- F a global field; S ⊇ S_∞ nonempty; the order of M invertible on O_{F,S}.
- For ℓ = 2 and F with real places, the comparison holds for ordinary cohomology; modified
  groups are M.2's.

**Construction and proof.**

1. Locally constant sheaves on U trivialised by finite étale covers correspond to finite
   G_{F,S}-modules unramified outside S.
2. Compare the Hochschild–Serre spectral sequence for the pro-étale cover Spec O_{F_S,S} → U
   with the vanishing of H^{i}_et(Spec O_{F_S,S}, 𝓕) for i > 0 and #M invertible (Milne ADT
   II.2.9).
3. Pass to ℓ-adic limits by continuous-limit-comparison on both sides (the groups are finite by
   ArithmeticGaloisDuality R02.4/global-finiteness).

**Acceptance.**

- For F = ℚ, S = {2, ∞} and M = μ_2: H¹_et(Spec ℤ[1/2], μ_2) ≅ H¹(G_{ℚ,S}, μ_2) ≅
  ℤ[1/2]^×/(ℤ[1/2]^×)^2 ≅ (ℤ/2)^2, generated by −1 and 2.

**Depends on.** `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/field-etale-galois-comparison`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `ArithmeticGaloisDuality:R02.3/restricted-ramification-group`, `ArithmeticGaloisDuality:R02.4/global-finiteness`

**Source.**

- James S. Milne, *Arithmetic Duality Theorems*, II §2, Proposition 2.9, PDF p. 178: “H r .U; F
  /.`/ D H r .GS ; M /.`/ for all r if ` is invertible on U” — Milne's statement for locally
  constant constructible sheaves; the node specialises to finite modules of invertible order
  and their twists.

### `M.1/etale-kummer-sequences` — Étale Kummer sequences with units, Picard and Brauer terms

*Kind:* theorem.

Let X be a scheme and n ≥ 1 invertible on X. The sequence of étale sheaves 1 → μ_n → G_m --n-->
G_m → 1 is exact, and, writing Pic(X) = H¹_et(X, G_m) and Br'(X) = H²_et(X, G_m) (the
cohomological Brauer group of SchemeAndStackFoundations SF.2), it gives natural exact sequences
0 → O(X)^×/n → H¹_et(X, μ_n) → Pic(X)[n] → 0 and 0 → Pic(X)/n → H²_et(X, μ_n) → Br'(X)[n] → 0.
For X = Spec F the first map O(X)^×/n → H¹_et(X, μ_n) ≅ H¹(F, μ_n) is Tau Ceti's kummerMap, and
it is an isomorphism (Hilbert 90, ProfiniteCohomology Layer 9). For X = Spec O_{F,S} with n
invertible these are the sequences used in K-book VI.8.5 and in HabiroNumberFields HB.1 for
O_L[1/p], and the inclusion O_{F,S} → F makes them compatible with the field sequences.

**Hypotheses.**

- X a scheme; n invertible on X.
- Pic(X) = H¹_et(X, G_m) requires Hilbert 90 for G_m on X_et.

**Construction and proof.**

1. Exactness of the Kummer sequence: étale locally every unit has an n-th root because t^n − u
   is separable when n is invertible.
2. Take the long exact cohomology sequence and identify H⁰_et(X, G_m) = O(X)^× and H¹_et(X,
   G_m) = Pic(X) (Hilbert 90 for G_m, requested from SF.2).
3. For X = Spec F, compare the connecting map with Tau Ceti's kummerMap through
   field-etale-galois-comparison (the Kummer map is the degree-zero connecting homomorphism).

**Acceptance.**

- For X = Spec ℤ[1/2] and n = 2: ℤ[1/2]^×/2 ≅ (ℤ/2)^2, Pic = 0, so H¹_et(X, μ_2) ≅ (ℤ/2)^2 and
  H²_et(X, μ_2) ≅ Br'(ℤ[1/2])[2] ≅ ℤ/2 (by (8.1.1) of M.2/s-integer-brauer-sequence).

**Depends on.** `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/field-etale-galois-comparison`, `tauceti:TauCeti.kummerMap`, `tauceti:TauCeti.ker_kummerMap`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `SchemeAndStackFoundations:SF.2`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI Example 8.5,
  printed p. 514 (PDF p. 522): “H 1 (OS ; µ⊗i ℓ ) = OS /OS ⊕ ℓ Pic(OS ) and H (OS ; µℓ ) =
  Pic(OS )/ℓ ⊕ ℓ Br(OS )” — The two Kummer sequences for S-integers (split when μ_ℓ ⊂ O_S).
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, III Example 6.10.1,
  printed p. 242 (PDF p. 250): “is refered to as the Kummer sequence” — The field case.

### `M.1/henselian-residue-comparison` — Henselian local rings: cohomology of the closed point

*Kind:* theorem.

Let A be a henselian local ring with residue field k (for example a complete discrete valuation
ring 𝒪_v), and m invertible in k. For every j ∈ ℤ and i ≥ 0, restriction to the closed point
induces isomorphisms H^{i}_et(Spec A, μ_m^{⊗j}) ≅ H^{i}_et(Spec k, μ_m^{⊗j}) ≅ H^{i}(k,
μ_m^{⊗j}), natural in A and compatible with cup products; passing to limits, the same holds for
H^{i}_cont(−, ℤ_ℓ(j)) with ℓ invertible in k.

**Hypotheses.**

- A henselian local; m invertible in the residue field k (hence in A); j ∈ ℤ.

**Construction and proof.**

1. Apply Gabber's affine analogue of proper base change for the henselian pair (A, 𝔪_A),
   imported from ClassicalAdicEtaleCohomology, to the torsion sheaf μ_m^{⊗j}.
2. Identify the closed-point cohomology with Galois cohomology of k
   (field-etale-galois-comparison) and pass to ℓ-adic limits (continuous-limit-comparison).

**Acceptance.**

- For A = ℤ_p and m prime to p: H¹_et(Spec ℤ_p, μ_m) ≅ H¹(𝔽_p, μ_m) ≅ μ_m(𝔽_p)_{Frob} ≅
  ℤ/gcd(m, p − 1).

**Depends on.** `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/field-etale-galois-comparison`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `ClassicalAdicEtaleCohomology:H1:henselian/affine-henselian-comparison-3-2-5`

**Source.**

- Thomas Geisser, *Motivic cohomology over Dedekind rings*, Theorem 1.2(3), p. 774: “Let R be a
  henselian local ring of a smooth scheme over B, k the residue field of R, and m ∈ N be
  invertible in k.” — Geisser's motivic rigidity has the same shape; the étale statement of
  this node is the classical henselian comparison, which Geisser's proof combines with
  Beilinson–Lichtenbaum.

### `M.1/localization-gysin-sequence` — The étale localization sequence of a Dedekind scheme ★

*Kind:* theorem. *Planet:* Étale localization sequence.

Let B be a Dedekind scheme (for example Spec O_{F,S}), Z ⊂ B a finite set of closed points with
open complement V, m invertible on B and j ∈ ℤ. Absolute purity for the regular codimension-one
immersions {v} → B gives isomorphisms H^{i}_{\{v\}}(B, μ_m^{⊗j}) ≅ H^{i−2}(k(v), μ_m^{⊗(j−1)}),
and hence a natural long exact sequence … → H^{i}_et(B, μ_m^{⊗j}) → H^{i}_et(V, μ_m^{⊗j})
--∂--> ⊕_{v∈Z} H^{i−1}(k(v), μ_m^{⊗(j−1)}) → H^{i+1}_et(B, μ_m^{⊗j}) → … . Passing to the
colimit over Z gives the sequence for the generic point, with Spec F in place of V. The residue
∂_v : H^{i}(F, μ_m^{⊗j}) → H^{i−1}(k(v), μ_m^{⊗(j−1)}) satisfies ∂_v(κ(a)) = v(a) mod m in
H⁰(k(v), μ_m^{⊗0}) = ℤ/m for j = 1, i = 1, and ∂_v(κ(u) ∪ x) = −κ_{k(v)}(ū) ∪ ∂_v(x) for a
v-unit u. The same holds with ℤ_ℓ(j) and ℚ_ℓ/ℤ_ℓ(j) coefficients for ℓ invertible on B.

**Hypotheses.**

- B a Dedekind scheme (noetherian, regular, of dimension ≤ 1); m invertible on B.
- The sign of ∂_v on cup products is fixed by the convention ∂_v(κ(π)) = 1 for a uniformiser π;
  M.3/symbol-residue-compatibility compares it with K2SymbolsBrauer's tame symbol.

**Construction and proof.**

1. Excision reduces the supported cohomology at v to the henselisation of B at v; there purity
   H^{i}_{v}(𝒪^h_v, μ_m^{⊗j}) ≅ H^{i−2}(k(v), μ_m^{⊗(j−1)}) follows from
   henselian-residue-comparison and the Kummer computation H¹(F^h_v, μ_m)/H¹(𝒪^h_v, μ_m) ≅ ℤ/m
   (cohomological purity for a regular pair, EtaleDualityAndPerverseSheaves EDC.3).
2. Insert purity into the long exact sequence of cohomology with supports for Z ⊂ B ⊃ V.
3. Compute ∂ on Kummer classes from the Kummer sequence: the boundary of the divisor of a is
   v(a); the cup-product rule follows from multiplicativity of the supported cup product.

**Acceptance.**

- For B = Spec ℤ_(p) (with m prime to p), the sequence reduces to 0 → H¹(𝔽_p, μ_m) → H¹(ℚ_p^h,
  μ_m) → ℤ/m → 0 on the Kummer side, ∂ being the valuation mod m.

**Depends on.** `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/henselian-residue-comparison`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, §5, (5.3), p. 269: “where denotes
  direct sum. The map d^S is surjective by a theorem of Moore” — Tate's K₂ localization
  sequence 0 → K_2O_S → K_2F → ⊕ k(v)^× → 0, whose étale counterpart is this sequence in degree
  two; excerpt typed from the scan.
- Thomas Geisser, *Motivic cohomology over Dedekind rings*, §1, Theorem 1.2(1) (Purity), p.
  774: “If i : Y → X is the inclusion of one of the closed fibers, then the canonical map” —
  Purity with shift 2 and twist one along a closed fibre of a Dedekind base, of which the étale
  form is used here.

## M.2 — Local/global duality and the real places

M.2 states the arithmetic comparison inputs that K-theory needs at the real places and in
degree two, keeping three theories apart: ordinary étale cohomology, positive (totally
positive) cohomology H^n_+, defined by the fibre of the restriction α to the real places, and
the kernel groups H̃^n = ker α^n of the K-book. None of them is ArithmeticGaloisDuality D7's
Tate-modified compactly supported cohomology, which is imported where needed. Poitou–Tate,
finiteness, Euler characteristics and cd bounds are imported (R02.3, R02.4, D7,
ProfiniteCohomology Layer 11); M.2 proves the K-theoretic consequences: the periodic values of
H^n(ℝ, −), α^n bijective for n ≥ 3, the Brauer group of O_S, the mod-2 dimension formulas with
the narrow Picard group and signature defect, the even-weight split surjection, ℓ-adic
finiteness, and the comparison diagram between the K₂ and étale localization sequences.

**Declarations.** `real-restriction-map`, `positive-and-modified-cohomology`, `high-degree-real-isomorphism`, `s-integer-brauer-sequence`, `mod-two-dimension-formulas`, `even-twist-real-surjection`, `adic-s-integer-cohomology`, `degree-two-localization-diagram`.

**Planets.** Real restriction maps, Real places in high degrees, Degree-two comparison diagram.

**Dependencies inside the roadmap.** `MotivicEtaleKTheory:M.1/adic-tate-twist`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/localization-gysin-sequence`, `MotivicEtaleKTheory:M.1/primewise-q-mod-z-twist`, `MotivicEtaleKTheory:M.1/s-integer-galois-comparison`.

**Dependencies on other roadmaps.** `ArithmeticGaloisDuality:D7/compact-support-without-p`, `ArithmeticGaloisDuality:R02.3/localisation-maps`, `ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound`, `ArithmeticGaloisDuality:R02.4/global-euler-characteristic`, `ArithmeticGaloisDuality:R02.4/global-finiteness`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `ArithmeticGaloisDuality:R02.4/units-cohomology-high-degree`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.3/tame-symbol-hom`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `SchemeAndStackFoundations:SF.2/cohomological-brauer`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`.

**Coverage.** planned. Refinements: Render and read §6.2 of Weibel's 'Higher wild kernels' (its text layer is unreadable) to cite Kahn's positive cohomology beside the K-book kernel groups. ArithmeticKTheory N.6 also asks M.2 for the top-degree corestriction/coinvariant statement under cd ≤ 2 and for the corrected cyclotomic ring-to-field localisation of Weibel's 'Higher wild kernels' §§4.5 and 6.11; plan them as M.2 nodes after reading that paper.

### `M.2/real-restriction-map` — Restriction to the real places ★

*Kind:* construction. *Planet:* Real restriction maps. *Library:* `TauCeti/NumberTheory/GaloisCohomology/RealPlaces`, namespace `TauCeti.RealPlaces`.

Let F be a number field with r_1 real embeddings σ : F → ℝ, S a set of places containing S_∞
and the places above 2, R = O_{F,S}, and M one of the coefficient modules ℤ/2^ν(j) =
μ_{2^ν}^{⊗j}, ℤ_2(j) or ℤ/2^∞(j) = ℚ_2/ℤ_2(j). For each real place σ the decomposition group
G_ℝ = Gal(ℂ/ℝ) ⊂ G_{F,S} gives a restriction H^{n}_et(R, M) ≅ H^{n}(G_{F,S}, M) → H^{n}(ℝ, M);
their sum is α^{n}_S(j) : H^{n}_et(R, M) → ⊕_{σ real} H^{n}(ℝ, M). The targets are periodic:
for n > 0, H^{n}(ℝ; ℤ/2^∞(j)) ≅ ℤ/2 if j − n is odd and 0 if j − n is even; H^{n}(ℝ; ℤ/2) ≅ ℤ/2
for all n ≥ 0; and, for n > 0, H^{n}(ℝ; ℤ_2(j)) ≅ ℤ/2 if n ≡ j (mod 2) and 0 otherwise. Complex
conjugation acts on ℤ_2(j) by (−1)^j.

**Hypotheses.**

- F a number field with r_1 ≥ 0 real places; S ⊇ S_∞ ∪ {v | 2}; ν ≥ 1, j ∈ ℤ.

**Construction and proof.**

1. Choose for each real place σ an extension to F_S ⊂ ℂ; the image of complex conjugation
   generates a decomposition group of order 2, well defined up to conjugacy, so restriction is
   independent of the choice.
2. Compose the comparison of M.1/s-integer-galois-comparison with restriction to these
   subgroups.
3. Compute H^{n}(ℤ/2, M) from the 2-periodic resolution of the cyclic group of order 2, with c
   acting on ℤ/2^ν(j) and ℤ_2(j) by (−1)^j.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.RealPlaces.alpha` | constructor | α^{n}_S(j) : H^{n}_et(O_{F,S}, M) → ⊕_{σ real} H^{n}(ℝ, M). |
| `TauCeti.RealPlaces.alpha_natural` | functoriality | α commutes with the maps induced by S ⊆ T and by coefficient maps. |
| `TauCeti.RealPlaces.alpha_cup` | compatibility | α is multiplicative for cup products. |
| `TauCeti.RealPlaces.realCohomology_divisible` | simp | For n > 0, H^{n}(ℝ; ℤ/2^∞(j)) ≅ ℤ/2 if j − n is odd and 0 if j − n is even. |
| `TauCeti.RealPlaces.realCohomology_modTwo` | simp | H^{n}(ℝ; ℤ/2) ≅ ℤ/2 for every n ≥ 0. |
| `TauCeti.RealPlaces.alpha_one_sign` | characterisation | On H¹(O_{F,S}, ℤ/2) ⊇ O_{F,S}^×/2, α¹ is the sign map u ↦ (sign σ(u))_σ. |

**Used by.**

- Kbook2013 VI Theorem 9.4 and Theorem 9.7: The morphism α_S of motivic spectral sequences from
  O_S to r_1 copies of ℝ is α^{p−q}_S(−q) on E_2.
- ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions and modified-mod-two-dimensions: The
  image and kernel of α¹, α² determine the mod-2 K-groups.
- MotivicEtaleKTheory:M.7/real-place-correction: Real-place correction terms in the dyadic
  comparison.

**Unit tests.**

- `RealPlaces.test_totally_imaginary` (degenerate): If r_1 = 0 the target of α^{n}_S(j) is 0.
- `RealPlaces.test_rat_sign` (computation): For F = ℚ, S = {2, ∞}: α¹(−1) ≠ 0 and α¹(2) = 0.
- `RealPlaces.test_real_periodic` (compatibility): For F = ℝ (r_1 = 1, no finite places) α is
  the identity of H^{n}(ℝ, M).
- `RealPlaces.test_parity` (non-example): H²(ℝ; ℤ/2^∞(2)) = 0 although H²(ℝ; ℤ/2) ≠ 0: the
  divisible and mod-2 targets differ, so α for ℤ/2^∞(j) is not the mod-2 α.

**Acceptance.**

- For F = ℚ and S = {2, ∞}, α^{1}_S(0) : H¹(ℤ[1/2], ℤ/2) ≅ ⟨−1, 2⟩ → H¹(ℝ, ℤ/2) = ℝ^×/ℝ^{×2}
  sends −1 to the nonzero class and 2 to 0.

**Depends on.** `MotivicEtaleKTheory:M.1/s-integer-galois-comparison`, `MotivicEtaleKTheory:M.1/adic-tate-twist`, `ArithmeticGaloisDuality:R02.3/localisation-maps`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.9, (9.2), printed
  p. 518 (PDF p. 526): “Following Tate, the r1 real embeddings of F define natural maps” —
  Definition of α^n_S(i) and the values of H^n(ℝ; ℤ/2^∞(i)).

### `M.2/positive-and-modified-cohomology` — Positive and modified étale cohomology at the real places

*Kind:* definition. *Library:* `TauCeti/NumberTheory/GaloisCohomology/RealPlaces`, namespace `TauCeti.RealPlaces`.

In the setting of real-restriction-map, three theories are kept separate. (i) Ordinary
cohomology H^{n}_et(R, M). (ii) Positive (Kahn's totally positive) cohomology H^{n}_+(R, M),
the cohomology of RΓ_+(R, M) = fibre(RΓ_et(R, M) → ⊕_{σ real} RΓ(G_ℝ, M)); it sits in the exact
sequence … → ⊕_σ H^{n−1}(ℝ, M) → H^{n}_+(R, M) → H^{n}_et(R, M) --α^n--> ⊕_σ H^{n}(ℝ, M) → … .
(iii) The kernel groups H̃^{n}(R, M) = ker(α^{n}) of K-book VI.9, which receive H^{n}_+(R, M)
surjectively with kernel coker(α^{n−1}). Neither (ii) nor (iii) is the compactly supported or
Tate-modified cohomology of ArithmeticGaloisDuality D7, which uses Tate cohomology at the real
places; for ℓ odd all three agree with ordinary cohomology.

**Hypotheses.**

- As in real-restriction-map; M a 2-primary coefficient module.
- H̃ is a subgroup of ordinary cohomology; H_+ is defined by a mapping fibre; D7's modified
  complexes are imported, not redefined.

**Construction and proof.**

1. Form the mapping fibre of α on cochain complexes (continuous cochains of G_{F,S} and of each
   G_ℝ), take cohomology, and read off the long exact sequence.
2. Define H̃^{n} = ker α^{n} and show H^{n}_+ → H^{n} factors through H̃^{n} surjectively, with
   kernel the image of ⊕ H^{n−1}(ℝ, M), i.e. coker α^{n−1}.
3. For ℓ odd the real cohomology of ℓ-primary modules vanishes in positive degrees, so all
   three theories coincide.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.RealPlaces.positiveCohomology` | constructor | H^{n}_+(R, M) as cohomology of the fibre of α on cochains. |
| `TauCeti.RealPlaces.positive_long_exact` | relation | The long exact sequence … → ⊕_σ H^{n−1}(ℝ, M) → H^{n}_+(R, M) → H^{n}(R, M) → ⊕_σ H^{n}(ℝ, M) → …. |
| `TauCeti.RealPlaces.kernelCohomology` | constructor | H̃^{n}(R, M) = ker α^{n}. |
| `TauCeti.RealPlaces.positive_to_kernel` | relation | 0 → coker α^{n−1} → H^{n}_+(R, M) → H̃^{n}(R, M) → 0 is exact. |
| `TauCeti.RealPlaces.odd_agree` | characterisation | For ℓ-primary M with ℓ odd, H^{n}_+ = H̃^{n} = H^{n}. |
| `TauCeti.RealPlaces.not_tate_modified` | other | The comparison map from D7's Tate-modified cohomology to these groups is recorded separately; no identification is asserted. |

**Used by.**

- ArithmeticKTheory:N.6 (modified-mod-two-dimensions, request: 'distinct modified H̃ and
  totally positive H₊ cohomology'): The mod-2 dimension formulas use H̃; the positive groups
  enter the positive even K-subgroup.
- Kbook2013 VI Theorem 9.4 (n = 8k + 7 row): K_{8k+7}(O_S; ℤ/2^∞) ≅ H̃¹(O_S; ℤ/2^∞(4k + 4)).
- MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions: Extension data at 2 are stated with
  these groups.

**Unit tests.**

- `RealPlaces.test_totally_imaginary_agree` (degenerate): If r_1 = 0 then H^{n}_+ = H̃^{n} =
  H^{n} for all n.
- `RealPlaces.test_rat_kernel` (computation): For F = ℚ, S = {2, ∞}, M = ℤ/2: H̃¹ is spanned by
  the class of 2 and has dimension 1.
- `RealPlaces.test_high_degree` (computation): For n ≥ 3, H̃^{n}(R, ℤ/2) = 0 (α^n is bijective)
  and H^{n}_+(R, ℤ/2) = 0 (α^{n−1} is surjective, by high-degree-real-isomorphism), although
  H^{n}(R, ℤ/2) ≅ (ℤ/2)^{r_1}.
- `RealPlaces.test_not_ordinary` (non-example): For F = ℚ, S = {2, ∞}, M = ℤ/2, n = 3: H³ ≅ ℤ/2
  but H̃³ = 0, so the kernel groups are not ordinary cohomology.

**Acceptance.**

- For F = ℚ, S = {2, ∞}, M = ℤ/2: dim H̃¹ = 1 (spanned by 2), and H¹_+ has dimension 1 = dim
  H̃¹ + dim coker α⁰ with coker α⁰ = 0.

**Depends on.** `MotivicEtaleKTheory:M.2/real-restriction-map`, `ArithmeticGaloisDuality:D7/compact-support-without-p`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.9, after Lemma
  9.3, printed p. 518 (PDF p. 526): “for the kernel of α1” — K-book's H̃¹(O_S; ℤ/2^∞(i)) := ker
  α¹_S(i), and (9.6): H̃^n(R; ℤ/2) the kernel of α^n.
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, (9.6.2), printed p.
  521 (PDF p. 529): “A diagram chase (left to Ex. 9.3” — The exact sequence relating H̃¹ to the
  narrow Picard group, which presupposes the kernel definition.

### `M.2/high-degree-real-isomorphism` — Cohomological dimension and the real places in high degrees ★

*Kind:* theorem. *Planet:* Real places in high degrees.

Let F be a number field, S ⊇ S_∞ ∪ {v | ℓ} and R = O_{F,S}. (a) If ℓ is odd, or F is totally
imaginary, then cd_ℓ(G_{F,S}) ≤ 2, so H^{n}_et(R, M) = 0 for n ≥ 3 and every ℓ-primary torsion
module M. (b) For ℓ = 2 and every finite or divisible 2-primary module M, α^{n}_S : H^{n}_et(R,
M) → ⊕_σ H^{n}(ℝ, M) is an isomorphism for n ≥ 3. (c) α^{2}_S(i) is an isomorphism for M =
ℤ/2^∞(i) and i ≥ 2, and α² : H²_et(R, ℤ/2) → ⊕_σ H²(ℝ, ℤ/2) is surjective. Here cd_ℓ is
ProfiniteCohomology Layer 11's cohomological dimension.

**Hypotheses.**

- F a number field; S ⊇ S_∞ ∪ {v | ℓ}; M an ℓ-primary torsion G_{F,S}-module.

**Construction and proof.**

1. (a) is ArithmeticGaloisDuality R02.4's cohomological-dimension bound for G_{F,S},
   transported by M.1/s-integer-galois-comparison.
2. (b) is the high-degree part of Poitou–Tate (R02.4/units-cohomology-high-degree and
   R02.4/poitou-tate): for n ≥ 3 the localisation H^{n}(G_{F,S}, M) → ⊕_{v real} H^{n}(F_v, M)
   is bijective (NSW (8.6.10)(ii); Milne ADT I.4.10).
3. (c): for i ≥ 2 use K-book Exercise 9.1: compare with F(√−1), where H² of ℤ/2^∞(i) vanishes,
   deduce that H²(R; ℤ/2^∞(i)) has exponent 2, and read off the Kummer sequence with the H³
   values from (b); the surjectivity of α² for ℤ/2 is K-book Exercise 9.2 (Tate–Poitou).

**Acceptance.**

- For F = ℚ, S = {2, ∞}: H³_et(ℤ[1/2], ℤ/2) ≅ ℤ/2 = H³(ℝ, ℤ/2).
- For F = ℚ(i) and ℓ = 2, H^{n}_et(O_{F,S}, ℤ/2) = 0 for n ≥ 3.

**Depends on.** `MotivicEtaleKTheory:M.2/real-restriction-map`, `ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound`, `ArithmeticGaloisDuality:R02.4/units-cohomology-high-degree`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `MotivicEtaleKTheory:M.1/s-integer-galois-comparison`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.9, after (9.2),
  printed p. 518 (PDF p. 526): “This map is an isomorphism for all n ≥ 3 by Tate-Poitou
  duality” — Part (b); 'It is also an isomorphism for n = 2 and i ≥ 2, as shown in Exercise
  9.1' is part (c).
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.8.2 proof, printed
  p. 513 (PDF p. 521): “unless ℓ = 2 and r1 > 0 (F has a real embedding)” — Part (a).
- Jürgen Neukirch, Alexander Schmidt, Kay Wingberg, *Cohomology of Number Fields*, VIII §6,
  (8.6.10), PDF p. 503: “Long Exact Sequence of Poitou-Tate” — Source of the high-degree
  localisation isomorphism.

### `M.2/s-integer-brauer-sequence` — The Brauer group of a ring of S-integers

*Kind:* theorem.

Let F be a number field, S a finite set of places containing S_∞ and at least one finite place,
and O_S = O_{F,S}. Then the cohomological Brauer group Br'(O_S) = H²_et(Spec O_S, G_m)
(SchemeAndStackFoundations SF.2) fits into the exact sequence 0 → Br'(O_S) → (ℤ/2)^{r_1} ⊕ ⊕_{v
∈ S finite} ℚ/ℤ --add--> ℚ/ℤ → 0, where the maps to the summands are the local invariants inv_v
(ℤ/2 = ½ℤ/ℤ at real places) and the last map is the sum. In particular, for ℓ odd, Br'(O_S)[ℓ]
≅ (ℤ/ℓ)^{s−1} with s the number of finite places in S.

**Hypotheses.**

- F a number field; S finite, S ⊇ S_∞, S containing at least one finite place.

**Construction and proof.**

1. Compare Br'(O_S) with Br(F) via the localization sequence of M.1/localization-gysin-sequence
   with G_m-coefficients: purity gives 0 → Br'(O_S) → Br(F) → ⊕_{v ∉ S} H¹(k(v), ℚ/ℤ) = ⊕_{v∉S}
   ℚ/ℤ, the last map being the residue (= local invariant at v).
2. Insert the Brauer–Hasse–Noether sequence 0 → Br(F) → ⊕_v Br(F_v) → ℚ/ℤ → 0 of
   ClassFieldTheory Layer 10, with Br(F_v) = ℚ/ℤ at finite v, ½ℤ/ℤ at real v, 0 at complex v.
3. A diagram chase gives the stated sequence; surjectivity of the sum map uses one finite place
   in S.

**Acceptance.**

- For O_S = ℤ[1/2]: r_1 = 1 and S_f = {2}, so Br'(ℤ[1/2]) ≅ ℤ/2, the kernel of ℤ/2 ⊕ ℚ/ℤ → ℚ/ℤ.

**Depends on.** `MotivicEtaleKTheory:M.1/localization-gysin-sequence`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `SchemeAndStackFoundations:SF.2/cohomological-brauer`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.8.1, (8.1.1),
  printed p. 513 (PDF p. 521): “The Brauer group of OS is determined by the sequence” — The
  displayed sequence (8.1.1) 0 → Br(O_S) → (ℤ/2)^{r_1} ⊕ ∐_{v∈S finite} ℚ/ℤ → ℚ/ℤ → 0.

### `M.2/mod-two-dimension-formulas` — Mod-2 dimensions, the narrow Picard group and the signature defect

*Kind:* theorem.

Let F be a number field with r_1 > 0 real and r_2 complex places, R = O_{F,S} with 1/2 ∈ R, s
the number of finite places in S, t = dim_{𝔽_2} Pic(R)/2 and u = dim_{𝔽_2} Pic^+(R)/2, where
Pic^+(R) is the narrow Picard group (cokernel of the restricted divisor map F^×_+ → ⊕_{𝔭 ∉ S}
ℤ). Then (a) dim H¹_et(R, ℤ/2) = r_1 + r_2 + s + t and dim H²_et(R, ℤ/2) = r_1 + s + t − 1; (b)
there is an exact sequence 0 → H̃¹(R; ℤ/2) → H¹(R; ℤ/2) --α¹--> (ℤ/2)^{r_1} → Pic^+(R)/2 →
Pic(R)/2 → 0; (c) the signature defect j(R) = dim coker α¹ satisfies u = t + j(R) and 0 ≤ j(R)
< r_1; (d) dim H̃¹(R, ℤ/2) = r_2 + s + u and dim H̃²(R, ℤ/2) = t + s − 1.

**Hypotheses.**

- F a number field with r_1 > 0; S ⊇ S_∞ ∪ {v | 2} finite.

**Construction and proof.**

1. (a): Kummer theory (M.1/etale-kummer-sequences) with the S-unit theorem (rank r_1 + r_2 + s
   − 1 plus μ(F)/2 = ℤ/2) for H¹, and the Brauer sequence (s-integer-brauer-sequence) with
   Pic(R)/2 for H².
2. (b): the diagram chase of K-book (9.6.2) comparing the sign map on units with the narrow and
   ordinary Picard groups.
3. (c) and (d): read off from (b) and the surjectivity of α² (high-degree-real-isomorphism
   (c)).

**Acceptance.**

- For R = ℤ[1/2]: r_1 = 1, r_2 = 0, s = 1, t = u = 0, j = 0, so dim H¹ = 2, dim H² = 1, dim H̃¹
  = 1, dim H̃² = 0.

**Depends on.** `MotivicEtaleKTheory:M.2/positive-and-modified-cohomology`, `MotivicEtaleKTheory:M.2/s-integer-brauer-sequence`, `MotivicEtaleKTheory:M.2/high-degree-real-isomorphism`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.9, after (9.6.2),
  printed p. 521 (PDF p. 529): “If s denotes the number of finite places of OS , then dim H 1
  (OS ; Z/2)” — Part (a); Lemma 9.6.3 gives part (d).
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, Definition 9.6.1,
  printed p. 520 (PDF p. 528): “The signature defect j(R) of R is defined to be the dimension
  of the cokernel of α1” — Part (c).

### `M.2/even-twist-real-surjection` — Surjectivity onto the real places in even weight

*Kind:* lemma.

Let F be a number field with r_1 > 0 and i even. Then α¹(i) : H¹(F, ℤ/2^∞(i)) → ⊕_σ H¹(ℝ,
ℤ/2^∞(i)) ≅ (ℤ/2)^{r_1} is a split surjection, and for all sufficiently large finite S, H¹(O_S;
ℤ/2^∞(i)) ≅ (ℤ/2)^{r_1} ⊕ H̃¹(O_S; ℤ/2^∞(i)).

**Hypotheses.**

- F a number field with r_1 > 0; i even; S large enough (containing enough finite places).

**Construction and proof.**

1. By weak approximation for units of F the sign map F^×/F^{×2} → ⊕_σ ℝ^×/ℝ^{×2} is split
   surjective.
2. Compare via F^×/F^{×2} ≅ H¹(F, ℤ/2) → H¹(F, ℤ/2^∞(i)) and the isomorphism H¹(ℝ, ℤ/2) ≅ H¹(ℝ,
   ℤ/2^∞(i)) for i even (K-book Lemma 9.3).
3. Pass to O_S using F^×/F^{×2} = colim_S O_S^×/O_S^{×2}.

**Acceptance.**

- For F = ℚ and i = 2: −1 ∈ ℚ^× maps to the generator of H¹(ℝ, ℤ/2^∞(2)) ≅ ℤ/2.

**Depends on.** `MotivicEtaleKTheory:M.2/real-restriction-map`, `MotivicEtaleKTheory:M.2/positive-and-modified-cohomology`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, Lemma VI.9.3, printed
  p. 518 (PDF p. 526): “For even i, H 1 (F ; Z/2∞ (i))” — Statement of Lemma 9.3, with the
  splitting for sufficiently large S.

### `M.2/adic-s-integer-cohomology` — ℓ-adic cohomology of S-integers: finiteness and rationalisation

*Kind:* theorem.

Let F be a number field, ℓ a prime, S ⊇ S_∞ ∪ {v | ℓ} finite and R = O_{F,S}. For every j ∈ ℤ
and n ≥ 0: (a) H^{n}_et(R, μ_{ℓ^ν}^{⊗j}) is finite, so H^{n}_cont(R, ℤ_ℓ(j)) = lim_ν
H^{n}_et(R, μ_{ℓ^ν}^{⊗j}) is a finitely generated ℤ_ℓ-module; (b) H^{n}_cont(R, ℚ_ℓ(j)) =
H^{n}_cont(R, ℤ_ℓ(j)) ⊗ ℚ_ℓ; (c) the torsion subgroup is H^{n}_cont(R, ℤ_ℓ(j))_tors ≅
coker(H^{n−1}_cont(R, ℚ_ℓ(j)) → H^{n−1}_et(R, ℚ_ℓ/ℤ_ℓ(j))); in particular for j ≠ 0, H¹_cont(R,
ℤ_ℓ(j))_tors ≅ H⁰(R, ℚ_ℓ/ℤ_ℓ(j)) = ℤ/w_j^{(ℓ)}(F). (d) Tate's Euler characteristic formula
gives rank H¹_cont(R, ℤ_ℓ(j)) − rank H²_cont(R, ℤ_ℓ(j)) = r_2 for j even and r_1 + r_2 for j
odd, j ≠ 0, when ℓ is odd.

**Hypotheses.**

- F a number field; S ⊇ S_∞ ∪ {v | ℓ} finite; j ∈ ℤ.
- (d) for ℓ odd (for ℓ = 2 with real places the real contributions are added as in K-book
  VI.9).

**Construction and proof.**

1. (a) ArithmeticGaloisDuality R02.4/global-finiteness for finite coefficients, then
   M.1/continuous-limit-comparison (a) (the lim^1 term vanishes) and Nakayama for the compact
   ℤ_ℓ-module.
2. (b) M.1/continuous-limit-comparison (c).
3. (c) the long exact sequence of 0 → ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0; for n = 1 and j ≠ 0,
   H⁰(R, ℚ_ℓ(j)) = 0 because the cyclotomic character has infinite image.
4. (d) the global Euler characteristic formula R02.4/global-euler-characteristic applied to
   μ_{ℓ^ν}^{⊗j}, passed to the limit.

**Acceptance.**

- For F = ℚ, ℓ = 3, j = 2: H¹_cont(ℤ[1/3], ℤ_3(2))_tors ≅ ℤ/3 = ℤ/w_2^{(3)}(ℚ).

**Depends on.** `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `MotivicEtaleKTheory:M.1/s-integer-galois-comparison`, `MotivicEtaleKTheory:M.1/primewise-q-mod-z-twist`, `ArithmeticGaloisDuality:R02.4/global-finiteness`, `ArithmeticGaloisDuality:R02.4/global-euler-characteristic`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI Exercise 8.3,
  printed p. 516 (PDF p. 524): “Let ℓ be an odd prime and F a number field. If i > 1, show that
  for every ring OS of integers in F containing 1/ℓ,” — The torsion of H¹(O_S, ℤ_ℓ(i)) is
  ℤ/w_i^{(ℓ)}(F) and its rank is r_2 or r_1 + r_2; this node proves the cohomological parts
  that do not need K-theory.
- Jürgen Neukirch, Alexander Schmidt, Kay Wingberg, *Cohomology of Number Fields*, II §7,
  (2.7.6), PDF p. 156: “If H i (G, An ) is finite for all n” — Limit step in (a).

### `M.2/degree-two-localization-diagram` — The degree-two comparison diagram of localization sequences ★

*Kind:* theorem. *Planet:* Degree-two comparison diagram.

Let F be a number field, S ⊇ S_∞ finite, O_S = O_{F,S}, and m = ℓ^r with ℓ invertible on O_S.
The diagram whose top row is K2SymbolsBrauer's tame-kernel sequence reduced mod m, K_2(O_S)/m →
K_2(F)/m --(∂_v)--> ⊕_{v∉S} k(v)^×/m → 0, and whose bottom row is the étale localization
sequence H²_et(O_S, μ_m^{⊗2}) → H²(F, μ_m^{⊗2}) --(∂_v)--> ⊕_{v∉S} H¹(k(v), μ_m) → H³_et(O_S,
μ_m^{⊗2}), with vertical maps the Galois symbol h (M.3) on the first two columns and the Kummer
isomorphism k(v)^×/m ≅ H¹(k(v), μ_m) on the third, commutes up to the sign fixed by the residue
conventions: ∂_v ∘ h_F = −κ_{k(v)} ∘ ∂^{tame}_v. The first vertical map is the unique map
making the left square commute, and the third is an isomorphism; H³_et(O_S, μ_m^{⊗2}) = 0 when
ℓ is odd or F is totally imaginary.

**Hypotheses.**

- F a number field; S ⊇ S_∞; m = ℓ^r invertible on O_S.
- The tame symbol convention is K2SymbolsBrauer T.3's; the cohomological residue is M.1's.

**Construction and proof.**

1. The top row is exact by K2SymbolsBrauer T.5/s-integer-tame-kernel-sequence (Tate's (5.3))
   and right exactness of ⊗ ℤ/m; the bottom row is the degree-two part of
   M.1/localization-gysin-sequence for B = Spec O_S, colimit over Z.
2. Commutativity of the right square is M.3/symbol-residue-compatibility evaluated on symbols
   {u, π} and {u, w} with u, w units at v, since K_2(F) is generated by symbols (Matsumoto).
3. The left vertical map is induced because the bottom-left map is injective modulo the image
   of H¹(F, μ_m^{⊗2}) → ⊕ H⁰(k(v), μ_m^{⊗1}), and the K₂ classes in the kernel of ∂ land in the
   image of H²_et(O_S); vanishing of H³ is high-degree-real-isomorphism (a).

**Acceptance.**

- For F = ℚ, S = {ℓ, ∞}, ℓ odd: the diagram identifies K_2(ℤ[1/ℓ])/ℓ with H²_et(ℤ[1/ℓ],
  μ_ℓ^{⊗2}), both being determined by the tame symbols at primes ≠ ℓ.

**Depends on.** `MotivicEtaleKTheory:M.1/localization-gysin-sequence`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `MotivicEtaleKTheory:M.2/high-degree-real-isomorphism`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `K2SymbolsBrauer:T.3/tame-symbol-hom`, `K2SymbolsBrauer:T.2/matsumoto`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, §5, (5.3), p. 269: “The map d^S is
  surjective by a theorem of Moore” — Tate's sequence (5.3) 0 → K_2O_S → K_2F → ∐_{v∉S} k(v)^×
  → 0 is the top row; excerpt typed from the scan.
- John Tate, *Relations between K2 and Galois cohomology*, §6, proof of (6.2), p. 270: “The
  square commutes because, for z ∈ μ_l and a ∈ F, we have by definition of the tame symbol” —
  Tate's own comparison of the tame symbol with the cohomological side; excerpt typed from the
  scan.

## M.3 — Tate's degree-two arithmetic theorem

M.3 is the single owner (RT-AREA-ktheory-1/8) of the Galois symbol for every field, of its
symbol formula and cohomological Steinberg relation, and of Tate's theorems: local, global (mod
ℓ, ℓ-adic, and prime powers), and for rings of S-integers, each a separate declaration with its
hypotheses. K2SymbolsBrauer T.7 imports the symbol and keeps the Kummer/cup-product reading,
the Hilbert-symbol normalisation and the Chern-class sign (T.7/chern-class-agreement: c_{2,2} =
−h_F). Norm compatibility uses K2SymbolsBrauer T.4's Milnor norms and Tate's projection
formula; residue compatibility uses T.3's tame symbol and M.1's cohomological residue.

**Declarations.** `cohomological-steinberg`, `galois-symbol`, `adic-galois-symbol`, `symbol-norm-compatibility`, `symbol-residue-compatibility`, `tate-local`, `tate-global`, `tate-torsion-symbols`, `tate-s-integer`, `tate-picard-sequence`.

**Planets.** Cohomological Steinberg relation, Galois symbol, Tate's local theorem, Tate's global theorem, Tate's S-integer theorem.

**Dependencies inside the roadmap.** `MotivicEtaleKTheory:M.1/adic-tate-twist`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/localization-gysin-sequence`, `MotivicEtaleKTheory:M.1/twisted-cohomology-ring`, `MotivicEtaleKTheory:M.2/adic-s-integer-cohomology`, `MotivicEtaleKTheory:M.2/degree-two-localization-diagram`, `MotivicEtaleKTheory:M.2/high-degree-real-isomorphism`.

**Dependencies on other roadmaps.** `K2SymbolsBrauer:T.1/k2-definition`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison`, `K2SymbolsBrauer:T.3/tame-symbol-hom`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/p-closed-generation`, `K2SymbolsBrauer:T.4/prime-to-p-closure`, `K2SymbolsBrauer:T.4/transfer-base-change`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.

**Coverage.** planned. Refinements: Lemma-level refinement of tate-global into Tate's Lemma (5.2) and Proposition (4.5) nodes.

### `M.3/cohomological-steinberg` — The cohomological Steinberg relation ★

*Kind:* theorem. *Planet:* Cohomological Steinberg relation.

Let F be a field and m ≥ 1 invertible in F, and let κ : F^× → H¹(F, μ_m) be the Kummer map (Tau
Ceti's kummerMap). For every a ∈ F with a ≠ 0, 1, κ(a) ∪ κ(1 − a) = 0 in H²(F, μ_m^{⊗2}), the
cup product being that of M.1/twisted-cohomology-ring. The same holds for Tate's ℓ-adic
classes: d_F a ∪ d_F(1 − a) = 0 in H²(F, ℤ_ℓ(2)) for ℓ ≠ char F.

**Hypotheses.**

- F a field, m invertible in F (ℓ ≠ char F in the adic form); a ∈ F ∖ {0, 1}.

**Construction and proof.**

1. Factor t^m − a = ∏ f_i(t) into monic irreducibles in F[t] (separable since m is invertible),
   let x_i be a root of f_i and F_i = F(x_i); then 1 − a = ∏_i N_{F_i/F}(1 − x_i).
2. By the projection formula (M.1/twisted-cohomology-ring; Tau Ceti's
   explicitCup_projection11), κ(a) ∪ κ(N_{F_i/F}(1 − x_i)) = cor_{F_i/F}(κ(a) ∪ κ(1 − x_i)) =
   cor_{F_i/F}(m·κ(x_i) ∪ κ(1 − x_i)) since a = x_i^m in F_i.
3. H²(F, μ_m^{⊗2}) has exponent m, so each term vanishes. For the adic form Tate shows the
   subgroup D_F generated by such transfers is ℓ-divisible and uses Proposition 2.1 (no nonzero
   divisible subgroup in the image).

**Acceptance.**

- For F = ℚ, m = 2, a = 2: κ(2) ∪ κ(−1) = 0 in H²(ℚ, μ_2^{⊗2}) = Br(ℚ)[2], i.e. the quaternion
  algebra (2, −1) is split.
- For F = ℝ, m = 2: no a ∈ ℝ ∖ {0, 1} has both a < 0 and 1 − a < 0, consistent with κ(−1) ∪
  κ(−1) ≠ 0.

**Depends on.** `MotivicEtaleKTheory:M.1/twisted-cohomology-ring`, `MotivicEtaleKTheory:M.1/adic-tate-twist`, `tauceti:TauCeti.kummerMap`, `tauceti:TauCeti.ContCohomology.explicitCup_projection11`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, Proposition
  III.6.10.3 and proof, printed pp. 242-243 (PDF pp. 250-251): “It suffices to show that a ∪ (1
  − a) vanishes for” — The proof via factorisation of t^m − a and the projection formula.
- John Tate, *Relations between K2 and Galois cohomology*, (3.1) Theorem and proof, pp.
  262-263: “(*) (a, 1−a)_F = 0, if a ∈ F^*, a ≠ 1.” — The adic form; excerpt typed from the
  scan.

### `M.3/galois-symbol` — The Galois symbol on K₂ of a field ★

*Kind:* construction. *Planet:* Galois symbol. *Library:* `TauCeti/KTheory/GaloisSymbol`, namespace `TauCeti.GaloisSymbol`.

Let F be a field and m ≥ 1 invertible in F. The Galois symbol (norm residue symbol of degree
two) is the unique homomorphism h_{F,m} : K_2(F)/m → H²(F, μ_m^{⊗2}) with h_{F,m}{a, b} = κ(a)
∪ κ(b) for all a, b ∈ F^×, where K_2(F) is classical K₂ (K2SymbolsBrauer T.1) presented by
Matsumoto's theorem (K2SymbolsBrauer T.2/matsumoto) and κ is the Kummer map. It is natural for
field extensions (restriction), compatible with change of m (for m | m', reduction μ_{m'}^{⊗2}
→ μ_m^{⊗2} corresponds to K_2(F)/m' → K_2(F)/m), and for m = ℓ it is Tate's h_1 of diagram
(3.3). The Chern-class description h_{F,m} = −c_{2,2} is K2SymbolsBrauer
T.7/chern-class-agreement, which consumes this node.

**Hypotheses.**

- F a field; m invertible in F. No primitive m-th root of unity is assumed.

**Construction and proof.**

1. The pairing (a, b) ↦ κ(a) ∪ κ(b) is bilinear (κ is a homomorphism and the cup product is
   bilinear).
2. It satisfies the Steinberg relation by cohomological-steinberg, hence factors through K_2(F)
   by Matsumoto's presentation, and through K_2(F)/m since the target has exponent m.
3. Naturality and change of m follow from naturality of κ and of the cup product.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GaloisSymbol.symbol` | constructor | h_{F,m} : K_2(F)/m → H²(F, μ_m^{⊗2}). |
| `TauCeti.GaloisSymbol.symbol_steinberg` | simp | h_{F,m}{a, b} = κ(a) ∪ κ(b). |
| `TauCeti.GaloisSymbol.symbol_unique` | extensionality | Two homomorphisms K_2(F)/m → A agreeing on all Steinberg symbols are equal. |
| `TauCeti.GaloisSymbol.symbol_res` | functoriality | res_{E/F} ∘ h_{F,m} = h_{E,m} ∘ (K_2(F) → K_2(E)) for every field extension E/F. |
| `TauCeti.GaloisSymbol.symbol_reduce` | functoriality | For m ∣ m', reduction of coefficients intertwines h_{F,m'} and h_{F,m}. |
| `TauCeti.GaloisSymbol.symbol_skew` | relation | h{a, b} = −h{b, a} and h{a, −a} = 0. |

**Used by.**

- K2SymbolsBrauer:T.7/symbol-formula, brauer-valued-symbol, chern-class-agreement: T.7 imports
  the general-field symbol and identifies its formula and sign with the pinned Kummer map and
  the Chern class.
- ArithmeticKTheory:N.6/the-two-primary-corrections and
  N.7/tame-kernel-vanishing-at-a-regular-prime: Tate's comparison through this symbol.
- HabiroNumberFields:HB.2/etale-bloch-group-and-K2: K_2(F)/n ≅ H²(F, ℤ/n(2)) through this map.
- MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees: The degree-two component of the
  all-degree norm residue map is this symbol.

**Unit tests.**

- `GaloisSymbol.test_one` (degenerate): h{1, b} = 0 for every b, and for m = 1 the symbol is
  the zero map between zero groups.
- `GaloisSymbol.test_hamilton` (computation): For F = ℝ and m = 2, h{−1, −1} ≠ 0 (Hamilton's
  quaternions are not split).
- `GaloisSymbol.test_explicitCup11` (compatibility): h{a, b} = explicitCup11(kummerMap a,
  kummerMap b) for the tensor pairing KummerCoeff × KummerCoeff → μ_m^{⊗2} (Tau Ceti's
  low-degree model).
- `GaloisSymbol.test_not_untwisted` (non-example): For F = ℚ and m = 4, the target H²(ℚ,
  μ_4^{⊗2}) is not H²(ℚ, μ_4): the two G_ℚ-modules differ, so a definition with untwisted μ_m
  coefficients changes the group.

**Acceptance.**

- h_{ℚ,2}{−1, −1} ≠ 0: its image in Br(ℝ)[2] is the class of Hamilton's quaternions.
- h_{F,m}{a, −a} = 0 for all a ∈ F^×.

**Depends on.** `MotivicEtaleKTheory:M.3/cohomological-steinberg`, `MotivicEtaleKTheory:M.1/twisted-cohomology-ring`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.1/k2-definition`, `tauceti:TauCeti.kummerMap`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, Proposition
  III.6.10.3, printed p. 242 (PDF p. 250): “The bilinear pairing (6.10.2) induces a” —
  Statement: the pairing induces a Steinberg symbol K_2(F)/mK_2(F) → H²(F; μ_m^{⊗2}) for every
  m prime to char(F).

### `M.3/adic-galois-symbol` — Tate's ℓ-adic Galois symbol

*Kind:* construction. *Library:* `TauCeti/KTheory/GaloisSymbol`, namespace `TauCeti.GaloisSymbol`.

Let F be a field and ℓ ≠ char F a prime. Tate's adic Galois symbol is the unique homomorphism
h_F : K_2(F) → H²(F, ℤ_ℓ(2)) with h_F{a, b} = d_F a ∪ d_F b, where d_F : F^× → H¹(F, ℤ_ℓ(1)) is
the connecting map of 0 → ℤ_ℓ(1) → lim F_s^× --ℓ--> … (Tate §3), equivalently the limit of the
Kummer maps. Its reduction modulo ℓ^ν, composed with H²(F, ℤ_ℓ(2))/ℓ^ν → H²(F, μ_{ℓ^ν}^{⊗2}),
is the Galois symbol h_{F,ℓ^ν}.

**Hypotheses.**

- F a field; ℓ ≠ char F prime.

**Construction and proof.**

1. Define d_F as the limit over ν of Kummer maps into H¹(F, μ_{ℓ^ν}) and identify it with the
   connecting map into H¹(F, ℤ_ℓ(1)) (M.1/continuous-limit-comparison).
2. Bilinearity is clear; the Steinberg relation is cohomological-steinberg (adic form), so
   Matsumoto's presentation gives h_F.
3. Compatibility with the mod-ℓ^ν symbol is naturality of the cup product under reduction of
   coefficients.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GaloisSymbol.adicSymbol` | constructor | h_F : K_2(F) → H²(F, ℤ_ℓ(2)). |
| `TauCeti.GaloisSymbol.adicSymbol_steinberg` | simp | h_F{a, b} = d_F a ∪ d_F b. |
| `TauCeti.GaloisSymbol.adicSymbol_reduce` | compatibility | Reducing h_F mod ℓ^ν gives h_{F,ℓ^ν}. |
| `TauCeti.GaloisSymbol.adicSymbol_divisible` | relation | h_F vanishes on the ℓ-divisible subgroup of K_2(F) (Tate (3.5)(a)). |
| `TauCeti.GaloisSymbol.adicSymbol_res` | functoriality | Natural for field extensions. |

**Used by.**

- Tate1976 (3.5), (5.4): The l-primary part of K_2 of a global field is identified with the
  torsion of H²(F, Z_l(2)) through h.
- HabiroNumberFields:HB.2 (request to M.3): K_2(F)[n] ≅ H²(F, ℤ_p(2))[n] for n = p^m.
- SpecialValuesBirchTate:B.4/k2-ell-part-as-etale-cohomology: ℓ-parts of K_2(O_F) as étale
  cohomology, compatibly in r.

**Unit tests.**

- `GaloisSymbol.test_adic_one` (degenerate): h_F{1, b} = 0.
- `GaloisSymbol.test_adic_closed` (computation): For F algebraically closed, H²(F, ℤ_ℓ(2)) = 0,
  so h_F = 0.
- `GaloisSymbol.test_adic_reduce` (compatibility): For F = ℚ, ℓ = 2, ν = 1: the reduction of
  h_ℚ{−1, −1} is h_{ℚ,2}{−1, −1} ≠ 0.
- `GaloisSymbol.test_adic_not_injective` (non-example): For F a local field, h_F is not
  injective on K_2(F): it kills the uncountable divisible summand of Moore's decomposition.

**Acceptance.**

- h_F is zero on the ℓ-divisible subgroup of K_2(F) (Tate (3.5)(a)), e.g. on all of K_2(ℂ).

**Depends on.** `MotivicEtaleKTheory:M.3/cohomological-steinberg`, `MotivicEtaleKTheory:M.3/galois-symbol`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `K2SymbolsBrauer:T.2/matsumoto`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, (3.1) Theorem, p. 262: “There exists
  a unique homomorphism” — h = h_F : K_2F → H²(F, Z_l(2)) such that h({a, b}) = d_F a ∪ d_F b;
  excerpt typed from the scan.

### `M.3/symbol-norm-compatibility` — The Galois symbol commutes with norms

*Kind:* theorem.

Let E/F be a finite extension of fields and m invertible in F. Let N_{E/F} : K_2(E) → K_2(F) be
the Milnor norm (transfer) of K2SymbolsBrauer T.4, which agrees with Quillen's transfer on K₂
(K2SymbolsBrauer T.3/milnor-quillen-transfer-comparison). Then cor_{E/F} ∘ h_{E,m} = h_{F,m} ∘
N_{E/F} : K_2(E)/m → H²(F, μ_m^{⊗2}), where cor is corestriction for E/F separable and, for E/F
purely inseparable of degree p^a, cor is multiplication by p^a after the identification G_E =
G_F. On symbols with one entry from F this is Tate's Lemma (3.2): cor_{E/F} h_E{a, b} = h_F{a,
N_{E/F} b} for a ∈ F^×, b ∈ E^×.

**Hypotheses.**

- E/F finite; m invertible in F.

**Construction and proof.**

1. Symbols {a, b} with a ∈ F^×: projection formula (M.1/twisted-cohomology-ring) and N_{E/F}{a,
   b} = {a, N_{E/F}b} (K2SymbolsBrauer T.4/milnor-projection-formula); this is Tate's Lemma
   (3.2).
2. Reduce to [E : F] prime: both sides are transitive in towers (Kato's transitivity,
   T.4/milnor-transfer-transitivity, and transitivity of cor).
3. For ℓ-primary torsion pass to the prime-to-ℓ closure F' of F (T.4/prime-to-p-closure):
   res_{F'/F} is injective on ℓ-primary groups since cor ∘ res = [F' : F] prime to ℓ.
4. Over such a field an extension of prime degree ℓ has K_2(E) generated by symbols {a, b} with
   a ∈ F (T.4/p-closed-generation), so step one applies; extensions of degree prime to ℓ are
   handled by the base change formula T.4/transfer-base-change.

**Acceptance.**

- For E = F(√d) with F = ℚ, m = 2: cor h_E{−1, √d} = h_ℚ{−1, N(√d)} = h_ℚ{−1, −d}.

**Depends on.** `MotivicEtaleKTheory:M.3/galois-symbol`, `MotivicEtaleKTheory:M.1/twisted-cohomology-ring`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/prime-to-p-closure`, `K2SymbolsBrauer:T.4/p-closed-generation`, `K2SymbolsBrauer:T.4/transfer-base-change`, `K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, (3.2) Lemma, p. 263: “Let E/F be a
  finite subextension of F_s/F. Let a ∈ F^* and b ∈ E^*. Then tr_{E/F}(a, b)_E = (a, N_{E/F}
  b)_F.” — Tate's projection formula on symbols; excerpt typed from the scan.
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, III.6.10, (6.10.2),
  printed p. 242 (PDF p. 250): “which satisfies the following projection formula” — The
  projection formula tr_{E/F}(a ∪ b) = a ∪ N_{E/F}(b).

### `M.3/symbol-residue-compatibility` — The Galois symbol commutes with residues

*Kind:* theorem.

Let F be a field with a discrete valuation v, residue field k(v) and uniformiser π, and let m
be invertible in k(v). Let ∂^{tame}_v : K_2(F) → k(v)^× be K2SymbolsBrauer's tame symbol
homomorphism (T.3/tame-symbol-hom; with its convention ∂^{tame}_v{u, π} = ū for a v-unit u) and
∂_v : H²(F, μ_m^{⊗2}) → H¹(k(v), μ_m) the residue of M.1/localization-gysin-sequence. Then ∂_v
∘ h_{F,m} = −κ_{k(v)} ∘ ∂^{tame}_v mod m, i.e. ∂_v(κ(u) ∪ κ(π)) = −κ_{k(v)}(ū) and ∂_v(κ(u) ∪
κ(w)) = 0 for v-units u, w.

**Hypotheses.**

- (F, v) a discretely valued field; m invertible in the residue field.

**Construction and proof.**

1. Both sides are bilinear and Steinberg, so it suffices to check on {u, π} and {u, w} (K_2(F)
   is generated by these, Matsumoto).
2. For units u, w, κ(u) ∪ κ(w) is unramified (comes from H²_et of the henselised valuation
   ring), so its residue is 0.
3. For {u, π}: by M.1/localization-gysin-sequence, ∂_v(κ(u) ∪ x) = −κ(ū) ∪ ∂_v(x) and ∂_v(κ(π))
   = 1, giving −κ(ū); the tame symbol gives ū.

**Acceptance.**

- For F = ℚ, v = 3, m = 2: ∂_3 h{−1, 3} = −κ_{𝔽_3}(−1) ≠ 0 in H¹(𝔽_3, μ_2) = 𝔽_3^×/𝔽_3^{×2}.

**Depends on.** `MotivicEtaleKTheory:M.3/galois-symbol`, `MotivicEtaleKTheory:M.1/localization-gysin-sequence`, `K2SymbolsBrauer:T.3/tame-symbol-hom`, `K2SymbolsBrauer:T.2/matsumoto`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, §6, proof of (6.2), p. 270: “we have
  by definition of the tame symbol” — Tate compares (d^S γ(z⊗a))_v = d_v{z, a} = z^{v(a)} with
  the cohomological side in proving (6.2); excerpt typed from the scan.

### `M.3/tate-local` — Tate's theorem for local fields ★

*Kind:* theorem. *Planet:* Tate's local theorem.

Let F be a locally compact non-discrete field (a finite extension of ℚ_p or 𝔽_p((t)), or ℝ, or
ℂ) and ℓ ≠ char F a prime. Then h_{F,ℓ} : K_2(F)/ℓ → H²(F, μ_ℓ^{⊗2}) is bijective. If μ_ℓ ⊂ F
then H²(F, μ_ℓ^{⊗2}) ≅ μ_ℓ ⊗ Br(F)[ℓ] and, under this identification with a primitive root z,
h_{F,ℓ}{a, b} = z ⊗ (a, b), the class of the cyclic algebra A_z(a, b).

**Hypotheses.**

- F locally compact non-discrete; ℓ ≠ char F prime.
- The prime-power statement for local fields is the degree-two case of M.5's norm residue
  theorem; it is not claimed here.

**Construction and proof.**

1. Reduce to μ_ℓ ⊂ F: for E = F(μ_ℓ), [E : F] is prime to ℓ, and the transfer argument of
   Tate's Lemma (3.4)/(4.1) shows bijectivity for E implies it for F.
2. With μ_ℓ ⊂ F, identify H² with μ_ℓ ⊗ Br_ℓ(F) (Kummer, M.1/etale-kummer-sequences for Spec F)
   and h with the cyclic algebra symbol (Tate (4.2)).
3. For local F, Br_ℓ(F) is cyclic (ClassFieldTheory Layer 5: Br(F) ≅ ℚ/ℤ for nonarchimedean F,
   ½ℤ/ℤ for ℝ), so Tate's Proposition (4.5) verifies the criterion (4.4) and h is injective;
   surjectivity because every class of order ℓ is split by a cyclic extension of degree ℓ
   (local class field theory).

**Acceptance.**

- For F = ℝ and ℓ = 2: K_2(ℝ)/2 ≅ ℤ/2 generated by {−1, −1}, mapping to Hamilton's quaternions.
- For F = ℚ_p, ℓ odd with μ_ℓ ⊂ ℚ_p: K_2(ℚ_p)/ℓ ≅ μ_ℓ.

**Depends on.** `MotivicEtaleKTheory:M.3/galois-symbol`, `MotivicEtaleKTheory:M.3/symbol-norm-compatibility`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, §4, Corollary after (4.5), p. 268:
  “The map h_1 of diagram (3.3) is bijective for any locally compact non-discrete field.” —
  Statement; excerpt typed from the scan.

### `M.3/tate-global` — Tate's theorem for global fields ★

*Kind:* theorem. *Planet:* Tate's global theorem.

Let F be a global field and ℓ ≠ char F a prime. (a) h_{F,ℓ} : K_2(F)/ℓ → H²(F, μ_ℓ^{⊗2}) is
bijective. (b) The adic symbol induces an isomorphism from the ℓ-primary part K_2(F){ℓ} onto
the torsion subgroup of H²(F, ℤ_ℓ(2)). (c) For every r ≥ 1, h_{F,ℓ^r} : K_2(F)/ℓ^r → H²(F,
μ_{ℓ^r}^{⊗2}) is bijective.

**Hypotheses.**

- F a global field (number field or function field in one variable over a finite field); ℓ ≠
  char F.

**Construction and proof.**

1. (a) Reduce to μ_ℓ ⊂ F (Tate (4.1)). Surjectivity: every α ∈ Br_ℓ(F) has a cyclic splitting
   field of degree ℓ, hence is a cyclic algebra (class field theory, ClassFieldTheory Layer
   10). Injectivity: verify conditions (i), (ii) of the corollary to Tate (4.4) using common
   cyclic splitting fields F(d^{1/ℓ}) and Lemma (5.2), whose proof uses the reciprocity law Σ_v
   inv_v = 0 and Kummer duality (Tate (5.1)).
2. (b) K_2(F) is torsion with no nonzero divisible subgroup: it is an extension of ⊕_{v} k(v)^×
   by the finite group K_2(O_S) (Tate (5.3), K2SymbolsBrauer T.5; finiteness of K_2(O_S) as in
   Garland/Bass–Tate). Combine with (a) and Tate (3.5) and its corollary (Tate (5.4)).
3. (c) Induction on r through the coefficient sequence of M.1/adic-tate-twist and the five
   lemma, using (a) and the exactness of the top row of Tate's diagram (3.3), which is
   tate-torsion-symbols (Tate (6.1)); for ℓ odd or F with no real places H³(F, μ_ℓ^{⊗2}) = 0,
   and for ℓ = 2 the real places contribute isomorphically to both sides
   (M.2/high-degree-real-isomorphism).

**Acceptance.**

- For F = ℚ and ℓ = 2: K_2(ℚ)/2 ≅ ℤ/2 ⊕ ⊕_{p odd} 𝔽_p^×/2 via {−1, −1} and tame symbols,
  matching H²(ℚ, μ_2^{⊗2}) = Br(ℚ)[2].

**Depends on.** `MotivicEtaleKTheory:M.3/galois-symbol`, `MotivicEtaleKTheory:M.3/adic-galois-symbol`, `MotivicEtaleKTheory:M.3/tate-local`, `MotivicEtaleKTheory:M.3/symbol-norm-compatibility`, `MotivicEtaleKTheory:M.1/adic-tate-twist`, `MotivicEtaleKTheory:M.2/high-degree-real-isomorphism`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, (5.1) Theorem, p. 268: “For a global
  field F the map h_1 in diagram (3.3) is bijective.” — Part (a); excerpt typed from the scan.
- John Tate, *Relations between K2 and Galois cohomology*, (5.4) Theorem, p. 270: “For a global
  field F the map h of Theorem (3.1) induces an isomorphism from the l-primary part of K_2F
  onto the torsion subgroup of H^2(F, Z_l(2)).” — Part (b); excerpt typed from the scan.

### `M.3/tate-torsion-symbols` — Torsion in K₂ of a global field is generated by root-of-unity symbols

*Kind:* theorem.

Let F be a global field and ℓ ≠ char F a prime. The top row (μ_ℓ ⊗ E^×)^Δ → K_2F → K_2F →
K_2F/ℓK_2F of Tate's diagram (3.3), with E = F(μ_ℓ) and Δ = Gal(E/F), is exact; that is, the
ℓ-torsion (K_2F)_ℓ is the image of γ. In particular, if F contains a primitive ℓ-th root of
unity z, every element of order ℓ in K_2F is of the form {z, a} with a ∈ F^×. Moreover (Tate
(6.3)) the kernel of γ is elementary abelian of order ℓ^{r_2+ε}, where r_2 is the number of
complex places and ε = 1 if H⁰(F, μ_ℓ ⊗ μ_ℓ) ≠ 0, i.e. if [F(μ_ℓ) : F] ≤ 2, and ε = 0
otherwise.

**Hypotheses.**

- F a global field; ℓ ≠ char F.

**Construction and proof.**

1. Injectivity of h on ℓ-power torsion (tate-global (b)), surjectivity of i in diagram (3.3),
   and exactness of the bottom row (the cohomology sequence of 0 → ℤ_ℓ(2) → ℤ_ℓ(2) → μ_ℓ ⊗ μ_ℓ
   → 0) give the exactness by a diagram chase (Tate (6.1)).
2. For the kernel of γ, compare with the S-unit sequence for large S and use Tate (6.2) and the
   Grothendieck-group computation (6.4) (Tate (6.3)).

**Acceptance.**

- For F = ℚ and ℓ = 2 (z = −1): every element of order 2 in K_2ℚ is {−1, a} for some a ∈ ℚ^×.
- For F = ℚ(√5), N.8 uses this with ℓ = 2 and z = −1.

**Depends on.** `MotivicEtaleKTheory:M.3/tate-global`, `MotivicEtaleKTheory:M.3/galois-symbol`, `MotivicEtaleKTheory:M.1/adic-tate-twist`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, (6.1) Theorem, p. 270: “In
  particular, if F contains a primitive l-th root of unity z, then every element of order l in
  K_2F is of the form {z, a} for some a ∈ F^*.” — Statement; excerpt typed from the scan.
- John Tate, *Relations between K2 and Galois cohomology*, (6.3) Theorem, p. 271: “Then the
  kernel of the map γ^F in diagram (3.3) is an elementary abelian group of order l^{r_2+ε}.” —
  Kernel of γ; excerpt typed from the scan.

### `M.3/tate-s-integer` — Tate's theorem for rings of S-integers ★

*Kind:* theorem. *Planet:* Tate's S-integer theorem.

Let F be a number field, ℓ a prime, r ≥ 1, S a finite set of places containing S_∞ and the
places above ℓ, and O_S = O_{F,S}. Then the Galois symbol induces an isomorphism K_2(O_S)/ℓ^r ≅
H²_et(O_S, μ_{ℓ^r}^{⊗2}), natural for S ⊆ T and compatible with the residue maps of the two
localization sequences; this includes ℓ = 2 when F has real places. Passing to the limit over
r, K_2(O_S) ⊗ ℤ_ℓ ≅ H²_cont(O_S, ℤ_ℓ(2)). This ring statement is a separate declaration from
the field statement tate-global.

**Hypotheses.**

- F a number field; S ⊇ S_∞ ∪ {v | ℓ} finite; r ≥ 1.

**Construction and proof.**

1. Extend both rows of M.2/degree-two-localization-diagram to the left: K_2(F)[ℓ^r] → ⊕_{v∉S}
   μ_{ℓ^r}(k(v)) → K_2(O_S)/ℓ^r → K_2(F)/ℓ^r → ⊕_{v∉S} k(v)^×/ℓ^r → 0 (from Tate's sequence
   (5.3) and the snake lemma for multiplication by ℓ^r) and H¹(F, μ_{ℓ^r}^{⊗2}) → ⊕_{v∉S}
   H⁰(k(v), μ_{ℓ^r}) → H²_et(O_S, μ_{ℓ^r}^{⊗2}) → H²(F, μ_{ℓ^r}^{⊗2}) → ⊕_{v∉S} H¹(k(v),
   μ_{ℓ^r}) (M.1/localization-gysin-sequence; the next map to H³_et(O_S) is zero because
   H³_et(O_S, −) → H³(F, −) is bijective by M.2/high-degree-real-isomorphism).
2. The vertical maps are: on K_2(F)[ℓ^r], the composite of Tate's γ and i of diagram (3.3),
   surjective onto the relevant image by tate-torsion-symbols; on the torsion of the residue
   fields, the identity of μ_{ℓ^r}(k(v)); then h_{O_S}, h_F (bijective by tate-global (c)) and
   the Kummer isomorphisms k(v)^×/ℓ^r ≅ H¹(k(v), μ_{ℓ^r}).
3. Commutativity is M.3/symbol-residue-compatibility and the definition of the tame symbol on
   torsion; the five lemma gives bijectivity. Naturality in S follows from naturality of both
   rows.
4. All groups are finite (M.2/adic-s-integer-cohomology), so the limit over r has no lim¹ term
   and gives the ℓ-adic statement.

**Acceptance.**

- For F = ℚ, S = {2, ∞}, ℓ = 2: K_2(ℤ[1/2])/2 ≅ ℤ/2 (generated by {−1, −1}) and H²_et(ℤ[1/2],
  μ_2^{⊗2}) ≅ Br'(ℤ[1/2])[2] ≅ ℤ/2.
- Consumers (SpecialValuesBirchTate B.4, B.7, B.8; ArithmeticKTheory N.6, N.7) use the
  naturality for S ⊆ T.

**Depends on.** `MotivicEtaleKTheory:M.3/tate-global`, `MotivicEtaleKTheory:M.3/tate-torsion-symbols`, `MotivicEtaleKTheory:M.3/symbol-residue-compatibility`, `MotivicEtaleKTheory:M.2/degree-two-localization-diagram`, `MotivicEtaleKTheory:M.2/adic-s-integer-cohomology`, `MotivicEtaleKTheory:M.2/high-degree-real-isomorphism`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.8.6 discussion,
  printed p. 515 (PDF p. 523): “when 1/m ∈ O” — The K-book cites Tate [198] for K_2(O_S)/m ≅
  H²_et(O_S, μ_m^{⊗2}) when 1/m ∈ O_S.
- John Tate, *Relations between K2 and Galois cohomology*, (6.2) Theorem and its proof, pp.
  270-271: “Then there is a natural exact sequence” — Tate's computation of K_2O_S/l through
  the localization sequence (5.3); excerpt typed from the scan.

### `M.3/tate-picard-sequence` — K₂ of S-integers modulo ℓ and the Picard group

*Kind:* theorem.

Let F be a global field containing μ_ℓ (ℓ ≠ char F prime), S a finite nonempty set of places
containing the archimedean places and the places above ℓ (number field case), and S_c the
complex places. There is a natural exact sequence 0 → μ_ℓ ⊗ Pic(O_S) → K_2O_S/ℓK_2O_S --h^S-->
(⊕_{v∈S∖S_c} μ_ℓ)_0 → 0, where (⊕ μ_ℓ)_0 is the subgroup of elements whose components sum to 0
and h^S is induced by the ℓ-th power norm residue symbols at v ∈ S ∖ S_c.

**Hypotheses.**

- F a global field with μ_ℓ ⊂ F; S ⊇ S_∞ ∪ {v | ℓ} finite and nonempty.

**Construction and proof.**

1. Map diagram (3.3) for O_S to Tate's localization sequence (5.3); identify the cokernel of
   d^S on ℓ-torsion with μ_ℓ ⊗ Pic(O_S) through F^× → I_S → Pic(O_S) → 0.
2. Replace K_2F/ℓK_2F by (∐_{v∈S_c^c} μ_ℓ)_0 via tate-global (a) and the Brauer–Hasse–Noether
   sequence (ClassFieldTheory Layer 10), the map being h^S.
3. Exactness follows from the exactness of the rows (Tate (6.2)).

**Acceptance.**

- For F = ℚ, ℓ = 2, S = {2, ∞}: Pic(ℤ[1/2]) = 0 and (μ_2 ⊕ μ_2)_0 ≅ ℤ/2, so K_2(ℤ[1/2])/2 ≅
  ℤ/2, generated by {−1, −1}.

**Depends on.** `MotivicEtaleKTheory:M.3/tate-global`, `MotivicEtaleKTheory:M.3/tate-torsion-symbols`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`

**Source.**

- John Tate, *Relations between K2 and Galois cohomology*, (6.2) Theorem, p. 270: “Then there
  is a natural exact sequence” — 0 → μ_l ⊗ Pic O_S → K_2O_S/lK_2O_S → (∐_{v∈S−S_c} μ_l)_0 → 0;
  excerpt typed from the scan.

## M.4 — Cycle complexes and motivic cohomology

M.4 constructs Bloch's cycle complexes and motivic cohomology without reference to K-theory (so
the atlas edge from SchemeKTheoryOperations S.6 is proposed for removal, RT-AREA-ktheory-2/41).
Degree-zero groups are SchemeAndStackFoundations SF.5's Chow groups. The simplicial and cubical
models, functoriality, homotopy invariance, the moving lemma, localization, products and
pullbacks for smooth schemes, purity with shift 2c and twist c, the projective bundle formula
and Zariski descent are stated over a field; the arithmetic cycle complex over a Dedekind base
(Geisser) carries localization and the Gersten resolution, and is the construction used for
S-integers. The low-weight descriptions are: weight zero, units and Picard in weight one,
Milnor K-theory on the diagonal (Nesterenko–Suslin–Totaro, importing K2SymbolsBrauer T.4's Kato
norm and Suslin reciprocity as RT-AREA-ktheory-1/12 requires), and the weight-two symbol
comparison.

**Declarations.** `algebraic-simplex`, `admissible-cycles`, `cycle-complex`, `cubical-cycle-complex`, `simplicial-cubical-comparison`, `functoriality`, `homotopy-invariance`, `moving-lemma`, `localization-sequence`, `products`, `chow-degree-zero`, `weight-zero-and-one`, `vanishing-above-weight`, `nesterenko-suslin-totaro`, `weight-two-symbol-comparison`, `projective-bundle-formula`, `purity-gysin-triangle`, `dedekind-cycle-complex`, `dedekind-gersten`, `zariski-descent`.

**Planets.** Bloch's higher Chow groups, Moving lemma, Bloch's localization theorem, Weight-one motivic cohomology, Nesterenko–Suslin–Totaro isomorphism.

**Dependencies inside the roadmap.** none outside the stage.

**Dependencies on other roadmaps.** `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.3/higher-milnor-residues`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/weil-reciprocity`, `SchemeAndStackFoundations:SF.5`.

**Coverage.** planned. Refinements: Read Bloch, 'Algebraic cycles and higher K-theory' (1986), 'The moving lemma for higher Chow groups' (1994) and Levine, 'Bloch's higher Chow groups revisited' (1994) to replace the MVW/Geisser/Totaro locators of moving-lemma, localization-sequence, homotopy-invariance and simplicial-cubical-comparison by the original statements. Polylogarithms P.5 asks M.4 for the admissible graph map from the final Gersten terms Λ²k(Y)^* → k(Y)^* → Z^p(X) inducing isomorphisms on CH^p(X) and CH^p(X, 1) (BFT Proposition 6.12); add it as an M.4 node refining dedekind-gersten over a field.

### `M.4/algebraic-simplex` — The algebraic simplices and the cubes

*Kind:* construction. *Library:* `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

For a base scheme B and n ≥ 0, the algebraic n-simplex is Δ^n_B = Spec_B O_B[t_0, …, t_n]/(t_0
+ ⋯ + t_n − 1) ≅ 𝔸^n_B. The coface maps ∂_i : Δ^{n−1} → Δ^n (t_i = 0) and codegeneracies s_i :
Δ^{n} → Δ^{n−1} (t_i ↦ t_i + t_{i+1}) make Δ^•_B a cosimplicial B-scheme; a face of Δ^n is a
closed subscheme defined by t_{i_1} = ⋯ = t_{i_r} = 0. The algebraic n-cube is □^n_B = (ℙ^1_B ∖
{1})^n with faces given by setting coordinates equal to 0 or ∞, together with the coordinate
projections and the involution-free cubical structure used by Totaro.

**Hypotheses.**

- B a scheme (in applications a field or a Dedekind scheme).

**Construction and proof.**

1. Define Δ^n_B as the relative spectrum; verify the cosimplicial identities on coordinate
   rings.
2. Faces are complete intersections of codimension r, defined by a regular sequence; their
   intersections are faces.
3. Define □^n and its faces δ^ε_i (coordinate i set to ε ∈ {0, ∞}) and degeneracies
   (projections).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.HigherChow.simplex` | constructor | Δ^n_B as a B-scheme, functorial in B. |
| `TauCeti.HigherChow.coface` | data | The coface closed immersions ∂_i : Δ^{n−1}_B → Δ^n_B. |
| `TauCeti.HigherChow.codegeneracy` | data | The codegeneracy maps s_i : Δ^n_B → Δ^{n−1}_B. |
| `TauCeti.HigherChow.cosimplicial_identities` | relation | ∂_j ∂_i = ∂_i ∂_{j−1} for i < j, and the remaining cosimplicial identities. |
| `TauCeti.HigherChow.simplex_iso_affine` | equivalence | Δ^n_B ≅ 𝔸^n_B over B. |
| `TauCeti.HigherChow.cube` | constructor | □^n_B = (ℙ¹_B ∖ {1})^n with faces δ^ε_i, ε ∈ {0, ∞}. |
| `TauCeti.HigherChow.face_regular` | characterisation | Every face of Δ^n_B (resp. □^n_B) of codimension r is cut out by a regular sequence of length r. |

**Used by.**

- MotivicEtaleKTheory:M.4/admissible-cycles: Cycles on X × Δ^n meeting all faces properly.
- Polylogarithms:P.5 (request to M.4): Goncharov's affine simplices and the cubical model with
  ∞-face normalisation.
- MotivicEtaleKTheory:M.5a/suslin-complex: C_*F(U) = F(U × Δ^•) uses the same cosimplicial
  scheme.

**Unit tests.**

- `HigherChow.test_simplex_zero` (degenerate): Δ^0_B ≅ B.
- `HigherChow.test_simplex_one` (computation): Δ^1_k ≅ 𝔸^1_k with exactly two codimension-one
  faces, the k-points t_0 = 0 and t_1 = 0.
- `HigherChow.test_base_change` (compatibility): Δ^n_{B'} ≅ Δ^n_B ×_B B' for every B' → B.
- `HigherChow.test_not_projective` (non-example): Δ^n is not ℙ^n: Δ^1 has no point at which t_0
  + t_1 = 0, so the projective closure adds a face-free divisor at infinity.

**Acceptance.**

- Δ^1_B ≅ 𝔸^1_B with vertices t_0 = 0 and t_1 = 0; Δ^0_B = B.

**Depends on.** `mathlib:AlgebraicGeometry.AlgebraicCycle`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 17.1, PDF p. 150: “We write zi (X, m) for the free abelian group generated by all
  codimension i subvarieties on X × ∆m which intersect all faces X × ∆ j properly” — The
  simplices and their faces enter Bloch's definition.
- Burt Totaro, *Milnor K-theory is the simplest part of algebraic K-theory*, §1, PDF p. 4: “So
  we can restate the cubical definition of CH*(X, n) in terms of” — Totaro's cubes (ℙ¹ − {1})^n
  with faces at 0 and ∞.

### `M.4/admissible-cycles` — Cycles meeting the faces properly

*Kind:* definition. *Library:* `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

Let X be an equidimensional scheme of finite type over a field (or, in dimension-indexed form,
essentially of finite type over a Dedekind scheme B) and q, n ≥ 0. Then z^q(X, n) is the free
abelian group on the integral closed subschemes Z ⊂ X × Δ^n of codimension q such that for
every face F ⊂ Δ^n, every irreducible component of Z ∩ (X × F) has codimension ≥ q in X × F.
Over a Dedekind base one uses dimension instead of codimension: z_r(X, n) is generated by
integral Z of dimension r + n meeting X × F in dimension ≤ r + dim F. Cycles are elements of
Mathlib's AlgebraicCycle (locally finite functions on points) with finite support.

**Hypotheses.**

- X equidimensional of finite type over a field k, or essentially of finite type over a
  Dedekind scheme B for the dimension-indexed version.

**Construction and proof.**

1. Define the condition 'meets all faces properly' componentwise; it is stable under passage to
   components, so the admissible cycles form a free subgroup of AlgebraicCycle(X × Δ^n, ℤ).
2. Show that intersection with a face X × ∂_i(Δ^{n−1}) is defined on admissible cycles (proper
   intersection with a regular codimension-one face; MVW 17A.1) and lands in z^q(X, n−1).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.HigherChow.cycles` | constructor | z^q(X, n) as a subgroup of AlgebraicCycle(X × Δ^n, ℤ). |
| `TauCeti.HigherChow.mem_cycles_iff` | characterisation | A cycle lies in z^q(X, n) iff each component has codimension q and meets every face properly. |
| `TauCeti.HigherChow.face_restrict` | data | Intersection with the i-th face, z^q(X, n) → z^q(X, n − 1). |
| `TauCeti.HigherChow.cyclesDim` | constructor | The dimension-indexed groups z_r(X, n) over a Dedekind base. |
| `TauCeti.HigherChow.cycles_eq_cyclesDim` | compatibility | For X equidimensional of dimension d over a field, z^q(X, n) = z_{d−q}(X, n). |

**Used by.**

- Bloch's higher Chow groups (cycle-complex): Degree-n term of the cycle complex.
- Geisser2004 §1 notation and Theorem 1.1: The dimension-indexed groups over a Dedekind base
  define Z(n) for S-integers.
- MotivesAndAlgebraicCycles:MC.4 request to M.4: Bloch's cycle complexes z^i(X, *) (MVW 17.1).

**Unit tests.**

- `HigherChow.test_cycles_zero_n` (degenerate): z^q(X, 0) is the group of codimension-q cycles
  of X.
- `HigherChow.test_point` (computation): z^1(Spec k, 1) is generated by the closed points of
  Δ^1_k ≅ 𝔸^1_k other than the two vertices.
- `HigherChow.test_algebraic_cycle` (compatibility): z^q(X, 0) agrees with the codimension-q
  part of Mathlib's AlgebraicCycle X ℤ with finite support.
- `HigherChow.test_vertex_not_admissible` (non-example): The vertex t_0 = 0 of Δ^1_k is a
  codimension-one cycle on Δ^1_k that does not meet the face t_0 = 0 properly, so it is not in
  z^1(Spec k, 1).

**Acceptance.**

- z^q(X, n) = 0 if q > dim X + n.
- z^0(X, n) = ℤ^{(components of X × Δ^n)} since every codimension-0 subscheme meets faces
  properly.

**Depends on.** `MotivicEtaleKTheory:M.4/algebraic-simplex`, `mathlib:AlgebraicGeometry.AlgebraicCycle`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 17.1, PDF p. 150: “intersect all faces X × ∆ j properly for all j < m” — Bloch's
  condition, as stated in MVW.

### `M.4/cycle-complex` — Bloch's cycle complex and higher Chow groups ★

*Kind:* construction. *Planet:* Bloch's higher Chow groups. *Library:* `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

For X as in admissible-cycles and q ≥ 0, the groups z^q(X, n), n ≥ 0, with face maps the
intersections with the faces ∂_i, form a simplicial abelian group z^q(X, •); its associated
chain complex has differential d = Σ_i (−1)^i ∂_i^*. Bloch's higher Chow groups are CH^q(X, n)
= H_n(z^q(X, •)). The cycle complex of sheaves is Z(q)_X = z^q(−, •)[−2q] on the small Zariski
(or étale) site of X, a cohomologically graded complex with z^q(−, 2q − i) in degree i; motivic
cohomology is H^{p}(X, Z(q)) = CH^q(X, 2q − p) (Zariski hypercohomology of Z(q)_X, equal to the
global groups by Zariski descent). For an abelian group A, Z(q) ⊗ A and H^{p}(X, A(q)) are
defined by tensoring the free complex. The definition does not refer to K-theory.

**Hypotheses.**

- X equidimensional, of finite type over a field (or over a Dedekind scheme for the
  dimension-indexed version); q ≥ 0.

**Construction and proof.**

1. The intersections with faces satisfy the simplicial identities because faces are compatible
   (cosimplicial identities of algebraic-simplex); degeneracies are pullbacks along
   codegeneracies.
2. Define CH^q(X, n) as homology of the Moore complex and Z(q)_X as the presheaf of complexes U
   ↦ z^q(U, 2q − •); it is a sheaf for the Zariski and étale topologies termwise (cycles glue).
3. Define H^{p}(X, Z(q)) := CH^q(X, 2q − p) and H^{p}(X, A(q)) via the complex tensored with A.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.HigherChow.complex` | constructor | z^q(X, •) as a simplicial abelian group and its chain complex. |
| `TauCeti.HigherChow.CH` | constructor | CH^q(X, n) = H_n(z^q(X, •)). |
| `TauCeti.HigherChow.motivicComplex` | constructor | Z(q)_X = z^q(−, •)[−2q] as a complex of Zariski (and étale) sheaves on X. |
| `TauCeti.HigherChow.H` | constructor | H^{p}(X, A(q)) for an abelian group A, with H^{p}(X, Z(q)) = CH^q(X, 2q − p). |
| `TauCeti.HigherChow.d_sq` | relation | d ∘ d = 0 with d = Σ (−1)^i ∂_i^*. |
| `TauCeti.HigherChow.CH_neg` | simp | CH^q(X, n) = 0 for n < 0, and H^{p}(X, Z(q)) = 0 for p > 2q. |
| `TauCeti.HigherChow.coefficient_long_exact` | relation | For 0 → A' → A → A'' → 0 there is a long exact sequence … → H^{p}(X, A'(q)) → H^{p}(X, A(q)) → H^{p}(X, A''(q)) → H^{p+1}(X, A'(q)) → …; in particular the Bockstein triangle Z(q) --m--> Z(q) → Z/m(q). |
| `TauCeti.HigherChow.H_mod_m` | relation | 0 → H^{p}(X, Z(q))/m → H^{p}(X, Z/m(q)) → H^{p+1}(X, Z(q))[m] → 0 is exact. |

**Used by.**

- Kbook2013 VI Theorem 4.1 and Remark 4.2.2: Motivic cohomology H^n(X, Z/m(i)) and higher Chow
  groups CH^i(X, n) in the norm residue and spectral-sequence statements.
- MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison, M.6a/coniveau-cycle-layer,
  M.8/finite-etale-chern: The sibling packet's actual cycle complexes (request to M.4).
- MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow: Comparison H^{n,i}(X, ℤ) ≅
  CH^i(X, 2i − n) (MVW 19.1) needs this side.
- Polylogarithms:P.5 and GeneralizedHeegnerCycles:GH.0/GH.1: Regulators on higher Chow groups
  and Chow groups with rational coefficients.

**Unit tests.**

- `HigherChow.test_CH_zero` (compatibility): CH^q(X, 0) is the Chow group CH^q(X) of
  SchemeAndStackFoundations SF.5.
- `HigherChow.test_q_zero` (degenerate): For X = Spec k: CH^0(Spec k, 0) = ℤ and CH^0(Spec k,
  n) = 0 for n > 0.
- `HigherChow.test_field_weight_one` (computation): CH^1(Spec k, 1) ≅ k^×, the point a ∈ Δ^1 ∖
  vertices with barycentric coordinate ratio a ↦ a.
- `HigherChow.test_not_naive_cycles` (non-example): Without the proper-intersection condition
  the homology in degree one for X = Spec k would vanish (all points of 𝔸¹ are homologous to
  vertices), so admissibility is essential for CH^1(k, 1) = k^×.

**Acceptance.**

- CH^q(X, 0) = CH^q(X) (chow-degree-zero).
- H^{p}(Spec k, Z(q)) = 0 for p > q (vanishing-above-weight) and H^{1}(Spec k, Z(1)) = k^×
  (weight-zero-and-one).

**Depends on.** `MotivicEtaleKTheory:M.4/admissible-cycles`, `MotivicEtaleKTheory:M.4/algebraic-simplex`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 17.1, PDF p. 150: “Each face X × ∆ j is defined by a regular sequence, and
  intersection of cycles defines a map” — Bloch's simplicial cycle group and its face maps.
- Markus Spitzweck, *A commutative P^1-spectrum representing motivic cohomology over Dedekind
  domains*, §2, PDF p. 8: “Levine’s cycle complex. A representative is the complex with z r ( ,
  2r − i) in cohomological degree i” — The cohomological indexing Z(r) = z^r(−, 2r − •).

### `M.4/cubical-cycle-complex` — The cubical cycle complex

*Kind:* construction. *Library:* `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

For X as in admissible-cycles and q ≥ 0, let c^q(X, n) be the free abelian group on integral
closed Z ⊂ X × □^n of codimension q meeting all faces of □^n properly, and let z^q_□(X, n) =
c^q(X, n)/(degenerate cycles), the degenerate cycles being pullbacks along the coordinate
projections □^n → □^{n−1}. With d = Σ_{i=1}^{n} (−1)^{i} (∂^∞_i − ∂^0_i), z^q_□(X, •) is a
chain complex; the cubical higher Chow groups are its homology. There is an external product
z^p_□(X, n) ⊗ z^r_□(Y, m) → z^{p+r}_□(X × Y, n + m) given by the product of cycles under □^n ×
□^m = □^{n+m}.

**Hypotheses.**

- X as in admissible-cycles; q ≥ 0.

**Construction and proof.**

1. Faces of □^n are products of faces of ℙ¹ ∖ {1} at 0 and ∞; admissibility is preserved by
   intersection with faces and by external products of cycles.
2. Quotient by degenerate cycles; d² = 0 from the cubical identities.
3. Define the external product by the product of cycles; it is compatible with d up to the
   Koszul sign.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.HigherChow.cubeCycles` | constructor | z^q_□(X, n), admissible cubical cycles modulo degenerate ones. |
| `TauCeti.HigherChow.cube_d_sq` | relation | d ∘ d = 0 for d = Σ (−1)^i (∂^∞_i − ∂^0_i). |
| `TauCeti.HigherChow.cubeProduct` | constructor | External product z^p_□(X, n) ⊗ z^r_□(Y, m) → z^{p+r}_□(X × Y, n + m). |
| `TauCeti.HigherChow.cube_leibniz` | relation | d(x × y) = dx × y + (−1)^n x × dy. |
| `TauCeti.HigherChow.milnorCycle` | constructor | For a_i ∈ F^× ∖ {1}, the point (a_1, …, a_n) ∈ □^n_F as a cycle in z^n_□(F, n). |

**Used by.**

- Totaro1992 Theorem 1: The explicit cycle {(a_1, …, a_n)} realises Milnor symbols.
- Polylogarithms:P.5/cubical-regulator and simplicial-cubical-comparison: Regulators are
  written on cubical cycles.
- MotivicEtaleKTheory:M.4/products: Products of higher Chow groups are defined cubically.

**Unit tests.**

- `HigherChow.test_cube_zero` (degenerate): z^q_□(X, 0) = z^q(X, 0).
- `HigherChow.test_cube_point` (computation): For a ∈ F^× ∖ {1}, the point a ∈ □^1_F is a cycle
  with d = 0 (it avoids 0 and ∞).
- `HigherChow.test_cube_vs_simplex` (compatibility): The cubical and simplicial complexes have
  isomorphic homology (simplicial-cubical-comparison).
- `HigherChow.test_degenerate_killed` (non-example): The pullback of a point of □^0 along □^1 →
  □^0 is the whole line, a degenerate cycle; without quotienting by degenerate cycles, the
  homology of the cubical complex is not CH.

**Acceptance.**

- For X = Spec F, the cycle {(a_1, …, a_n)} ∈ z^n_□(F, n) is a cycle for a_i ∈ F^× ∖ {1};
  Totaro's map sends {a_1, …, a_n} ∈ K^M_n(F) to its class.

**Depends on.** `MotivicEtaleKTheory:M.4/algebraic-simplex`, `MotivicEtaleKTheory:M.4/admissible-cycles`

**Source.**

- Burt Totaro, *Milnor K-theory is the simplest part of algebraic K-theory*, §1, PDF p. 4: “via
  the isomorphism” — Totaro's identification A¹ ≅ ℙ¹ − {1} and the cubical definition of CH*(X,
  n).
- Burt Totaro, *Milnor K-theory is the simplest part of algebraic K-theory*, §1, PDF p. 5: “One
  checks that the isomorphisms between the cubical and the simplicial Chow groups preserve
  products” — Products on cubical cycles and their compatibility with the simplicial product.

### `M.4/simplicial-cubical-comparison` — Simplicial and cubical higher Chow groups agree

*Kind:* theorem.

For X quasi-projective and equidimensional over a field, there is a natural isomorphism
H_n(z^q(X, •)) ≅ H_n(z^q_□(X, •)) for all q, n, compatible with flat pullback, proper
pushforward and the external products of the two models; it is induced by the mixed
simplicial-cubical complexes of Levine with both inclusions quasi-isomorphisms.

**Hypotheses.**

- X quasi-projective, equidimensional over a field.

**Construction and proof.**

1. Form the double complex of cycles on X × Δ^p × □^r meeting all faces properly; both edge
   inclusions are quasi-isomorphisms (homotopy invariance on each side and an acyclicity
   argument).
2. Check the comparison preserves products (Totaro §1) and functorialities.

**Acceptance.**

- For X = Spec F and q = n = 1 both sides are F^×.

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/cubical-cycle-complex`, `MotivicEtaleKTheory:M.4/homotopy-invariance`

**Source.**

- Burt Totaro, *Milnor K-theory is the simplest part of algebraic K-theory*, §1, PDF p. 5: “One
  checks that the isomorphisms between the cubical and the simplicial Chow groups preserve
  products” — The comparison and its multiplicativity; the mixed-complex proof is Levine's
  (1994), recorded in the handoff as a source to read for lemma-level refinement.

### `M.4/functoriality` — Flat pullback and proper pushforward of higher Chow groups

*Kind:* theorem.

Let f : Y → X be a morphism of equidimensional schemes of finite type over a field. (a) If f is
flat of relative dimension d, pullback of cycles f^* : z^q(X, •) → z^q(Y, •) is a map of
complexes, inducing f^* on CH^q(−, n). (b) If f is proper, pushforward of cycles (with degrees
of residue field extensions) f_* : z_r(Y, •) → z_r(X, •) is a map of complexes in the dimension
indexing, inducing f_* on CH_r(−, n). (c) Pullback and pushforward are functorial, satisfy base
change for a flat g and proper f in a cartesian square, and in degree n = 0 are SF.5's flat
pullback and proper pushforward on Chow groups.

**Hypotheses.**

- Morphisms of equidimensional schemes of finite type over a field; for (b) proper; for (a)
  flat.

**Construction and proof.**

1. Flat pullback preserves codimension and proper intersection with faces (faces pull back to
   faces).
2. Proper pushforward preserves dimension bounds of intersections with faces (images of proper
   maps have no larger dimension).
3. Both commute with the face maps, hence with d; base change is the corresponding identity of
   cycles; degree zero recovers SF.5.

**Acceptance.**

- For f : Spec E → Spec F finite, f_* : CH^1(E, 1) = E^× → CH^1(F, 1) = F^× is the norm
  N_{E/F}.

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `SchemeAndStackFoundations:SF.5`

**Source.**

- Markus Spitzweck, *A commutative P^1-spectrum representing motivic cohomology over Dedekind
  domains*, §2, PDF p. 9: “Then there is a flat pullback f ∗MX (r) → MY (r).” — Flat pullback
  on cycle complexes (also over Dedekind bases).
- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Theorem 17.21, PDF p. 157: “The maps W ∗ defined in 17.17 give the higher Chow groups CH i
  (−, m) the structure of presheaves with transfers.” — Pushforward along finite surjective
  correspondences, the transfer structure, is the finite case of (b).

### `M.4/homotopy-invariance` — Homotopy invariance of higher Chow groups

*Kind:* theorem.

For X equidimensional of finite type over a field, flat pullback along the projection p : X ×
𝔸^1 → X induces isomorphisms p^* : CH^q(X, n) ≅ CH^q(X × 𝔸^1, n) for all q, n.

**Hypotheses.**

- X equidimensional of finite type over a field.

**Construction and proof.**

1. Construct the homotopy from the triangulation of Δ^n × 𝔸^1 into simplices, using the moving
   lemma to make the prism cycles admissible (Bloch; MVW Lecture 17).
2. Conclude by the induced chain homotopy between the identity and p^* ∘ s^* for the zero
   section s.

**Acceptance.**

- CH^1(𝔸^1_F, 1) ≅ CH^1(F, 1) = F^×.

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/functoriality`, `MotivicEtaleKTheory:M.4/moving-lemma`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Lecture 17, PDF p. 150: “with Bloch’s definition of higher Chow groups” — MVW reviews Bloch's
  results, including homotopy invariance, at the start of Lecture 17; the original is Bloch
  1986 §2.

### `M.4/moving-lemma` — Bloch's moving lemma for cycle complexes ★

*Kind:* theorem. *Planet:* Moving lemma.

Let X be smooth and quasi-projective over a field and 𝒲 a finite set of locally closed subsets
of X. The subcomplex z^q_𝒲(X, •) ⊂ z^q(X, •) of cycles meeting every W × F (W ∈ 𝒲, F a face)
properly is a quasi-isomorphism onto z^q(X, •). Over a Dedekind base B, the same holds for X
smooth quasi-projective over B (Levine's moving lemma used by Geisser).

**Hypotheses.**

- X smooth quasi-projective over a field (or over a Dedekind scheme for the arithmetic
  version); 𝒲 finite.

**Construction and proof.**

1. Move cycles by a generic translation in an embedding X ⊂ ℙ^N (projecting cones), with the
   action of a group of automorphisms of 𝔸^N over a field extension, and descend by a norm
   argument (Bloch, 'The moving lemma for higher Chow groups').
2. The arithmetic version replaces general position over a field by Levine's chamber argument
   relative to B.

**Acceptance.**

- For 𝒲 = ∅ the inclusion is the identity.

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/functoriality`

**Source.**

- Markus Spitzweck, *A commutative P^1-spectrum representing motivic cohomology over Dedekind
  domains*, Introduction, PDF p. 5: “Hereby we rely heavily on a moving Lemma due to Levine
  (Theorem 5.8).” — The moving lemma over a Dedekind base, used for strictification of the
  cycle complexes.
- Thomas Geisser, *Motivic cohomology over Dedekind rings*, §4, proof of Theorem 1.1, PDF p.
  10: “We use the methods of Bloch [1, 2] and Gillet-Levine [11] to prove Theorem 1.1.” —
  Geisser's arithmetic arguments rest on Bloch's moving techniques.

### `M.4/localization-sequence` — Bloch's localization theorem ★

*Kind:* theorem. *Planet:* Bloch's localization theorem.

Let X be equidimensional of finite type over a field (or over a Dedekind scheme B), Z ⊂ X a
closed subscheme of pure codimension c with open complement U. Then the sequence of complexes
z^{q−c}(Z, •) --i_*--> z^q(X, •) --j^*--> z^q(U, •) induces a distinguished triangle in the
derived category, hence a long exact sequence … → CH^{q−c}(Z, n) → CH^q(X, n) → CH^q(U, n) →
CH^{q−c}(Z, n − 1) → …, natural in the triple (X, Z, U); in the dimension indexing it reads … →
CH_r(Z, n) → CH_r(X, n) → CH_r(U, n) → CH_r(Z, n − 1) → … .

**Hypotheses.**

- X equidimensional of finite type over a field or a Dedekind scheme; Z closed of pure
  codimension c.

**Construction and proof.**

1. j^* is surjective onto the subcomplex of cycles on U whose closures in X are admissible; the
   moving lemma for the pair (X, Z) shows this subcomplex is quasi-isomorphic to z^q(U, •)
   (Bloch 1994; Levine over a Dedekind base).
2. The kernel of j^* is i_* z^{q−c}(Z, •); conclude with the triangle and its long exact
   sequence.

**Acceptance.**

- For X = 𝔸^1_F, Z = {0}, U = 𝔾_m: … → CH^0(F, 1) = 0 → CH^1(𝔸^1, 1) = F^× → CH^1(𝔾_m, 1) →
  CH^0(F, 0) = ℤ → CH^1(𝔸^1, 0) = 0, so CH^1(𝔾_m, 1) ≅ F^× ⊕ ℤ.

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/moving-lemma`, `MotivicEtaleKTheory:M.4/functoriality`

**Source.**

- Thomas Geisser, *Motivic cohomology over Dedekind rings*, Corollary 3.3, PDF p. 8: “there is
  a distinguished triangle in the derived category of Zariski sheaves on X” — The localization
  triangle over a Dedekind base (Levine's theorem, [16, Theorem 1.7] in Geisser).
- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Lecture 17, after Theorem 17.4, PDF p. 151: “Thus the localization theorem yields long exact
  sequences of higher Chow groups.” — MVW's statement of Bloch's Localization Theorem and its
  long exact sequence.

### `M.4/products` — Products and pullback for smooth schemes

*Kind:* construction. *Library:* `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

For X, Y equidimensional over a field k, the external product of cycles gives z^p(X, •) ⊗
z^r(Y, •) → z^{p+r}(X × Y, •) up to the Eilenberg–Zilber (or cubical) comparison, inducing
CH^p(X, n) ⊗ CH^r(Y, m) → CH^{p+r}(X × Y, n + m). For X smooth over k, pullback along the
diagonal (defined by the moving lemma) gives the cup product, making ⊕_{p,n} CH^p(X, n) a
bigraded ring, graded-commutative in n and associative and unital; for any morphism f : Y → X
of smooth quasi-projective k-schemes there is a pullback f^* : CH^q(X, n) → CH^q(Y, n),
functorial, agreeing with flat pullback when f is flat, and multiplicative. Equivalently
⊕_{p,q} H^{p}(X, Z(q)) is a bigraded ring with H^{p}(X, Z(q)) · H^{p'}(X, Z(q')) ⊂ H^{p+p'}(X,
Z(q+q')).

**Hypotheses.**

- X, Y equidimensional of finite type over a field; for the cup product and general pullback,
  smooth and quasi-projective.

**Construction and proof.**

1. Define the external product on cubical cycles (cubical-cycle-complex) and transport to the
   simplicial model (simplicial-cubical-comparison).
2. For smooth X, replace z(X × X, •) by the subcomplex of cycles meeting the diagonal properly
   (moving-lemma); intersect with Δ_X to get Δ^*.
3. For f : Y → X between smooth quasi-projective schemes, factor f as the graph Y → Y × X
   followed by the projection; pull back by moving to cycles in good position with respect to
   the graph.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.HigherChow.extProduct` | constructor | CH^p(X, n) ⊗ CH^r(Y, m) → CH^{p+r}(X × Y, n + m). |
| `TauCeti.HigherChow.cup` | constructor | The cup product on ⊕ CH^p(X, n) for X smooth. |
| `TauCeti.HigherChow.pullback` | functoriality | f^* for f : Y → X between smooth quasi-projective k-schemes, with (g ∘ f)^* = f^* ∘ g^* and id^* = id. |
| `TauCeti.HigherChow.pullback_flat` | compatibility | f^* agrees with flat pullback when f is flat. |
| `TauCeti.HigherChow.cup_comm` | relation | x · y = (−1)^{nm} y · x for x ∈ CH^p(X, n), y ∈ CH^r(X, m). |
| `TauCeti.HigherChow.projection_formula` | relation | f_*(f^*x · y) = x · f_*y for f proper between smooth schemes. |

**Used by.**

- MotivicEtaleKTheory:M.6b/filtered-motivic-products and M.8/motivic-chern-character: Products
  of motivic cohomology on the E_2-page and in the Chern character.
- Kbook2013 VI Addendum 4.2.1: The motivic spectral sequence is multiplicative with the product
  in motivic cohomology on E_2.
- K3BlochGroups:V.2 (request to M.4): Ring structure of ⊕ H^i(F, Z(i)) and its identification
  with Milnor K-theory.

**Unit tests.**

- `HigherChow.test_unit` (degenerate): The class [X] ∈ CH^0(X, 0) is the unit of the ring.
- `HigherChow.test_symbol_product` (computation): For a, b ∈ F^× ∖ {1}, a · b ∈ CH^2(F, 2) is
  the class of the point (a, b) ∈ □^2_F.
- `HigherChow.test_degree_zero` (compatibility): On CH^*(X, 0) the cup product is SF.5's
  intersection product for X smooth.
- `HigherChow.test_sign` (non-example): For a ∈ F^×, a · a = a · (−1) in CH^2(F, 2), which is
  generally nonzero (e.g. F = ℝ, a = −1), so the product is graded-commutative but not
  alternating.

**Acceptance.**

- For X = Spec F, the product CH^1(F, 1) ⊗ CH^1(F, 1) → CH^2(F, 2) sends a ⊗ b to the class of
  the cycle (a, b) ∈ □^2_F, i.e. to the image of {a, b} under nesterenko-suslin-totaro.

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/cubical-cycle-complex`, `MotivicEtaleKTheory:M.4/simplicial-cubical-comparison`, `MotivicEtaleKTheory:M.4/moving-lemma`, `MotivicEtaleKTheory:M.4/functoriality`

**Source.**

- Burt Totaro, *Milnor K-theory is the simplest part of algebraic K-theory*, §1, PDF p. 5: “(X,
  q) ® CHr(X, s) ~ CH p +r(x, q + S)” — The product CH^p(X, q) ⊗ CH^r(X, s) → CH^{p+r}(X, q +
  s) on cubical cycles (scan text).

### `M.4/chow-degree-zero` — Higher Chow groups in degree zero are Chow groups

*Kind:* theorem.

For X equidimensional of finite type over a field, CH^q(X, 0) = z^q(X, 0)/d(z^q(X, 1)) is
canonically the Chow group CH^q(X) of SchemeAndStackFoundations SF.5 (cycles modulo rational
equivalence), compatibly with flat pullback, proper pushforward and, for X smooth, intersection
products.

**Hypotheses.**

- X equidimensional of finite type over a field.

**Construction and proof.**

1. z^q(X, 0) is the group of codimension-q cycles, and d(z^q(X, 1)) = {Z|_{t=0} − Z|_{t=1} : Z
   ⊂ X × Δ^1 admissible}, which is the subgroup of cycles rationally equivalent to zero (SF.5's
   definition via families over ℙ¹ or 𝔸¹).
2. Compatibilities: degree-zero parts of functoriality and products.

**Acceptance.**

- CH^1(X, 0) = Pic(X) for X smooth (with SF.5's identification).

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/functoriality`, `MotivicEtaleKTheory:M.4/products`, `SchemeAndStackFoundations:SF.5`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 17.1, PDF p. 150: “We write zi (X, m) for the free abelian group generated by all
  codimension i subvarieties” — For m = 0 these are the cycles of X; the boundary of z^i(X, 1)
  is rational equivalence.

### `M.4/weight-zero-and-one` — Motivic cohomology in weights zero and one ★

*Kind:* theorem. *Planet:* Weight-one motivic cohomology.

Let X be smooth over a field k. (a) Z(0)_X ≃ ℤ, so H^{p}(X, Z(0)) = H^{p}_Zar(X, ℤ), which is
ℤ^{π_0(X)} for p = 0 and 0 for p ≠ 0. (b) There is a quasi-isomorphism Z(1)_X ≃ O_X^×[−1] of
Zariski complexes; hence H^{1}(X, Z(1)) ≅ O(X)^×, H^{2}(X, Z(1)) ≅ Pic(X) (Tau Ceti's
line-bundle classes), and H^{p}(X, Z(1)) = 0 for p ∉ {1, 2}. For X = Spec F: H^{1}(F, Z(1)) =
F^× and H^{p}(F, Z(1)) = 0 for p ≠ 1.

**Hypotheses.**

- X smooth over a field k (essentially smooth allowed for local rings and fields).

**Construction and proof.**

1. (a) z^0(X, n) = ℤ^{π_0(X × Δ^n)} = ℤ^{π_0(X)} for all n, a constant simplicial group.
2. (b) Codimension-one admissible cycles on X × Δ^n: compute H_n(z^1(X, •)) via divisors of
   functions on X × Δ^1 (Bloch's computation), giving O^× in homological degree 1 and Pic in
   degree 0; compare with MVW 4.1–4.2 for the Voevodsky model through MotivesAndAlgebraicCycles
   MC.4.
3. The field case: CH^1(F, 1) = F^× by sending a to the point of Δ^1 with t_0/t_1 = a (up to
   the sign convention).

**Acceptance.**

- H^{2}(ℙ^1_k, Z(1)) ≅ ℤ and H^{1}(ℙ^1_k, Z(1)) ≅ k^×.

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/chow-degree-zero`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Corollary 4.2, PDF p. 40: “Let X be a smooth scheme over k. Then we have” — H^{p,q}(X, ℤ) for
  q ≤ 1: ℤ(X), O^*(X), Pic(X) in bidegrees (0,0), (1,1), (2,1); MVW Theorem 4.1 gives Z(1) ≃
  O^*[−1].

### `M.4/vanishing-above-weight` — Vanishing above the weight for fields and local rings

*Kind:* theorem.

For a field F and q ≥ 0, H^{p}(F, Z(q)) = CH^q(F, 2q − p) = 0 for p > q; more generally, for X
the spectrum of a local ring essentially smooth over a field or a Dedekind scheme, the complex
Z(q)_X is acyclic in degrees above q.

**Hypotheses.**

- F a field, or X local and essentially smooth over a field or a Dedekind scheme.

**Construction and proof.**

1. For a field, a codimension-q cycle on Δ^n_F meeting all faces properly must meet the
   vertices (codimension n) in codimension ≥ q, impossible for n < q unless empty, so z^q(F, n)
   = 0 for n < q.
2. For local rings use Geisser's Gersten argument (Theorem 1.1 and its corollaries: 'the
   complex Z(n) is acyclic in degrees above n').

**Acceptance.**

- H^{2}(F, Z(1)) = 0, consistent with Pic(Spec F) = 0.

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/dedekind-gersten`

**Source.**

- Burt Totaro, *Milnor K-theory is the simplest part of algebraic K-theory*, §2, Theorem 1, PDF
  p. 5: “then we have CHt(F, n) = 0, for i > n” — Totaro's Theorem 1: CH^i(F, n) = 0 for i > n
  (scan text: 'CHt(F, n) = 0, for i > n').
- Thomas Geisser, *Motivic cohomology over Dedekind rings*, §1, after Theorem 1.1, PDF p. 2:
  “we obtain that the complex Z(n) is acyclic in degrees above n” — The local-ring version.

### `M.4/nesterenko-suslin-totaro` — Milnor K-theory is motivic cohomology on the diagonal ★

*Kind:* theorem. *Planet:* Nesterenko–Suslin–Totaro isomorphism.

For every field F and n ≥ 0 there is a natural isomorphism φ_n : K^M_n(F) ≅ CH^n(F, n) =
H^{n}(F, Z(n)), where K^M_*(F) is Milnor K-theory (K2SymbolsBrauer T.2/milnor-k-theory). On
symbols, φ_n{a_1, …, a_n} is the class of the point (a_1, …, a_n) ∈ □^n_F for a_i ≠ 1 (cubical
model); φ = ⊕ φ_n is a ring isomorphism K^M_*(F) ≅ ⊕_n H^{n}(F, Z(n)); φ commutes with norms
(Milnor norm N_{E/F} on the left, proper pushforward on the right) and with the residue maps of
a discrete valuation (higher tame symbol on the left, localization boundary on the right, up to
the sign of K2SymbolsBrauer's convention). Consequently H^{n}(F, Z/m(n)) ≅ K^M_n(F)/m for every
m.

**Hypotheses.**

- F any field; n ≥ 0.

**Construction and proof.**

1. Map K^M_n → CH^n(F, n): the cycle (a_1, …, a_n) is admissible and closed; Steinberg
   relations hold in CH (Totaro §3 constructs an explicit boundary for {a, 1 − a}),
   multiplicativity by products.
2. Map back CH^n(F, n) → K^M_n(F): a closed point x of □^n_F with coordinates (x_1, …, x_n) ∈
   F(x) goes to N_{F(x)/F}{x_1, …, x_n} (Kato's Milnor norm, K2SymbolsBrauer
   T.4/milnor-transfer-transitivity).
3. This kills boundaries: the boundary of a curve C ⊂ □^{n+1}_F gives Σ_w N_{κ(w)/F} ∂_w(...) =
   0 by Suslin's reciprocity law for the function field of C (K2SymbolsBrauer
   T.4/weil-reciprocity), as RT-AREA-ktheory-1/12 requires.
4. The two maps are inverse: every class in CH^n(F, n) is represented by zero-cycles
   (vanishing-above-weight and moving), and the composite on symbols is the identity;
   compatibility with norms and residues follows from the definitions and
   T.3/higher-milnor-residues.

**Acceptance.**

- φ_1 : F^× ≅ CH^1(F, 1) is weight-zero-and-one (b).
- K^M_n(𝔽_q) = 0 for n ≥ 2, so CH^n(𝔽_q, n) = 0 for n ≥ 2.

**Depends on.** `MotivicEtaleKTheory:M.4/cubical-cycle-complex`, `MotivicEtaleKTheory:M.4/products`, `MotivicEtaleKTheory:M.4/vanishing-above-weight`, `MotivicEtaleKTheory:M.4/weight-zero-and-one`, `MotivicEtaleKTheory:M.4/functoriality`, `MotivicEtaleKTheory:M.4/localization-sequence`, `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/weil-reciprocity`, `K2SymbolsBrauer:T.3/higher-milnor-residues`

**Source.**

- Burt Totaro, *Milnor K-theory is the simplest part of algebraic K-theory*, §2, Theorem 1, PDF
  p. 5: “CHn(F, n) _~ K~n (F).” — Theorem 1 (scan text): CH^n(F, n) ≅ K^M_n(F).
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.4, printed p. 480
  (PDF p. 488): “A result of Totaro, and Nesterenko-Suslin” — The ring isomorphism K^M_*(k) ≅ ⊕
  H^i(k, Z(i)) compatible with multiplication.

### `M.4/weight-two-symbol-comparison` — The weight-two symbol comparison

*Kind:* theorem.

For a field F: (a) H^{2}(F, Z(2)) ≅ K_2(F), the composite of nesterenko-suslin-totaro (n = 2)
with Matsumoto's identification K^M_2(F) = K_2(F) (K2SymbolsBrauer T.2/matsumoto); (b) for
every m ≥ 1, H^{2}(F, Z/m(2)) ≅ K_2(F)/m, the coefficient sequence H^{2}(F, Z(2))/m → H^{2}(F,
Z/m(2)) → H^{3}(F, Z(2))[m] = 0; (c) H^{p}(F, Z(2)) = 0 for p ≥ 3. The weight-two group
H^{1}(F, Z(2)) and its comparison with the Bloch group belong to K3BlochGroups, which imports
this node; the identification of (b) composed with the motivic-to-étale map with M.3's Galois
symbol is M.5c/galois-symbol-all-degrees in degree two.

**Hypotheses.**

- F a field.

**Construction and proof.**

1. (a) is the n = 2 case of nesterenko-suslin-totaro and Matsumoto's theorem.
2. (b) the coefficient long exact sequence of cycle-complex with (c).
3. (c) is vanishing-above-weight.

**Acceptance.**

- H^{2}(𝔽_q, Z(2)) = K_2(𝔽_q) = 0.
- H^{2}(ℝ, Z/2(2)) ≅ K_2(ℝ)/2 ≅ ℤ/2, generated by {−1, −1}.

**Depends on.** `MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro`, `MotivicEtaleKTheory:M.4/vanishing-above-weight`, `MotivicEtaleKTheory:M.4/cycle-complex`, `K2SymbolsBrauer:T.2/matsumoto`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.4, printed p. 480
  (PDF p. 488): “Since H i (k, Z(i))/m ∼= H i (k, Z/m(i))” — The diagonal mod-m identification
  used in the weight-two case.

### `M.4/projective-bundle-formula` — The projective bundle formula for higher Chow groups

*Kind:* theorem.

Let X be smooth quasi-projective over a field, E a vector bundle of rank r + 1 on X, π : ℙ(E) →
X its projectivisation and ξ = c_1(O(1)) ∈ CH^1(ℙ(E), 0). Then ⊕_{i=0}^{r} CH^{q−i}(X, n) →
CH^q(ℙ(E), n), (x_i) ↦ Σ_i π^*(x_i) · ξ^i, is an isomorphism for all q, n; the classes ξ^i are
the universal classes used for Chern classes in M.8.

**Hypotheses.**

- X smooth quasi-projective over a field; E locally free of rank r + 1.

**Construction and proof.**

1. Reduce to E trivial by Zariski descent (zariski-descent) and the five lemma.
2. For ℙ^r_X use the localization sequence for ℙ^{r−1} ⊂ ℙ^r with complement 𝔸^r and homotopy
   invariance.

**Acceptance.**

- CH^1(ℙ^1_F, 1) ≅ CH^1(F, 1) ⊕ CH^0(F, 1) = F^× ⊕ 0.

**Depends on.** `MotivicEtaleKTheory:M.4/localization-sequence`, `MotivicEtaleKTheory:M.4/homotopy-invariance`, `MotivicEtaleKTheory:M.4/products`, `MotivicEtaleKTheory:M.4/zariski-descent`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*, 14.5
  (projective bundle) and 15.12, PDF p. 126: “then the canonical map induces an isomorphism” —
  The motivic projective bundle decomposition M(ℙ(E)) ≅ ⊕ M(X)(i)[2i]; with MVW 19.1 it gives
  the higher Chow statement, and Bloch's original proof uses localization and homotopy
  invariance as in the proof steps.

### `M.4/purity-gysin-triangle` — Purity for cycle complexes with supports

*Kind:* theorem.

Let X be smooth over a field (or over a Dedekind scheme) and i : Z → X a closed immersion of a
smooth (resp. essentially smooth over the base) subscheme of pure codimension c. Then the
localization sequence gives a distinguished triangle i_* Z(q − c)_Z[−2c] → Z(q)_X → Rj_*
Z(q)_U, so motivic cohomology with supports is H^{p}_Z(X, Z(q)) ≅ H^{p−2c}(Z, Z(q − c)), with
shift 2c and twist c, natural for smooth pairs.

**Hypotheses.**

- X smooth over a field or a Dedekind scheme; Z ⊂ X closed, smooth, of pure codimension c.

**Construction and proof.**

1. Apply localization-sequence: z^{q−c}(Z, •) → z^q(X, •) → z^q(U, •); reindex cohomologically
   (Z(q) = z^q[−2q]) to get the shift 2c and twist c.
2. Over a Dedekind base use Geisser's Corollary 3.3 and Theorem 1.2(1).

**Acceptance.**

- For X = 𝔸^1_F and Z = {0}: H^{2}_{\{0\}}(𝔸^1, Z(1)) ≅ H^{0}(F, Z(0)) = ℤ.

**Depends on.** `MotivicEtaleKTheory:M.4/localization-sequence`, `MotivicEtaleKTheory:M.4/cycle-complex`

**Source.**

- Thomas Geisser, *Motivic cohomology over Dedekind rings*, Theorem 1.2(1) (Purity), PDF p. 2:
  “Z(n − 1)ét [−2] → τ≤n+1 Ri ! Z(n)ét” — Purity with shift 2 and twist 1 for a closed fibre;
  the Zariski form for smooth pairs is the localization triangle.

### `M.4/dedekind-cycle-complex` — Cycle complexes over a Dedekind base

*Kind:* construction. *Library:* `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

Let B be the spectrum of a Dedekind ring (for example O_{F,S}) and X a scheme essentially of
finite type and equidimensional over B. Define Z(n)_X as the complex of Zariski sheaves U ↦
z_{d−n}(U, 2n − •) (dimension-indexed admissible cycles of admissible-cycles, d = dim X) and
its étale sheafification Z(n)_et; for an abelian group A, A(n) = Z(n) ⊗ A. Motivic cohomology
of X is H^{p}(X, Z(n)) = H^{p}_Zar(X, Z(n)). This is the construction to be used for
S-integers; theorems stated only for smooth varieties over a field are not applied to Spec O_F.

**Hypotheses.**

- B a Dedekind scheme; X essentially of finite type and equidimensional over B (essentially
  smooth for the theorems).

**Construction and proof.**

1. Use dimension-indexed admissible cycles, which make sense over B; check the presheaf
   property for flat maps (flat pullback, functoriality) and form the Zariski complex.
2. Hypercohomology agrees with global sections by the localization theorem and the
   Brown–Gersten criterion (Geisser §3).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.HigherChow.dedekindComplex` | constructor | Z(n)_X for X essentially of finite type over a Dedekind scheme. |
| `TauCeti.HigherChow.dedekind_H` | constructor | H^{p}(X, A(n)) as Zariski hypercohomology. |
| `TauCeti.HigherChow.dedekind_restrict_field` | compatibility | Restriction to the generic fibre X_F agrees with cycle-complex for the field case. |
| `TauCeti.HigherChow.dedekind_flat_pullback` | functoriality | Flat pullback Z(n)_X → f_*Z(n)_Y. |
| `TauCeti.HigherChow.dedekind_etale` | constructor | The étale version Z(n)_et and the change-of-topology map Z(n)_Zar → Rε_* Z(n)_et. |

**Used by.**

- MotivicEtaleKTheory:M.7/dedekind-motivic-comparison: The cycle map Z/m(j)_et ≃ μ_m^{⊗j} and
  Beilinson–Lichtenbaum over Spec O_{F,S}[1/ℓ].
- MotivicEtaleKTheory:M.5d request to M.4: 'Arithmetic extension uses the Geisser Dedekind base
  hypotheses.'
- ArithmeticKTheory:N.5/N.6: Motivic cohomology of S-integer rings on the E_2-page.

**Unit tests.**

- `HigherChow.test_dedekind_weight_zero` (degenerate): Z(0)_X ≃ ℤ for X connected and
  essentially smooth over B.
- `HigherChow.test_dedekind_units` (computation): H^{1}(Spec ℤ[1/2], Z(1)) ≅ ℤ[1/2]^× ≅ {±1} ×
  2^ℤ.
- `HigherChow.test_dedekind_generic` (compatibility): For X = Spec F (B = Spec F) the
  construction is cycle-complex.
- `HigherChow.test_not_codimension` (non-example): Codimension indexing would be wrong for X =
  Spec ℤ_(p) ∪ fibres of different dimension; the dimension-indexed groups are the ones with
  localization over B.

**Acceptance.**

- For X = Spec O_{F,S}: H^{1}(X, Z(1)) = O_{F,S}^× and H^{2}(X, Z(1)) = Pic(O_{F,S}).

**Depends on.** `MotivicEtaleKTheory:M.4/admissible-cycles`, `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/functoriality`, `MotivicEtaleKTheory:M.4/localization-sequence`

**Source.**

- Thomas Geisser, *Motivic cohomology over Dedekind rings*, §1, Notation, PDF p. 3: “Throughout
  the paper, B is the spectrum of a Dedekind ring, and X an equidimensional scheme, essentially
  smooth over B.” — Geisser's setting for the arithmetic cycle complex.

### `M.4/dedekind-gersten` — Localization and Gersten resolution over a Dedekind base

*Kind:* theorem.

Let X be essentially smooth over a Dedekind scheme B. (a) For a closed subscheme Z ⊂ X with
complement U there is a localization triangle of Zariski complexes, as in
localization-sequence. (b) If X is the local ring at a point of an essentially smooth B-scheme,
the Gersten complex 0 → H^{t}(X, Z(n)) → ⊕_{x∈X^{(0)}} H^{t}(k(x), Z(n)) → ⊕_{x∈X^{(1)}}
H^{t−1}(k(x), Z(n − 1)) → ⋯ is exact except possibly at the first two terms, and exact
everywhere if the generic-fibre injectivity hypothesis of Geisser's Theorem 1.1 holds;
consequently Z(n)_X is acyclic in degrees above n. (c) Semilocal statement: for X semilocal
essentially smooth over a field, H^{p}(X, Z(n)) → H^{p}(k(X), Z(n)) is injective.

**Hypotheses.**

- X essentially smooth over a Dedekind scheme B (or over a field for (c)).

**Construction and proof.**

1. (a) Levine's localization theorem over Dedekind bases (Geisser Corollary 3.3).
2. (b) the coniveau spectral sequence of the cycle complex, whose E_1-terms are cycle complexes
   of residue fields by localization; Geisser's Theorem 4.2/Corollary 4.3 (Gillet–Levine
   modification of Quillen's argument).
3. (c) Gersten's conjecture for motivic cohomology over a field (Bloch's moving techniques; the
   semilocal case requested by M.5d).

**Acceptance.**

- For X = Spec ℤ_(p): 0 → H^{1}(ℤ_(p), Z(1)) = ℤ_(p)^× → ℚ^× → ℤ → 0 is exact.

**Depends on.** `MotivicEtaleKTheory:M.4/dedekind-cycle-complex`, `MotivicEtaleKTheory:M.4/localization-sequence`, `MotivicEtaleKTheory:M.4/moving-lemma`

**Source.**

- Thomas Geisser, *Motivic cohomology over Dedekind rings*, Theorem 1.1, PDF p. 2: “Then there
  is an exact sequence of Zariski sheaves on X” — Gersten resolution under the generic-fibre
  injectivity hypothesis.
- Thomas Geisser, *Motivic cohomology over Dedekind rings*, Corollary 4.3, PDF p. 14: “Then the
  following sequence is exact except at the first two terms” — The unconditional local
  statement.

### `M.4/zariski-descent` — Zariski descent for cycle complexes

*Kind:* theorem.

For X equidimensional of finite type over a field (or over a Dedekind scheme), the presheaf of
complexes U ↦ z^q(U, •) satisfies Zariski descent: for an open cover X = U ∪ V there is a
Mayer–Vietoris triangle z^q(X, •) → z^q(U, •) ⊕ z^q(V, •) → z^q(U ∩ V, •), and the natural map
CH^q(X, n) → H^{2q−n}_Zar(X, Z(q)) is an isomorphism.

**Hypotheses.**

- X equidimensional of finite type over a field or a Dedekind scheme.

**Construction and proof.**

1. Localization-sequence for the closed complements gives the Mayer–Vietoris property; the
   Brown–Gersten criterion turns it into descent (MVW 19.12, Geisser §3).

**Acceptance.**

- For X = ℙ^1_F covered by two affine lines, Mayer–Vietoris recovers CH^1(ℙ^1, 0) = ℤ from
  CH^1(𝔸^1, 0) = 0 and CH^1(𝔾_m, 1) = F^× ⊕ ℤ.

**Depends on.** `MotivicEtaleKTheory:M.4/localization-sequence`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Proposition 19.12, PDF p. 177: “Let X be any scheme of finite type over a field. For any
  scheme T , each zi (− × T ) satisfies Zariski descent on X.” — Zariski descent for Bloch's
  complexes over a field.
- Thomas Geisser, *Motivic cohomology over Dedekind rings*, proof of Theorem 3.2, PDF p. 8:
  “For (b), we employ the criterion of” — Brown–Gersten descent over a Dedekind base.

## M.5 — The norm-residue theorem, with its proof dependencies

M.5 is the norm residue theorem itself, assembled from M.5c's mod-l theorem in characteristic
zero and the sibling packet's M.5d/prime-power-norm-residue (Bockstein induction,
characteristic and inseparable reductions). Its degree-one case is ProfiniteCohomology Layer
9's Kummer isomorphism, imported rather than re-proved (RT-AREA-ktheory-1/14). The
Beilinson–Lichtenbaum form demanded by RT-AREA-ktheory-1/2 is planned in the sibling packet as
M.7/beilinson-lichtenbaum, which consumes M.4, M.5a and M.5d; the residue-characteristic
Bloch–Gabber–Kato theorem is M.5d's.

**Declarations.** `norm-residue-theorem`.

**Planets.** Norm residue theorem.

**Dependencies inside the roadmap.** `MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees`, `MotivicEtaleKTheory:M.5c/mod-l-norm-residue`, `MotivicEtaleKTheory:M.5d/prime-power-norm-residue`.

**Dependencies on other roadmaps.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.

**Coverage.** planned.

### `M.5/norm-residue-theorem` — The norm residue theorem (Rost–Voevodsky) ★

*Kind:* theorem. *Planet:* Norm residue theorem.

Let F be a field, ℓ a prime invertible in F and r ≥ 1. For every j ≥ 0, the norm residue
homomorphism h^j_F : K^M_j(F)/ℓ^r → H^j(F, μ_{ℓ^r}^{⊗j}) of M.5c/galois-symbol-all-degrees is
an isomorphism; together they form a graded ring isomorphism K^M_*(F)/ℓ^r ≅ ⊕_j H^j(F,
μ_{ℓ^r}^{⊗j}). In degree one it is the Kummer isomorphism of ProfiniteCohomology Layer 9; in
degree two it is the Merkurjev–Suslin theorem, whose arithmetic special cases are M.3's Tate
theorems. Its Beilinson–Lichtenbaum form (Z/m(i) ≃ τ_{≤i}Rα_*μ_m^{⊗i} for smooth schemes over
F) is MotivicEtaleKTheory:M.7/beilinson-lichtenbaum, and the residue-characteristic statement
(Bloch–Gabber–Kato) is M.5d/bloch-gabber-kato, a separate theorem.

**Hypotheses.**

- F a field; ℓ prime with ℓ ≠ char F; r ≥ 1; j ≥ 0.

**Construction and proof.**

1. Mod-ℓ, characteristic zero: M.5c/mod-l-norm-residue.
2. Passage to all fields of characteristic ≠ ℓ (filtered colimits, inseparable and
   characteristic reductions) and to ℓ^r coefficients by the compatible Bockstein induction:
   M.5d/prime-power-norm-residue, which consumes M.5c and M.4.
3. Assemble the graded ring statement from multiplicativity of h_F
   (M.5c/galois-symbol-all-degrees).

**Acceptance.**

- K^M_j(𝔽_q)/ℓ^r = 0 = H^j(𝔽_q, μ_{ℓ^r}^{⊗j}) for j ≥ 2.
- K^M_2(F)/ℓ^r ≅ H²(F, μ_{ℓ^r}^{⊗2}) for every field F with ℓ ≠ char F (Merkurjev–Suslin).

**Depends on.** `MotivicEtaleKTheory:M.5c/mod-l-norm-residue`, `MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees`, `MotivicEtaleKTheory:M.5d/prime-power-norm-residue`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI Corollary 4.1.1,
  printed p. 480 (PDF p. 488): “isomorphisms for all i” — K^M_i(k)/m ≅ H^i_et(k, μ_m^{⊗i}) for
  all i, as a ring isomorphism.
- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Theorem 6.16, PDF p. 41:
  “Let k be a field of characteristic 6= l. Then the norm residue homomorphisms” — Mod-l
  statement for all fields of characteristic ≠ l.

## M.5a — Transfers and motivic homotopy prerequisites

M.5a is the first construction tranche of Voevodsky's proof: finite correspondences, presheaves
and Nisnevich sheaves with transfers, the Suslin complex and the motivic complexes ℤ(q),
Voevodsky's theorem on homotopy invariant presheaves with transfers over perfect fields,
DM^{eff,−}_Nis(k, R) with representability of motivic cohomology, cancellation over any perfect
field, transfers on higher Chow groups with the comparison input to M.4's cycle complex, the
étale comparison ℤ/n(q)_et ≃ μ_n^{⊗q} with the motivic-to-étale map, and the passage to
imperfect fields (p inverted) and filtered colimits. The packaged higher-Chow comparison and
geometric motives belong to MotivesAndAlgebraicCycles MC.4 (RS-08).

**Declarations.** `finite-correspondence`, `presheaf-with-transfers`, `suslin-complex-and-motivic-complexes`, `homotopy-invariant-sheaves`, `effective-motives`, `cancellation`, `cycle-complex-transfers`, `etale-motivic-comparison`, `imperfect-field-passage`.

**Planets.** Finite correspondences, Motivic complexes ℤ(q), Effective motives DM^eff, Cancellation theorem, Motivic-to-étale comparison.

**Dependencies inside the roadmap.** `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/field-etale-galois-comparison`, `MotivicEtaleKTheory:M.4/algebraic-simplex`, `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/functoriality`, `MotivicEtaleKTheory:M.4/localization-sequence`, `MotivicEtaleKTheory:M.4/moving-lemma`.

**Dependencies on other roadmaps.** `EnhancedDerivedSheaves:E5:abstract`.

**Coverage.** planned. Refinements: Read Suslin, 'Motivic complexes over nonperfect fields' (2017) for imperfect-field-passage beyond the transfer argument.

### `M.5a/finite-correspondence` — Finite correspondences ★

*Kind:* definition. *Planet:* Finite correspondences. *Library:* `TauCeti/AlgebraicGeometry/Motives/Transfers`, namespace `TauCeti.Transfers`.

Let k be a field. For X smooth and connected over k and Y separated of finite type over k, an
elementary correspondence from X to Y is an integral closed subscheme W ⊂ X × Y that is finite
and surjective over X; Cor_k(X, Y) is the free abelian group on elementary correspondences (for
non-connected X, the direct sum over components). Composition W' ∘ W ∈ Cor_k(X, Z) is the
pushforward to X × Z of the intersection product (W × Z) · (X × W') on X × Y × Z, which is
defined because the intersection is proper and finite over X. The graph Γ_f of a morphism f : X
→ Y is an elementary correspondence.

**Hypotheses.**

- k a field; X smooth over k; Y separated of finite type over k.

**Construction and proof.**

1. Show proper intersection: (W × Z) ∩ (X × W') is finite over X since W is finite over X and
   W' finite over Y (MVW 1.7).
2. Intersection multiplicities are Serre's Tor formula (or Fulton's), needing X × Y × Z smooth
   along the relevant components; pushforward along the finite projection.
3. Associativity and Γ_g ∘ Γ_f = Γ_{g∘f}.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Transfers.Cor` | constructor | Cor_k(X, Y) as a free abelian group on elementary correspondences. |
| `TauCeti.Transfers.graph` | constructor | Γ_f ∈ Cor_k(X, Y) for f : X → Y. |
| `TauCeti.Transfers.comp` | constructor | Composition Cor_k(Y, Z) × Cor_k(X, Y) → Cor_k(X, Z). |
| `TauCeti.Transfers.comp_assoc` | relation | Composition is associative and bilinear. |
| `TauCeti.Transfers.graph_comp` | simp | Γ_g ∘ Γ_f = Γ_{g∘f} and Γ_id = id. |
| `TauCeti.Transfers.transpose_finite` | other | For f : Y → X finite surjective with X, Y smooth, the transpose Γ_f^t ∈ Cor_k(X, Y). |

**Used by.**

- MVW2006 Lectures 1-2: Morphisms of the category Cor_k on which presheaves with transfers are
  defined.
- MotivesAndAlgebraicCycles:MC.4 (request to M.5a): Finite correspondences and their
  composition underlie geometric motives.
- MotivicEtaleKTheory:M.4/functoriality and M.5a/cycle-complex-transfers: Correspondences act
  on higher Chow groups (MVW 17.21).

**Unit tests.**

- `Transfers.test_point_source` (computation): Cor_k(Spec k, 𝔸^1_k) is the free abelian group
  on closed points of 𝔸^1_k.
- `Transfers.test_empty` (degenerate): Cor_k(∅, Y) = 0 and Cor_k(X, ∅) = 0 for X nonempty.
- `Transfers.test_galois_group_ring` (compatibility): For L/k finite Galois with group G,
  Cor_k(Spec L, Spec L) ≅ ℤ[G] as rings.
- `Transfers.test_not_all_cycles` (non-example): The diagonal of 𝔸^1 × 𝔸^1 is a correspondence
  from 𝔸^1 to 𝔸^1, but the line {0} × 𝔸^1 is not (it is not finite over the first factor).

**Acceptance.**

- Cor_k(Spec k, X) is the group of zero-cycles on X.
- For L/k finite Galois with group G, Cor_k(Spec L, Spec L) ≅ ℤ[G].

**Depends on.** `mathlib:AlgebraicGeometry.AlgebraicCycle`, `MotivicEtaleKTheory:M.4/functoriality`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 1.1, PDF p. 18: “an elementary correspondence from X to Y is an irreducible closed
  subset W of X ×Y whose associated integral subscheme is finite and surjective over X.” —
  Definition.

### `M.5a/presheaf-with-transfers` — Presheaves and Nisnevich sheaves with transfers

*Kind:* definition. *Library:* `TauCeti/AlgebraicGeometry/Motives/Transfers`, namespace `TauCeti.Transfers`.

A presheaf with transfers over k is an additive contravariant functor F : Cor_k → Ab (from the
additive category whose objects are smooth k-schemes); its restriction along the graph functor
Sm/k → Cor_k is a presheaf on Sm/k. The representable presheaf ℤ_tr(X) = Cor_k(−, X). A
Nisnevich sheaf with transfers is a presheaf with transfers whose underlying presheaf is a
sheaf for the Nisnevich topology on Sm/k (covers by étale maps admitting sections over a
stratification; equivalently, the topology generated by elementary distinguished squares).
ℤ_tr(X) is an étale, hence Nisnevich, sheaf, and the Nisnevich sheafification of a presheaf
with transfers carries a unique compatible structure of presheaf with transfers. Sh_Nis(Cor_k)
is abelian with enough injectives.

**Hypotheses.**

- k a field; Sm/k smooth separated schemes of finite type over k.

**Construction and proof.**

1. Define the Nisnevich topology on Sm/k by elementary distinguished squares (an étale V → X
   and open U ⊂ X with V ×_X (X ∖ U) ≅ X ∖ U).
2. ℤ_tr(X) is an étale sheaf (MVW 6.2); sheafification preserves transfers (MVW 6.17 for étale,
   13.1 for Nisnevich), using that Nisnevich covers of henselian local schemes split.
3. Sh_Nis(Cor_k) is a Grothendieck abelian category, so it has enough injectives.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Transfers.PST` | constructor | The abelian category of presheaves with transfers. |
| `TauCeti.Transfers.ztr` | constructor | ℤ_tr(X) = Cor_k(−, X), with the Yoneda isomorphism Hom(ℤ_tr(X), F) ≅ F(X). |
| `TauCeti.Transfers.nisnevichTopology` | constructor | The Nisnevich topology on Sm/k, generated by elementary distinguished squares. |
| `TauCeti.Transfers.NST` | constructor | Nisnevich sheaves with transfers, Sh_Nis(Cor_k). |
| `TauCeti.Transfers.sheafify_transfers` | universal-property | The Nisnevich sheafification of F ∈ PST has a unique transfer structure making F → F_Nis a map in PST. |
| `TauCeti.Transfers.ztr_sheaf` | characterisation | ℤ_tr(X) is an étale sheaf, hence a Nisnevich sheaf. |
| `TauCeti.Transfers.NST_abelian` | instance | Sh_Nis(Cor_k) is abelian with enough injectives. |

**Used by.**

- MVW2006 Definition 3.1: Motivic complexes are complexes of presheaves with transfers.
- MVW2006 Definition 14.1: DM^eff,− is a localisation of D^−(Sh_Nis(Cor_k)).
- MotivesAndAlgebraicCycles:MC.4 (request to M.5a): Nisnevich sheaves with transfers and the
  exactness of the Čech complex of a Zariski cover (MVW 6.12, 6.14).

**Unit tests.**

- `Transfers.test_ztr_point` (computation): ℤ_tr(Spec k)(X) = ℤ^{π_0(X)}.
- `Transfers.test_zero_presheaf` (degenerate): The zero presheaf is a Nisnevich sheaf with
  transfers.
- `Transfers.test_units` (compatibility): O^× with transfers given by norms agrees with G_m on
  Sm/k.
- `Transfers.test_not_zariski` (non-example): A Zariski sheaf need not be a Nisnevich sheaf:
  Nisnevich covers by étale maps with sections are finer, and H^1_Nis ≠ H^1_Zar for nonconstant
  sheaves in general.

**Acceptance.**

- O^× and G_m with their norm transfers are Nisnevich sheaves with transfers (MVW Example 2.4).
- Every constant presheaf ℤ has transfers given by degrees.

**Depends on.** `MotivicEtaleKTheory:M.5a/finite-correspondence`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `EnhancedDerivedSheaves:E5:abstract`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 2.1, PDF p. 28: “A presheaf with transfers is a contravariant additive functor F :
  Cork → Ab.” — Definition of presheaves with transfers.
- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 6.1 and Lecture 13, PDF p. 52: “A presheaf F of abelian groups on Sm/k is an étale
  sheaf if it restricts to an étale sheaf on each X in Sm/k.” — Sheaf conditions on Sm/k;
  Lecture 13 does the Nisnevich case.

### `M.5a/suslin-complex-and-motivic-complexes` — The Suslin complex and the motivic complexes ℤ(q) ★

*Kind:* construction. *Planet:* Motivic complexes ℤ(q). *Library:* `TauCeti/AlgebraicGeometry/Motives/Transfers`, namespace `TauCeti.Transfers`.

For a presheaf F on Sm/k, C_•F is the simplicial presheaf U ↦ F(U × Δ^•) and C_*F its chain
complex; if F has transfers, so does C_*F. For q ≥ 0 the motivic complex is ℤ(q) =
C_*ℤ_tr(𝔾_m^{∧q})[−q], a bounded-above cochain complex of presheaves with transfers
(ℤ_tr(𝔾_m^{∧q}) the summand of ℤ_tr(𝔾_m^{×q}) complementary to the images of the coordinate
inclusions); A(q) = ℤ(q) ⊗ A. Motivic cohomology H^{p,q}(X, A) = H^{p}_Zar(X, A(q)) for X
smooth. There are quasi-isomorphisms ℤ(0) ≃ ℤ and ℤ(1) ≃ O^×[−1], products ℤ(q) ⊗_tr ℤ(q') →
ℤ(q + q'), and for a field F, H^{n,n}(Spec F, ℤ) ≅ K^M_n(F).

**Hypotheses.**

- k a field; q ≥ 0; A an abelian group.

**Construction and proof.**

1. Define C_• via the cosimplicial scheme Δ^• (M.4/algebraic-simplex); transfers pass to C_*F
   termwise.
2. Define ℤ_tr(𝔾_m^{∧q}) as the cokernel of the sum of the coordinate-inclusion maps, and ℤ(q)
   as in MVW Definition 3.1.
3. Weight one: ℤ(1) ≃ O^×[−1] (MVW Theorem 4.1); diagonal: H^{n,n}(F, ℤ) ≅ K^M_n(F) (MVW
   Theorem 5.1).
4. Products from 𝔾_m^{∧q} ∧ 𝔾_m^{∧q'} = 𝔾_m^{∧(q+q')}.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Transfers.suslinComplex` | constructor | C_*F for a presheaf (with transfers) F. |
| `TauCeti.Transfers.motivicComplex` | constructor | ℤ(q) = C_*ℤ_tr(𝔾_m^{∧q})[−q] and A(q) = ℤ(q) ⊗ A. |
| `TauCeti.Transfers.motivicCohomology` | constructor | H^{p,q}(X, A) = H^{p}_Zar(X, A(q)). |
| `TauCeti.Transfers.motivicComplex_zero` | equivalence | ℤ(0) ≃ ℤ. |
| `TauCeti.Transfers.motivicComplex_one` | equivalence | ℤ(1) ≃ O^×[−1] (MVW 4.1). |
| `TauCeti.Transfers.mul` | constructor | Products ℤ(q) ⊗_tr ℤ(q') → ℤ(q + q'), associative and graded-commutative on cohomology. |
| `TauCeti.Transfers.diagonal_milnor` | equivalence | H^{n,n}(Spec F, ℤ) ≅ K^M_n(F), sending {a_1, …, a_n} to the product of the classes of a_i (MVW 5.1). |

**Used by.**

- MotivicEtaleKTheory:M.5c: The cohomology H^{p,q} of simplicial schemes in which the inductive
  proof takes place is computed with these complexes.
- MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison and M.7/beilinson-lichtenbaum: Z/m(j)
  in the Beilinson–Lichtenbaum statement is this complex (compared with M.4's cycle complex).
- MotivesAndAlgebraicCycles:MC.4 (request to M.5a): R(q) = C_*R_tr(G_m^{∧q})[−q] with R(1)^{⊗q}
  = R(q) and multiplication maps (MVW 3.1, 2.13, 10.4).

**Unit tests.**

- `Transfers.test_weight_zero` (degenerate): H^{0,0}(X, ℤ) = ℤ^{π_0(X)} and H^{p,0} = 0 for p ≠
  0.
- `Transfers.test_weight_one_field` (computation): H^{1,1}(Spec F, ℤ) ≅ F^×.
- `Transfers.test_vs_cycle_complex` (compatibility): For X smooth over a perfect field,
  H^{p,q}(X, ℤ) ≅ H^{p}(X, Z(q)) of M.4 (MVW 19.1; the comparison is MotivesAndAlgebraicCycles
  MC.4's).
- `Transfers.test_negative_vanish` (non-example): H^{p,q}(Spec F, ℤ) = 0 for p > q, whereas the
  naive complex ℤ_tr(𝔾_m^{×q}) without smashing has extra summands, e.g. ℤ_tr(𝔾_m) contains ℤ.

**Acceptance.**

- H^{1,1}(F, ℤ) = F^×; H^{2,1}(X, ℤ) = Pic(X) for X smooth.

**Depends on.** `MotivicEtaleKTheory:M.5a/presheaf-with-transfers`, `MotivicEtaleKTheory:M.4/algebraic-simplex`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 3.1, PDF p. 36: “For every integer q ≥ 0 the motivic complex Z(q) is defined as
  the following complex of presheaves with transfers” — Definition of ℤ(q).
- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Theorem 5.1, PDF p. 44: “For any field F and any n we have” — H^{n,n}(Spec F, ℤ) ≅ K^M_n(F).
- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 2.14, PDF p. 31: “We will write C• F for the simplicial presheaf” — The Suslin
  complex.

### `M.5a/homotopy-invariant-sheaves` — Voevodsky's theorem on homotopy invariant presheaves with transfers

*Kind:* theorem.

Let k be a perfect field and F a homotopy invariant presheaf with transfers (F(X) ≅ F(X ×
𝔸^1)). Then the Nisnevich sheafification F_Nis is homotopy invariant, and each cohomology
presheaf H^{n}_Nis(−, F_Nis) is homotopy invariant with transfers. Moreover, Zariski and
Nisnevich cohomology of F_Nis agree on smooth schemes.

**Hypotheses.**

- k perfect; F a homotopy invariant presheaf with transfers on Sm/k.

**Construction and proof.**

1. Prove the Gersten-type exactness for semilocal schemes using the standard triples of
   Voevodsky and the transfers (MVW Lectures 11, 21-24).
2. Deduce homotopy invariance of the sheaf and its cohomology (MVW Theorem 13.8, completed in
   22.3) and the Zariski–Nisnevich comparison.

**Acceptance.**

- F = O^× (homotopy invariant on smooth schemes since O(X × 𝔸^1)^× = O(X)^× for X reduced).

**Depends on.** `MotivicEtaleKTheory:M.5a/presheaf-with-transfers`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Theorem 13.8, PDF p. 115: “Let k be a perfect field and F a homotopy invariant presheaf” —
  Statement (proof completed in 22.3).

### `M.5a/effective-motives` — The triangulated category of effective motives ★

*Kind:* construction. *Planet:* Effective motives DM^eff. *Library:* `TauCeti/AlgebraicGeometry/Motives/Transfers`, namespace `TauCeti.Transfers`.

For a perfect field k and a coefficient ring R, DM^{eff,−}_Nis(k, R) is the localisation of
D^−(Sh_Nis(Cor_k, R)) at the A¹-weak equivalences (the thick subcategory generated by cones of
R_tr(X × 𝔸^1) → R_tr(X)). The motive of X ∈ Sm/k is M(X) = R_tr(X); the tensor structure is
M(X) ⊗ M(Y) = M(X × Y), and the Tate objects are R(q)[2q] = M(ℙ^q)/M(ℙ^{q−1}). C_* is a left
adjoint to the inclusion of A¹-local complexes, which identifies DM^{eff,−}_Nis(k, R) with the
full subcategory of complexes with homotopy invariant cohomology sheaves; motivic cohomology is
representable: H^{n,i}(X, R) ≅ Hom(M(X), R(i)[n]). Simplicial smooth schemes 𝒳 have motives
M(𝒳) by totalisation, with reduced versions for pointed ones.

**Hypotheses.**

- k a perfect field (for imperfect fields work with R in which char k is invertible,
  imperfect-field-passage); R a commutative ring.

**Construction and proof.**

1. Define the localisation (EnhancedDerivedSheaves E5 supplies the abstract Verdier
   localisation and tensor-triangulated structure).
2. Use homotopy-invariant-sheaves to show that C_* F is A¹-local for any F, so C_* realises the
   localisation (MVW Theorem 14.11).
3. Representability of motivic cohomology from Proposition 14.16.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Transfers.DMeff` | constructor | DM^{eff,−}_Nis(k, R), a tensor triangulated category. |
| `TauCeti.Transfers.motive` | constructor | M(X) for X ∈ Sm/k and M(𝒳) for smooth simplicial schemes. |
| `TauCeti.Transfers.motive_tensor` | simp | M(X) ⊗ M(Y) ≅ M(X × Y). |
| `TauCeti.Transfers.motive_A1` | simp | M(X × 𝔸^1) ≅ M(X). |
| `TauCeti.Transfers.hom_motive_tate` | characterisation | Hom(M(X), R(i)[n]) ≅ H^{n,i}(X, R). |
| `TauCeti.Transfers.localisation_equiv` | equivalence | The A¹-local complexes form a subcategory equivalent to DM^{eff,−}_Nis(k, R), with C_* as localisation functor. |
| `TauCeti.Transfers.projective_line` | example | M(ℙ^1) ≅ R ⊕ R(1)[2]. |

**Used by.**

- Voevodsky2011 §§4-6: The Rost motive, the Čech motives M(Č(X)) and the degree theorem live in
  DM^{eff,−}(k, ℤ_(l)) and DM(k, ℤ/l).
- MotivesAndAlgebraicCycles:MC.4: Geometric motives and Tate stabilisation extend this category
  (MC.4 owns them).
- MotivicEtaleKTheory:M.5b/motivic-steenrod-operations: Operations are defined on motivic
  cohomology of pointed simplicial schemes, representable here.

**Unit tests.**

- `Transfers.test_point` (degenerate): M(Spec k) = R is the unit object.
- `Transfers.test_projective_line` (computation): Hom(M(ℙ^1), R(1)[2]) ≅ Pic(ℙ^1) ⊗ R ⊕
  H^{2,1}(k, R) = R.
- `Transfers.test_hom_cycles` (compatibility): Hom(M(X), ℤ(q)[p]) ≅ CH^q(X, 2q − p) for X
  smooth (through MC.4's comparison with M.4).
- `Transfers.test_affine_line` (non-example): M(𝔸^1) is not M(Spec k) ⊕ ℤ(1)[1]: the
  A¹-localisation contracts 𝔸^1, unlike 𝔾_m with M(𝔾_m) = ℤ ⊕ ℤ(1)[1].

**Acceptance.**

- M(𝔸^1) ≅ M(Spec k) and M(ℙ^1) ≅ R ⊕ R(1)[2].

**Depends on.** `MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves`, `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`, `EnhancedDerivedSheaves:E5:abstract`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Definition 14.1, PDF p. 124: “The triangulated category of motives over k is defined to” —
  Definition of DM^{eff,−}_Nis(k, R) and M(X).
- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Proposition 14.16, PDF p. 129: “In particular, the motivic cohomology functors X → H n,i (X,
  R) are representable” — Representability.

### `M.5a/cancellation` — Voevodsky's cancellation theorem ★

*Kind:* theorem. *Planet:* Cancellation theorem.

Let k be a perfect field. For all M, N in DM^{eff,−}_Nis(k, ℤ), tensoring with ℤ(1) induces an
isomorphism Hom(M, N) → Hom(M(1), N(1)). In particular H^{p,q}(X, ℤ) ≅ H^{p+1,q+1}(X × 𝔾_m,
ℤ)/H^{p+1,q+1}(X, ℤ), and DM^{eff,−} embeds fully faithfully into DM^{−}(k) =
DM^{eff,−}[ℤ(1)^{−1}]. No resolution of singularities is assumed.

**Hypotheses.**

- k a perfect field (for imperfect fields after inverting the characteristic exponent).

**Construction and proof.**

1. Reduce to M = M(X)[n], N = C_*ℤ_tr(Y) by triangulated generation.
2. Construct, for each X, an explicit inverse to − ⊗ 𝔾_m on Hom groups using the divisor of the
   functions t^{n+1} − f and t^{n+1} − g on X × 𝔾_m × 𝔸^1 (Voevodsky's homotopy argument, §4).
3. Compare with MVW 16.25, which proves the same under resolution of singularities.

**Acceptance.**

- Hom(ℤ(1), ℤ(1)) = Hom(ℤ, ℤ) = ℤ.

**Depends on.** `MotivicEtaleKTheory:M.5a/effective-motives`

**Source.**

- Vladimir Voevodsky, *Cancellation theorem*, Corollary 4.10, PDF p. 14: “Let k be a perfect
  field. Then for any K, L in DM−ef f (k) the map Hom(K, L) → Hom(K(1), L(1)) is a bijection.”
  — Cancellation over any perfect field (arXiv version read).
- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Theorem 16.25, PDF p. 146: “Then tensoring with Z(1) induces an isomorphism Hom(M, N) →
  Hom(M(1), N(1)).” — MVW's version under resolution of singularities.

### `M.5a/cycle-complex-transfers` — Transfers on higher Chow groups and the comparison maps

*Kind:* theorem.

For a field k, finite correspondences act on the cycle complexes: for W ∈ Cor_k(X, Y) between
smooth k-schemes there is W^* : CH^i(Y, m) → CH^i(X, m), and these make CH^i(−, m) a presheaf
with transfers, compatible with the graph functor (W = Γ_f gives f^*). For X smooth over a
perfect field, Suslin's comparison of the cycle complex with the equidimensional cycle complex
gives a natural, transfer-compatible quasi-isomorphism between ℤ(q)
(suslin-complex-and-motivic-complexes) and the cycle complex Z(q) of M.4 on the small Zariski
site, inducing H^{p,q}(X, ℤ) ≅ CH^q(X, 2q − p); this is the transfer-compatible input that
MotivesAndAlgebraicCycles MC.4 packages as its comparison theorem.

**Hypotheses.**

- k a field; X, Y smooth over k; perfect k for the comparison quasi-isomorphism.

**Construction and proof.**

1. Define W^* by pulling back along X × Y → Y after moving into good position and pushing
   forward along the finite W → X (MVW 17.17); check composition (MVW Theorem 17.21).
2. Compare equidimensional cycles z_equi(𝔸^q, 0)(− × Δ^•) with z^q(− × Δ^•) (Suslin's theorem,
   MVW Lecture 18) and use the localisation and moving lemmas of M.4 to identify ℤ(q)[2q] with
   z^q(−, •) up to quasi-isomorphism (MVW Lecture 19).

**Acceptance.**

- For q = 1, W^* on CH^1(Y, 1) = O(Y)^× is the norm along W.

**Depends on.** `MotivicEtaleKTheory:M.5a/finite-correspondence`, `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`, `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/functoriality`, `MotivicEtaleKTheory:M.4/moving-lemma`, `MotivicEtaleKTheory:M.4/localization-sequence`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Theorem 17.21, PDF p. 157: “The maps W ∗ defined in 17.17 give the higher Chow groups CH i
  (−, m) the structure of presheaves with transfers.” — Transfers on higher Chow groups.
- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Theorem 19.1, PDF p. 174: “Let X be a smooth separated scheme over a perfect field k, then
  for all n and i ≥ 0 there is a natural isomorphism” — The comparison H^{n,i}(X, ℤ) ≅ CH^i(X,
  2i − n).

### `M.5a/etale-motivic-comparison` — Étale motivic cohomology with finite coefficients and the comparison map ★

*Kind:* theorem. *Planet:* Motivic-to-étale comparison.

Let k be a field and n invertible in k. (a) The étale sheafification of ℤ/n(q) is
quasi-isomorphic to μ_n^{⊗q} as complexes of étale sheaves with transfers, so H^{p,q}_L(X, ℤ/n)
:= H^{p}_et(X, ℤ/n(q)) ≅ H^{p}_et(X, μ_n^{⊗q}) for X smooth. (b) Change of topology α :
(Sm/k)_et → (Sm/k)_Nis gives a natural map H^{p,q}(X, ℤ/n) → H^{p}_et(X, μ_n^{⊗q}),
multiplicative and compatible with transfers; in weight one it is the Kummer map O(X)^×/n ≅
H^{1,1}(X, ℤ/n) → H^{1}_et(X, μ_n). This is the motivic-to-étale map of the norm residue
theorem.

**Hypotheses.**

- k a field; n invertible in k; X smooth over k.

**Construction and proof.**

1. μ_n → ℤ/n(1) is an étale quasi-isomorphism by ℤ(1) ≃ O^×[−1] and the étale Kummer sequence
   (MVW 4.1 and Lecture 10).
2. Tensor powers: ℤ/n(q)_et ≃ ℤ/n(1)_et^{⊗q} ≃ μ_n^{⊗q} (rigidity for homotopy invariant étale
   sheaves with transfers with torsion coefficients; MVW Theorem 10.2).
3. Define the comparison map as the unit H^{p}_Nis(X, ℤ/n(q)) → H^{p}_Nis(X, Rα_*α^*ℤ/n(q)) =
   H^{p}_et(X, ℤ/n(q)_et).

**Acceptance.**

- For X = Spec F, H^{1,1}(F, ℤ/n) = F^×/n → H^{1}(F, μ_n) is the Kummer isomorphism (Hilbert
  90).

**Depends on.** `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`, `MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves`, `MotivicEtaleKTheory:M.1/etale-twist-sheaf`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `MotivicEtaleKTheory:M.1/field-etale-galois-comparison`

**Source.**

- Carlo Mazza, Vladimir Voevodsky, Charles Weibel, *Lecture Notes on Motivic Cohomology*,
  Theorem 10.2, PDF p. 90: “Let n be an integer prime to the characteristic of k. Then:” —
  H_L^{p,q}(X, ℤ/n) = H_et^p(X, μ_n^{⊗q}).
- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI.4, before Theorem
  4.1, printed p. 480 (PDF p. 488): “It arises from the forgetful functor a∗ from” — The
  comparison map H^n(X, ℤ/m(i)) → H^n_et(X, μ_m^{⊗i}).

### `M.5a/imperfect-field-passage` — Imperfect fields and filtered colimits

*Kind:* theorem.

(a) Let k'/k be a purely inseparable extension of fields of characteristic p > 0 and R a
coefficient ring in which p is invertible. Base change induces isomorphisms H^{p,q}(X, R) ≅
H^{p,q}(X_{k'}, R) for X smooth over k, and the cycle complexes satisfy CH^q(X, n) ⊗ R ≅
CH^q(X_{k'}, n) ⊗ R; this is the only passage between imperfect and perfect fields used, and it
requires p invertible in the coefficients. (b) For a filtered system of fields (or essentially
smooth k-schemes with affine flat transition maps) X = lim X_α, CH^q(X, n) = colim CH^q(X_α, n)
and H^{p,q}(X, R) = colim H^{p,q}(X_α, R).

**Hypotheses.**

- (a) p = char k > 0 invertible in R; (b) filtered limits with affine, flat (essentially étale
  or field-extension) transition maps.

**Construction and proof.**

1. (a) The composite of pushforward and pullback along the finite flat purely inseparable Spec
   k' → Spec k is multiplication by [k' : k], a power of p, on cycle complexes in both orders
   (M.4/functoriality), hence an isomorphism after inverting p.
2. (b) Cycles on X × Δ^n are defined over some X_α (finite presentation), and admissibility
   descends; homology commutes with filtered colimits.

**Acceptance.**

- For k' = k^{1/p}, CH^1(k', 1)[1/p] = k'^× ⊗ ℤ[1/p] ≅ k^× ⊗ ℤ[1/p] since k'^{×p} = k^×.

**Depends on.** `MotivicEtaleKTheory:M.4/cycle-complex`, `MotivicEtaleKTheory:M.4/functoriality`, `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`

**Source.**

- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, §6, after Lemma 6.15, PDF
  p. 41: “following two results from Theorem 6.1 can be found in [6]” — The passage from
  characteristic zero to general fields relies on these reductions; the
  inseparable/characteristic-p reductions themselves are M.5d's node.

## M.5b — Cohomology operations and norm-variety geometry

M.5b constructs the motivic reduced power operations and Bocksteins with Cartan, instability
and Adem relations, the Milnor operations Q_i, the characteristic numbers and ν_n-varieties,
norm (Rost) varieties, Voevodsky's motivic degree theorem, the Pfister-neighbour norm varieties
at l = 2 and, for odd l, Rost's Chain Lemma and Norm Principle with the existence theorem for
norm varieties. The geometric statements hold in characteristic zero, the range of the sources;
extension to other characteristics is part of M.5d's reductions, not assumed here.

**Declarations.** `motivic-steenrod-operations`, `steenrod-relations`, `milnor-operations`, `nu-variety`, `degree-theorem`, `pfister-norm-variety`, `chain-lemma-and-norm-principle`, `norm-variety-existence`.

**Planets.** Motivic Steenrod operations, Norm varieties, Motivic degree theorem, Existence of norm varieties.

**Dependencies inside the roadmap.** `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`.

**Dependencies on other roadmaps.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

**Coverage.** planned. Refinements: Read Suslin–Joukhovitski, 'Norm varieties' (JPAA 206, 2006) for norm-variety-existence; the present locators are Voevodsky 2011 Theorem 6.3 and Haesemeyer–Weibel Theorem 0.7.

### `M.5b/motivic-steenrod-operations` — Motivic reduced power operations ★

*Kind:* construction. *Planet:* Motivic Steenrod operations. *Library:* `TauCeti/AlgebraicGeometry/Motives/Operations`, namespace `TauCeti.MotivicSteenrod`.

Let k be a field and l a prime different from char k. For every pointed smooth simplicial
scheme 𝒳 over k there are natural operations on reduced motivic cohomology with ℤ/l
coefficients: the Bockstein β : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+1,q}(𝒳, ℤ/l) (connecting map of 0 →
ℤ/l → ℤ/l² → ℤ/l → 0) and the reduced powers P^i : H̃^{p,q} → H̃^{p+2i(l−1), q+i(l−1)} (l odd),
resp. Sq^{2i} = P^i and Sq^{2i+1} = B^i for l = 2, defined from the total power operation P :
H̃^{2n,n}(𝒳) → H̃^{2nl,nl}(𝒳 ∧ (BS_l)_+) and the computation H̃^{*,*}(𝒳 ∧ (BS_l)_+, ℤ/l) =
H̃^{*,*}(𝒳, ℤ/l)[[c, d]]/(c² = τd + ρc) (l = 2), resp. /(c² = 0) (l odd), where ρ is the class
of −1 in H^{1,1} and τ ∈ H^{0,1}.

**Hypotheses.**

- k a field; l a prime ≠ char k; 𝒳 a pointed smooth simplicial scheme (or simplicial sheaf)
  over k.

**Construction and proof.**

1. Construct the total power operation via the symmetric power of the Eilenberg–MacLane object
   and the classifying space BS_l (Voevodsky RPO §§5-7).
2. Compute the motivic cohomology of BS_l and Bμ_l (RPO Theorems 6.10, 6.16) and extract P^i,
   B^i from the coefficients of the total power on generators c, d (RPO §9).
3. Extend to all bidegrees by suspension (σ_s, σ_t) invariance.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.MotivicSteenrod.bockstein` | constructor | β : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+1,q}(𝒳, ℤ/l). |
| `TauCeti.MotivicSteenrod.reducedPower` | constructor | P^i : H̃^{p,q} → H̃^{p+2i(l−1), q+i(l−1)}. |
| `TauCeti.MotivicSteenrod.natural` | functoriality | β and P^i commute with pullback along maps of pointed simplicial schemes. |
| `TauCeti.MotivicSteenrod.suspension` | compatibility | β and P^i commute with the simplicial and 𝔾_m suspension isomorphisms. |
| `TauCeti.MotivicSteenrod.BSl_cohomology` | characterisation | H̃^{*,*}(𝒳 ∧ (BS_l)_+) = H̃^{*,*}(𝒳)[[c, d]]/(c² = τd + ρc) for l = 2 and /(c² = 0) for l odd. |
| `TauCeti.MotivicSteenrod.etale_realisation` | compatibility | Under the motivic-to-étale map, P^i and β go to the classical Steenrod operations and Bockstein on étale cohomology with ℤ/l coefficients. |

**Used by.**

- Voevodsky2011 Theorem 3.8 and Lemma 4.1: β P^n and the Milnor operations Q_n detect the Rost
  motive and the degree of characteristic numbers.
- Voevodsky2011 Lemmas 6.6-6.15: Margolis-type vanishing on H̃^{*,*}(X̃) drives the induction.
- MotivicEtaleKTheory:M.5c/rost-motive: φ_{l−1} = c·βP^n identifies the symmetric-power
  operation used to build the Rost motive.

**Unit tests.**

- `MotivicSteenrod.test_P0` (degenerate): P^0 = Id.
- `MotivicSteenrod.test_square` (computation): For u ∈ H̃^{2n,n}, P^n(u) = u^l (RPO Lemma 9.7).
- `MotivicSteenrod.test_bockstein_P` (compatibility): β P^i = B^i and β B^i = 0 (RPO Lemma
  9.5).
- `MotivicSteenrod.test_rho_term` (non-example): For l = 2 the motivic Cartan formula has the
  extra term τ, ρ: the topological Cartan formula Sq^2(xy) = Sq^2x·y + Sq^1x·Sq^1y + x·Sq^2y
  fails without the ρ-term over k = ℝ.

**Acceptance.**

- P^0 = Id and P^i = 0 for i < 0 (RPO Theorems 9.3-9.4).
- For l = 2 and u ∈ H̃^{2n,n}, Sq^{2n}(u) = u².

**Depends on.** `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`

**Source.**

- Vladimir Voevodsky, *Reduced power operations in motivic cohomology*, Theorem 6.16, PDF p.
  27: “For any pointed simplicial sheaf F• over k one has” — The cohomology of F ∧ (BS_l)_+
  used to define the operations.
- Vladimir Voevodsky, *Reduced power operations in motivic cohomology*, §9, PDF p. 35: “For u ∈
  H̃ 2d,d define” — Definition of P^i(u) = D_{d−i}(u) and B^i(u) = C_{d−i}(u).

### `M.5b/steenrod-relations` — Cartan formula, instability and Adem relations

*Kind:* theorem.

For k a field, l ≠ char k, and the operations of motivic-steenrod-operations: (a) P^i = 0 for i
< 0 and P^0 = Id; (b) β² = 0, β P^i = B^i and β B^i = 0; (c) Cartan formula: for l odd, P^i(uv)
= Σ_r P^r(u)P^{i−r}(v), and for l = 2 the corrected formula with the terms involving τ and ρ;
(d) instability: for u ∈ H̃^{2n,n}, P^n(u) = u^l, and for u ∈ H̃^{p,q} with n > p − q and n ≥
q, P^n(u) = 0; (e) the Adem relations hold, so the operations generate the motivic Steenrod
algebra A^{*,*}(k, ℤ/l), which over k with l odd (or l = 2 with ρ = 0) is the topological
algebra tensored with H^{*,*}(k, ℤ/l).

**Hypotheses.**

- k a field; l ≠ char k prime.

**Construction and proof.**

1. (a)-(b): RPO Theorems 9.3, 9.4 and Lemma 9.5.
2. (c): RPO Proposition 9.6 from the multiplicativity of the total power operation.
3. (d): RPO Lemmas 9.7-9.8.
4. (e): RPO §10 from the cohomology of B(S_l × S_l) → BS_{l²}.

**Acceptance.**

- For l = 2, Sq^1 = β and Sq^{2n}(u) = u² on H̃^{2n,n}.

**Depends on.** `MotivicEtaleKTheory:M.5b/motivic-steenrod-operations`

**Source.**

- Vladimir Voevodsky, *Reduced power operations in motivic cohomology*, Lemmas 9.7-9.8, PDF p.
  37: “For u ∈ H̃ p,q and n > p − q, n ≥ q one has P n (u) = 0.” — Instability.
- Vladimir Voevodsky, *Reduced power operations in motivic cohomology*, Proposition 9.6, PDF p.
  36: “For u, v ∈ H̃ ∗,∗ and l 6= 2 one has:” — Cartan formula.

### `M.5b/milnor-operations` — The Milnor operations Q_i

*Kind:* construction. *Library:* `TauCeti/AlgebraicGeometry/Motives/Operations`, namespace `TauCeti.MotivicSteenrod`.

For k a field and l ≠ char k, the Milnor operations Q_i ∈ A^{2l^i−1, l^i−1} are defined
inductively by Q_0 = β and Q_{i+1} = [P^{l^i}, Q_i] (for l = 2 the corrected commutator); they
satisfy Q_i² = 0 and Q_iQ_j = −Q_jQ_i, act as derivations up to the ρ-terms, and for l > 2
satisfy Q_0P^b = P^bQ_0 + P^{b−1}Q_1 + P^{b−l−1}Q_2 + ⋯ + P^0Q_n with b = (l^n − 1)/(l − 1).
Q_i raises bidegree by (2l^i − 1, l^i − 1).

**Hypotheses.**

- k a field; l ≠ char k prime.

**Construction and proof.**

1. Define Q_i by the commutator formula in the motivic Steenrod algebra (RPO §13).
2. Q_i² = 0 from the Adem relations; the relation with P^b is Voevodsky 2011 Lemma 5.13.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.MotivicSteenrod.milnorOp` | constructor | Q_i ∈ A^{2l^i−1, l^i−1}. |
| `TauCeti.MotivicSteenrod.milnorOp_zero` | simp | Q_0 = β. |
| `TauCeti.MotivicSteenrod.milnorOp_sq` | relation | Q_i ∘ Q_i = 0. |
| `TauCeti.MotivicSteenrod.milnorOp_anticomm` | relation | Q_i Q_j = −Q_j Q_i. |
| `TauCeti.MotivicSteenrod.Q0_Pb` | relation | For l > 2, Q_0P^b = P^bQ_0 + P^{b−1}Q_1 + ⋯ + P^0Q_n with b = (l^n − 1)/(l − 1). |

**Used by.**

- Voevodsky2011 Lemma 4.1: Q_n(t̃) = (deg s_{l^n−1}(X)/l)·v computes the characteristic number.
- Voevodsky2011 Lemmas 6.6-6.7: Q_{n−1}⋯Q_0(δ) ≠ 0 for the class δ of a nonzero symbol.
- MotivicEtaleKTheory:M.5c/hilbert-ninety-induction: Margolis homology of Q_i on H̃^{*,*}(X̃)
  vanishes for a ν_n-variety (Lemma 4.3).

**Unit tests.**

- `MotivicSteenrod.test_Q0_beta` (degenerate): Q_0 is the Bockstein β.
- `MotivicSteenrod.test_Q_bidegree` (computation): Q_1 has bidegree (2l − 1, l − 1); for l = 2,
  (3, 1).
- `MotivicSteenrod.test_Q_etale` (compatibility): Under étale realisation Q_i maps to the
  topological Milnor primitive.
- `MotivicSteenrod.test_Q_not_derivation` (non-example): For l = 2 over k = ℝ, Q_0 is not a
  derivation on the nose: β(uv) differs from βu·v + u·βv by a ρ-term, so a definition ignoring
  ρ gives wrong values.

**Acceptance.**

- Q_0 = β.

**Depends on.** `MotivicEtaleKTheory:M.5b/steenrod-relations`

**Source.**

- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Lemma 5.13, PDF p. 31:
  “One has the following equality in the motivic Steenrod algebra for l > 2:” — Q_0 P^b = P^b
  Q_0 + P^{b−1} Q_1 + ⋯ + P^0 Q_n.
- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Lemma 4.1, PDF p. 20:
  “Recall from [8] that Qn = βqn ± qn β where β is the Bockstein homomorphism.” — Definition of
  Q_n through q_n and β.

### `M.5b/nu-variety` — ν_n-varieties and norm varieties ★

*Kind:* definition. *Planet:* Norm varieties. *Library:* `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

Let k be a field of characteristic 0 and l a prime. For a smooth projective variety X of
dimension d > 0, s_d(X) ∈ ℤ is the degree of the d-th Milnor characteristic class (the
characteristic number of the polynomial Σ t_i^d in the Chern roots of T_X). For d = l^n − 1 ≥ 1
the number s_d(X) is always divisible by l; X is a ν_n-variety if d = l^n − 1 and s_d(X) ≢ 0
(mod l²). For a symbol a = {a_1, …, a_n} ∈ K^M_n(k)/l, a smooth connected X splits a if a
vanishes in K^M_n(k(X))/l. A norm variety (Rost variety) for a nonzero a is a ν_{n−1}-variety
of dimension l^{n−1} − 1 splitting a, with the ν_{≤ n−1} property (Voevodsky's Definition 6.2:
for i < n − 1 there are ν_i-varieties X_i with morphisms X_i → X) and satisfying the exactness
of H_{−1,−1}(X × X) → H_{−1,−1}(X) → k^× (Rost's norm condition).

**Hypotheses.**

- k of characteristic 0 (the source's range); l prime; a a symbol in K^M_n(k)/l.

**Construction and proof.**

1. Define s_d via the Chern classes of T_X (SF.5 Chow ring) and its degree.
2. Define splitting via the function field and K^M of M.4/nesterenko-suslin-totaro's source
   K2SymbolsBrauer T.2.
3. Assemble the norm-variety conditions as in Voevodsky 2011 Definition 6.2 and Theorem 6.3,
   and Haesemeyer–Weibel Definitions 0.4-0.5.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.RostMotive.charNumber` | constructor | s_d(X) ∈ ℤ for X smooth projective of dimension d. |
| `TauCeti.RostMotive.IsNuVariety` | characterisation | X is a ν_n-variety iff dim X = l^n − 1 and s_{l^n−1}(X) ≢ 0 mod l². |
| `TauCeti.RostMotive.Splits` | characterisation | X splits a iff a ↦ 0 in K^M_n(k(X))/l. |
| `TauCeti.RostMotive.IsNormVariety` | constructor | The norm-variety predicate: ν_{≤(n−1)}, splits a, and Rost's norm exactness. |
| `TauCeti.RostMotive.splits_baseChange` | functoriality | If X splits a then X_{k'} splits a_{k'} for every field extension k'/k. |

**Used by.**

- Voevodsky2011 Theorem 6.3 and Lemmas 6.8-6.9: A ν_{≤(n−1)}-variety splitting a gives M(X̃) =
  M(Č(X)) and the exact sequence used to prove H90.
- HW2009Chain Theorem 0.7: Existence of Rost varieties, from the Chain Lemma and the Norm
  Principle.
- MotivicEtaleKTheory:M.5c/rost-motive: The Rost motive is a summand of M(X) for a norm variety
  X.

**Unit tests.**

- `RostMotive.test_projective_space` (computation): s_{l−1}(ℙ^{l−1}) = l, so ℙ^{l−1} is a
  ν_1-variety.
- `RostMotive.test_point` (degenerate): Spec k (dimension 0 = l^0 − 1) splits a iff a = 0 in
  K^M_n(k)/l.
- `RostMotive.test_splits_degree_one` (compatibility): If X has a k-rational point and splits
  a, then a = 0.
- `RostMotive.test_quadric_not_nu` (non-example): A smooth conic in ℙ^2 has dimension 1 = 2^1 −
  1 and s_1 = 2 ≢ 0 mod 4, so it is a ν_1-variety for l = 2, while ℙ^1 × ℙ^1 (dimension 2) is
  not a ν_n-variety for any n when l = 2.

**Acceptance.**

- ℙ^{l−1} is a ν_1-variety: s_{l−1}(ℙ^{l−1}) = l and l ≢ 0 mod l².

**Depends on.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `SchemeAndStackFoundations:SF.5`

**Source.**

- Christian Haesemeyer, Charles Weibel, *Norm varieties and the chain lemma (after Markus
  Rost)*, Definition 0.4, PDF p. 2: “is a smooth projective variety X of dimension d = pn−1 −
  1, with sd (X) 6≡ 0 (mod p2 ).” — Definition of ν_{n−1}-variety; Definition 0.5 defines Rost
  varieties.
- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, §6, PDF p. 33: “We say
  that a smooth connected scheme X splits a modulo l if a becomes zero in KnM (k(X))/l” —
  Splitting.

### `M.5b/degree-theorem` — Voevodsky's motivic degree theorem ★

*Kind:* theorem. *Planet:* Motivic degree theorem.

Let k be a field of characteristic 0, l a prime, 𝒳 an embedded simplicial scheme such that
there is a ν_n-variety X with M(X, ℤ/l) in the subcategory DM_𝒳, and t̃ the Thom class of the
normal bundle of X ⊂ ℙ^N. Then Q_n(t̃) = (deg s_{l^n−1}(X)/l) · v mod l (Lemma 4.1), the
Margolis homology of Q_n on H̃^{*,*}(𝒳̃, ℤ/l) vanishes (Lemma 4.3), and for any commutative
square M(X) → N → ℤ/l_𝒳 with a class α ∈ H^{p,q}(𝒳, ℤ/l), p > q, α ≠ 0, α ∘ r = 0 and Q_n(α) =
0, the composite is nonzero (Theorem 4.4).

**Hypotheses.**

- k of characteristic 0; l prime; X a ν_n-variety; 𝒳 embedded with M(X) ∈ DM_𝒳.

**Construction and proof.**

1. Compute Q_n on the Thom class through the characteristic class c_{Q_n} = s_{l^n−1}
   (Voevodsky 2011 Lemma 4.1, using RPO Theorem 14.2).
2. Deduce vanishing of Margolis homology and the degree theorem (Lemma 4.3, Theorem 4.4).

**Acceptance.**

- For n = 1 and X = a conic splitting a quaternion algebra (l = 2), the theorem gives the
  nontriviality used for the Pfister-quadric case of the Milnor conjecture.

**Depends on.** `MotivicEtaleKTheory:M.5b/milnor-operations`, `MotivicEtaleKTheory:M.5b/nu-variety`, `MotivicEtaleKTheory:M.5a/effective-motives`

**Source.**

- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Lemma 4.1, PDF p. 20: “Let
  X be a smooth projective variety of dimension d = ln − 1 where n > 0. Then one has” — Q_n(t̃)
  = (deg(s_{l^n−1}(X))/l) v mod l.
- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Theorem 4.4, PDF p. 23:
  “Assume that there exists a class α ∈ H p,q (X , Z/l) such that the following conditions
  hold” — The motivic degree theorem.

### `M.5b/pfister-norm-variety` — Pfister neighbours as norm varieties for l = 2

*Kind:* construction. *Library:* `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

Let k be a field of characteristic 0 and a = (a_1, …, a_n) with a_i ∈ k^×. The (n−1)-fold
Pfister form ⟨⟨a_1, …, a_{n−1}⟩⟩ = ⊗_{i<n} ⟨1, −a_i⟩ (QuadraticFormInvariants Layer 4) and the
Pfister neighbour q_a = ⟨⟨a_1, …, a_{n−1}⟩⟩ ⊥ ⟨−a_n⟩, of dimension 2^{n−1} + 1, define the
smooth projective quadric Q_a ⊂ ℙ^{2^{n−1}} of dimension 2^{n−1} − 1. Q_a splits the symbol
{a_1, …, a_n} mod 2, is a ν_{n−1}-variety, and Q_a has a k-point iff the symbol is zero in
K^M_n(k)/2. This is the l = 2 norm variety used by Voevodsky for the Milnor conjecture.

**Hypotheses.**

- k of characteristic 0 (char ≠ 2 suffices for the quadric itself); a_i ∈ k^×.

**Construction and proof.**

1. Define q_a from the Pfister form of QuadraticFormInvariants Layer 4 and its projective
   quadric.
2. Over k(Q_a), q_a is isotropic, so ⟨⟨a_1, …, a_n⟩⟩ is isotropic, hence hyperbolic (Pfister
   forms are round), hence {a} = 0 in K^M_n/2 (by the Milnor–Pfister dictionary).
3. For a smooth quadric Q ⊂ ℙ^{d+1} of dimension d, c(T_Q) = (1 + h)^{d+2}/(1 + 2h) and deg h^d
   = 2, so s_d(Q) = 2((d + 2) − 2^d); for d = 2^{n−1} − 1 with n ≥ 2 the factor (2^{n−1} + 1 −
   2^{d}) is odd, so s_d(Q_a) ≡ 2 (mod 4) and Q_a is a ν_{n−1}-variety.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.RostMotive.pfisterNeighbourQuadric` | constructor | Q_a ⊂ ℙ^{2^{n−1}} for a ∈ (k^×)^n. |
| `TauCeti.RostMotive.pfister_dim` | simp | dim Q_a = 2^{n−1} − 1. |
| `TauCeti.RostMotive.pfister_splits` | characterisation | Q_a splits {a_1, …, a_n} mod 2. |
| `TauCeti.RostMotive.pfister_isNu` | characterisation | Q_a is a ν_{n−1}-variety for l = 2. |
| `TauCeti.RostMotive.pfister_point_iff` | characterisation | Q_a(k) ≠ ∅ iff {a_1, …, a_n} = 0 in K^M_n(k)/2. |

**Used by.**

- Voevodsky2011 Theorem 6.3 (l = 2): The ν_{≤(n−1)}-variety splitting a for l = 2.
- MotivicEtaleKTheory:M.5c/rost-motive: The l = 2 Rost motive is a summand of M(Q_a).
- Haesemeyer–Weibel, Norm varieties and the chain lemma, Definition 0.5: Rost varieties for odd
  l generalise the l = 2 Pfister quadrics.

**Unit tests.**

- `RostMotive.test_pfister_n1` (degenerate): For n = 1, Q_a is the zero-dimensional quadric x²
  = a_1 z², which has a point iff a_1 is a square.
- `RostMotive.test_pfister_conic` (computation): For n = 2 and a = (−1, −1) over ℝ, q_a = ⟨1,
  1⟩ ⊥ ⟨1⟩, so Q_a is the conic x² + y² + z² = 0 with no real point, matching {−1, −1} ≠ 0 in
  K^M_2(ℝ)/2.
- `RostMotive.test_pfister_quaternion` (compatibility): For n = 2, Q_a has a point iff the
  quaternion algebra (a_1, a_2) splits (QuadraticFormInvariants Layer 2).
- `RostMotive.test_not_full_pfister` (non-example): The full Pfister quadric ⟨⟨a_1, …, a_n⟩⟩ =
  0 has dimension 2^n − 2, not 2^{n−1} − 1, so it is not a ν_{n−1}-variety; the neighbour is
  required.

**Acceptance.**

- For n = 2, Q_a is the conic ax² + by² = z² (with a = a_1, b = a_2 up to signs), splitting the
  quaternion algebra (a, b).

**Depends on.** `MotivicEtaleKTheory:M.5b/nu-variety`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`

**Source.**

- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, §1, PDF p. 3: “the Rost
  motives for l = 2 discussed above” — For l = 2 the norm varieties are Pfister quadrics and
  the Rost motives are their summands.

### `M.5b/chain-lemma-and-norm-principle` — Rost's Chain Lemma and Norm Principle

*Kind:* theorem.

Let k be an l-special field of characteristic 0 (l divides the degree of every finite
extension) and {a} ∈ K^M_n(k)/l a nontrivial symbol. (Chain Lemma) There is a smooth projective
cellular variety S/k and invertible sheaves J = J_1, J'_1, …, J_{n−1}, J'_{n−1} with l-forms
giving a chain of symbols over k(S) linking {a} to symbols of a special shape, with dim S =
l(l^{n−1} − 1) and I(S) = lℤ. (Norm Principle) If X is a norm variety for {a} and [z, β] ∈
A_0(X, K_1) with [k(z) : k] = l^ν, ν > 1, then there is a point x ∈ X with [k(x) : k] = l and α
∈ k(x)^× such that [z, β] − [x, α] lies in the kernel of the norm N : A_0(X, K_1) → k^×.

**Hypotheses.**

- k of characteristic 0 and l-special; {a} a nontrivial symbol mod l; X a norm variety for {a}.

**Construction and proof.**

1. Chain Lemma: construct S as an iterated tower of projective bundles of l-forms
   (Haesemeyer–Weibel §§1-5).
2. Norm Principle: induct on ν using the Chain Lemma and the degree formula (Haesemeyer–Weibel
   §§6-8).

**Acceptance.**

- For n = 2, the Chain Lemma recovers the classical chain lemma for cyclic algebras of degree
  l.

**Depends on.** `MotivicEtaleKTheory:M.5b/nu-variety`, `MotivicEtaleKTheory:M.5b/degree-theorem`

**Source.**

- Christian Haesemeyer, Charles Weibel, *Norm varieties and the chain lemma (after Markus
  Rost)*, Theorem 0.1, PDF p. 1: “Let {a} ∈ KnM (k)/p be a nontrivial symbol, where k is a
  p-special field.” — Rost's Chain Lemma.
- Christian Haesemeyer, Charles Weibel, *Norm varieties and the chain lemma (after Markus
  Rost)*, Theorem 0.3, PDF p. 2: “Suppose that k is a p-special field and that X is a norm
  variety for some nontrivial symbol {a}.” — Norm Principle.

### `M.5b/norm-variety-existence` — Existence of norm varieties ★

*Kind:* theorem. *Planet:* Existence of norm varieties.

Let k be a field of characteristic 0, l a prime and a = (a_1, …, a_n) ∈ (k^×)^n. Then there
exists a ν_{≤(n−1)}-variety X over k such that X splits a and the sequence H_{−1,−1}(X × X, ℤ)
--pr_1 − pr_2--> H_{−1,−1}(X, ℤ) → k^× is exact (a norm variety for a). For l = 2 one may take
the Pfister neighbour quadric of pfister-norm-variety.

**Hypotheses.**

- k of characteristic 0; l prime; a ∈ (k^×)^n.

**Construction and proof.**

1. Reduce to k l-special by a transfer argument (prime-to-l extensions do not affect splitting
   or the norm condition after taking norms).
2. Construct the variety by induction on n using the Chain Lemma, and prove the ν_{≤(n−1)}
   property and the norm exactness via the Norm Principle and the degree formula (Rost;
   Suslin–Joukhovitski; Haesemeyer–Weibel Theorem 0.7).
3. For l = 2, the Pfister neighbour quadric of pfister-norm-variety satisfies all conditions.

**Acceptance.**

- For n = 1 the variety Spec k(a^{1/l}) (dimension 0) splits a.

**Depends on.** `MotivicEtaleKTheory:M.5b/chain-lemma-and-norm-principle`, `MotivicEtaleKTheory:M.5b/pfister-norm-variety`, `MotivicEtaleKTheory:M.5b/nu-variety`

**Source.**

- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Theorem 6.3, PDF p. 34:
  “For any a = (a1 , . . . , an ) there exists a ν≤(n−1) -variety X such that:” — Rost's
  theorem as used by Voevodsky (proved in Suslin–Joukhovitski).
- Christian Haesemeyer, Charles Weibel, *Norm varieties and the chain lemma (after Markus
  Rost)*, Introduction, PDF p. 1: “Given (0), Rost varieties exist; this is Theorem 0.7 below”
  — The deduction from the Chain Lemma and the Norm Principle.

## M.5c — Rost motives and the symbol calculation

M.5c carries out the symbol calculation: Čech simplicial schemes and embedded simplicial
schemes, the generalised Rost motive with its triangles, projector and duality, the all-degree
norm residue homomorphism with its compatibility with Kummer theory, products, norms and
residues, the inductive step (Hilbert 90 for K^M_n, vanishing of H^{n+1,n}(𝒳, ℤ_(l))), and the
mod-l norm residue isomorphism in characteristic zero.

**Declarations.** `cech-simplicial-scheme`, `rost-motive`, `galois-symbol-all-degrees`, `hilbert-ninety-induction`, `mod-l-norm-residue`.

**Planets.** Rost motive, Norm residue homomorphism, Hilbert 90 for K^M_n, Mod-l norm residue isomorphism.

**Dependencies inside the roadmap.** `MotivicEtaleKTheory:M.1/twisted-cohomology-ring`, `MotivicEtaleKTheory:M.3/cohomological-steinberg`, `MotivicEtaleKTheory:M.3/galois-symbol`, `MotivicEtaleKTheory:M.3/symbol-norm-compatibility`, `MotivicEtaleKTheory:M.3/symbol-residue-compatibility`, `MotivicEtaleKTheory:M.5a/cancellation`, `MotivicEtaleKTheory:M.5a/effective-motives`, `MotivicEtaleKTheory:M.5a/etale-motivic-comparison`, `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`, `MotivicEtaleKTheory:M.5b/degree-theorem`, `MotivicEtaleKTheory:M.5b/milnor-operations`, `MotivicEtaleKTheory:M.5b/motivic-steenrod-operations`, `MotivicEtaleKTheory:M.5b/norm-variety-existence`, `MotivicEtaleKTheory:M.5b/nu-variety`.

**Dependencies on other roadmaps.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.3/higher-milnor-residues`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.

**Coverage.** planned. Refinements: Lemma-level split of rost-motive and hilbert-ninety-induction along Voevodsky 2011 Lemmas 5.7-5.15 and 6.4-6.15.

### `M.5c/cech-simplicial-scheme` — The Čech simplicial scheme of a splitting variety

*Kind:* construction. *Library:* `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

For a smooth variety X over k, the Čech simplicial scheme Č(X) has Č(X)_n = X^{n+1} with
projections as faces and diagonals as degeneracies; its motive M(Č(X)) ∈ DM^{eff,−}(k) comes
with M(Č(X)) → ℤ, an isomorphism iff X has a zero-cycle of degree one after Nisnevich
localisation (in particular if X(k) ≠ ∅). The unreduced suspension 𝒳̃ = cone(Č(X)_+ → S^0) is
pointed. For a symbol a, the class of embedded simplicial schemes defined by smooth varieties
splitting a gives the subcategory DM_𝒳 of motives 'supported on 𝒳'; for X splitting a, M(X) ∈
DM_𝒳.

**Hypotheses.**

- k a field; X smooth over k.

**Construction and proof.**

1. Define Č(X) as the Čech nerve of X → Spec k in simplicial smooth schemes; its motive by
   totalisation (M.5a/effective-motives).
2. If X has a rational point, Č(X) is simplicially contractible, so M(Č(X)) ≅ ℤ.
3. Embedded simplicial schemes correspond to Nisnevich-local classes of smooth varieties
   (Voevodsky 2011 §1, [9]).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.RostMotive.cech` | constructor | Č(X) as a simplicial smooth k-scheme with M(Č(X)) → ℤ. |
| `TauCeti.RostMotive.cech_point` | characterisation | If X(k) ≠ ∅ then M(Č(X)) → ℤ is an isomorphism. |
| `TauCeti.RostMotive.cech_suspension` | constructor | 𝒳̃ = cone(Č(X)_+ → S^0) and its reduced motivic cohomology. |
| `TauCeti.RostMotive.cech_baseChange` | functoriality | Č(X)_{k'} = Č(X_{k'}) and M commutes with base change. |
| `TauCeti.RostMotive.cech_idempotent` | relation | M(Č(X)) ⊗ M(Č(X)) ≅ M(Č(X)). |

**Used by.**

- Voevodsky2011 Lemmas 6.5-6.15: The inductive step computes H^{n+1,n}(𝒳, ℤ_(l)) for 𝒳 = Č(X).
- Voevodsky2011 Proposition 5.18: M(𝒳) ≅ M(Č(X)) for 𝒳 defined by a ν_{n−1}-variety splitting
  a.
- MotivicEtaleKTheory:M.5c/rost-motive: The Rost motive's triangles are over M(Č(X)).

**Unit tests.**

- `RostMotive.test_cech_point` (degenerate): Č(Spec k) is the constant simplicial scheme and
  M(Č(Spec k)) = ℤ.
- `RostMotive.test_cech_conic` (computation): For a conic C without rational point,
  H̃^{*,*}(𝒳̃_C, ℤ/2) ≠ 0 (it contains the class δ of the quaternion symbol).
- `RostMotive.test_cech_etale` (compatibility): After étale sheafification M(Č(X)) → ℤ becomes
  an isomorphism for every X with a point over k^sep.
- `RostMotive.test_cech_not_X` (non-example): M(Č(X)) ≠ M(X) for X = ℙ^1: M(ℙ^1) = ℤ ⊕ ℤ(1)[2]
  while M(Č(ℙ^1)) = ℤ.

**Acceptance.**

- For X = Spec L with L/k a field extension of degree l, H̃^{*,*}(𝒳̃) measures the failure of
  descent for L/k.

**Depends on.** `MotivicEtaleKTheory:M.5a/effective-motives`

**Source.**

- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, §1, PDF p. 2: “Up to an
  equivalence, embedded simplicial schemes correspond to subsheaves of the constant one point
  sheaf on Sm/k” — Embedded simplicial schemes and the Čech construction.

### `M.5c/rost-motive` — The generalised Rost motive ★

*Kind:* construction. *Planet:* Rost motive. *Library:* `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

Let k be a field of characteristic 0 containing μ_l, a = (a_1, …, a_n) a nonzero symbol mod l,
X a ν_{n−1}-variety splitting a, 𝒳 = Č(X), b = (l^{n−1} − 1)/(l − 1) and d = b(l − 1) = l^{n−1}
− 1. From the class δ ∈ H^{n,n−1}(𝒳, ℤ/l) attached to a (Lemma 6.5) one obtains μ = β̃ … ∈
H^{2b+1,b}(𝒳, ℤ_(l)) and the objects M_i (i = 0, …, l − 1) of DM_𝒳 defined by the symmetric
powers S^i of the extension M with triangles ℤ_(l)𝒳(ib)[2ib] → M_i → M_{i−1} → ℤ_(l)𝒳(ib)[2ib +
1] (Voevodsky (5.4)-(5.6)). The generalised Rost motive is M_a := M_{l−1}; it is a direct
summand of M(X) with Z_(l)-coefficients, via a projector p = Dλ ∘ φ ∘ λ, it is restricted
(Theorem 5.16), self-dual: (M_{l−1}, e'_M) is an internal Hom-object to ℤ(d)[2d] (Corollary
5.17), and M(𝒳) ≅ M(Č(X)) (Proposition 5.18).

**Hypotheses.**

- k of characteristic 0 with μ_l ⊂ k; a nonzero symbol; X a ν_{n−1}-variety splitting a;
  coefficients ℤ_(l).

**Construction and proof.**

1. Construct the symmetric powers S^i(M) in the category of relative Tate motives and the
   triangles of Lemma 3.1; identify the operation φ_{l−1} with c β P^n (Theorem 3.8, using
   motivic-steenrod-operations).
2. Construct λ : M(X) → M_{l−1} (Lemma 5.11) and its dual Dλ; show λDλ is multiplication by a
   unit c prime to l on the bottom slice using the degree theorem (Proposition 5.12, Lemma
   5.15), hence an isomorphism (Corollary 5.10).
3. Conclude that p = Dλ φ λ is a projector with image M_{l−1}; restrictedness and duality
   (Theorem 5.16, Corollary 5.17), and M(𝒳) ≅ M(Č(X)) (Proposition 5.18).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.RostMotive.rostMotive` | constructor | M_a ∈ DM^{eff,−}(k, ℤ_(l)) for a norm variety X of a. |
| `TauCeti.RostMotive.rost_triangle` | relation | Distinguished triangles M(𝒳)(ib)[2ib] → M_i → M_{i−1} → M(𝒳)(ib)[2ib + 1] for 1 ≤ i ≤ l − 1. |
| `TauCeti.RostMotive.rost_summand` | characterisation | M_a is a direct summand of M(X) via the projector p = Dλ ∘ φ ∘ λ. |
| `TauCeti.RostMotive.rost_dual` | relation | (M_a, e'_M) is an internal Hom-object from M_a to ℤ(d)[2d]. |
| `TauCeti.RostMotive.rost_split_after_splitting` | characterisation | After a field extension splitting a, M_a ≅ ⊕_{i=0}^{l−1} ℤ(ib)[2ib]. |
| `TauCeti.RostMotive.symmetric_power_operation` | relation | φ_{l−1}(α) = c β P^n(α) for α ∈ H̃^{2n+1,n}, some c ∈ (ℤ/l)^× (Theorem 3.8). |

**Used by.**

- Voevodsky2011 Lemmas 6.13-6.15: The vanishing of H^{n+1,n}(𝒳, ℤ_(l)) is computed through
  Hom(ℤ, M_{l−1}(1)[1]).
- Voevodsky2011 Lemmas 5.7-5.15: The properties of M_{l−1} that make the induction work
  (restricted, self-dual, a summand of M(X)).
- HW2009Chain introduction: 'If Rost varieties exist then Rost motives exist' is the step this
  node realises.

**Unit tests.**

- `RostMotive.test_rost_split` (degenerate): If a = 0 (X has a point), M_a ≅ ⊕_{i=0}^{l−1}
  ℤ(ib)[2ib].
- `RostMotive.test_rost_conic` (computation): For l = 2, n = 2: b = 1, d = 1, and M_a = M(C)
  for the conic C, with triangle M(𝒳)(1)[2] → M(C) → M(𝒳).
- `RostMotive.test_rost_rank` (compatibility): Over k^sep, M_a has the Tate-motive
  decomposition of rank l, matching the l summands ℤ(ib)[2ib].
- `RostMotive.test_not_whole_X` (non-example): For n ≥ 3 and l = 2, M_a ≠ M(Q_a): the Pfister
  neighbour quadric has more Tate summands over k^sep than the Rost motive.

**Acceptance.**

- For l = 2 and n = 2, M_a is the motive of the conic splitting the quaternion symbol, M(C)
  itself (Rost).

**Depends on.** `MotivicEtaleKTheory:M.5c/cech-simplicial-scheme`, `MotivicEtaleKTheory:M.5b/degree-theorem`, `MotivicEtaleKTheory:M.5b/motivic-steenrod-operations`, `MotivicEtaleKTheory:M.5b/nu-variety`, `MotivicEtaleKTheory:M.5a/cancellation`, `MotivicEtaleKTheory:M.5a/effective-motives`

**Source.**

- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Theorem 5.16 and Corollary
  5.17, PDF p. 32: “The motive Ml−1 is restricted.” — The Rost motive M_{l−1} is restricted and
  self-dual.
- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, §5, PDF p. 32: “Then the
  composition p : Dλ ◦ φ ◦ λ : M (X) → M (X) is a projector i.e. p2 = p and its image is Ml−1
  .” — The projector cutting out the Rost motive.

### `M.5c/galois-symbol-all-degrees` — The norm residue homomorphism in all degrees ★

*Kind:* construction. *Planet:* Norm residue homomorphism. *Library:* `TauCeti/KTheory/NormResidue`, namespace `TauCeti.NormResidue`.

Let F be a field and m invertible in F. The norm residue homomorphism is the unique graded ring
homomorphism h_F = ⊕_n h^n_F : K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}) = ⊕_n H^n(F, μ_m^{⊗n}) with
h^1_F = κ, the Kummer isomorphism of ProfiniteCohomology Layer 9 (F^×/m ≅ H¹(F, μ_m)); on
symbols h^n_F{a_1, …, a_n} = κ(a_1) ∪ ⋯ ∪ κ(a_n), using Layer 12's cup product and the twist
pairings of M.1. It is well defined because of the cohomological Steinberg relation of M.3;
h^2_F is M.3's Galois symbol. It coincides with the composite K^M_n(F)/m ≅ H^{n,n}(F, ℤ/m) →
H^n_et(F, μ_m^{⊗n}) of M.5a's diagonal isomorphism and the motivic-to-étale map, once the
weight-one identification ℤ/m(1) ≃ μ_m is normalised so that the composite is κ in degree one.
It is natural in F, compatible with change of m, with norms (cor ∘ h_E = h_F ∘ N_{E/F} for the
Milnor norm of K2SymbolsBrauer T.4) and with residues of discrete valuations (∂_v ∘ h_F =
±h_{k(v)} ∘ ∂^M_v with K2SymbolsBrauer T.3's higher residue).

**Hypotheses.**

- F a field; m invertible in F.

**Construction and proof.**

1. Kummer: h^1 = κ is the isomorphism of ProfiniteCohomology Layer 9 (the degree-one case of
   M.5 is imported, not re-proved).
2. Multiplicativity: the tensor algebra of F^× maps to H^{*} by cup products (Layer 12 and
   M.1/twisted-cohomology-ring); Steinberg relations die by M.3/cohomological-steinberg, so the
   map factors through K^M_*(F) (K2SymbolsBrauer T.2).
3. Comparison with the motivic map: both are ring homomorphisms out of K^M_*(F)/m, which is
   generated in degree one, and they agree in degree one by the normalisation of
   M.5a/etale-motivic-comparison, hence agree.
4. Norms: reduce as in M.3/symbol-norm-compatibility to symbols with all but one entry from F,
   then use the projection formula; residues: as in M.3/symbol-residue-compatibility, on
   generators {u_1, …, u_{n−1}, π}.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.NormResidue.map` | constructor | h_F : K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}), a graded ring homomorphism. |
| `TauCeti.NormResidue.map_symbol` | simp | h^n_F{a_1, …, a_n} = κ(a_1) ∪ ⋯ ∪ κ(a_n). |
| `TauCeti.NormResidue.map_one` | equivalence | h^1_F is the Kummer isomorphism F^×/m ≅ H¹(F, μ_m). |
| `TauCeti.NormResidue.map_two` | compatibility | h^2_F is M.3's Galois symbol. |
| `TauCeti.NormResidue.map_res` | functoriality | Natural for field extensions. |
| `TauCeti.NormResidue.map_norm` | compatibility | cor_{E/F} ∘ h_E = h_F ∘ N_{E/F} for E/F finite. |
| `TauCeti.NormResidue.map_residue` | compatibility | ∂_v ∘ h_F = ±h_{k(v)} ∘ ∂^M_v for a discrete valuation v with m invertible in k(v). |
| `TauCeti.NormResidue.map_motivic` | compatibility | h_F equals the composite K^M_n(F)/m ≅ H^{n,n}(F, ℤ/m) → H^n_et(F, μ_m^{⊗n}) with the normalised weight-one identification. |

**Used by.**

- MotivicEtaleKTheory:M.5 norm-residue-theorem: The map whose bijectivity is the norm residue
  theorem.
- MotivicEtaleKTheory:M.5d/prime-power-norm-residue: The prime-power induction uses the natural
  map in all degrees.
- KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields and
  HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Higher symbols of local fields are evaluated
  through this map.

**Unit tests.**

- `NormResidue.test_degree_zero` (degenerate): h^0_F : ℤ/m → H^0(F, ℤ/m) = ℤ/m is the identity.
- `NormResidue.test_real` (computation): For F = ℝ, m = 2: h^n{−1, …, −1} = κ(−1)^n ≠ 0.
- `NormResidue.test_kummer` (compatibility): h^1_F = TauCeti.kummerMap modulo m-th powers.
- `NormResidue.test_finite_field` (non-example): For F = 𝔽_q and n = 2 both sides vanish
  (K^M_2(𝔽_q) = 0, cd(𝔽_q) = 1); a map defined without the Steinberg relation on the tensor
  algebra would have nonzero source.

**Acceptance.**

- For F = ℝ and m = 2, h^n_ℝ{−1, …, −1} ≠ 0 for every n.

**Depends on.** `MotivicEtaleKTheory:M.3/cohomological-steinberg`, `MotivicEtaleKTheory:M.3/galois-symbol`, `MotivicEtaleKTheory:M.3/symbol-norm-compatibility`, `MotivicEtaleKTheory:M.3/symbol-residue-compatibility`, `MotivicEtaleKTheory:M.1/twisted-cohomology-ring`, `MotivicEtaleKTheory:M.5a/etale-motivic-comparison`, `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.3/higher-milnor-residues`

**Source.**

- Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*, VI Corollary 4.1.1,
  printed p. 480 (PDF p. 488): “If k is a field containing 1/m, the norm residue symbols are” —
  The norm residue symbols K^M_i(k)/m → H^i_et(k, μ_m^{⊗i}) and their ring structure.
- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Theorem 6.1, PDF p. 33:
  “Then the norm residue homomorphisms” — The map whose bijectivity is proved.

### `M.5c/hilbert-ninety-induction` — The inductive step: Hilbert 90 for K^M_n and the vanishing of H^{n+1,n}(𝒳) ★

*Kind:* theorem. *Planet:* Hilbert 90 for K^M_n.

Let k be a field of characteristic 0 containing μ_l, n ≥ 2, and assume the norm residue
homomorphism is bijective in degrees ≤ n − 1 for all such fields. Let a be a nonzero symbol in
K^M_n(k)/l and X a norm variety for a (M.5b), 𝒳 = Č(X). Then: (a) the image of a in H^n_et(k,
μ_l^{⊗n}) is nonzero, and there is a nonzero δ ∈ H^{n,n−1}(𝒳, ℤ/l) with Q_{n−1}⋯Q_0(δ) ≠ 0
(Lemmas 6.4-6.7); (b) H̃^{p,q}(𝒳̃, ℤ/l) = 0 for q ≤ n − 1 and p ≤ q + 1 (Lemma 6.6); (c)
H^{n+1,n}(𝒳, ℤ_(l)) = 0 (Proposition 6.11, via Lemmas 6.12-6.15 and the Rost motive); (d)
consequently the sequence H^{n+1,n}(𝒳, ℤ_(l)) → H^{n+1,n}_et(k, ℤ_(l)) → H^{n+1,n}_et(k(X),
ℤ_(l)) of Lemma 6.9 shows that a is killed only in extensions that split it, giving Hilbert 90
for K^M_n: H^{n+1}(k, ℤ_(l)(n)) → H^{n+1}_et(k, ℤ_(l)(n)) is an isomorphism, which is
equivalent to the Beilinson–Lichtenbaum statement in weight n.

**Hypotheses.**

- k of characteristic 0 with μ_l ⊂ k; induction hypothesis in degrees < n.

**Construction and proof.**

1. (a) Transfer argument and the degree-(n−1) hypothesis (Lemma 6.4); construct δ from a and
   the Čech motive (Lemma 6.5); Q_i-nonvanishing by weight counting with (b) (Lemma 6.7).
2. (b) From the comparison of motivic and étale cohomology of 𝒳 in weights < n, which holds by
   the induction hypothesis (Lemma 6.6).
3. (c) Use rost-motive: H^{n+1,n}(𝒳, ℤ_(l)) embeds in H^{2lb+2,lb+1}(𝒳) (Lemma 6.12), which is
   covered by a kernel computed on M_{l−1} (Lemmas 6.13-6.14), and this kernel vanishes by
   Rost's norm exactness of norm-variety-existence (Lemma 6.15).
4. (d) Lemma 6.9 and the standard equivalence H90(n) ⇔ BL(n) (Suslin–Voevodsky, Geisser–Levine;
   Voevodsky 2011 Theorem 6.17).

**Acceptance.**

- For n = 2 and l = 2 this recovers Merkurjev's theorem on K_2/2 (with Q_a a conic).

**Depends on.** `MotivicEtaleKTheory:M.5c/rost-motive`, `MotivicEtaleKTheory:M.5c/cech-simplicial-scheme`, `MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees`, `MotivicEtaleKTheory:M.5b/norm-variety-existence`, `MotivicEtaleKTheory:M.5b/milnor-operations`, `MotivicEtaleKTheory:M.5a/etale-motivic-comparison`

**Source.**

- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Proposition 6.11, PDF p.
  39: “In view of Lemma 6.9 in order to finish the proof of Theorem 6.1 it remains to prove the
  following result.” — The key vanishing H^{n+1,n}(𝒳, ℤ_(l)) = 0.
- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Lemma 6.4, PDF p. 34:
  “Assume that Theorem 6.1 holds in degrees ≤ n − 1 and the a = (a1 , . . . , an ) is a symbol
  which is not zero in KnM (k)/l.” — The induction hypothesis.

### `M.5c/mod-l-norm-residue` — The mod-l norm residue isomorphism in characteristic zero ★

*Kind:* theorem. *Planet:* Mod-l norm residue isomorphism.

Let k be a field of characteristic 0 and l a prime. For every n ≥ 0, h^n_k : K^M_n(k)/l →
H^n_et(k, μ_l^{⊗n}) is an isomorphism. Equivalently (Voevodsky 2011 Theorem 6.17, for pointed
smooth simplicial schemes over such k), H̃^{p,q}(𝒳, ℤ/l) → H̃^{p,q}_et(𝒳, ℤ/l) is an
isomorphism for p ≤ q and a monomorphism for p = q + 1; and the motivic Beilinson–Lichtenbaum
statement holds for k with ℤ/l coefficients. The extension to all fields of characteristic ≠ l
and to ℤ/l^r coefficients is MotivicEtaleKTheory M.5d's (prime-power-norm-residue,
inseparable-and-characteristic-reductions).

**Hypotheses.**

- k of characteristic 0; l prime; n ≥ 0.

**Construction and proof.**

1. Reduce to μ_l ⊂ k: [k(μ_l) : k] is prime to l and both sides satisfy a transfer argument
   (galois-symbol-all-degrees norms).
2. Induct on n: degrees 0, 1 are trivial and Kummer theory; assuming degrees < n, surjectivity
   in degree n follows from hilbert-ninety-induction (H90(n) ⇒ BL(n) gives surjectivity of
   h^n), and injectivity from H90(n) via the standard argument (Voevodsky 2011 §6, [6, pp.
   96-97]): it suffices to find for every symbol a field extension K_a splitting a with
   H^{n+1}_et injectivity, which the generic splitting field k(X) of a norm variety provides
   (Theorem 6.18).

**Acceptance.**

- For k = ℝ, l = 2: K^M_n(ℝ)/2 ≅ ℤ/2 ≅ H^n(ℝ, μ_2^{⊗n}) for all n (Milnor's computation and the
  cohomology of ℤ/2).

**Depends on.** `MotivicEtaleKTheory:M.5c/hilbert-ninety-induction`, `MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees`, `MotivicEtaleKTheory:M.5b/norm-variety-existence`

**Source.**

- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Theorem 6.1, PDF p. 33:
  “Let k be a field of characteristic zero which contains a primitive l-th root of unity.” —
  Characteristic-zero statement with μ_l ⊂ k; the removal of the root of unity is a transfer
  argument.
- Vladimir Voevodsky, *On motivic cohomology with Z/l-coefficients*, Theorem 6.17, PDF p. 42:
  “are isomorphisms for p ≤ q and monomorphisms for p =” — The simplicial-scheme form
  (Beilinson–Lichtenbaum).

## Requests to other roadmaps

- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`:
  The Kummer isomorphism F^×/m ≅ H¹(F, μ_m) (profinite Hilbert 90) for every field F with m
  invertible, with Tau Ceti's kummerMap as its map; M.5's degree-one case and M.5c's h¹ are
  taken from it. Needed by `M.1/finite-tate-twist`, `M.1/etale-kummer-sequences`,
  `M.3/cohomological-steinberg`, `M.5c/galois-symbol-all-degrees`, `M.5/norm-residue-theorem`.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`:
  Continuous cohomology of G_F in all degrees with restriction, corestriction (cor ∘ res =
  index), long exact sequences and the finite-quotient colimit, applied to the twist modules
  μ_m^{⊗j}, ℤ_ℓ(j), ℚ_ℓ/ℤ_ℓ(j). Needed by `M.1/twisted-cohomology-ring`,
  `M.1/continuous-limit-comparison`, `M.1/field-etale-galois-comparison`,
  `M.2/real-restriction-map`.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`:
  The graded cup product in all degrees with associativity, graded commutativity and the
  projection formula, for the twist pairings μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)}. Needed by
  `M.1/twisted-cohomology-ring`, `M.5c/galois-symbol-all-degrees`.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-3-the-comparison-isomorphisms`: The
  comparison isomorphisms between the canonical continuous cohomology and Tau Ceti's explicit
  H1/H2 model in degrees ≤ 2. Needed by `M.1/twisted-cohomology-ring`.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-4-the-finite-quotient-colimit-description`:
  The finite-quotient colimit description H^n(G, M) = colim_U H^n(G/U, M^U) for discrete M,
  used for ℚ_ℓ/ℤ_ℓ(j) = colim μ_{ℓ^ν}^{⊗j}. Needed by `M.1/continuous-limit-comparison`.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`: cd_ℓ of a
  profinite group and its bounding predicate, to state cd_ℓ(G_{F,S}) ≤ 2. Needed by
  `M.2/high-degree-real-isomorphism`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`:
  The local Brauer group and invariant map of a local field (Br(F) ≅ ℚ/ℤ nonarchimedean, ½ℤ/ℤ
  for ℝ) and the cyclic splitting of classes of order ℓ, for Tate's local theorem. Needed by
  `M.3/tate-local`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`:
  The Brauer–Hasse–Noether sequence 0 → Br(F) → ⊕_v Br(F_v) → ℚ/ℤ → 0 for number fields, with
  the real-place invariants. Needed by `M.2/s-integer-brauer-sequence`, `M.3/tate-global`,
  `M.3/tate-picard-sequence`.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`:
  n-fold Pfister forms ⟨⟨a_1, …, a_n⟩⟩, their roundness and the fact that an isotropic Pfister
  form is hyperbolic, for the Pfister-neighbour norm varieties at l = 2. Needed by
  `M.5b/pfister-norm-variety`.
- `SchemeAndStackFoundations:SF.2`: Grothendieck's Hilbert 90 for G_m on the small étale site,
  H¹_et(X, G_m) ≅ Pic(X), and the cohomological Brauer group Br'(X) = H²_et(X, G_m)
  (SF.2/cohomological-brauer), for the étale Kummer sequences. Needed by
  `M.1/etale-kummer-sequences`, `M.1/etale-twist-sheaf`.
- `SchemeAndStackFoundations:SF.5`: Chow groups with rational equivalence, flat pullback,
  proper pushforward, intersection products on smooth schemes and Chern classes of vector
  bundles (for s_d(X)); M.4's degree-zero higher Chow groups are these groups (RS-08 link SF.5
  → M.4). Needed by `M.4/functoriality`, `M.4/chow-degree-zero`, `M.5b/nu-variety`.
- `EnhancedDerivedSheaves:E5:abstract`: Verdier localisation of D^−(Sh_Nis(Cor_k, R)) at a
  thick tensor ideal and the induced tensor-triangulated structure, for DM^{eff,−}_Nis(k, R).
  Needed by `M.5a/presheaf-with-transfers`, `M.5a/effective-motives`.

## Restructuring proposals

- rescope (MotivicEtaleKTheory, SchemeKTheoryOperations, K2SymbolsBrauer): Stage edges needed
  by this plan and not yet in the atlas, and one edge to drop (RT-AREA-ktheory-2/41). M.4 uses
  no λ- or Adams operations, so SchemeKTheoryOperations:S.6 → M.4 carries nothing; M.4's
  Nesterenko–Suslin–Totaro node imports K2SymbolsBrauer T.2 (Milnor K-theory) and T.4 (Kato's
  norm, Suslin reciprocity) (RT-AREA-ktheory-1/12); M.3 imports T.3, T.4 and T.5 nodes (tame
  symbol, Milnor norms, tame-kernel sequence); M.5c imports ProfiniteCohomology Layer 9, M.3
  and K2SymbolsBrauer T.2–T.4 (RT-AREA-ktheory-1/14); M.5a imports M.1's étale twists.
  Proposal: Drop SchemeKTheoryOperations:S.6 → MotivicEtaleKTheory:M.4 and add S.6 →
  MotivicEtaleKTheory:M.6b (RT-AREA-ktheory-2/41). Add the stage edges that this packet's
  prerequisites use and that neither data/atlas.json nor an accepted restructuring records:
  inside the roadmap M.1 → M.2, M.1 → M.5a, M.1 → M.5c, M.3 → M.5c and M.5c → M.5; from
  K2SymbolsBrauer T.1:classical → M.3, T.2:symbols → M.2, M.4, M.5b, M.5c, T.3:symbols → M.2,
  M.3, M.4, M.5c, T.3:localization-comparison → M.3, T.4 → M.3, M.4, M.5c, T.5 → M.2, M.3; from
  ProfiniteCohomology Layer 9 → M.3, M.5, M.5c, Layer 10 → M.2, Layer 12 → M.1; from
  ClassFieldTheory Layer 10 → M.2; from QuadraticFormInvariants Layer 4 → M.5b; from
  SchemeAndStackFoundations SF.2 → M.1, M.2 and SF.5 → M.5b; from
  EtaleDualityAndPerverseSheaves EDC.3 → M.1 and ClassicalAdicEtaleCohomology H1:henselian →
  M.1. All were checked acyclic together against data/atlas.json stage edges and the links of
  accepted restructurings.
- rescope (MotivicEtaleKTheory, MotivesAndAlgebraicCycles): The sibling packet
  MotivicEtaleKTheory--M.5d requests from M.5a a transfer-compatible comparison between the
  cycle complex and the Nisnevich motivic complexes. RS-08 makes MotivesAndAlgebraicCycles:MC.4
  the owner of the higher-Chow/motivic-cohomology comparison
  (MC.4/motivic-cohomology-higher-chow). This packet supplies the transfer structure and the
  comparison input (M.5a/cycle-complex-transfers) and leaves the packaged comparison with MC.4.
  Proposal: Add the edge MotivesAndAlgebraicCycles:MC.4 → MotivicEtaleKTheory:M.5d (acyclic:
  MC.4's ancestors in this roadmap are M.4 and M.5a only), so that
  M.5d/mod-prime-motivic-comparison and M.7/beilinson-lichtenbaum cite
  MC.4/motivic-cohomology-higher-chow together with M.5a/cycle-complex-transfers.

## Acceptance tests of the part

- Kummer theory in weight one: h¹ = κ (Tau Ceti's kummerMap) and H¹(F, Z(1)) = F^×.
- Matsumoto/Tate in weight two: h²_F is the Galois symbol, K₂(F)/ℓ ≅ H²(F, μ_ℓ^{⊗2}) for local
  and global F, and K₂(O_S)/ℓ^r ≅ H²_et(O_S, μ_{ℓ^r}^{⊗2}).
- Finite fields: K^M_n(𝔽_q) = 0 = H^n(𝔽_q, μ_m^{⊗n}) for n ≥ 2, and H¹_cont(𝔽_q, ℤ_ℓ(j)) =
  ℤ_ℓ/(q^j − 1).
- Real places with ℚ at 2: α¹ on ℤ[1/2]^× is the sign map, H̃¹(ℤ[1/2], ℤ/2) has dimension 1,
  H³(ℤ[1/2], ℤ/2) ≅ ℤ/2 and Br'(ℤ[1/2]) ≅ ℤ/2.
- Coefficient sequences: the inclusion μ_{ℓ^a}^{⊗j} → μ_{ℓ^{a+b}}^{⊗j} is multiplication by
  ℓ^b, and the Bockstein term appears in every comparison of a completed group with a tensor
  product.
- Degree checks: H²(F, Z(2)) ≅ K₂(F); H¹(F, Z(2)) is the weight-two group that K3BlochGroups
  compares with the Bloch group.

