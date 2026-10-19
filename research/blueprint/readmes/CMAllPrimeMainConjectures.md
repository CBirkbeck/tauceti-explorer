# Main conjectures for modular forms and their families, Part II: all-prime CM zeta-element main conjectures

This roadmap is the Part II of ModularIwasawaMainConjectures for CM forms. That roadmap's L0 formulates Kato's cohomological main conjecture char H²\_Iw(V) = char(H¹\_Iw(V)/Z(f)) and its layers L1–L6 prove restricted ordinary, family and signed branches; it proves no CM case. This roadmap starts at L0's formulation and proves the conjecture rationally for every CM newform of weight k ≥ 2 and every prime p, including p = 2 and the primes dividing the order of the torsion of the ray-class group. This is Theorem 2.6 of Burungale–Tian, 'A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin' (Annals 203, 2026), whose proof is a few lines citing Kato §15 and Johnson-Leung–Kings. Planned in full, that proof has four parts.

1. The elliptic-unit side over the CM field K (layers CZ.0–CZ.2): the ray tower K(p^∞f) and its unit and class modules h¹, h²; Kato's elliptic units and the module z ⊂ h¹; the elliptic-unit Euler system and Johnson-Leung–Kings' main conjecture for imaginary quadratic fields at every prime; Rubin's classical forms.
2. The rational equivariant main conjecture (CZ.4): Burungale–Tian Theorem 2.1, corrected by the Euler factors at the primes of f prime to p that the printed statement omits.
3. Kato's passage from K to Q (CZ.1, CZ.5): Kato's realization of Hecke characters, his explicit reciprocity law for elliptic units (Prop. 15.9), the comparison map (15.12.1), the descent lemma 15.13 and its variant 15.14 for K ⊂ Q(μ\_{p^∞}), which covers the congruent-number case K = Q(i), p = 2; and the CM case of Kato's Theorem 12.4, proved from elliptic units alone.
4. The equality (CZ.6): Kato §15 proves only an inequality (Prop. 15.17). The equality step applies Kato's Lemma 14.15 to both sides and cancels the a-torsion terms. With the bridge (15.16.1) from elliptic units to Beilinson–Kato elements, it gives Theorem 2.6. The roadmap exports the result and its normalization dictionary to CMRankZeroConverse.

The split-prime material of CZ.3 (two-variable Coleman map, Katz's measure, anticyclotomic θ-components) is part of the integral layer at the request of the Castella–Grossi–Lee–Skinner and Burungale–Kobayashi–Ota routes, which need Rubin's main conjecture in those forms; Theorem 2.6 does not use it.

## Reading the plan

Each layer states its targets and then lists its nodes. Definitions and constructions carry an API outline and unit tests. Theorems carry hypotheses, a proof route, acceptance checks and prerequisites. Every node cites the place in its sources where the result is stated or proved, in our own words. Node identifiers are relative to this roadmap; prerequisites in other roadmaps keep their full identifiers. The plan is at target level (PROTOCOL.md §2).

## Conventions

- K is an imaginary quadratic field with a fixed embedding K ⊂ C; Q̄ ⊂ C and fixed embeddings Q̄ ⊂ Q̄\_p; (ζ\_{p^n})\_n a compatible system of primitive p-power roots of unity. K(a) is the ray class field of modulus a, K(p^∞f) = ∪\_n K(p^n f), G = G\_{p∞f} = Gal(K(p^∞f)/K) ≅ Z\_p² × Δ\_f.
- Artin symbols: σ\_a = (a, K′/K) is the usual (arithmetic) Artin symbol, as in Kato. Johnson-Leung–Kings use the inverse reciprocity map, so their η(a) is η^{-1}(σ\_a); every node that imports one of their formulas states which convention it uses.
- Cohomology over rings of S-integers uses Kato's convention 8.2, the direct image j\_\* from the open set where the coefficients are lisse. It is neither extension by zero nor the cohomology of an enlarged set of places. H^q\_{p∞f}(T) is the limit over the ray tower along corestriction; H^q(T) (Kato) is the limit over Z\[ζ\_{p^n}, 1/p\].
- V\_{F\_λ}(f) is Kato's cohomological representation of a newform (Kato 8.3), the dual of the covariant ρ\_f; f\* is the form with conjugate coefficients. Hecke characters ψ of K have type (m, n) when ψ restricted to C^× is z ↦ z^m z̄^n; a CM newform of weight k corresponds to ψ of type (1 − k, 0), so r = k − 1 in Kato's §15.
- Λ = O\_λ\[\[G\_∞\]\] with G\_∞ = Gal(Q(μ\_{p^∞})/Q) ≅ Z\_p^× (including its torsion), Λ\_Q = Λ\[1/p\]; G′\_∞ = Gal(Q(μ\_{p^∞})/K) when K ⊂ Q(μ\_{p^∞}). R = Z\_p\[\[G\]\], R\_O = O\[\[G\]\]. ξ(M) is the characteristic ideal of a finitely generated torsion module over the normal ring after inverting p, the product of the height-one primes raised to the local lengths.
- All main-conjecture equalities of CZ.4–CZ.6 hold over the Iwasawa algebra with p inverted. They are not integral, and they do not hold over the unrestricted ring Q\_p\[\[T\]\]. The integral statements of CZ.2–CZ.3 say so explicitly.

## Layer overview

| Layer | Title | Main sources |
| --- | --- | --- |
| [CZ.0](#cz0) | CM ray towers, unit and class modules, and elliptic units | Kato 15.1–15.6; Johnson-Leung–Kings §§3–5; Burungale–Tian §2.1 |
| [CZ.1](#cz1) | Kato's CM realization and the elliptic-unit reciprocity law | Kato 15.7–15.9 |
| [CZ.2](#cz2) | The elliptic-unit Euler system and the integral main conjecture | Johnson-Leung–Kings §§2–6; Rubin 1991 §4 |
| [CZ.3](#cz3) | Split primes: the Coleman map, Katz's measure and anticyclotomic components | Rubin 1991 §4; Castella–Grossi–Lee–Skinner §§1.2, 2.2 |
| [CZ.4](#cz4) | The rational equivariant main conjecture | Johnson-Leung–Kings §7; Burungale–Tian Theorem 2.1 |
| [CZ.5](#cz5) | CM descent and the CM case of Kato's Theorem 12.4 | Kato 13.5, 14.15, 15.10–15.17; Rohrlich 1988 |
| [CZ.6](#cz6) | Kato's main conjecture for CM newforms at every prime | Kato 15.16–15.17; Burungale–Tian Theorem 2.6 |

## Sources and editions

- **Ashay A. Burungale and Ye Tian**, A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin. Annals of Mathematics 203 (2026), no. 1, 1–13; read in the author version arXiv:2506.03465v2 (11 October 2025), whose page numbers are used throughout. <https://arxiv.org/pdf/2506.03465v2> (SHA-256 cbb8284a13ed40bd…, read 2026-10-19). Read: Entire paper, pp. 1–7, with §2.1 (Theorem 2.1 and footnote 3), §2.2 (Theorems 2.3, 2.4, 2.6, footnote 4) and §3.1 read line by line.
- **Kazuya Kato**, p-adic Hodge theory and values of zeta functions of modular forms. Astérisque 295 (2004), ix, 117–290 (Numdam scan; printed page = PDF page + 115). <https://www.numdam.org/item/AST_2004__295__117_0.pdf> (SHA-256 3c6e14b11fa60262…, read 2026-10-19). Read: Chapter III §13.4–13.8, pp. 226–229; Lemma 14.15, pp. 243–244; §15 in full, pp. 250–267 (15.1–15.23), with the page images of pp. 250, 253, 254, 258–260 and 263–265 checked; §3.8, pp. 136–138, for (3.8.1)–(3.8.2).
- **Jennifer Johnson-Leung and Guido Kings**, On the equivariant and the non-equivariant main conjecture for imaginary quadratic fields. J. reine angew. Math. 653 (2011), 75–114; read in arXiv:0804.2828v2 (12 August 2009), whose numbering is used. <https://arxiv.org/pdf/0804.2828v2> (SHA-256 2af28fc5c53be95d…, read 2026-10-19). Read: Entire paper, pp. 1–38: §1 (conventions, Det and Div), §2 (Theorem 2.6, Corollaries 2.8 and 2.11, Proposition 2.9), §3 (Definition 3.2, Proposition 3.3, Corollary 3.4, Definition 3.5, Proposition 3.6, Lemma 3.7, Theorem 3.9, Corollary 3.10), §4 (Lemmas 4.3–4.7), §5 (Theorem 5.2, Corollary 5.3, Conjecture 5.5, Theorem 5.7, §5.4 Lemma 5.8), §6 (Theorem 6.4, Corollary 6.5, Lemmas 6.6–6.7), §7 (Lemmas 7.1–7.7, §§7.2–7.3).
- **Karl Rubin**, The "main conjectures" of Iwasawa theory for imaginary quadratic fields. Inventiones mathematicae 103 (1991), 25–68 (GDZ scan, published version; printed page = PDF page + 23). <https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0103/LOG_0009.pdf> (SHA-256 96ca08e8ed1a7646…, read 2026-10-19). Read: Introduction and contents, pp. 25–27; §1 setting, p. 27; §4 in full, pp. 36–37 (Theorem 4.1 and Remarks); §5 opening, p. 38; end of §10 (case table) and §11 opening, pp. 58–59.
- **Karl Rubin**, Euler systems (author's course draft of the Annals of Mathematics Studies 147 monograph). Hermann Weyl Lectures draft, 1999 (public copy). <https://swc-math.github.io/notes/files/99RubinES.pdf> (SHA-256 de47655dc35066fd…, read 2026-10-19). Read: Statements of Definition II.1.1 and Theorems II.3.2–II.3.3 as cited by Johnson-Leung–Kings §6.2 (the theorem numbering of the published book is II.2.1.1, II.2.3.2–2.3.3).
- **David E. Rohrlich**, L-functions and division towers. Mathematische Annalen 281 (1988), 611–632 (GDZ scan, published version). <https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0281/LOG_0061.pdf> (SHA-256 4c067a8b08258d90…, read 2026-10-19). Read: Introduction with Theorems 1 and 2, pp. 611–612.
- **Adebisi Agboola and Benjamin Howard**, Anticyclotomic Iwasawa theory of CM elliptic curves II. Mathematical Research Letters 12 (2005); read in arXiv:math/0401124v2. <https://arxiv.org/pdf/math/0401124v2> (SHA-256 8bdbebfadd90e2f1…, read 2026-10-19). Read: §3, Propositions 3.1 and 3.3 with proofs, pp. 3–5.
- **Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner**, On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes. Inventiones mathematicae 227 (2022), 517–580; read in arXiv:2008.02571v2 (final version). <https://arxiv.org/pdf/2008.02571v2> (SHA-256 7cd995e0d9ee1c93…, read 2026-10-19). Read: §1.2: Definition 1.2.1, Theorem 1.2.2 and its proof, Remark 1.2.3, pp. 7–8; §2.2: proof of Theorem 2.2.2 (functional equation step) and Theorem 2.2.3, p. 15.
- Not read, and not freely available or in the cleared library: Yager, 'On two variable p-adic L-functions' (Ann. of Math. 115, 1982); de Shalit, Iwasawa theory of elliptic curves with complex multiplication (1987); Ribet, LNM 601 (1977); Huber–Kings (Duke Math. J. 119, 2003) Propositions 1.2.10 and 2.3.1; Itakura's preprint on the prime 2; Kato's 'Generalized explicit reciprocity laws' (KK3). Each use is a recorded gap.

### Corrections used here

- PAPER-BURUNGALE-TIAN-26/E1 (confirmed): Theorem 2.1 as printed omits the factors ξ(Z\_p\[\[G/D\_𝔩\]\]) for the primes 𝔩 | f with 𝔩 ∤ p; CZ.4/rational-equivariant-main-conjecture states the corrected form, and CZ.4/printed-equivariant-form-range the range of the printed one.
- PAPER-BURUNGALE-TIAN-26/E2 (confirmed): Kato §15 proves only the inequality Prop. 15.17; the equality step is CZ.6/equality-descent.
- PAPER-BURUNGALE-TIAN-26/E13 (confirmed): footnote 4 secures only the residue-field hypothesis of Kato's Lemma 15.13, not K ⊄ Q(μ\_{p^∞}); the contained case is CZ.5/cm-contained-descent.
- CMAllPrimeMainConjectures/E1 (new, this packet): Kato's proof of Prop. 15.17 (p. 265) cites 'Lemma 14.12' for what is Lemma 14.15 (pp. 243–244).
- CMAllPrimeMainConjectures/E2 (new, this packet): in the proof of Lemma 15.11(2) (p. 262) Kato writes L\_S(ψ, χ, k − 1) and L\_S(f, χ, k − 1) where the results he invokes ((15.9.2), Theorem 6.6) give L\_S(ψ̄, χ, k − 1) and L\_S(f\*, χ, k − 1); harmless, since L(f\*, s) = L(ψ̄, s).
- Kato's conventions are kept exactly: Prop. 15.9 and (15.9.1) involve L\_{pf}(ψ̄, χ, r) (the complex conjugate character), (15.12.2) involves L\_{{p}}(f\*, χ, k − 1), and an idele a acts on V\_{L\_λ}(ψ) by a\_v^r ψ(a)^{-1}.
- PAPER-CASTELLA-ETAL-22/E3 and E16: the tamely ramified branch convention for L\_ψ and the Δ\_θ-invariants in (1.4), used in CZ.3/anticyclotomic-theta-main-conjecture.
- The Burungale–Kobayashi–Ota route 6 item 'rubin-two-variable-main-conjecture' attributes to Rubin's Theorem 4.1(ii) an inert-prime equality char(X\_∞^χ) = char(U\_∞^χ/C̄\_∞^χ); Rubin's 4.1(ii) concerns A\_∞ and Ē\_∞/C̄\_∞, and his Remark 2 says X\_∞ and U\_∞/C̄\_∞ are not torsion for nonsplit p. CZ.2/classical-two-variable-main-conjecture exports Rubin's statement as printed, which is what Agboola–Howard II Proposition 3.3(ii) uses.

## Baseline

Mathlib 082e2d3 and Tau Ceti f790474. Declarations used, each read at the pinned commit:

- `mathlib:Module.length` (Mathlib/RingTheory/Length.lean): The length of a module as an element of ℕ∞; the lengths of localized Iwasawa modules at height-one primes are Module.length over the localization.
- `mathlib:Ideal.height` (Mathlib/RingTheory/Ideal/Height.lean): The height of an ideal; height-zero and height-one primes of the completed group algebras are the primes of height 0 and 1.
- `mathlib:IsLocalization.AtPrime` (Mathlib/RingTheory/Localization/AtPrime/Basic.lean): Localization at a prime ideal, used for M\_q at height-one primes q.
- `mathlib:MonoidAlgebra` (Mathlib/Algebra/MonoidAlgebra/Defs.lean): Group rings O\[G\] of the finite layers Gal(K'/K); the completed algebra is their inverse limit.
- `mathlib:PowerSeries` (Mathlib/RingTheory/PowerSeries/Basic.lean): Power series rings, for the noncanonical presentation O\[Δ\]\[\[S,T\]\] of the two-variable Iwasawa algebra.
- `mathlib:ClassGroup` (Mathlib/RingTheory/ClassGroup/Basic.lean): The ideal class group of O\_{K'}, whose p-primary parts form the class module h².
- `mathlib:NumberField.Units.regulator` (Mathlib/NumberTheory/NumberField/Units/Regulator.lean): The regulator of a number field as the covolume of the unit lattice.
- `mathlib:NumberField.Units.regulator_ne_zero` (Mathlib/NumberTheory/NumberField/Units/Regulator.lean): Nonvanishing of the regulator: the logarithmic embedding of units modulo torsion is a full lattice; used for the injectivity of the archimedean regulator on O^×⊗Q.
- `mathlib:NumberField.Units.torsion` (Mathlib/NumberTheory/NumberField/Units/Basic.lean): The roots of unity O\_K^× of the base field, whose order w\_K controls the injectivity of O\_K^× → (O\_K/f)^×.
- `mathlib:IsCyclotomicExtension` (Mathlib/NumberTheory/Cyclotomic/Basic.lean): Cyclotomic extensions, for the fields Q(μ\_{p^n}) of the cyclotomic tower and the test K ⊂ Q(μ\_{p^∞}).
- `mathlib:cyclotomicCharacter` (Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean): The p-adic cyclotomic character, whose kernel on the group algebra is the ideal J generated by N(a) − σ\_a.
- `mathlib:NumberField.IsTotallyComplex` (Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean): Totally complex number fields; an imaginary quadratic K and all its abelian extensions are totally complex, so no real-place 2-torsion corrections enter at p = 2.

Mathlib has the analytic class number formula (the residue of the Dedekind zeta function) and Dirichlet's unit theorem with the regulator. It has no ray class fields, no Hecke characters of infinite order, no Iwasawa cohomology and no elliptic units. Tau Ceti's GlobalNumberFields, ClassFieldTheory and ProfiniteProPGroups roadmaps plan the ray class carriers, class fields and completed group algebras that this roadmap cites.

## Supplier contracts

What this roadmap takes from other roadmaps, by request (stage-level) or by node:

- **AutomorphicPadicLFunctions:L0** — For an imaginary quadratic K, any prime p and any nonzero tame modulus f: the inverse limit of ray class groups of conductor p^n f, its Artin identification with G = Gal(K(p^∞f)/K), the dimension formula (Z\_p-rank 2, no Leopoldt defect since the unit rank is zero) and the decomposition G ≅ Z\_p² × Δ\_f with Δ\_f finite, without assuming p ∤ #Δ\_f. This is the CM ray tower that Burungale–Tian's route 7 brief says L0 supplies (items ray-tower and ray-group-structure of PAPER-BURUNGALE-TIAN-26).
- **IntegralIwasawaTheory:I.2** — Arithmetic inverse limits of p-completed S-unit groups and p-primary class groups along norms in towers that are not cyclotomic Z\_p-extensions, in particular the ray tower K(p^∞f) of an imaginary quadratic field (Galois group Z\_p² × Δ); and weak Leopoldt for the cyclotomic Z\_p-extension of every number field, in the form H²(G\_S(F(μ\_{p^∞})), Q\_p/Z\_p) = 0 for S the places above p, which by a direct limit gives weak Leopoldt for the ray tower.
- **PadicMeasuresIwasawaAlgebras:L1** — Completed group algebras O\[\[G\]\] for G ≅ Z\_p² × Δ with Δ finite of order possibly divisible by p, their presentation O\[Δ\]\[\[S,T\]\], their compact topology and functoriality along restriction and quotient maps.
- **ComplexMultiplicationAndExplicitReciprocity:CM.4** — The general-weight CM induction (Kato 15.10; item cm-galois-induction of PAPER-BURUNGALE-TIAN-26 route 6, routed to CM.4 as a source item): for a newform f of weight k ≥ 2 with L(f, s) = L(ψ, s), ψ of type (1 − k, 0) and conductor dividing N, F ⊂ L = K(ψ(K̂^×)) and V\_{L\_λ}(f) ≅ Ind\_{G\_K}^{G\_Q} V\_{L\_λ}(ψ) with Kato's explicit action, irreducible over L\_λ. CM.4/cm-induction-comparison covers only k = 2 for rational CM curves. Lemma 15.11's normalizations are planned here (CZ.5/cm-induction-normalization for (15.11.2), CZ.6/cm-period-normalization for (15.11.3)), not in CM.4, because the proof of (15.11.3) uses the elliptic-unit reciprocity law of CZ.1, which itself uses CM.4.
- **PadicHodgeRegulators:D.2** — Kato's generalized explicit reciprocity law \[Kato, 'Generalized explicit reciprocity laws', Theorem 4.3.1\] in height h = 1: for a finite extension K′\_v of Q\_p and a p-divisible group of height one with an action of O\_𝔭 (the 𝔭-divisible group of a CM elliptic curve with good reduction), the dual exponential of the Kummer image of a norm-compatible system of values of a function along the torsion is the logarithmic-derivative formula used in Kato's proof of Prop. 15.9 (pp. 258–259). D.2 is already asked for the h = 2 case used in Kato §10.
- **AnalyticNumberTheory:AN.4** — Nonvanishing on Re(s) = 1 of the unitary normalization of an algebraic Hecke character of infinite order of an imaginary quadratic field (Hecke), extending AN.4/hecke-nonvanishing-on-line-one beyond ray-class (finite-order) characters; needed for Kato 13.5(1) for CM forms of weight k = 3, where s = k − 1 is on the edge of absolute convergence.
- **ColemanPowerSeries:L1** — Part II direction: the Coleman norm operator and Coleman's interpolation theorem for a relative Lubin–Tate formal group of height one over Ô (the completion of the maximal unramified extension of Q\_p), as used for the CM formal group at a split prime (de Shalit Chapter I).
- **ColemanPowerSeries:L2** — The sign and normalization of the Coleman map (dlog and the operator 1 − φ/p) in the cyclotomic case, so that the two-variable Coleman map of CZ.3 can be compared with it.
- **AutomorphicPadicLFunctions:L3** — Katz's two-variable p-adic L-function for an imaginary quadratic field at a split prime p = 𝔭𝔭̄ (the p-ordinary CM type), on the ray tower of conductor 𝔠p^∞ including branch characters tamely ramified at p; its interpolation at Hecke characters of type (−r, 0) with explicit periods and Euler factors; its projections to the anticyclotomic line along a branch character θ; and its functional equation exchanging θ and θ^{-1}ω (Castella–Grossi–Lee–Skinner cite Kriz 2016, Theorem 27).
- **AutomorphicPadicLFunctions:L3h** — Hida's μ = 0 theorem for the anticyclotomic projections of Katz's p-adic L-function along θ (accepted CGLS route 6), used with the main conjecture in Castella–Grossi–Lee–Skinner Theorem 1.2.2.
- **ModularIwasawaMainConjectures:L0** — Kato's cohomological formulation (char H²\_Iw = char(H¹\_Iw/Λ z\_Kato)) with Kato's j\_\* étale convention at Z\[ζ\_{p^n}, 1/p\] (Kato 8.2) on the full cyclotomic Λ = O\_λ\[\[Z\_p^×\]\]; the L0 text says 'extension-by-zero', which is not Kato's convention and should be corrected there.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers** — Existing Tau Ceti layer, cited as it stands: Moduli, ray class carriers and the ray class groups of K.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters** — Existing Tau Ceti layer, cited as it stands: Hecke and ray class characters of K, their conductors and local components.
- **tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic** — Existing Tau Ceti layer, cited as it stands: Infinity types of algebraic Hecke characters, for ψ of type (−r, 0) and (1 − k, 0).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants** — Existing Tau Ceti layer, cited as it stands: The global Brauer sequence, for the Brauer correction terms in (15.6.2).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields** — Existing Tau Ceti layer, cited as it stands: Ray class fields K(f) as actual class fields and the Artin map identifying G\_{p∞f}.
- **tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs** — Existing Tau Ceti layer, cited as it stands: The completed group algebra Z\_p\[\[G\]\] of a profinite group.
- **tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions** — Existing Tau Ceti layer, cited as it stands: L-functions of newforms and of their twists by Dirichlet characters.
- **tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer** — Existing Tau Ceti layer, cited as it stands: The self-twist (CM) predicate of a newform.
- **tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors** — Existing Tau Ceti layer, cited as it stands: Relative effective Cartier divisors and the norm along finite locally free maps.
- **tauceti:TauCetiRoadmap/ModularCurves#2a-group-homomorphisms-multiplication-maps-and-their-degree** — Existing Tau Ceti layer, cited as it stands: Multiplication maps and isogenies of elliptic curves over a base and their norms.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68** — Existing Tau Ceti layer, cited as it stands: Tate modules of elliptic curves.

### What other roadmaps import from here

- CMRankZeroConverse C.3–C.6: CZ.6/cm-kato-main-conjecture (Theorem 2.6, every p), CZ.5/cm-h2-torsion and CZ.6/cm-kato-normalization-dictionary.
- KatoEulerSystems L2/L4 (CM branch): CZ.5/cm-h2-torsion (Kato 12.4 for CM forms, before any Kato class), CZ.5/cm-length-inequality, CZ.6/cm-kato-divisibility, CZ.5/cm-twist-nonvanishing.
- InertAnticyclotomicCMMainConjecture (#1690) and NonordinaryCMSpecialValues (#1689), AnticyclotomicLocalUnits ALU.4, ColemanPowerSeriesPartII AU.4: the early layers CZ.0 (elliptic units, z\_{p∞f}) and CZ.1 (Prop. 15.9, of which Burungale–Kobayashi–Ota use r = 1), and CZ.2/classical-two-variable-main-conjecture (ii).
- HeegnerPointEulerSystems HE.7s/HE.8b and RankZeroOneBSD BSD.7a: CZ.2/classical-two-variable-main-conjecture, CZ.3/katz-form-main-conjecture, CZ.3/anticyclotomic-theta-main-conjecture and CZ.3/katz-functional-equation-lambda. None of these depends on ModularIwasawaMainConjectures L6 or on BSD.7a.

## CZ.0. CM ray towers, unit and class modules, and elliptic units

For an imaginary quadratic K, a prime p and a nonzero ideal f: the ray tower K(p^∞f) with G = Gal(K(p^∞f)/K) ≅ Z\_p² × Δ\_f (imported from AutomorphicPadicLFunctions L0, with no hypothesis p ∤ #Δ\_f), the Iwasawa algebra R = Z\_p\[\[G\]\], its normalization after inverting p and the regular/singular height-one primes (CM ray-class tower). The Iwasawa cohomology H^q\_{p∞f}(T) of the tower with Kato's j\_\* convention. The tower unit and class modules h¹ = lim (O\_{K'}\[1/p\]^× ⊗ Z\_p) and h² = lim Cl(K')(p) (Tower unit and class modules), the Kummer identification h¹ ≅ H¹\_{p∞f}(Z\_p(1)) (Kato (15.6.1)), the comparison h² → H²\_{p∞f}(Z\_p(1)) with finitely generated Z\_p kernel and cokernel retaining the p-place and Brauer terms (15.6.2), and the localization sequence 0 → H²\_p → H²\_{pf} → ⊕\_{𝔩|f,𝔩∤p} Z\_p\[\[G/D\_𝔩\]\] → 0. Finite generation, torsion-freeness and generic rank one of h¹, finite generation and torsion of h² (weak Leopoldt for the ray tower). Kato's CM theta function aθ\_E (15.4) (Kato's CM theta function), the canonical CM pair of modulus f over K(f) (15.3), the standard elliptic units a z\_f with integrality, norm relations and auxiliary independence (Standard elliptic units), Kronecker's limit formula (15.5.1)/(15.6.5) (Kronecker limit formula), the elliptic-unit module z ⊂ h¹ and the auxiliary-free element z\_{p∞f} with (15.6.3)–(15.6.4) (Elliptic-unit module), and the torsion of h¹/z. Nothing in this layer depends on a main conjecture; it is the shared foundation imported by the Burungale–Kobayashi–Ota designs and by AnticyclotomicLocalUnits.

**Depends on:** AnalyticNumberTheory:AN.4, ArithmeticGaloisDuality:D7, ArithmeticGaloisDuality:R02.4, AutomorphicLFunctionsAndLocalFactors:AL.1, AutomorphicPadicLFunctions:L0, ComplexMultiplicationAndExplicitReciprocity:CM.1, ComplexMultiplicationAndExplicitReciprocity:CM.2, ComplexMultiplicationAndExplicitReciprocity:CM.3, IntegralIwasawaTheory:I.2, KatoEulerSystems:L0, PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L4, SelmerIwasawaCohomology:L0, SelmerIwasawaCohomology:L3, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters, tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors, tauceti:TauCetiRoadmap/ModularCurves#2a-group-homomorphisms-multiplication-maps-and-their-degree, tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs.

### CZ.0/ray-tower-iwasawa-algebra — The CM ray-class tower and its two-variable Iwasawa algebra

*Definition · planet: CM ray-class tower.* Let K be an imaginary quadratic field with a fixed embedding K ⊂ C, p a prime and f a nonzero ideal of O\_K. Put K(p^∞f) = ∪\_n K(p^n f) ⊂ K^ab (K(a) the ray class field of modulus a) and G = G\_{p∞f} = Gal(K(p^∞f)/K) with its profinite topology. For a complete discrete valuation ring O finite flat over Z\_p (in applications O = O\_λ), the Iwasawa algebra is R\_O = O\[\[G\]\] = lim\_{K'} O\[Gal(K'/K)\], over finite K ⊂ K' ⊂ K(p^∞f), and R = Z\_p\[\[G\]\]. The group G is the product of its finite torsion subgroup Δ = Δ\_f and a subgroup Γ ≅ Z\_p², the latter mapping isomorphically onto Gal(K\_∞/K) for the unique Z\_p²-extension K\_∞ of K; a splitting G ≅ Γ × Δ is chosen and is part of the data. Hence R\_O ≅ O\[Δ\]\[\[S,T\]\] noncanonically: a three-dimensional semilocal ring, a finite product of local rings. When O contains the values of the characters of Δ, the normalization of R\_O in its total quotient ring Q(R\_O) is ∏\_{χ∈Δ^} O\[\[Γ\]\](χ), and R\_O\[1/p\] equals its normalization with p inverted. A height-one prime q of R\_O is regular if p ∉ q and singular if p ∈ q. For a finitely generated R\_O\[1/p\]-module M that is torsion (killed by a non-zero-divisor), ξ(M) denotes the invertible ideal ∏\_q q^{length(M\_q)} of R\_O\[1/p\], the product over the height-one primes q, all of which are regular after inverting p.

**Hypotheses.**
- K is imaginary quadratic; f is any nonzero ideal; p is any prime, p = 2 and p = 3 included.
- No hypothesis p ∤ #Δ\_f is made; when p divides #Δ\_f the ring R\_O is neither a domain nor normal.
- The splitting G ≅ Γ × Δ is chosen; statements that depend on it say so.

**Proof route.**
1. Import the inverse limit of ray class groups with p-power conductor and fixed tame modulus, and its dimension formula, from AutomorphicPadicLFunctions L0: for K imaginary quadratic the unit rank is zero, so there is no Leopoldt defect and the Z\_p-rank of G is r₂ + 1 = 2.
2. Identify G with that limit through the global Artin map for the actual ray class fields of ClassFieldTheory Layer 13, using the ray class carriers of GlobalNumberFields Layer 2.
3. The torsion subgroup of a finitely generated abelian pro-finite group of this shape is finite and has a complement isomorphic to Z\_p²; choose one, compatibly with the restriction G → Gal(K\_∞/K).
4. Form the completed group algebra as the inverse limit of the finite group rings (ProfiniteProPGroups Layer 9 prerequisites, PadicMeasuresIwasawaAlgebras L1); a choice of topological generators of Γ gives O\[Δ\]\[\[S,T\]\].
5. Johnson-Leung–Kings Lemma 7.2: O\[Δ\] ⊂ ∏\_χ O with cokernel killed by #Δ, so after tensoring with O\[\[Γ\]\] the inclusion into ∏\_χ O\[\[Γ\]\](χ) is an isomorphism after inverting p, and the product is normal. Lemma 7.6 then identifies localizations at regular primes.
6. Characteristic ideals of torsion R\_O\[1/p\]-modules are defined componentwise on the normal ring ∏\_χ O\[\[Γ\]\](χ)\[1/p\], where PadicMeasuresIwasawaAlgebras L4's height-one length formalism applies.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CMRayTower` | structure | The data (K, embedding, p, f) with the field K(p^∞f) as an intermediate field of K^ab and the profinite group G = Gal(K(p^∞f)/K). |
| `CMRayTower.iwasawaAlgebra` | data | The completed group algebra R\_O = O\[\[G\]\] as an inverse limit of finite group rings, with its compact topology and the canonical map G → R\_O^×. |
| `CMRayTower.torsion` | projection | The finite torsion subgroup Δ\_f of G. |
| `CMRayTower.splitting` | data | A chosen isomorphism G ≅ Γ × Δ\_f with Γ ≅ Z\_p² mapping onto Gal(K\_∞/K). |
| `CMRayTower.restrictTo` | functoriality | For f \| f′ the restriction G\_{p∞f′} → G\_{p∞f} and the induced surjection O\[\[G\_{p∞f′}\]\] → O\[\[G\_{p∞f}\]\], with map\_id and map\_comp. |
| `CMRayTower.cyclotomicQuotient` | functoriality | Restriction to K(μ\_{p^∞}) and the induced map R\_O → O\[\[G\_∞\]\] (onto when K ⊄ Q(μ\_{p^∞}); onto O\[\[G′\_∞\]\], G′\_∞ = Gal(Q(μ\_{p^∞})/K), when K ⊂ Q(μ\_{p^∞})). |
| `CMRayTower.normalization_eq_pi` | characterisation | If O contains the values of the characters of Δ, the normalization of R\_O is ∏\_χ O\[\[Γ\]\](χ), and R\_O\[1/p\] is equal to it after inverting p. |
| `CMRayTower.IsRegularPrime` | other | A height-one prime q of R\_O is regular when p ∉ q; at a regular q the localization (R\_O)\_q is a discrete valuation ring. |
| `CMRayTower.xi` | other | The characteristic ideal ξ(M) of a finitely generated torsion R\_O\[1/p\]-module, the product over height-one primes q of q^{length M\_q}; multiplicative in short exact sequences. |
| `CMRayTower.xi_eq_iff_length` | characterisation | ξ(M) = ξ(N) if and only if length(M\_q) = length(N\_q) at every height-one prime q of R\_O\[1/p\]. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `CMRayTower.torsion_gaussian_two` | computation | For K = Q(i), p = 2, f = (1): Δ\_f is trivial and G ≅ Z\_2². |
| `CMRayTower.torsion_gaussian_five` | computation | For K = Q(i), p = 5, f = (1): Δ\_f is cyclic of order 4, the ray class group of modulus (5). |
| `CMRayTower.not_normal_of_dvd` | non-example | For K = Q(i), p = 2, f = (3): Δ\_f ≅ Z/8, so p divides #Δ\_f and Z\_2\[\[G\]\] is not a normal ring (it is not a product of domains). |
| `CMRayTower.normalization_inv_p` | compatibility | With O containing the values of all characters of Δ, the inclusion O\[\[G\]\] → ∏\_χ O\[\[Γ\]\](χ) becomes an isomorphism after inverting p. |
| `CMRayTower.rank_two` | characterisation | G/Δ\_f ≅ Z\_p² for every K, p and f: the ray tower always contains the Z\_p²-extension K\_∞ and nothing of larger rank. |

**Uses.** Burungale–Tian §2.1.1, p. 3: the ring over which the equivariant main conjecture (Theorem 2.1) is stated; Kato 15.13, p. 264: the surjection O\_λ\[\[G\_{p∞f}\]\] → O\_λ\[\[G\_∞\]\] and the inverse image q of a prime of O\_λ\[\[G\_∞\]\]; Johnson-Leung–Kings §§7.1–7.3, pp. 34–37: the reduction of the Ω-main conjecture to regular and singular height-one primes; CMAllPrimeMainConjectures CZ.4 and CZ.6: the characteristic ideals ξ over R\[1/p\] and their comparison by height-one lengths.

**Acceptance.**
- For K = Q(i), p = 2 and f = (1), Δ is trivial and G ≅ Z\_2²: Z\_2\[i\]^× = μ\_4 × (a group ≅ Z\_2²) and the global units μ\_4 are the whole torsion.
- For K = Q(i), p = 5 and f = (1), Δ ≅ Z/4, of order prime to 5; for K = Q(i), p = 2 and f = (3), Δ ≅ Z/8 and p divides #Δ.
- The restriction to K(μ\_{p^∞}) maps G onto Gal(K(μ\_{p^∞})/K), which is the full cyclotomic group G\_∞ exactly when K ⊄ Q(μ\_{p^∞}).

**Prerequisites:** AutomorphicPadicLFunctions:L0, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields, tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs, PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal, mathlib:MonoidAlgebra, mathlib:PowerSeries, mathlib:Ideal.height, mathlib:IsLocalization.AtPrime.

**Sources:** burungale-tian-2026, §2.1.1, p. 3: Fixes the tower K(p^∞f), its Galois group G\_{p∞f} ≅ Z\_p² × Δ\_f and the three-dimensional semilocal ring Z\_p\[\[G\_{p∞f}\]\]; characteristic ideals are taken over Z\_p\[\[G\]\] ⊗ Q.; kato-2004-asterisque-295, 15.1, p. 250: The same tower and the decomposition of G\_{p∞f} as Z\_p × Z\_p times a finite abelian group.; johnson-leung-kings-2011, §4.1, p. 19; Lemma 7.2, p. 34; Lemma 7.6 and Definition 7.5, p. 35: The algebras Λ = Λ(Γ) and Ω = Λ(G\_f) ≅ Z\_p\[Δ\]\[\[T,S\]\], the normalization of Ω\_O as the product of the Λ(χ), and the regular/singular dichotomy for height-one primes.

### CZ.0/ray-tower-iwasawa-cohomology — Iwasawa cohomology of the ray tower with general coefficients

*Construction.* For a finitely generated Z\_p-module (or O-module) T with continuous Gal(K̄/K)-action, unramified outside a finite set, put H^q\_{p∞f}(T) = lim\_{K'} H^q\_ét(O\_{K'}\[1/p\], j\_\*T), the limit over finite K ⊂ K' ⊂ K(p^∞f) along corestriction, where j is the inclusion of the open subscheme over which T is lisse (Kato's convention 8.2: the generic-point direct image, not extension by zero and not unrestricted cohomology of a larger S). By Shapiro's lemma H^q\_{p∞f}(T) = H^q(O\_K\[1/p\], j\_\*(T ⊗ R^ι)). Each H^q\_{p∞f}(T) is a finitely generated R\_O-module, zero for q ∉ {1, 2} (Kato 15.6), and RΓ\_{p∞f}(T) is a perfect complex of R\_O-modules. The variant H^q(O\_K\[1/pf\], R(1)) of Johnson-Leung–Kings (13) replaces O\_{K'}\[1/p\] by O\_{K'}\[1/pf\]. A continuous character χ: G → O^× gives the semilinear twist isomorphism H^q\_{p∞f}(T) ≅ H^q\_{p∞f}(T(χ)) over the ring automorphism Tw\_χ: g ↦ χ(g)g of R\_O.

**Hypotheses.**
- T is a finitely generated Z\_p- or O-module with continuous action, unramified outside a finite set of places of K.
- Cohomology is étale cohomology of the arithmetic schemes O\_{K'}\[1/p\] with the j\_\* convention, identified with continuous Galois cohomology (SelmerIwasawaCohomology L3/etale-iwasawa-comparison).
- K has no real place, so the 2-cohomological dimension of O\_{K'}\[1/p\] is two and p = 2 needs no real-place correction.

**Proof route.**
1. Instantiate SelmerIwasawaCohomology L3/iwasawa-cohomology with G the Galois group of the maximal extension of K unramified outside p and the ramification of T, H the subgroup fixing K(p^∞f) and Γ-quotient G\_{p∞f}; that construction allows any profinite quotient, not only Z\_p^d.
2. Use L3/etale-iwasawa-comparison to pass between continuous Galois cohomology over G\_{K,S} and the j\_\* étale cohomology over O\_{K'}\[1/p\]: the difference is the unramified condition at the omitted primes, which is exactly Kato's convention.
3. Finiteness and perfectness: ArithmeticGaloisDuality D7/cochain-finiteness-perfectness, with R02.4/cohomological-dimension-bound giving amplitude \[0,2\] for the totally complex fields K'. Johnson-Leung–Kings Lemma 4.3 records the same for RΓ(O\_K\[1/p\], Λ(η)(1)) and RΓ(O\_K\[1/pf\], Ω(1)).
4. Shapiro's lemma (SelmerIwasawaCohomology L3/iwasawa-shapiro) and derived base change along R\_O → R′ (Johnson-Leung–Kings Lemma 4.4, after Fukaya–Kato 1.6.5) give the specialization spectral sequence Tor\_r^{R}(R′, H^s) ⇒ H^{s−r}.
5. The twist: the map g ↦ χ(g) g is a Galois-equivariant isomorphism R\_O ≅ R\_O(χ) (Johnson-Leung–Kings Lemma 4.7), which induces the semilinear isomorphism on cohomology.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `rayIwasawaCohomology` | constructor | H^q\_{p∞f}(T) as an R\_O-module, functorial in T. |
| `rayIwasawaCohomology.shapiro` | equivalence | H^q\_{p∞f}(T) ≅ H^q(O\_K\[1/p\], j\_\*(T ⊗ R^ι)), the inverse involution on the coefficient ring as in Johnson-Leung–Kings §4.2. |
| `rayIwasawaCohomology.finite` | other | Finite generation over R\_O and perfectness of RΓ\_{p∞f}(T). |
| `rayIwasawaCohomology.vanishing` | other | H^q\_{p∞f}(T) = 0 for q ∉ {1, 2}: degree three and above by cohomological dimension, degree zero because corestriction kills invariants in the limit. |
| `rayIwasawaCohomology.baseChange` | functoriality | Derived base change along R\_O → R′, in particular along restriction to a smaller tower and along the cyclotomic quotient. |
| `rayIwasawaCohomology.twist` | relation | For χ: G → O^× continuous, H^q\_{p∞f}(T(χ)) ≅ H^q\_{p∞f}(T), semilinear for Tw\_χ. |
| `rayIwasawaCohomology.localization` | relation | The localization triangle comparing the O\_{K'}\[1/p\] and O\_{K'}\[1/pf\] versions (made precise in h2-euler-comparison). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `rayIwasawaCohomology.h0_tate` | computation | H^0\_{p∞f}(Z\_p(1)) = 0. |
| `rayIwasawaCohomology.twist_trivial` | degenerate | Twisting by the trivial character is the identity map. |
| `rayIwasawaCohomology.agrees_cyclotomic` | compatibility | For a lattice T of a G\_Q-representation, H^q\_{p∞f}(T\|G\_K) maps to Kato's H^q(Ind\_K^Q T) through the cyclotomic quotient, and the specialization sequence is the one of Kato 15.13. |
| `rayIwasawaCohomology.not_unrestricted` | non-example | With f having a prime 𝔩 ∤ p, H^2 over O\[1/p\] and over O\[1/pf\] differ by the nonzero torsion module ⊕\_𝔩 Z\_p\[\[G/D\_𝔩\]\]: the j\_\* convention is not the unrestricted cohomology of a larger set of places. |

**Uses.** Kato 15.6 and 15.13, pp. 253 and 264: the modules H^1\_{p∞f}(T), H^2\_{p∞f}(T) whose descent to the cyclotomic tower gives Kato's cohomology of Ind T; Johnson-Leung–Kings Theorems 5.2 and 5.7: the cohomological modules over Λ and Ω in which the main conjectures are stated; CMAllPrimeMainConjectures CZ.5: twisted coefficients T ⊂ V\_{L\_λ}(ψ) in the descent lemma and in the CM case of Kato 12.4.

**Acceptance.**
- H^0\_{p∞f}(Z\_p(1)) = 0 (Johnson-Leung–Kings (14)).
- Over the base K = Q in place of an imaginary quadratic field, the same definition with the cyclotomic tower is Kato's H^q(T) of 8.2, so the two constructions agree where both apply.

**Prerequisites:** SelmerIwasawaCohomology:L3/iwasawa-cohomology, SelmerIwasawaCohomology:L3/etale-iwasawa-comparison, SelmerIwasawaCohomology:L3/iwasawa-shapiro, SelmerIwasawaCohomology:L3/iwasawa-descent, ArithmeticGaloisDuality:D7/cochain-finiteness-perfectness, ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound, CZ.0/ray-tower-iwasawa-algebra, mathlib:NumberField.IsTotallyComplex.

**Sources:** kato-2004-asterisque-295, 15.6, p. 253: Defines H^q\_{p∞f}(T) as the limit of the cohomology of O\_{K'}\[1/p\] over the ray tower and states its finite generation and vanishing outside degrees 1 and 2.; kato-2004-asterisque-295, 8.2, pp. 180–181: The étale convention: cohomology of the generic-point direct image on Spec O\_{K'}\[1/p\], finitely generated and zero above degree two.; johnson-leung-kings-2011, §4.2, (12)–(14) and Lemmas 4.3, 4.4 and 4.7, pp. 20–22: The Iwasawa modules over O\_K\[1/p\] and O\_K\[1/pf\], their perfectness, derived base change and twisting by characters of Γ.; burungale-tian-2026, Footnote 3, p. 4: Refers to Kato 15.6 for the description of the tower modules by Iwasawa cohomology.

### CZ.0/tower-unit-class-modules — The tower unit module h¹ and class module h²

*Definition · planet: Tower unit and class modules h¹ and h².* With the notation of the ray tower, h¹ = lim\_{K'} (O\_{K'}\[1/p\]^× ⊗ Z\_p) and h² = lim\_{K'} Cl(K')(p), the limits over finite K ⊂ K' ⊂ K(p^∞f) along the norm maps, where Cl(K')(p) is the p-primary part of the ideal class group of K'; G acts through its quotients Gal(K'/K), making both R-modules. In Johnson-Leung–Kings' notation h¹ = E′\_∞ and h² = A\_∞, and E\_∞ = lim (O^×\_{K(p^n f)} ⊗ Z\_p) ⊂ E′\_∞ is the module of global units.

**Hypotheses.**
- The limits run over all finite subextensions, equivalently over the cofinal family K(p^n f), n ≥ 1.
- Norm maps on S-units and on class groups are the field norm and the norm of ideals, respectively.

**Proof route.**
1. Form the inverse systems of finite Z\_p-modules O\_{K'}\[1/p\]^× ⊗ Z\_p and Cl(K')(p) with norms; their limits are compact R-modules (IntegralIwasawaTheory I.2 for the general construction of arithmetic inverse limits).
2. The class group carrier is Mathlib's ClassGroup of O\_{K'}; its p-primary part is the p-Sylow subgroup.
3. Compare with Johnson-Leung–Kings §5.4: E′\_∞, E\_∞ and A\_∞ are the same limits indexed by K(p^n f).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `towerUnits` | constructor | h¹ as a compact R-module. |
| `towerClasses` | constructor | h² as a compact R-module. |
| `towerUnits.globalUnits` | data | The submodule E\_∞ of norm-compatible global units, with E\_∞ ⊂ h¹. |
| `towerUnits.proj` | projection | The projection h¹ → O\_{K'}\[1/p\]^× ⊗ Z\_p to each finite layer. |
| `towerClasses.proj` | projection | The projection h² → Cl(K')(p). |
| `towerUnits.restrict` | functoriality | For f \| f′ the norm maps h¹(f′) → h¹(f) and h²(f′) → h²(f), compatible with R(f′) → R(f). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `towerUnits.proj_norm` | characterisation | For K ⊂ K′ ⊂ K″ finite in the tower, the projection to K′ is the norm from K″ composed with the projection to K″. |
| `towerUnits.roots_of_unity_vanish` | computation | The image of the roots of unity μ\_{p^∞}(K′) in h¹ is zero: along a Z\_p-direction in which no new p-power roots of unity appear the norm acts on them as a p-th power. |
| `towerClasses.class_number_one_layer` | degenerate | If every layer K′ has p-primary class group zero then h² = 0. |
| `towerUnits.global_subset` | compatibility | E\_∞ ⊂ h¹ is the kernel of the valuation maps at the finitely many places above p (Johnson-Leung–Kings proof of Theorem 3.9, p. 18). |

**Uses.** Burungale–Tian Theorem 2.1, p. 4: the two sides ξ(h²\_Q) and ξ((h¹/z)\_Q) of the equivariant main conjecture; Kato Theorem 15.2, p. 251: Rubin's comparison of lengths of h² and h¹/z at height-one primes; Johnson-Leung–Kings §5.4, pp. 26–27: the classical form of the main conjecture, with Lemma 5.8's exact sequence.

**Acceptance.**
- The definition presupposes nothing about class numbers of the layers.

**Prerequisites:** IntegralIwasawaTheory:I.2, CZ.0/ray-tower-iwasawa-algebra, mathlib:ClassGroup, SelmerIwasawaCohomology:L0/s-units-completion.

**Sources:** burungale-tian-2026, §2.1.1, p. 3: Defines h¹ as the norm limit of the p-completed p-unit groups and h² as the norm limit of p-primary class groups over the ray tower.; kato-2004-asterisque-295, 15.1, p. 251: The same definitions, with the R-module structures.; johnson-leung-kings-2011, §5.4, p. 26: The modules A\_∞, E\_∞, E′\_∞ over K(p^n f).

### CZ.0/tower-kummer-identification — Kummer identification of the tower unit module

*Comparison.* There is a natural R-isomorphism h¹ ≅ H^1\_{p∞f}(Z\_p(1)), compatible with the projections to the finite layers, where it is the Kummer isomorphism O\_{K'}\[1/p\]^× ⊗ Z\_p ≅ H^1(O\_{K'}\[1/p\], Z\_p(1)) (Kato (15.6.1); Johnson-Leung–Kings Lemma 5.8 for E′\_∞).

**Hypotheses.**
- The Kummer maps use the compatible system of p-power roots of unity fixed in Burungale–Tian §2.0.1.

**Proof route.**
1. At a finite layer: SelmerIwasawaCohomology L0/s-unit-kummer-identification gives H^1(G\_{K',S}, Z\_p(1)) ≅ Z\_p ⊗ O\_{K',S}^× for S the places above p and ∞; the j\_\* convention at primes away from p does not change H^1 with Z\_p(1) coefficients since units are unramified away from p.
2. The identifications commute with corestriction versus norm (same node).
3. Pass to the limit: both inverse systems consist of compact Z\_p-modules, so lim is exact (SelmerIwasawaCohomology L0/inverse-limit-hypotheses).

**Acceptance.**
- The image of the elliptic units of z in H^1\_{p∞f}(Z\_p(1)) is the class used in Kato (15.6.3).

**Prerequisites:** SelmerIwasawaCohomology:L0/s-unit-kummer-identification, SelmerIwasawaCohomology:L0/inverse-limit-hypotheses, CZ.0/ray-tower-iwasawa-cohomology, CZ.0/tower-unit-class-modules.

**Sources:** kato-2004-asterisque-295, (15.6.1), p. 253: States the isomorphism of h¹ with H^1\_{p∞f}(Z\_p(1)).; johnson-leung-kings-2011, Lemma 5.8, p. 27: States E′\_∞ ≅ H^1(O\_K\[1/p\], Ω(1)) after Burns–Greither and Witte.

### CZ.0/class-module-h2-comparison — Class groups and H² of the ray tower agree in codimension one

*Comparison.* There is a homomorphism of R-modules h² → H^2\_{p∞f}(Z\_p(1)) whose kernel and cokernel are finitely generated Z\_p-modules; in particular (h²)\_q ≅ H^2\_{p∞f}(Z\_p(1))\_q for every height-one prime q of R (Kato (15.6.2)). At each finite layer it comes from the Kummer sequence: 0 → Pic(O\_{K'}\[1/p\])(p) → H^2(O\_{K'}\[1/p\], Z\_p(1)) → lim\_n Br(O\_{K'}\[1/p\])\[p^n\] → 0, the last term being the kernel of the sum map Z\_p^Σ → Z\_p on the set Σ of places of K' above p, and Cl(K')(p) → Pic(O\_{K'}\[1/p\])(p) is onto with kernel generated by the classes of the primes in Σ.

**Hypotheses.**
- The number of places of K(p^∞f) above p is finite (each prime above p is finitely decomposed in the Z\_p²-direction and Δ is finite).

**Proof route.**
1. Take cohomology of the Kummer sequence of G\_m on O\_{K'}\[1/p\]: Pic gives the first term and the p-power torsion of the Brauer group the last.
2. Identify the Brauer group of O\_{K'}\[1/p\] through the global Brauer sequence (ClassFieldTheory Layer 10): its p-power torsion is the kernel of the sum of local invariants at the places above p (no real places).
3. Compare Cl(K′) and Pic(O\_{K'}\[1/p\]): the quotient by the classes of the primes above p.
4. Pass to the limit over the tower. The Brauer terms and the classes of primes above p are bounded by the finitely many places above p in K(p^∞f), so they contribute finitely generated Z\_p-modules, which are pseudo-null for R (PadicMeasuresIwasawaAlgebras L4/pseudo-null) and vanish at every height-one prime.
5. Retain both correction terms through the limit, as the brief requires; only after localization at height one do they disappear.

**Acceptance.**
- When every prime above p is totally ramified in K(p^∞f)/K, the correction terms have Z\_p-rank at most the number of primes above p in K.

**Prerequisites:** SelmerIwasawaCohomology:L0/s-unit-kummer-identification, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, CZ.0/ray-tower-iwasawa-cohomology, CZ.0/tower-unit-class-modules, PadicMeasuresIwasawaAlgebras:L4/pseudo-null, mathlib:ClassGroup.

**Sources:** kato-2004-asterisque-295, (15.6.2) and its proof, p. 254: States the map h² → H^2\_{p∞f}(Z\_p(1)) with finitely generated Z\_p kernel and cokernel, and derives it from the Kummer sequence, the Brauer group of O\_{K'}\[1/p\] and the classes of primes above p.; burungale-tian-2026, Footnote 3, p. 4: Refers to Kato 15.6 for the description of the Iwasawa modules by Iwasawa cohomology.

### CZ.0/h2-euler-comparison — Euler-factor comparison of H² over O\_K\[1/p\] and O\_K\[1/pf\]

*Theorem.* Write H^i\_S = lim\_{K'} H^i(O\_{K'}\[S^{-1}\], Z\_p(1)) over finite K ⊂ K' ⊂ K(p^∞f). Then H^1\_p = H^1\_{pf}, and restriction gives an exact sequence of R-modules 0 → H^2\_p → H^2\_{pf} → ⊕\_{𝔩|f, 𝔩∤p} Z\_p\[\[G/D\_𝔩\]\] → 0, where D\_𝔩 is the decomposition group of 𝔩 in G, of Z\_p-rank one. Each Z\_p\[\[G/D\_𝔩\]\] is torsion but not pseudo-null; after inverting p it is killed by 1 − Frob\_𝔩^{-1} on the components where 𝔩 is unramified, and its localization vanishes at every height-one prime of R\[1/p\] lying on a component on which the inertia group I\_𝔩 ⊂ G acts nontrivially.

**Hypotheses.**
- 𝔩 runs over the prime ideals of O\_K dividing f and not dividing p.
- Frob\_𝔩 denotes the Frobenius of 𝔩 in G/I\_𝔩, which has infinite order because 𝔩 is finitely decomposed in K\_∞/K.

**Proof route.**
1. At each finite layer K′ the localization triangle for Spec O\_{K'}\[1/pf\] ⊂ Spec O\_{K'}\[1/p\] and purity (cohomology with supports at a place w | 𝔩 of K′ is RΓ(κ(w), Z\_p)\[−2\] for Z\_p(1) coefficients; Johnson-Leung–Kings Lemma 4.3 proof) give the exact sequence 0 → H^1(O\_{K'}\[1/p\]) → H^1(O\_{K'}\[1/pf\]) → ⊕\_{w|𝔩} Z\_p → H^2(O\_{K'}\[1/p\]) → H^2(O\_{K'}\[1/pf\]) → ⊕\_{w|𝔩} H^1(κ(w), Z\_p) → 0, the first map being the valuations at w.
2. Pass to the limit along corestriction. On the degree-two supported terms H^0(κ(w), Z\_p) = Z\_p corestriction is multiplication by the residue degree, which grows without bound because Frob\_𝔩 has infinite order in G/I\_𝔩; their limit is zero, so H^1\_p = H^1\_{pf}.
3. On the degree-three terms H^1(κ(w), Z\_p) ≅ Z\_p corestriction is the identity summed over the places above, so the limit of ⊕\_{w|𝔩} Z\_p is the compact module Z\_p\[\[G/D\_𝔩\]\]. Limits of compact modules are exact, giving the short exact sequence.
4. D\_𝔩 has Z\_p-rank one (𝔩 is unramified in K\_∞ and finitely decomposed there), so Z\_p\[\[G/D\_𝔩\]\] is torsion of codimension one, not pseudo-null.
5. Johnson-Leung–Kings Lemma 4.3 computes the determinant of the supported complex as (1 − η(𝔩)Frob\_𝔩^{-1})^{-1} on η-components unramified at 𝔩 and as the unit ideal on ramified components; after inverting p this is the vanishing statement at height-one primes on which I\_𝔩 acts nontrivially.

**Acceptance.**
- On the trivial-character component the factor 1 − Frob\_𝔩^{-1} is a non-unit of R\[1/p\] for each 𝔩 | f with 𝔩 ∤ p, so H^2\_{pf} and H^2\_p have different characteristic ideals whenever f has such a prime factor.
- If every prime factor of f lies above p the sequence reduces to H^2\_p = H^2\_{pf}.

**Prerequisites:** CZ.0/ray-tower-iwasawa-cohomology, CZ.0/tower-kummer-identification, ArithmeticGaloisDuality:D7/compact-support-cochains, SelmerIwasawaCohomology:L3/local-cofree-euler, PadicMeasuresIwasawaAlgebras:L4/pseudo-null, CZ.0/ray-tower-iwasawa-algebra.

**Sources:** johnson-leung-kings-2011, Lemma 4.3 and its proof, pp. 20–21: The localization triangle between O\_K\[1/p\] and O\_K\[1/pf\], purity, and the determinant (1 − η(l)Frob\_l^{-1})^{-1} of the supported complex for Λ(η) coefficients, unramified components, trivial on ramified ones; the short exact sequence with Z\_p\[\[G/D\_𝔩\]\] for the full tower is derived here from that triangle and is not stated there.; johnson-leung-kings-2011, Corollary 5.3 and proof of Corollary 7.3, pp. 24–25 and 34: Uses the same sequence to move between the two H² modules.; burungale-tian-2026, Theorem 2.1 and footnote 3, p. 4: Pairs the class-group module h² (which is H² over O\[1/p\] at height one) with elliptic units of the single modulus p^n f; the Euler terms of this sequence are why the printed equality needs correcting (PAPER-BURUNGALE-TIAN-26/E1).

### CZ.0/tower-class-module-torsion — Finite generation and torsion of the class module (weak Leopoldt for the ray tower)

*Theorem.* h² and H^2\_{p∞f}(Z\_p(1)) are finitely generated torsion R-modules: each is killed by a non-zero-divisor of R. The proof given here goes through weak Leopoldt for the ray tower, H^2(G\_{K(p^∞f),S}, Q\_p/Z\_p) = 0 for S the places above p; the sources state only the torsion assertion.

**Hypotheses.**
- Any prime p, any nonzero f.

**Proof route.**
1. Weak Leopoldt for cyclotomic towers: for every number field F, H^2 of the Galois group of the maximal extension of F(μ\_{p^∞}) unramified outside p with Q\_p/Z\_p coefficients vanishes (IntegralIwasawaTheory I.2, Iwasawa's theorem).
2. K(p^∞f) is the union of the fields K′(μ\_{p^∞}) for finite K ⊂ K′ ⊂ K(p^∞f), since K(μ\_{p^∞}) ⊂ K(p^∞). Cohomology commutes with this direct limit, so the H^2 with Q\_p/Z\_p coefficients vanishes for the ray tower.
3. Poitou–Tate duality in the limit (ArithmeticGaloisDuality D7/derived-global-duality) turns this into: H^2\_{p∞f}(Z\_p(1)) has R-rank zero, i.e. is torsion, given finite generation from ray-tower-iwasawa-cohomology.
4. Transfer to h² through class-module-h2-comparison: the kernel and cokernel are finitely generated over Z\_p, hence torsion over R.

**Acceptance.**
- The module H^2\_{pf} is also torsion (h2-euler-comparison adds torsion terms).

**Prerequisites:** IntegralIwasawaTheory:I.2, ArithmeticGaloisDuality:D7/derived-global-duality, CZ.0/ray-tower-iwasawa-cohomology, CZ.0/class-module-h2-comparison.

**Sources:** burungale-tian-2026, §2.1.1, p. 3: Recalls that h¹ and h² are finitely generated over the three-dimensional semilocal ring and that h² is torsion.; kato-2004-asterisque-295, 15.1, p. 251: States finite generation and that h² is killed by a non-zero-divisor.; johnson-leung-kings-2011, Corollary 7.3, p. 34: Proves that H^2(O\_K\[1/pf\], Ω\_O(1)) is Ω\_O-torsion, through the normalization of Lemma 7.2.

### CZ.0/tower-unit-module-structure — Finite generation, torsion-freeness and generic rank of the unit module

*Theorem.* h¹ is a finitely generated torsion-free R-module (no nonzero element is killed by a non-zero-divisor of R), and for every height-zero prime q of R the localization h¹\_q has dimension one over the field R\_q.

**Hypotheses.**
- Any prime p, any nonzero f; R\_q is a field for q of height zero.

**Proof route.**
1. Finite generation: h¹ ≅ H^1\_{p∞f}(Z\_p(1)) (tower-kummer-identification) and the perfectness of RΓ\_{p∞f}.
2. Euler characteristic: for the perfect complex RΓ\_{p∞f}(Z\_p(1)) with H^0 = 0, rank H^1 − rank H^2 = r₂(K)·rank Z\_p(1) = 1 at each height-zero prime (global Euler characteristic, ArithmeticGaloisDuality R02.4/global-euler-characteristic, passed to the tower as in SelmerIwasawaCohomology L3/iwasawa-finiteness-euler, whose Z\_p^d statement covers the Z\_p²-part, the finite Δ being handled componentwise).
3. With H^2 torsion (tower-class-module-torsion), rank H^1 = 1 on each component.
4. Torsion-freeness: the R-torsion submodule of H^1 of the perfect complex RΓ\_{p∞f}(Z\_p(1)), which has H^0 = 0, is the norm limit of the torsion subgroups μ\_{p^∞}(K′) of the finite layers (the only R-torsion in the norm-compatible p-units), and this limit is zero along the Z\_p²-tower because in a Z\_p-direction transverse to the cyclotomic one the norm acts on a fixed group of roots of unity as a p-th power map (tower-unit-class-modules, roots-of-unity test). Kato 13.8 notes the analogous torsion-freeness in the cyclotomic setting follows from a general lemma of Perrin-Riou.

**Acceptance.**
- For K = Q(i), p = 2, f = (1), h¹ is torsion-free of rank one over Z\_2\[\[Z\_2²\]\], a domain, so it embeds in a free module of rank one after localizing at the zero ideal.

**Prerequisites:** CZ.0/tower-kummer-identification, CZ.0/ray-tower-iwasawa-cohomology, CZ.0/tower-class-module-torsion, ArithmeticGaloisDuality:R02.4/global-euler-characteristic, SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler, CZ.0/tower-unit-class-modules.

**Sources:** burungale-tian-2026, §2.1.1, p. 3: Recalls that h¹ is torsion-free with one-dimensional localization at each height-zero prime.; kato-2004-asterisque-295, 15.1, p. 251: The same assertions, citing Rubin.; johnson-leung-kings-2011, Theorem 6.4(2) proof and Corollary 7.3, pp. 30 and 34–35: The rank formula rank H^1 − rank H^2 = 1 for imaginary quadratic K and the rank-one statement over Ω\_O.

### CZ.0/theta-eisenstein-kronecker — Logarithm and logarithmic derivatives of the theta function as Eisenstein–Kronecker series

*Lemma.* For Im τ > 0 and z ∈ C, E(k, τ, z, s) = Σ\_{(m,n)∈Z²} (z + mτ + n)^{-k}|z + mτ + n|^{-s}, absolutely convergent for k + Re(s) > 2 and meromorphically continued in s; E^{(k)}(τ, z) = (−1)^k (k − 1)! (2πi)^{-k} E(k, τ, z, 0) for k ≥ 1, and E^{(0)}(τ, z) = lim\_{s→0} s^{-1} E(0, τ, z, s) (E(0, τ, z, s) vanishes at s = 0). For the elliptic curve E\_τ = C/(Zτ + Z) with coordinate z, t = e^{2πiz}, and c ≥ 2 prime to 6: (3.8.1) for k ≥ 1, D^{k−1} dlog(cθ\_E) = (c² E^{(k)}(τ, z) − c^k E^{(k)}(τ, cz)) ⊗ (dt/t)^{⊗k}; (3.8.2) log|cθ\_E| = c² E^{(0)}(τ, z) − E^{(0)}(τ, cz). Transported to the lattice of a CM pair by a homothety (C/g ≅ C/(Zτ + Z) after scaling), these are the formulas used for elliptic units.

**Hypotheses.**
- The series converge absolutely for k + Re(s) > 2; for k ≥ 3 the value at s = 0 is an absolutely convergent lattice sum.
- The transport to an ideal lattice g by homothety is a change of variables made here, not a statement of Kato 3.8.
- The normalization of cθ is the one fixed in KatoEulerSystems L0/theta-function-c-normalised.

**Proof route.**
1. Kato 3.8 reviews the analytic theory: the theta function cθ is the c-smoothed Weierstrass σ-quotient, whose logarithm and logarithmic derivatives are computed by Kronecker's limit formulas.
2. (3.8.1)–(3.8.2) are those formulas written in the Eisenstein–Kronecker normalization. A homothety C/g ≅ C/(Zτ + Z) transports them to the lattice of a CM pair; the weights of the factors (dt/t)^{⊗k} change by the scaling factor to the k-th power, which is recorded when the formula is applied.
3. These identities are the input both to the Kronecker limit formula for elliptic units (15.5.1) and to the period evaluation (15.9.1).

**Acceptance.**
- For k ≥ 3 the formula is an identity of absolutely convergent lattice sums.
- Kato (3.8.4)(iii): for a torsion point (α, β) ≠ (0, 0), log|g\_{α,β}| = E^{(0)}\_{α,β}, the Siegel-unit case.

**Prerequisites:** KatoEulerSystems:L0/theta-function-c-normalised, KatoEulerSystems:L0/analytic-product-cusp-divisor-and-integrality.

**Sources:** kato-2004-asterisque-295, 3.8, pp. 138–140; (3.8.1)–(3.8.2), p. 140: Defines E(k, τ, z, s), E^{(k)} and E^{(0)} and gives D^{k−1}dlog(cθ\_E) and log|cθ\_E| as c²E(τ, z) − c^k E(τ, cz) combinations.; kato-2004-asterisque-295, 15.5, p. 253: Says that the Kronecker limit formula (15.5.1) is deduced from (3.8.2) by a suitable choice of τ in K.

### CZ.0/cm-theta-function — Kato's CM theta function aθ\_E

*Construction · planet: Kato's CM theta function.* Let K′ be a field over K and E/K′ an elliptic curve with End(E) ≅ O\_K, normalized so that O\_K → End(E) → End\_{K'}(Lie E) = K′ is the inclusion. For an ideal a of O\_K prime to 6 there is a unique aθ\_E ∈ O(E ∖ E\[a\])^× with divisor N(a)·(0) − E\[a\], E\[a\] the subgroup scheme killed by a, and with N\_b(aθ\_E) = aθ\_E for every integer b prime to a, N\_b the norm along multiplication by b. It satisfies: (15.4.1) aθ\_E = cθ\_E when a = (c); (15.4.2) the norm along an isogeny E → E′ of CM curves with End ≅ O\_K sends aθ\_E to aθ\_{E′}; (15.4.3) for a, b prime to 6, (bθ\_E)^{N(a)}·(pr₁^\*(bθ\_{E₁}))^{-1} = (aθ\_E)^{N(b)}·(pr₂^\*(aθ\_{E₂}))^{-1} with E₁ = E/aE, E₂ = E/bE.

**Hypotheses.**
- a is an integral ideal prime to 6 (so that the auxiliary integers 2 and 3 are available in the uniqueness argument).
- E has CM by the maximal order O\_K with the normalized action; isogenies in (15.4.2) are between such curves.

**Proof route.**
1. Uniqueness and existence as in KatoEulerSystems L0/theta-function-c-normalised (Kato Prop. 1.3): two functions with the same divisor differ by a constant u, and invariance under N\_2 and N\_3 forces u^{a²−1} = 1 for a = 2, 3, hence u = 1.
2. Existence: the divisor N(a)(0) − E\[a\] has degree zero and is fixed under pushforward by the multiplications prime to a, so it is principal (Abel–Picard duality for elliptic curves over a base, Tau Ceti ModularCurves 2a and 0a); normalize by the explicit monomial in the norm constants as in Kato 1.10.
3. (15.4.1)–(15.4.3) follow from the same 'equal divisors and N\_2, N\_3 invariance' argument, using the ideal isogenies E → E/aE of ComplexMultiplicationAndExplicitReciprocity CM.1/ideal-action.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CMTheta.theta` | constructor | aθ\_E ∈ O(E ∖ E\[a\])^× for a prime to 6. |
| `CMTheta.divisor` | characterisation | div(aθ\_E) = N(a)(0) − E\[a\] as Cartier divisors. |
| `CMTheta.norm_invariant` | simp | N\_b(aθ\_E) = aθ\_E for integers b prime to a. |
| `CMTheta.unique` | extensionality | Any unit with these two properties equals aθ\_E. |
| `CMTheta.ofInt` | compatibility | aθ\_E = cθ\_E when a = (c), c ∈ Z prime to 6 (agreement with KatoEulerSystems' c-theta). |
| `CMTheta.isogeny_norm` | functoriality | Norm along an isogeny of O\_K-CM curves sends aθ\_E to aθ\_{E′}. |
| `CMTheta.two_ideals` | relation | The relation (15.4.3) between aθ and bθ through E/aE and E/bE. |
| `CMTheta.baseChange` | functoriality | Compatibility with base change K′ → K″. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `CMTheta.ofInt_eq_cTheta` | compatibility | For a = (5) and any CM curve, aθ\_E = 5θ\_E of KatoEulerSystems L0. |
| `CMTheta.divisor_degree` | computation | The divisor N(a)(0) − E\[a\] has degree N(a) − #E\[a\] = 0, since E\[a\] has order N(a). |
| `CMTheta.trivial_ideal` | degenerate | For a = O\_K the divisor is (0) − (0) = 0 and aθ\_E = 1. |
| `CMTheta.not_any_unit` | non-example | u·aθ\_E for a constant u ≠ 1 has the right divisor but fails N\_2-invariance, since N\_2(u f) = u^4 f. |

**Uses.** Kato 15.5, p. 253: the standard elliptic unit a z\_f = aθ\_E(α)^{-1}; Kato (15.4.4), p. 253: independence of the auxiliary ideal after the Euler factors N(a) − σ\_a; Kato proof of Prop. 15.9, pp. 258–260: the functions θ\_n(z) = aθ(z + ν\_n) whose dlog derivatives give the explicit reciprocity.

**Acceptance.**
- For a = (c) with c ∈ Z prime to 6, aθ\_E is Kato's cθ\_E.

**Prerequisites:** KatoEulerSystems:L0/theta-function-c-normalised, ComplexMultiplicationAndExplicitReciprocity:CM.1/ideal-action, tauceti:TauCetiRoadmap/ModularCurves#0a-relative-effective-cartier-divisors, tauceti:TauCetiRoadmap/ModularCurves#2a-group-homomorphisms-multiplication-maps-and-their-degree.

**Sources:** kato-2004-asterisque-295, 15.4 with (15.4.1)–(15.4.3), p. 252: Refines Prop. 1.3 to CM curves and ideals a prime to 6, with divisor N(a)(0) − aE and invariance under norms by integers prime to a; lists the integer case, the isogeny norm property and the two-ideal relation.; johnson-leung-kings-2011, §3.2, p. 14, and proof of Proposition 3.3, p. 15: Recalls the same function aθ\_E (p. 14) and notes that it is a twelfth root of de Shalit's function of Chapter II (p. 15).

### CZ.0/canonical-cm-pair — The canonical CM pair of modulus f over K(f)

*Comparison.* Let f be a nonzero ideal of O\_K with O\_K^× → (O\_K/f)^× injective. A CM pair of modulus f over a field K′ ⊃ K is (E, α) with E/K′ an elliptic curve with normalized O\_K ≅ End(E) and α ∈ E(K′) a torsion point whose annihilator in O\_K is f; isomorphisms of CM pairs are unique. (15.3.1) There is a CM pair over K(f) isomorphic over C to (C/f, 1 mod f), unique up to unique isomorphism: the canonical CM pair. (15.3.2) Every CM pair of modulus f over K′ is the base change of the canonical one along a unique K-embedding K(f) → K′. (15.3.3) For K′/K finite abelian, a an ideal prime to the ramification of K′ and σ = (a, K′/K), the conjugate pair (E^{(σ)}, σ(α)) is isomorphic to (E/aE, α mod aE), by a unique isomorphism η\_a.

**Hypotheses.**
- O\_K^× → (O\_K/f)^× is injective; for f = (1) or small f this fails and one passes to a multiple of f (Kato 15.5 takes n large).

**Proof route.**
1. Existence over C: the lattice f gives E = C/f with CM by O\_K and α = 1 mod f of annihilator exactly f.
2. Field of definition and Galois action: the explicit reciprocity of CM theory for level structures (ComplexMultiplicationAndExplicitReciprocity CM.2/explicit-level-reciprocity) and the identification of the ray-level field with K(f) for the maximal order (CM.3/ray-class-values) give the model over K(f) and the formula for σ(α).
3. Uniqueness of isomorphisms follows from injectivity of O\_K^× → (O\_K/f)^×: an automorphism of E fixing α is a unit congruent to 1 mod f.
4. (15.3.3) is the main theorem of complex multiplication in the moduli form: conjugation by the Artin symbol of a acts on the moduli of CM pairs as the ideal action a ⋆ E = E/aE (CM.1/ideal-action), compatibly with α.

**Acceptance.**
- For K = Q(i) and f = (3): O\_K^× = μ\_4 injects into (O\_K/3)^× = F\_9^×, so the canonical pair exists over K(3).

**Prerequisites:** ComplexMultiplicationAndExplicitReciprocity:CM.2/explicit-level-reciprocity, ComplexMultiplicationAndExplicitReciprocity:CM.3/ray-class-values, ComplexMultiplicationAndExplicitReciprocity:CM.1/ideal-action, ComplexMultiplicationAndExplicitReciprocity:CM.1/ideal-lattice-curve, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields, mathlib:NumberField.Units.torsion.

**Sources:** kato-2004-asterisque-295, 15.3, (15.3.1)–(15.3.3), pp. 251–252: Defines CM pairs of modulus f, notes uniqueness of isomorphisms under the injectivity hypothesis, and summarizes existence of the canonical pair over K(f), descent along a unique embedding, and the Artin-symbol action through E/aE.; johnson-leung-kings-2011, §3.2, pp. 13–14: Recalls the same CM pair and its uniqueness.

### CZ.0/standard-elliptic-unit — Standard elliptic units and their distribution relations

*Construction · planet: Standard elliptic units.* For f with O\_K^× → (O\_K/f)^× injective, (E, α) the canonical CM pair over K(f) and a an ideal prime to 6f, the standard elliptic unit of modulus f and twist a is a z\_f = aθ\_E(α)^{-1} ∈ K(f)^×. For general m prime to a, Johnson-Leung–Kings put a ζ\_m = N\_{K(p^r m)/K(m)}(aθ\_E(α)^{-1}) with (E, α) the canonical pair of modulus p^r m, for any r ≥ 1 with O\_K^× → (O\_K/p^r)^× injective; this is independent of r. Properties: (integrality) a z\_f is a 𝔭-unit for every prime 𝔭 ∤ f and a unit when f has at least two distinct prime divisors; a ζ\_{p^n} is a p-unit; (norm relation) for a prime 𝔮 with mq prime to a, N\_{K(mq)/K(m)}(a ζ\_{mq}) = a ζ\_m^{1 − Frob\_𝔮^{-1}} if 𝔮 ∤ pm and = a ζ\_m if 𝔮 | pm; in particular N\_{K(p^{n+1}f)/K(p^n f)}(a z\_{p^{n+1}f}) = a z\_{p^n f} for n large; (auxiliary independence, (15.4.4)) (b z\_f)^{N(a) − σ\_a} = (a z\_f)^{N(b) − σ\_b} for a, b prime to 6f, σ\_a = (a, K(f)/K).

**Hypotheses.**
- a is prime to 6f (prime to 6pf for the p-adic tower).
- The Artin symbol convention is Kato's (σ\_a the usual Artin symbol); Johnson-Leung–Kings' character values use η(a) = η^{-1}(σ\_a).

**Proof route.**
1. Evaluate the CM theta function at the canonical torsion point; it is defined over K(f) by (15.3.2).
2. Integrality: compare with de Shalit's elliptic functions of Chapter II (aθ\_E is a twelfth root of de Shalit's function, Johnson-Leung–Kings Prop. 3.3(1) proof); the divisor is supported on E\[a\], and α is not a-torsion, so the value is a unit away from primes dividing f.
3. Norm relation: the norm from K(mq) to K(m) of the theta value equals the theta value at the image point composed with the isogeny norm (15.4.2) and the Galois action (15.3.3); the Frobenius factor appears when q ∤ pm.
4. (15.4.4) from (15.4.3) and (15.3.3) applied to the isogenies E → E/aE and E → E/bE.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ellipticUnit` | constructor | a z\_f ∈ K(f)^× for f with injective units and a prime to 6f. |
| `ellipticUnitOf` | constructor | a ζ\_m ∈ K(m)^× for general m prime to a, via the norm from K(p^r m). |
| `ellipticUnitOf_indep_r` | extensionality | a ζ\_m does not depend on the auxiliary r. |
| `ellipticUnit.isUnit_away` | other | a z\_f is a 𝔭-unit for 𝔭 ∤ f, and a unit when f has two distinct prime factors. |
| `ellipticUnit.norm_relation` | relation | The Euler-system norm relation along K(mq)/K(m). |
| `ellipticUnit.aux_indep` | relation | (b z\_f)^{N(a) − σ\_a} = (a z\_f)^{N(b) − σ\_b}. |
| `ellipticUnit.galois` | simp | σ\_c(a z\_f) is the theta value at the conjugate point, computed by (15.3.3). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `ellipticUnit.norm_tower` | characterisation | N\_{K(p^{n+1}f)/K(p^n f)}(a z\_{p^{n+1}f}) = a z\_{p^n f} for n with O\_K^× → (O\_K/p^n f)^× injective. |
| `ellipticUnit.aux_indep_self` | degenerate | For a = b the auxiliary relation is the identity (a z\_f)^{N(a) − σ\_a} = (a z\_f)^{N(a) − σ\_a}. |
| `ellipticUnit.unit_two_primes` | computation | For K = Q(i) and f = (3)(1+i)^3 (two distinct prime factors), a z\_f is a global unit of K(f). |
| `ellipticUnit.euler_factor` | non-example | For 𝔮 ∤ pm the norm of a ζ\_{mq} is not a ζ\_m but a ζ\_m^{1 − Frob\_𝔮^{-1}}: an element without this Euler factor is not the elliptic-unit system. |
| `ellipticUnit.not_cyclotomic` | non-example | For K = Q(i) the cyclotomic units 1 − ζ\_{p^n} of Q(μ\_{p^n}) ⊂ K(p^n) are not the elliptic units: their norms down the Z\_p-direction transverse to the cyclotomic one are not norm-compatible. |

**Uses.** Kato 15.5, p. 253: the generators of the elliptic-unit module z ⊂ h¹; Johnson-Leung–Kings Corollary 3.4 and Definition 3.5, p. 15: the Euler system of elliptic units and its twists; Burungale–Kobayashi–Ota §3, pp. 951–952: the elliptic-unit zeta classes of the inert anticyclotomic tower (consumer InertAnticyclotomicCMMainConjecture).

**Acceptance.**
- The norm-compatible family (a z\_{p^n f})\_n defines an element of h¹ for each a prime to 6pf.

**Prerequisites:** CZ.0/cm-theta-function, CZ.0/canonical-cm-pair, CZ.0/tower-unit-class-modules, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields.

**Sources:** kato-2004-asterisque-295, 15.5, p. 253: Defines the standard elliptic unit a z\_f = aθ\_E(α)^{-1}, states its p-integrality and unit property, and the norm compatibility of a z\_{p^n f} in n deduced from (15.4.2).; kato-2004-asterisque-295, (15.4.4), p. 253: The relation between the units for two auxiliary ideals.; johnson-leung-kings-2011, Definition 3.2 and Proposition 3.3(1)–(3), pp. 14–15: The elliptic units a ζ\_m for general m via norms from K(p^r m), with integrality, the Euler-system norm relation and auxiliary independence.

### CZ.0/kronecker-limit-formula — Kronecker's limit formula for elliptic units

*Theorem · planet: Kronecker limit formula for elliptic units.* (15.5.1) For f with injective units, a prime to 6f and every character χ: Gal(K(f)/K) → C^×, Σ\_σ χ(σ) log|σ(a z\_f)| = (N(a) − χ(a)^{-1}) · lim\_{s→0} s^{-1} L\_{K,f}(χ, s), where L\_{K,f}(χ, s) = Σ\_b χ(b) N(b)^{-s} over ideals b prime to f, with χ(b) = χ((b, K(f)/K)). (15.6.5) For finite K ⊂ K′ ⊂ K(p^∞f) and the image z\_{K'} ∈ (O\_{K'}\[1/p\])^× ⊗ Q of z\_{p∞f}, Σ\_{σ∈Gal(K'/K)} χ(σ) log|σ(z\_{K'})| = lim\_{s→0} s^{-1} L\_{K,pf}(χ, s) for every nontrivial χ of Gal(K′/K).

**Hypotheses.**
- |·| is the absolute value through the fixed embedding K(f) ⊂ C; log|·| is extended to (O^×) ⊗ Q.
- In (15.6.5) χ is nontrivial and L\_{K,pf} omits the Euler factors at all primes dividing pf.

**Proof route.**
1. Apply theta-eisenstein-kronecker (3.8.2) to the lattice of the canonical CM pair and the point α, with τ ∈ K chosen as in Kato's remark after (15.5.1).
2. Sum over Gal(K(f)/K) using (15.3.3): conjugates of a z\_f are theta values at the points of the ray classes, so the character sum becomes a partial-zeta combination equal to the leading coefficient at s = 0 of the Hecke L-series.
3. (15.6.5) follows by taking norms from K(p^n f) to K′ and dividing by N(a) − σ\_a, using that z\_{K′} only involves the modulus p^n f units, so all Euler factors at primes of pf are removed.

**Acceptance.**
- For K′ = K(f) and χ ramified at every prime of f the two formulas agree up to the factor N(a) − χ(a)^{-1}.
- For χ unramified at a prime 𝔩 | f with χ(𝔩) = 1, L\_{K,f}(χ, s) vanishes to order at least two at s = 0 and the character sum is zero: the elliptic unit of modulus f does not see that component.

**Prerequisites:** CZ.0/theta-eisenstein-kronecker, CZ.0/standard-elliptic-unit, CZ.0/canonical-cm-pair, AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters.

**Sources:** kato-2004-asterisque-295, (15.5.1), p. 253: Kronecker's limit formula for the standard elliptic unit: the character sum of log|σ(a z\_f)| equals (N(a) − χ(a)^{-1}) times the derivative at 0 of the partial L-series prime to f; deduced from (3.8.2).; kato-2004-asterisque-295, (15.6.5), p. 255: The same for z\_{K′}, with the L-series prime to pf and χ nontrivial.; johnson-leung-kings-2011, Proposition 3.3(4), p. 14: The relation to L-values in the inverse-Artin convention of that paper.

### CZ.0/elliptic-unit-module — The elliptic-unit module z and the auxiliary-free element z\_{p∞f}

*Construction · planet: Elliptic-unit module z and z\_{p∞f}.* z ⊂ h¹ is the R-submodule generated by the norm-compatible families (a z\_{p^n f})\_{n≥1}, for n large enough that O\_K^× → (O\_K/p^n f)^× is injective (norm compatibility supplies the lower levels), over all ideals a of O\_K prime to 6pf. For any such a ≠ O\_K, N(a) − σ\_a (σ\_a = (a, K(p^∞f)/K)) is a non-zero-divisor of R and z\_{p∞f} = (N(a) − σ\_a)^{-1}·(a z\_{p^n f})\_n ∈ h¹ ⊗\_R Q(R) ≅ H^1\_{p∞f}(Z\_p(1)) ⊗\_R Q(R) is independent of a. Moreover (N(a) − σ\_a) z\_{p∞f} ∈ H^1\_{p∞f}(Z\_p(1)) for every a (15.6.3); the ideal J generated by the N(a) − σ\_a is the kernel of the cyclotomic character R → Z\_p (the annihilator of μ\_{p^∞}(K(p^∞f))), so J\_q = R\_q at every height-one prime q and z\_q = R\_q·z\_{p∞f} (15.6.4). Johnson-Leung–Kings' ζ(f) = (N(a) − σ\_a)^{-1} lim\_n a ζ\_{fp^n} ∈ H^1(O\_K\[1/pf\], Ω(1)) ⊗ Q(Ω) is the same element.

**Hypotheses.**
- a ranges over ideals prime to 6pf; N(a) − σ\_a is a non-zero-divisor exactly because its image under every character η of finite order, N(a) − η(σ\_a), is nonzero.

**Proof route.**
1. Norm compatibility (standard-elliptic-unit) makes (a z\_{p^n f})\_n an element of h¹; R-span gives z.
2. Auxiliary independence (15.4.4) in the limit gives (N(b) − σ\_b)(a z) = (N(a) − σ\_a)(b z), so the quotient is independent of a in h¹ ⊗ Q(R).
3. J is generated by the N(a) − σ\_a and equals the kernel of the cyclotomic character (Johnson-Leung–Kings §5.1); R/J ≅ Z\_p is pseudo-null, so J is the unit ideal at height one.
4. Hence at height one z\_q is generated by z\_{p∞f}.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ellipticUnitModule` | constructor | z ⊂ h¹ as the R-span of the families (a z\_{p^n f})\_n. |
| `zetaElement` | constructor | z\_{p∞f} ∈ h¹ ⊗\_R Q(R). |
| `zetaElement_indep` | extensionality | Independence of the auxiliary ideal a. |
| `zetaElement_mul_mem` | other | (N(a) − σ\_a)·z\_{p∞f} ∈ H^1\_{p∞f}(Z\_p(1)) for every a prime to 6pf. |
| `ellipticUnitModule_localization` | characterisation | z\_q = R\_q·z\_{p∞f} at every height-one prime q. |
| `cyclotomicIdeal_eq` | characterisation | The ideal generated by the N(a) − σ\_a is the kernel of the cyclotomic character R → Z\_p. |
| `zetaElement_restrict` | functoriality | For f \| f′, the norm h¹(f′) → h¹(f) sends z\_{p∞f′} to ∏\_{𝔩\|f′, 𝔩∤pf}(1 − Frob\_𝔩^{-1})·z\_{p∞f} (the distribution relation in the limit). |
| `zetaElement_eq_jlk` | compatibility | z\_{p∞f} equals Johnson-Leung–Kings' ζ(f) under h¹ ≅ H^1(O\_K\[1/pf\], Ω(1)). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `zetaElement_indep_two` | characterisation | (N(b) − σ\_b)·(a z) = (N(a) − σ\_a)·(b z) in h¹ for any a, b prime to 6pf. |
| `cyclotomicIdeal_quotient` | computation | R/J ≅ Z\_p, with g acting on Z\_p through the cyclotomic character. |
| `ellipticUnitModule_height_one` | degenerate | At a height-one prime q, z\_q = R\_q·z\_{p∞f}; the auxiliary ideals disappear. |
| `zetaElement_not_integral` | non-example | z\_{p∞f} itself need not lie in h¹: on the component of the cyclotomic character it can have a pole, which N(a) − σ\_a clears. |

**Uses.** Burungale–Tian Theorem 2.1, p. 4: h¹/z, the elliptic-unit side of the equivariant main conjecture; Kato 15.6 and (15.16.1), pp. 254 and 265: z\_{p∞f} ⊗ γ ⊗ (ζ\_{p^n})^{⊗(−1)} maps to the Beilinson–Kato element; Kato 15.15, p. 265: z\_{p∞f} ⊗ V(ψ)(−1) generates H^1\_{p∞f}(V(ψ))\_q in the proof of Theorem 12.4 for CM forms.

**Acceptance.**
- ξ((h¹/z)\_Q) = ξ(h¹\_Q/R\_Q·z\_{p∞f}) in R\[1/p\], since z and R·z\_{p∞f} differ only in codimension two.

**Prerequisites:** CZ.0/standard-elliptic-unit, CZ.0/tower-unit-class-modules, CZ.0/tower-kummer-identification, CZ.0/ray-tower-iwasawa-algebra, mathlib:cyclotomicCharacter.

**Sources:** kato-2004-asterisque-295, 15.5, p. 253: Defines z as the Z\_p\[\[G\_{p∞f}\]\]-submodule of h¹ generated by the families (a z\_{p^n f})\_n over a prime to 6pf.; kato-2004-asterisque-295, 15.6, (15.6.3)–(15.6.4), p. 254: Defines z\_{p∞f}, proves independence of a, and that the ideal of the N(a) − σ\_a is everything at height one, so z\_𝔭 is generated by z\_{p∞f}.; johnson-leung-kings-2011, §5.1 and §5.3, pp. 23 and 25: The ideal J\_Ω as kernel of the cyclotomic character and the element ζ(f) over O\_K\[1/pf\].; burungale-tian-2026, §2.1.1, p. 3: Takes z ⊂ h¹ to be the elliptic units of Kato §15.5.

### CZ.0/elliptic-unit-cotorsion — The elliptic units have torsion quotient

*Theorem.* For every prime p and nonzero f, h¹/z is a torsion R-module; equivalently z\_{p∞f} is nonzero at every height-zero prime of R and generates h¹ there.

**Hypotheses.**
- Any p, including p = 2 and primes dividing #Δ\_f.

**Proof route.**
1. Height-zero primes of R correspond to pairs (a character χ of Δ up to Galois conjugacy, the generic point of the Z\_p²-direction); h¹ has rank one at each (tower-unit-module-structure).
2. In each component choose a character η of G of finite order ramified at all primes above p and with η(Frob\_𝔩) ≠ 1 for the primes 𝔩 | f, 𝔩 ∤ p, at which the component is unramified; such η exist because Frob\_𝔩 has infinite order in G/I\_𝔩.
3. Under η the image of z\_{p∞f} in (O\_{K'}\[1/p\])^× ⊗ C, K′ the field of η, has archimedean regulator equal to lim\_{s→0} s^{-1}L\_{K,pf}(η^{-1}, s) times a nonzero unit (kronecker-limit-formula (15.6.5)); for such η the partial L-function has a simple zero at s = 0 with nonzero leading term, by the functional equation (AutomorphicLFunctionsAndLocalFactors AL.1/hecke-l-functional-equation) and L(η̄, 1) ≠ 0 (AnalyticNumberTheory AN.4/hecke-nonvanishing-on-line-one).
4. The regulator map on units modulo torsion is injective (Dirichlet's unit theorem, Mathlib's regulator\_ne\_zero), so the η-part of z\_{K′} is nonzero; hence z\_{p∞f} is nonzero at the height-zero prime, and the quotient is torsion.
5. This is Johnson-Leung–Kings Theorem 3.9(c) (non-torsion of ζ\_K(η^{-1})) in the language of h¹.

**Acceptance.**
- For K = Q(i), p = 2, f = (1), R = Z\_2\[\[Z\_2²\]\] is a domain and the statement is that z\_{2∞} ≠ 0.

**Prerequisites:** CZ.0/elliptic-unit-module, CZ.0/kronecker-limit-formula, CZ.0/tower-unit-module-structure, AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one, AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation, mathlib:NumberField.Units.regulator\_ne\_zero.

**Sources:** burungale-tian-2026, §2.1.1, p. 3: States that h¹/z is a torsion module.; kato-2004-asterisque-295, 15.1, p. 251: The same, citing Rubin.; johnson-leung-kings-2011, Theorem 3.9 and its proof, pp. 17–18: For η of large level ramified above p, ζ\_K(η^{-1}) is (N a − η(a)) times the zeta element z\_p(η) and is not torsion, via the injective archimedean regulator and L\*(η, 0) ≠ 0.

## CZ.1. Kato's CM realization and the elliptic-unit reciprocity law

For ψ of type (−r, 0), r ≥ 1: Kato's realization V\_L(ψ), V\_{L\_λ}(ψ) from the canonical CM pair, with the Galois action extended through η\_σ, the de Rham line S(ψ), the period map per\_ψ and the isomorphism (15.8.1) (Kato's realization), for every r (ComplexMultiplicationAndExplicitReciprocity CM.4 has only r = 1). The height-one generalized explicit reciprocity law applied to the 𝔭-divisible groups of the canonical CM curve (input requested from PadicHodgeRegulators D.2), the period evaluation (15.9.1)–(15.9.2) from the Eisenstein–Kronecker series of Kato 3.8, and Kato's Prop. 15.9 for every r ≥ 1, every p, every f inside the conductor and every finite layer (Kato's elliptic-unit reciprocity law). Its r = 1 case is the reciprocity Burungale–Kobayashi–Ota use. This layer depends on no main conjecture.

**Depends on:** AutomorphicLFunctionsAndLocalFactors:AL.1, CMAllPrimeMainConjectures:CZ.0, ComplexMultiplicationAndExplicitReciprocity:CM.1, ComplexMultiplicationAndExplicitReciprocity:CM.4, PadicHodgeRegulators:D.2, PadicHodgeRegulators:L1, SelmerIwasawaCohomology:L4, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters.

### CZ.1/cm-hecke-realization — Kato's λ-adic realization of a CM Hecke character

*Construction · planet: Kato's realization V(ψ), S(ψ), per\_ψ.* Let r ≥ 1 and ψ a Hecke character of K of type (−r, 0) (on C^× it is z ↦ z^{−r}), L = K(ψ(K̂^×)) ⊂ C, a finite extension of K. Choose a nonzero ideal f contained in the conductor of ψ with O\_K^× → (O\_K/f)^× injective and let (E, α) be the canonical CM pair over K(f). Put V\_L(ψ) = H^1(E(C), Q)^{⊗r} ⊗\_K L (tensor power over K) and, for a finite place λ of L over p, V\_{L\_λ}(ψ) = H^1\_ét(E ⊗ Q̄, Q\_p)^{⊗r} ⊗\_{K⊗Q\_p} L\_λ. Gal(Q̄/K(f)) acts naturally; it is extended to Gal(Q̄/K) by letting σ act as η\_σ = ψ(a)^{-1}(η\_a^\*)^{⊗r} ∘ σ, where a is prime to f with (a, K(f)/K) = σ|\_{K(f)} and η\_a: (E/aE, α mod aE) ≅ (E^{(σ)}, σ(α)) is the isomorphism of (15.3.3); the result is independent of a and abelian. Under class field theory an idele a ∈ K̂^× acts as a\_v^r ψ(a)^{-1} (v the place of K under λ, a\_v the v-component of a), and for a prime to pf the Artin symbol (a, K(p^∞f)/K) acts as ψ(a)^{-1}; the action factors through Gal(K(p^∞f)/K). S(ψ) ⊂ coLie(E)^{⊗r} ⊗\_K L is the subspace fixed by the semilinear Gal(K(f)/K)-action through η\_σ, with per\_ψ: S(ψ) → V\_C(ψ) = V\_L(ψ) ⊗ C induced by periods, and (15.8.1) S(ψ) ⊗\_L L\_λ ≅ D^j\_dR(K ⊗ Q\_p, V\_{L\_λ}(ψ)) for 1 ≤ j ≤ r. All constructions are independent of f up to the canonical isogenies between canonical CM pairs.

**Hypotheses.**
- ψ has infinity type (−r, 0) with r ≥ 1; for a CM newform of weight k the relevant character has type (1 − k, 0), so r = k − 1.
- Tensor powers ⊗^r are over K (Betti) and over K ⊗ Q\_p (étale) through the CM action; in (15.8.1) the de Rham tensor power is over K ⊗ K(f).
- This is the rank-one CM realization for every r ≥ 1; ComplexMultiplicationAndExplicitReciprocity CM.4 supplies only r = 1 (Tate-module components).

**Proof route.**
1. Fix the canonical CM pair (canonical-cm-pair) and form the tensor powers of H^1 of E with its O\_K-action.
2. Descend the Galois action from K(f) to K with the isomorphisms η\_a of (15.3.3) twisted by ψ(a)^{-1}; independence of a and commutativity follow from uniqueness of isomorphisms of CM pairs and from ψ being a character.
3. Identify the action by class field theory: on V\_{L\_λ}(ψ) an idele a acts by a\_v^r ψ(a)^{-1}; for r = 1 this is CM.4/cm-hecke-character and CM.4/tate-coefficient-components, and the r-th tensor power gives the exponent r.
4. Define S(ψ) as Gal(K(f)/K)-invariants of the semilinear action on coLie(E)^{⊗r} ⊗\_K L; the period map is the r-th tensor power of the period pairing (CM.1/cm-period-pairings).
5. (15.8.1): V\_{L\_λ}(ψ) is de Rham at places above p because it is so over K(f)\_w; the comparison D\_dR(H^1\_ét) ≅ H^1\_dR(E/K(f)) ⊗ Q\_p (SelmerIwasawaCohomology L4/period-realization) and Gal(K(f)/K)-invariants give S(ψ) ⊗ L\_λ ≅ D^j\_dR for 1 ≤ j ≤ r.
6. Independence of f: for f ⊂ f′ the canonical pairs are related by the canonical isogeny E″ → E″/f′E″ etc. (Kato 15.8, last paragraph).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `CMRealization.betti` | constructor | V\_L(ψ), a one-dimensional L-vector space. |
| `CMRealization.etale` | constructor | V\_{L\_λ}(ψ) with its continuous L\_λ-linear Gal(Q̄/K)-action. |
| `CMRealization.galois_artin` | simp | (a, K(p^∞f)/K) acts as ψ(a)^{-1} for a prime to pf. |
| `CMRealization.galois_idele` | characterisation | An idele a acts by a\_v^r ψ(a)^{-1}; the action factors through Gal(K(p^∞f)/K). |
| `CMRealization.deRham` | constructor | S(ψ) ⊂ coLie(E)^{⊗r} ⊗\_K L, one-dimensional over L. |
| `CMRealization.period` | data | per\_ψ: S(ψ) → V\_C(ψ). |
| `CMRealization.dR_comparison` | equivalence | (15.8.1) S(ψ) ⊗\_L L\_λ ≅ D^j\_dR(K ⊗ Q\_p, V\_{L\_λ}(ψ)) for 1 ≤ j ≤ r. |
| `CMRealization.indep_conductor` | extensionality | Canonical identifications between the constructions for f and f′. |
| `CMRealization.rank_one` | compatibility | For r = 1 agreement with the CM.4 Tate-module component. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `CMRealization.finrank_one` | computation | dim\_L V\_L(ψ) = 1 and dim\_{L\_λ} V\_{L\_λ}(ψ) = 1. |
| `CMRealization.frobenius` | characterisation | For a prime 𝔮 ∤ pf of K, a Frobenius at 𝔮 acts on V\_{L\_λ}(ψ) by ψ(𝔮)^{-1} (geometric normalization). |
| `CMRealization.r_one` | compatibility | For r = 1 and ψ attached to a CM elliptic curve, V\_{L\_λ}(ψ) is the corresponding one-dimensional component of the CM.4 Tate-module decomposition, dualized to Kato's cohomological convention. |
| `CMRealization.not_unramified` | non-example | V\_{L\_λ}(ψ) is ramified at the place v of K under λ (the idele action there contains a\_v^r with r ≥ 1), so it is not a finite-order character. |

**Uses.** Kato 15.9 and 15.12, pp. 258 and 263: the coefficients V\_{L\_λ}(ψ) in the elliptic-unit reciprocity law and in the comparison map (15.12.1); Kato 15.10–15.11, pp. 260–262: V\_{L\_λ}(f) ≅ Ind V\_{L\_λ}(ψ) and the fixed identification S(ψ) ≅ S(f) ⊗\_F L; Burungale–Tian proof of Theorem 2.6, p. 5: the lattices T ⊂ V\_{L\_λ}(ψ) in the descent to Kato's cohomology.

**Acceptance.**
- For r = 1 and ψ the Hecke character of a CM elliptic curve over K, V\_{L\_λ}(ψ) is the λ-component of the rational Tate module dual, with Frobenius at good 𝔮 ∤ pf acting by ψ(𝔮)^{-1} in Kato's geometric normalization.
- dim\_L V\_L(ψ) = dim\_L S(ψ) = 1.

**Prerequisites:** CZ.0/canonical-cm-pair, CZ.0/ray-tower-iwasawa-algebra, ComplexMultiplicationAndExplicitReciprocity:CM.4/cm-hecke-character, ComplexMultiplicationAndExplicitReciprocity:CM.4/tate-coefficient-components, ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-period-pairings, SelmerIwasawaCohomology:L4/period-realization, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68.

**Sources:** kato-2004-asterisque-295, 15.7–15.8 with (15.8.1), pp. 255–258: Hecke characters of type (m, n); for ψ of type (−r, 0) defines V\_L(ψ), V\_{L\_λ}(ψ) from the canonical CM pair, the extended Galois action through η\_σ = ψ(a)^{-1}(η\_a^\*)^{⊗r}, its class-field description, S(ψ), per\_ψ and the de Rham isomorphism (15.8.1), and the independence of f.; burungale-tian-2026, §2.2.5 and proof of Theorem 2.6, p. 5: A CM newform of weight k has L(s, f) = L(s, ψ) with ψ of type (1 − k, 0); the proof of Theorem 2.6 rests on Kato §15, where V(ψ) is defined.

### CZ.1/cm-p-divisible-reciprocity — Height-one explicit reciprocity for the CM p-divisible groups

*Lemma.* Let g = p^m f₀ (m ≥ 1, f₀ the prime-to-p part of f) with g ⊂ f and O\_K^× → (O\_K/g)^× injective, K′ = K(g), (E, α) the canonical CM pair over K′. E has good reduction at every finite place of K′. For a place v of K′ over p and a prime 𝔭 of O\_K over p, let G(v, 𝔭) be the 𝔭-power torsion of the Néron model of E over O\_v: a p-divisible group of height one over O\_{K′\_v} with O\_𝔭-action. Then the triple (K′\_v, G(v, 𝔭), O\_𝔭) satisfies the hypotheses of Kato's generalized explicit reciprocity law \[KK3, Theorem 4.3.1\] with h = 1, and that law computes the dual exponential of the Kummer image of a norm-compatible system of theta values: the image of ξ^{⊗(−r)} ⊗ (θ\_n(ξ\_n))\_n under the cup-product/Kummer map to H^1(K′ ⊗ Q\_p, (T\_pE)^{⊗(−r)}(1)) followed by exp^\* is p^{−mr}(r−1)!^{−1}(d/ω)^r log(θ\_m)·ω^{⊗r}, where ξ = (ξ\_n) is the O\_K ⊗ Z\_p-basis of T\_pE coming from the lattice g, θ\_n(z) = aθ(z + ν\_n) and ν\_n = ξ\_n − α\_n.

**Hypotheses.**
- Height h = 1: the p-divisible groups G(v, 𝔭) are the 𝔭-divisible groups of a CM curve with good reduction (Serre–Tate, because the Galois action on T\_ℓE is unramified away from ℓ once g ⊂ f).
- The general theorem \[KK3, Theorem 4.3.1\] is not proved here; it is requested from PadicHodgeRegulators D.2, which owns Kato's big-local-field reciprocity (used with h = 2 for modular curves in Kato §10).

**Proof route.**
1. Good reduction: since g ⊂ f, Gal(K^ab/K′) acts on T\_ℓE unramified outside ℓ for every ℓ, so E has good reduction everywhere over K′ (Serre–Tate criterion).
2. The 𝔭-divisible group of the Néron model at v is a height-one p-divisible group with O\_𝔭-action (Lubin–Tate of height one over O\_𝔭), so the triple satisfies \[KK3\]'s hypotheses with h = 1.
3. Apply \[KK3, Theorem 4.3.1\] for each v and 𝔭 and assemble over v | p, 𝔭 | p to get the stated formula for the dual exponential.

**Acceptance.**
- When p splits in K the two primes 𝔭, 𝔭̄ give the two height-one factors of E\[p^∞\] over K′\_v.

**Prerequisites:** PadicHodgeRegulators:D.2, CZ.0/canonical-cm-pair, CZ.0/cm-theta-function, CZ.1/cm-hecke-realization, PadicHodgeRegulators:L1/dual-exponential, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68.

**Sources:** kato-2004-asterisque-295, Proof of Prop. 15.9, pp. 258–259: Reduces to K′ = K(g), constructs the basis ξ, the points α\_n and ν\_n and the functions θ\_n, notes good reduction by Serre–Tate, and applies the height-one case of \[KK3, Thm. 4.3.1\] to the triples (K′\_v, G(v, 𝔭), O\_𝔭) to compute exp^\* of the Kummer images.

### CZ.1/cm-eisenstein-evaluation — The period evaluation (15.9.1)

*Lemma.* With the notation of the proof of Prop. 15.9 (K′ = K(g), the canonical CM pair, ω a K′-basis of coLie(E), β ∈ H\_1(E(C), Q) the image of 1 under K ≅ H\_1(C/g, Q)), put ω\_r = (r − 1)!^{-1}(d/ω)^r log(aθ)(α\_m) · ω^{⊗r} ∈ S(ψ) ⊗\_K K′. Then for every character χ of Gal(K′/K), Σ\_{σ∈Gal(K'/K)} χ(σ) per\_ψ(σ(ω\_r)) = (N(a) − ψ(a)χ(a)^{-1})·L\_{pf}(ψ̄, χ, r)·β^{⊗(−r)}, where L\_{pf}(ψ̄, χ, s) = Σ\_b ψ̄(b)χ(b)N(b)^{-s} over ideals b prime to pf, ψ̄ the complex conjugate character (ψψ̄ = N^r). Consequently (15.9.2): for z = (N(a) − ψ(a)σ\_a)^{-1}ω\_r, Σ\_σ χ(σ) per\_ψ(σ(z)) = L\_{pf}(ψ̄, χ, r)·β^{⊗(−r)}.

**Hypotheses.**
- r ≥ 1 and ψ of type (−r, 0); the Eisenstein–Kronecker series converge absolutely only for r ≥ 3, and for r = 1, 2 the value is the analytic continuation at s = 0 (equivalently at s = r for L).

**Proof route.**
1. For σ = (b, K′/K), σ(ω\_r) is the r-th logarithmic derivative of the theta function of E/bE at the image of α, transported back by η\_b (15.3.3) and scaled by ψ(b)^{-1}.
2. Express (d/ω)^r log θ through Eisenstein–Kronecker series (theta-eisenstein-kronecker (3.8.1)): the sum over the lattice becomes a sum over c ∈ K with c ≡ 1 mod b^{-1}g of c^{−r}|c|^{−2s} at s = 0.
3. Re-index by the bijection c ↦ cb onto the integral ideals I prime to g in the class of b, using ψ(cJ) = c^r ψ(J) for c ∈ P(J) (ψ has type (−r, 0), so ψ((c)) = c^r for c ≡ 1 modulo the conductor), and ψ(I)ψ̄(I) = N(I)^r to turn ψ(I)^{-1}N(I)^{-s} into ψ̄(I)N(I)^{-(s+r)}; at s = 0 this is the value at r of L\_{pf}(ψ̄, χ, ·).
4. The two terms of the c-smoothing give N(a) times the sum for b and ψ(a) times the sum for ab, which assemble to (N(a) − ψ(a)χ(a)^{-1})L\_{pf}(ψ̄, χ, r).

**Acceptance.**
- For χ trivial and r ≥ 3 both sides are absolutely convergent and the identity is a rearrangement of lattice sums.

**Prerequisites:** CZ.0/theta-eisenstein-kronecker, CZ.0/cm-theta-function, CZ.1/cm-hecke-realization, CZ.0/canonical-cm-pair, AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation.

**Sources:** kato-2004-asterisque-295, (15.9.1)–(15.9.2) and the proof of (15.9.1), pp. 259–260: States the period evaluation of the r-th logarithmic derivative of the theta value, with the factor N(a) − ψ(a)χ(a)^{-1}, and proves it from the Eisenstein series of 3.8 by the bijection c ↦ cJ onto ideals in a ray class.

### CZ.1/cm-elliptic-reciprocity — Kato's explicit reciprocity law for elliptic units

*Theorem · planet: Kato's elliptic-unit reciprocity law.* (Kato Prop. 15.9.) Let r ≥ 1, ψ of type (−r, 0), p a prime, f ⊂ cond(ψ) a nonzero ideal, K′ ⊂ K(p^∞f) finite over K and γ ∈ V\_L(ψ). Map z\_{p∞f} under H^1\_{p∞f}(Z\_p(1)) → H^1\_{p∞f}(Z\_p(1)) ⊗ V\_L(ψ) ≅ H^1\_{p∞f}(V\_{L\_λ}(ψ)(1)) → H^1(O\_{K'}\[1/p\], V\_{L\_λ}(ψ)(1)) (the first map is x ↦ x ⊗ γ), localize at p and apply exp^\* followed by (15.8.1). The image lies in S(ψ) ⊗\_K K′, and for every χ: Gal(K′/K) → C^×, Σ\_{σ} χ(σ)·per\_ψ(σ(image)) = L\_{pf}(ψ̄, χ, r)·γ, with L\_{pf}(ψ̄, χ, s) = Σ\_a ψ̄(a)χ(a)N(a)^{-s} over ideals a prime to pf. For r = 1 this is the elliptic-unit reciprocity used by Burungale–Kobayashi–Ota, in their convention.

**Hypotheses.**
- Every prime p, including p = 2 and p dividing #Δ\_f; every r ≥ 1.
- z\_{p∞f} lies in the fraction module; its image becomes integral at finite level after the S-localization of (15.6.5).

**Proof route.**
1. Reduce by trace maps to K′ = K(g) with g = p^m f₀ ⊂ f and injective units (Kato's first step); by K-linearity reduce to γ = β^{⊗(−r)}.
2. Apply cm-p-divisible-reciprocity to the norm-compatible system (θ\_n(ξ\_n))\_n, which is (a z\_{p^n f})-type data at the shifted points; this computes exp^\* of the image of a z ⊗ γ as p^{−mr} times ω\_r.
3. Divide by N(a) − ψ(a)σ\_a to remove the auxiliary ideal, and apply cm-eisenstein-evaluation (15.9.2) to obtain the character sums L\_{pf}(ψ̄, χ, r)·γ.
4. The result is the same for all auxiliary choices by elliptic-unit-module (auxiliary independence).

**Acceptance.**
- For χ of conductor divisible by every prime of pf, L\_{pf}(ψ̄, χ, r) = L(ψ̄χ, r) is the full Hecke L-value; for a CM newform f attached to ψ (r = k − 1) and χ factoring through the norm, it is L(f\*, χ, k − 1) up to the Euler factors at the primes of pf.
- For r = 1, K = Q(i) and ψ the character of y² = x³ − x, the formula relates the localized elliptic units to the twisted values L(ψχ, 1).

**Prerequisites:** CZ.1/cm-p-divisible-reciprocity, CZ.1/cm-eisenstein-evaluation, CZ.0/elliptic-unit-module, CZ.1/cm-hecke-realization, CZ.0/tower-kummer-identification, PadicHodgeRegulators:L1/dual-exponential.

**Sources:** kato-2004-asterisque-295, Prop. 15.9 and its proof, pp. 258–260: States the reciprocity law for the image of z\_{p∞f} under the map defined by γ, with values L\_{pf}(ψ̄, χ, r)·γ, for every r ≥ 1, p, f inside the conductor of ψ and finite K′ in the tower, and proves it from \[KK3, Thm. 4.3.1\] with h = 1 and the evaluation (15.9.1) (page images checked).; burungale-tian-2026, Proof of Theorem 2.6, p. 5: Relies on Kato's link (15.16.1) between elliptic units and Beilinson–Kato elements, whose proof rests on this reciprocity law.

## CZ.2. The elliptic-unit Euler system and the integral main conjecture

The Euler system of elliptic units and its twists by finite-order characters (Johnson-Leung–Kings §3) (Euler system of elliptic units). The integral Tamagawa number conjecture at s = 0 for abelian extensions of K (Johnson-Leung–Kings §2; p = 2 rests on Itakura's preprint, a recorded gap) and the identification of elliptic units with Tamagawa zeta elements at characters of large level (Theorem 3.9, Corollary 3.10). Rubin's Euler-system bound in the form of Johnson-Leung–Kings Theorem 6.4 and Corollary 6.5 (Kato's Theorem 15.2(1)). Johnson-Leung–Kings Theorem 5.2: for every prime p and every character χ, Div(κ\_χ) = 0, i.e. the integral equality of characteristic ideals of H²(O\_K\[1/p\], Λ(χ)(1)) and H¹/J\_Λζ(χ) over the Z\_p²-extension (Main conjecture at every prime), and its version over O\_K\[1/pf\] with Euler factors (Corollary 5.3). Rubin's modules U\_∞, Ē\_∞, C̄\_∞, A\_∞, X\_∞ and exact sequence (Rubin's modules), and Rubin's Theorem 4.1 with Johnson-Leung–Kings' all-prime classical form for p ∤ #Δ (Rubin's two-variable main conjecture). The integral equivariant Ω-form at singular primes (Johnson-Leung–Kings §7.3, needing μ = 0) is not a target. Consumers: InertAnticyclotomicCMMainConjecture, HeegnerPointEulerSystems HE.8b, RankZeroOneBSD BSD.7a; nothing here depends on ModularIwasawaMainConjectures L6 or BSD.7a.

**Depends on:** ArithmeticGaloisDuality:D7, ArithmeticGaloisDuality:R02.4, CMAllPrimeMainConjectures:CZ.0, EulerSystemsAndKolyvaginSystems:ES.2, EulerSystemsAndKolyvaginSystems:ES.8, IntegralIwasawaTheory:I.2, NoncommutativeAndEquivariantIwasawa:NE.2, PadicMeasuresIwasawaAlgebras:L4, SelmerIwasawaCohomology:L3, SelmerIwasawaCohomology:L4, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields.

### CZ.2/elliptic-unit-euler-system — The Euler system of elliptic units and its twists by finite characters

*Construction · planet: Euler system of elliptic units.* Fix p, an ideal a prime to 6p, and let 𝒦 be the union of the ray class fields K(q) with q prime to a. The classes a ζ\_m ∈ O\_{K(m)}\[1/p\]^× ⊗ Z\_p ⊂ H^1(O\_{K(m)}\[1/p\], Z\_p(1)), m prime to a, form an Euler system for (𝒦, Z\_p(1), pa) in Rubin's sense: for every prime 𝔮, Cor\_{K(m𝔮)∩𝒦/K(m)∩𝒦}(c\_{m𝔮}) = P(Frob\_𝔮^{-1} | T^∨(1); Frob\_𝔮^{-1}) c\_m if 𝔮 ∤ m·pa and = c\_m otherwise. For a character χ: G(f\_χ) → E^× of conductor f\_χ with a prime to f\_χ, the twisted classes a ζ\_m(χ) = tr\_{K(f\_χ m)/K(m)}(a ζ\_{f\_χ m} ⊗ t\_p(χ)) ∈ H^1(O\_{K(m)}\[1/p\], O\_p(χ)(1)) form an Euler system for (𝒦, O\_p(χ)(1), p f\_χ a), and their limit along K\_∞ is a ζ(χ) ∈ H^1(O\_K\[1/p\], Λ(χ)(1)), Λ = O\_p\[\[Gal(K\_∞/K)\]\]. Projection compatibility: for K ⊂ F ⊂ L ⊂ 𝒦 with G = Gal(L/F), the image of ζ\_L under p\_{χ^{-1}}: O\_p\[G\] → O\_p(χ) is ζ\_F(χ).

**Hypotheses.**
- E is a number field containing the values of χ, O\_p = O\_E ⊗ Z\_p, t\_p(χ) the canonical generator of O\_p(χ) (Johnson-Leung–Kings Definition 1.1).
- The Euler factors use Johnson-Leung–Kings' inverse Artin convention η(𝔮) = η(Frob\_𝔮^{-1}).

**Proof route.**
1. Norm relations of standard-elliptic-unit give the Euler system axioms (Johnson-Leung–Kings Corollary 3.4), with the Euler factor 1 − Frob\_𝔮^{-1} for T = Z\_p(1).
2. Twisting by a finite-order character: Rubin's general twisting construction (EulerSystemsAndKolyvaginSystems ES.2/twisting; Rubin 2.4.2 as cited in Johnson-Leung–Kings Proposition 3.6).
3. The projection formula (Johnson-Leung–Kings Lemma 3.7) compares corestriction with the idempotent p\_{χ^{-1}} through the formula Σ\_g g(f(g^{-1}) t\_p(χ)).
4. Norm compatibility in the K\_∞-direction gives the limit class a ζ(χ).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `ellipticEulerSystem` | constructor | The classes a ζ\_m ∈ H^1(O\_{K(m)}\[1/p\], Z\_p(1)). |
| `ellipticEulerSystem.isEulerSystem` | characterisation | The Euler system axioms for (𝒦, Z\_p(1), pa). |
| `ellipticEulerSystem.twist` | constructor | a ζ\_m(χ) ∈ H^1(O\_{K(m)}\[1/p\], O\_p(χ)(1)). |
| `ellipticEulerSystem.twist_isEulerSystem` | characterisation | The twisted classes form an Euler system for (𝒦, O\_p(χ)(1), p f\_χ a). |
| `ellipticEulerSystem.iwasawaClass` | constructor | a ζ(χ) ∈ H^1(O\_K\[1/p\], Λ(χ)(1)) as a limit along K\_∞. |
| `ellipticEulerSystem.projection` | relation | p\_{χ^{-1}}(ζ\_L) = ζ\_F(χ) (Johnson-Leung–Kings Lemma 3.7). |
| `ellipticEulerSystem.twist_gamma` | relation | For a continuous ρ: Γ → O\_p^×, the twisting isomorphism Λ ≅ Λ(ρ) sends a ζ(χ) to a ζ(χρ) (Johnson-Leung–Kings Lemma 6.1). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `ellipticEulerSystem.trivial_twist` | degenerate | For χ = 1, a ζ\_m(χ) = a ζ\_m. |
| `ellipticEulerSystem.euler_factor_unramified` | characterisation | For 𝔮 ∤ pma, corestriction from K(m𝔮) multiplies by 1 − Frob\_𝔮^{-1} for T = Z\_p(1). |
| `ellipticEulerSystem.twist_compose` | compatibility | Twisting by ρ₁ then ρ₂ equals twisting by ρ₁ρ₂. |
| `ellipticEulerSystem.not_norm_compatible_p` | non-example | Dropping the Euler factor at 𝔮 ∤ pm would make the system norm-compatible in every direction, which elliptic units are not (their L-function interpretation forces the factor). |

**Uses.** Johnson-Leung–Kings Theorem 6.4, p. 30: Rubin's Euler-system bound applied to a ζ(η); Johnson-Leung–Kings §5.2, (17), p. 24: the element ζ(χ) = (N a − σ\_a)^{-1} a ζ(χ) of the Λ-main conjecture; Agboola–Howard II §3, p. 4: the twisted elliptic-unit Euler system for the anticyclotomic tower of a CM curve.

**Acceptance.**
- For χ trivial the twisted system is the elliptic-unit system itself.
- a ζ(χ) is nonzero for every χ (elliptic-unit-cotorsion applied to the corresponding component).

**Prerequisites:** CZ.0/standard-elliptic-unit, CZ.0/ray-tower-iwasawa-cohomology, EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module, EulerSystemsAndKolyvaginSystems:ES.2/twisting, EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension.

**Sources:** johnson-leung-kings-2011, §3.1–§3.4: Definition 3.1, Corollary 3.4, Definition 3.5, Proposition 3.6 and Lemma 3.7, pp. 13–16: Rubin's definition of an Euler system, the elliptic-unit Euler system for Z\_p(1), its twists by a character χ through the trace and t\_p(χ), and the compatibility of ζ\_L with the projector p\_{χ^{-1}}.; rubin-euler-systems-draft, Definition II.1.1 (book II.2.1.1): Rubin's definition of an Euler system for (𝒦, T, N), as used by Johnson-Leung–Kings.

### CZ.2/tamagawa-s0-abelian — The Tamagawa number conjecture at s = 0 for abelian extensions of K

*Theorem.* For an abelian extension F/K and every rational prime p, the rational (Conjecture 2.4) and integral (Conjecture 2.5) Tamagawa number conjectures hold for the motive M(F) = h^0(F)\_E at s = 0. Consequently (Corollary 2.11), for abelian L ⊃ F ⊃ K, the O\_p-module ⊗\_η r\_p(z\_p(η)O\_p) generated by the p-adic regulators of the zeta elements z\_p(η) = ∏\_{𝔭|p}(1 − η(𝔭))z(η), η ∈ Ĝ\_L ∖ Ĝ\_F, coincides with ⊗\_η Det^{-1}\_{O\_p} RΓ(O\_K\[1/p\], O\_p(η^{-1})(1))\[1\].

**Hypotheses.**
- E contains the values of the characters; the Beilinson regulator (twice the Dirichlet regulator) normalizes the archimedean side (Johnson-Leung–Kings (6)).
- For p = 2 the published proof rests on a preprint of Itakura; F is totally complex, so no real-place 2-torsion intervenes.

**Proof route.**
1. Both conjectures for h^0(F) at s = 0 are reformulations of the analytic class number formula with the regulator and the p-adic structure of RΓ\_c (Huber–Kings Proposition 2.3.1 for p ≠ 2; Itakura 3.1 for p = 2, as cited by Johnson-Leung–Kings Theorem 2.6). The analytic class number formula is in Mathlib (the residue of the Dedekind zeta function); its passage to the integral determinant statement is the input still to be decomposed.
2. Pass to the quotient motive M(L)/M(F) = ⊕\_{η∈Ĝ\_L∖Ĝ\_F} M(η) (Corollary 2.8).
3. Artin–Verdier duality matches the O\_p-structures of RΓ\_c(O\_K\[1/p\], O\_p(η^{-1})^∨) and RΓ(O\_K\[1/p\], O\_p(η^{-1})(1)) (Proposition 2.9, by Huber–Kings 1.2.10 for p ≠ 2 and Itakura 1.15 for p = 2).
4. Remove the Euler factors at p using Det RΓ\_f(K\_𝔭, O\_p(η^{-1})^∨) = 1 − η(𝔭) (Corollary 2.11).

**Acceptance.**
- For F = K the statement is the p-part of the class number formula for K: h\_K R\_K/w\_K and the leading term of ζ\_K at s = 0 agree up to a p-adic unit.

**Prerequisites:** CZ.0/ray-tower-iwasawa-cohomology, ArithmeticGaloisDuality:D7/derived-global-duality, ArithmeticGaloisDuality:D7/compact-support-euler-characteristic, NoncommutativeAndEquivariantIwasawa:NE.2/determinant-functor, mathlib:NumberField.Units.regulator, mathlib:NumberField.IsTotallyComplex.

**Sources:** johnson-leung-kings-2011, §2: Conjectures 2.4–2.5, Theorem 2.6, Corollary 2.8, Proposition 2.9, Definition 2.10 and Corollary 2.11, pp. 7–13: Formulates the rational and integral Tamagawa number conjectures for M(F) at s = 0, records their proof for all p (Huber–Kings for p ≠ 2, Itakura for p = 2), passes to the quotient motives M(η) and reformulates the integral statement through zeta elements and determinants of RΓ(O\_K\[1/p\], O\_p(η^{-1})(1)).

### CZ.2/elliptic-zeta-element-comparison — Elliptic units are the Tamagawa zeta elements

*Theorem.* Let η: G(f\_χ) → E^× have conductor f\_η and level n (the largest n with K\_n ⊂ K(f\_η)) large enough that η is ramified at every prime above p. Then ζ\_K(η^{-1}) = tr\_{K(f\_η)/K}(ζ\_{f\_η} ⊗ t\_p(η^{-1})) lies in p\_η(O^×\_{K(f\_η)} ⊗ E) = H^1\_f(M(η^{-1})(1)) and equals (N a − η(a))·z\_p(η); N a ≠ η(a) as automorphisms of M(η)\_p for a ≠ O\_K prime to 6pf\_η; and r\_p(z\_p(η)O\_p) = (N a − η(a))^{-1}ζ\_K(η^{-1})O\_p, so ζ\_K(η^{-1}) is not torsion. Consequently, for n large enough that every η ∈ Ĝ\_n(f\_χ) ∖ Ĝ\_{n−1}(f\_χ) is ramified above p, ⊗\_η (N a − η(a))^{-1}ζ\_K(η^{-1})O\_p = ⊗\_η Det^{-1}\_{O\_p} RΓ(O\_K\[1/p\], O\_p(η^{-1})(1)).

**Hypotheses.**
- η of large level, ramified at every prime above p, so η(𝔭) = 0 and z\_p(η) = z(η).
- a ≠ O\_K is an ideal prime to 6pf\_η.

**Proof route.**
1. Integrality: if f\_η has two distinct prime factors ζ\_{f\_η} is a unit; otherwise f\_η is a power of the unique prime above p and the p-adic valuations are killed by p\_η because η is ramified at every place above p (Johnson-Leung–Kings proof of 3.9(a)).
2. Compute the archimedean regulator of ζ\_K(η^{-1}) with kronecker-limit-formula: it equals (N a − η(a)) L^\*(η, 0) t\_B(η^{-1}), the regulator of (N a − η(a))z(η); injectivity of the regulator gives the identity.
3. N a − η(a) is invertible since η(a) is a root of unity and N a > 1.
4. Combine with tamagawa-s0-abelian (Corollary 2.11) for L = K\_n(f\_χ), F = K\_{n−1}(f\_χ).

**Acceptance.**
- For η of small level (unramified at a prime above p) the identity acquires the Euler factor 1 − η(𝔭) and the integrality can fail; this is why the reduction to large level in lambda-main-conjecture is needed.

**Prerequisites:** CZ.2/tamagawa-s0-abelian, CZ.0/kronecker-limit-formula, CZ.2/elliptic-unit-euler-system, mathlib:NumberField.Units.regulator\_ne\_zero.

**Sources:** johnson-leung-kings-2011, Definition 3.8, Theorem 3.9 and Corollary 3.10, pp. 17–19: For characters of large level ramified above p, the elliptic-unit class ζ\_K(η^{-1}) is (N a − η(a)) times the zeta element, is integral and non-torsion, and the tensor product over new characters of these classes generates the determinant of RΓ(O\_K\[1/p\], O\_p(η^{-1})(1)).

### CZ.2/elliptic-unit-euler-system-bound — Rubin's Euler-system bound for elliptic units

*Theorem.* Let η be a character of conductor f\_η and level large enough that O\_p(η) is ramified at every place above p, Λ\_O = O\_p\[\[Γ\]\], Γ = Gal(K\_∞/K) ≅ Z\_p². Then (1) H^2(O\_K\[1/p\], Λ(η)(1)) is Λ\_O-torsion; (2) H^1(O\_K\[1/p\], Λ(η)(1)) has Λ\_O-rank one; (3) H^1/Λ\_O·a ζ(η) is torsion; (4) Det H^2\_0 ⊂ Det(H^1/Λ\_O a ζ(η)) inside Q(Λ\_O), where H^2\_0 is the kernel of localization to ⊕\_{v|p} H^2(K\_v, Λ(η)(1)); and (Corollary 6.5) the same inclusion with H^2 in place of H^2\_0. In length form: at every height-one prime 𝔮 of Λ\_O, length(H^2\_𝔮) ≤ length((H^1/Λ\_O a ζ(η))\_𝔮). By twisting (Lemma 6.1) the inequality holds for every χ at height-one primes, which is Rubin's inequality, Kato Theorem 15.2(1), in the form needed at regular primes.

**Hypotheses.**
- Every prime p, including p = 2 and 3; Rubin's hypotheses Hyp(K\_∞/K) and Hyp(K\_∞, O\_p(η)(1)) hold with τ = 1 because K is imaginary quadratic and the coefficient module has rank one.
- The local H^2(K\_v, Λ(η)(1)), v | p, are finitely generated O\_p-modules, hence pseudo-null (Johnson-Leung–Kings Lemma 4.6).

**Proof route.**
1. Check Rubin's hypotheses for the Z\_p²-extension K\_∞ (no finite prime splits completely: EulerSystemsAndKolyvaginSystems ES.8/admissible-zp-d-extension, ES.8/leopoldt-tower-hypothesis, ES.8/iwasawa-large-image-hypotheses).
2. The Λ-adic class a ζ(η) is non-torsion (elliptic-zeta-element-comparison), so Rubin's Theorem II.3.2 gives torsion of X\_∞ = H^2\_0 (ES.8/weak-leopoldt-from-an-euler-system), and with Lemma 4.6 torsion of H^2.
3. Rank one of H^1 from the Euler characteristic rank H^1 − rank H^2 = 1 (r₂(K) = 1) and H^0 = 0.
4. Rubin's Theorem II.3.3, ind\_Λ(c) ⊂ char(X\_∞) (ES.8/rubin-iwasawa-divisibility), together with the pseudo-isomorphism H^1 → Λ\_O ⊕ torsion, gives the determinant inclusion (Johnson-Leung–Kings proof of 6.4(4)).
5. Corollary 6.5: H^2\_0 and H^2 have the same characteristic ideal because the local H^2 at p are pseudo-null.

**Acceptance.**
- The inclusion is integral, with no power of p lost, for every p including 2.

**Prerequisites:** CZ.2/elliptic-unit-euler-system, CZ.2/elliptic-zeta-element-comparison, CZ.0/ray-tower-iwasawa-cohomology, EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility, EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system, EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis, EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses, EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension, EulerSystemsAndKolyvaginSystems:ES.8/twisting-by-characters-of-gamma, PadicMeasuresIwasawaAlgebras:L4/pseudo-null, ArithmeticGaloisDuality:R02.4/global-euler-characteristic.

**Sources:** johnson-leung-kings-2011, Definition 6.3, Theorem 6.4, Corollary 6.5, pp. 30–31; Lemma 4.6, p. 22: For characters of large level, the Euler-system theory gives torsion of H², rank one of H¹, torsion of H¹ modulo the elliptic-unit class and the determinant inclusion, first for H²\_0 and then, the local terms at p being pseudo-null, for H².; kato-2004-asterisque-295, Theorem 15.2(1), p. 251: Rubin's inequality length(h²\_𝔭) ≤ length((h¹/z)\_𝔭) at height-one primes not containing p (condition (a)).; rubin-euler-systems-draft, Theorems II.3.2–II.3.3 (book II.2.3.2–2.3.3): Rubin's Iwasawa-theoretic Euler-system theorems: weak Leopoldt and the divisibility char(X\_∞) | ind\_Λ(c).

### CZ.2/lambda-main-conjecture — The main conjecture for imaginary quadratic fields at every prime (Johnson-Leung–Kings Theorem 5.2)

*Theorem · planet: Main conjecture at every prime (Johnson-Leung–Kings).* For every prime p and every character χ: G(f\_χ) → E^× of conductor f\_χ, with Λ\_O = O\_p\[\[Gal(K\_∞/K)\]\]: (1) H^0(O\_K\[1/p\], Λ(χ)(1)) = 0; (2) H^1(O\_K\[1/p\], Λ(χ)(1)) has Λ\_O-rank one and H^1/J\_Λ(ζ(χ)) is torsion; (3) H^2(O\_K\[1/p\], Λ(χ)(1)) is torsion; and the inclusion κ\_χ: J\_Λ(ζ(χ)) → RΓ(O\_K\[1/p\], Λ(χ)(1))\[1\] is good in the sense of Knudsen–Mumford with Div(κ\_χ) = 0, so that κ\_χ induces Det\_{Λ\_O}(H^1/J\_Λ(ζ(χ))) ≅ Det\_{Λ\_O} H^2. Here ζ(χ) = (N a − σ\_a)^{-1} a ζ(χ) ∈ H^1 ⊗ Q(Λ\_O) and J\_Λ is the kernel of the cyclotomic character Λ → Z\_p. In length form: length((H^1/J\_Λζ(χ))\_𝔮) = length(H^2\_𝔮) at every height-one prime 𝔮 of Λ\_O, integrally, including 𝔮 ∋ p.

**Hypotheses.**
- No restriction on p: Johnson-Leung–Kings say the theorem holds for all primes with no exceptions, removing Rubin's condition that p not divide the degree of the abelian field cut out by χ; in particular p = 2 and 3 are covered, which Rubin's standing hypothesis p ∤ #μ(H) excludes.
- The p = 2 case rests on tamagawa-s0-abelian at p = 2 (Itakura's preprint, a recorded gap).

**Proof route.**
1. Reduce to characters of large level by twisting with a continuous ρ: Γ → O\_p^× (Lemmas 4.7 and 6.1, Corollary 6.2); the statement is invariant under such twists.
2. For η of large level: Div(κ\_η ∘ τ\_η) is effective by elliptic-unit-euler-system-bound, and Div(τ\_η) is effective with (N a − σ\_a)^{-1}Det(Λ\_O a ζ(η)) = Det(J\_Λ ζ(η)) (Lemma 6.6, using that J\_Λ ζ(η)/... is pseudo-null), so Div(κ\_η) is effective.
3. Effective divisors vanish when their sum over all new characters η of level n vanishes; test the resulting inclusion of invertible modules after the augmentation ι: Λ\_O → O\_p (Nakayama). By Lemma 6.7 and the identity (N a − σ\_a) ↦ N a − η^{-1}(a), the pulled-back inclusion becomes the inclusion of elliptic-zeta-element-comparison, which is an equality by the Tamagawa input.
4. Hence Div(κ\_η) = 0 for all η of large level and, by step 1, for every χ.

**Acceptance.**
- For χ trivial and p ∤ 6 split in K, the statement contains the one-variable and two-variable classical main conjectures of Rubin in their cohomological form.
- K = Q(i), p = 2, χ = 1: the equality holds integrally over Z\_2\[\[Z\_2²\]\].

**Prerequisites:** CZ.2/elliptic-unit-euler-system-bound, CZ.2/elliptic-zeta-element-comparison, CZ.2/tamagawa-s0-abelian, CZ.2/elliptic-unit-euler-system, CZ.0/elliptic-unit-module, NoncommutativeAndEquivariantIwasawa:NE.2/determinant-functor, SelmerIwasawaCohomology:L3/selmer-determinant, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal, PadicMeasuresIwasawaAlgebras:L4/iwasawa-algebra-regular-local.

**Sources:** johnson-leung-kings-2011, Theorem 5.2, p. 24; §6, pp. 29–33: States the Λ-main conjecture for every character and every prime with no exceptions, and proves it by reduction to large level, the Euler-system divisibility, Lemma 6.6 and the augmentation argument with Corollary 3.10.; johnson-leung-kings-2011, §1.3 and Proposition 1.2, pp. 6–7: The Knudsen–Mumford functors Det and Div and the good maps used to state the equality.

### CZ.2/lambda-main-conjecture-euler-factors — The main conjecture over O\_K\[1/pf\] with Euler factors

*Theorem.* Suppose f\_χ | f and put ζ(χ, f) = ∏\_{𝔩|f, 𝔩∤p}(1 − χ(𝔩)Frob\_𝔩^{-1})·ζ(χ) (image in H^1(O\_K\[1/pf\], Λ(χ)(1))). Then J\_Λ(ζ(χ, f)) → RΓ(O\_K\[1/pf\], Λ(χ)(1))\[1\] is good and induces Det\_{Λ\_O}(H^1(O\_K\[1/pf\], Λ(χ)(1))/J\_Λ(ζ(χ, f))) ≅ Det\_{Λ\_O} H^2(O\_K\[1/pf\], Λ(χ)(1)).

**Hypotheses.**
- Every prime p; f\_χ | f.
- χ(𝔩) = 0 when χ is ramified at 𝔩, so the factor is 1 there.

**Proof route.**
1. Combine lambda-main-conjecture with the localization triangle relating O\_K\[1/p\] and O\_K\[1/pf\].
2. The supported complexes at 𝔩 | f, 𝔩 ∤ p have determinant Λ\_O(1 − χ(𝔩)Frob\_𝔩^{-1})^{-1} (h2-euler-comparison; Johnson-Leung–Kings Lemma 4.3), which is exactly compensated by the Euler factors in ζ(χ, f).

**Acceptance.**
- If every prime of f divides p, ζ(χ, f) = ζ(χ) and the statement is lambda-main-conjecture.

**Prerequisites:** CZ.2/lambda-main-conjecture, CZ.0/h2-euler-comparison.

**Sources:** johnson-leung-kings-2011, Corollary 5.3 and its proof, pp. 24–25: The main conjecture over O\_K\[1/pf\] with the elliptic-unit element multiplied by the Euler factors at the primes of f prime to p, from the localization sequence and Lemma 4.3.

### CZ.2/rubin-iwasawa-modules — Rubin's Iwasawa modules U\_∞, Ē\_∞, C̄\_∞, A\_∞, X\_∞

*Definition · planet: Rubin's modules U∞, Ē∞, C̄∞, A∞, X∞.* Fix a prime 𝔭 of K above p, an abelian extension K₀ of K containing the Hilbert class field H with p ∤ \[K₀ : K\], and an abelian extension K\_∞ of K containing K₀ with Gal(K\_∞/K₀) ≅ Z\_p or Z\_p²; G = Gal(K\_∞/K) ≅ Δ × Γ with Δ = Gal(K₀/K). For finite F ⊂ K\_∞ over K: A(F) is the p-part of the class group, ℰ(F) the global units, 𝒞(F) Rubin's elliptic units of F, U(F) the local units of F ⊗ K\_𝔭 congruent to 1 modulo the primes above 𝔭, Ē(F) and C̄(F) the closures of ℰ(F) ∩ U(F) and 𝒞(F) ∩ U(F) in U(F), and X(F) = Gal(M(F)/F) for M(F) the maximal abelian p-extension of F unramified outside the primes above 𝔭. A\_∞, U\_∞, Ē\_∞, C̄\_∞, X\_∞ are the norm limits, modules over Λ = Z\_p\[\[G\]\] = ⊕\_χ Λ^χ, χ running over the irreducible Z\_p-representations of Δ, Λ^χ ≅ R\_χ\[\[Γ\]\] (R\_χ the unramified extension of Z\_p of degree dim χ). Global class field theory gives the exact sequence 0 → Ē\_∞/C̄\_∞ → U\_∞/C̄\_∞ → X\_∞ → A\_∞ → 0.

**Hypotheses.**
- Rubin's standing hypothesis: p does not divide the number of roots of unity in H (so p > 2, and p > 3 when 3 ramifies in K), and p ∤ \[K₀ : K\].
- Rubin's 𝒞(F) is generated by elliptic units of all moduli dividing the conductor; up to torsion C\_∞ is the Ω-span of I\_Ω J\_Ω(ζ(g)) for all g | f (Johnson-Leung–Kings §5.4).

**Proof route.**
1. Form the finite-level modules and their limits under norms; the χ-decomposition uses the idempotents e\_χ, which are integral since p ∤ #Δ.
2. The exact sequence (5) is the limit of the class-field-theoretic sequences at finite level, comparing the 𝔭-ramified Galois group with local units modulo global units and the class group.
3. Compare with Johnson-Leung–Kings §5.4: E′\_∞ ≅ H^1(O\_K\[1/p\], Ω(1)) and the sequence of Lemma 5.8 linking E\_∞, E′\_∞, the decomposition-group modules, A\_∞ and H^2(O\_K\[1/p\], Ω(1)).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `RubinModules` | structure | The data (𝔭, K₀, K\_∞) under Rubin's hypotheses and the modules A\_∞, U\_∞, Ē\_∞, C̄\_∞, X\_∞. |
| `RubinModules.chiPart` | projection | The χ-isotypic component Y^χ = e\_χ Y over Λ^χ ≅ R\_χ\[\[Γ\]\]. |
| `RubinModules.fundamentalSequence` | relation | 0 → Ē\_∞/C̄\_∞ → U\_∞/C̄\_∞ → X\_∞ → A\_∞ → 0. |
| `RubinModules.toCohomology` | equivalence | E′\_∞ ≅ H^1(O\_K\[1/p\], Ω(1)) and the five-term comparison of Johnson-Leung–Kings Lemma 5.8. |
| `RubinModules.char` | other | The characteristic ideal char(Y) ⊂ Λ of a finitely generated torsion Λ-module, as the product of characteristic ideals of the χ-parts. |
| `RubinModules.restrictToZp` | functoriality | Passage from a Z\_p²-extension to a Z\_p-subextension (one-variable case), as in Rubin §5. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `RubinModules.sequence_split` | characterisation | When p splits in K, X\_∞ and U\_∞/C̄\_∞ are torsion and char(X\_∞) = char(U\_∞/C̄\_∞) is equivalent to char(A\_∞) = char(Ē\_∞/C̄\_∞) through the sequence. |
| `RubinModules.nonsplit_not_torsion` | non-example | When p is inert in K and Gal(K\_∞/K₀) ≅ Z\_p², U\_∞/C̄\_∞ is not a torsion Λ-module, so 'char(X\_∞) = char(U\_∞/C̄\_∞)' is not a meaningful torsion statement there. |
| `RubinModules.chi_trivial_hyp` | degenerate | For Δ trivial (K₀ = K = H, class number one) there is one component and Λ ≅ Z\_p\[\[Γ\]\]. |
| `RubinModules.compare_jlk` | compatibility | For p ∤ #Δ, p\_χ E′\_∞ ≅ H^1(O\_K\[1/p\], Λ(χ)(1)) under Johnson-Leung–Kings' projectors. |

**Uses.** Rubin Theorem 4.1, p. 37: the modules whose characteristic ideals are compared; Castella–Grossi–Lee–Skinner proof of Theorem 1.2.2, p. 8: X\_∞ for the anticyclotomic tower and the θ-isotypic part; Agboola–Howard II Proposition 3.3, p. 5: deduction of the strict-versus-relaxed Selmer equality from Rubin's Theorem 4.1(ii).

**Acceptance.**
- When p does not split in K, X\_∞ and U\_∞/C̄\_∞ are not torsion Λ-modules (Rubin, Remark 2 after Theorem 4.1); when p splits they are torsion and the two equalities of Theorem 4.1(i) are equivalent through (5).

**Prerequisites:** CZ.0/tower-unit-class-modules, CZ.0/standard-elliptic-unit, IntegralIwasawaTheory:I.2, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields, SelmerIwasawaCohomology:L4/unit-class-exact-sequence.

**Sources:** rubin-1991-invent, §1, p. 27, and §4, pp. 36–37: The standing hypothesis on p, the fields K₀ ⊂ K\_∞, the modules A, ℰ, 𝒞, U, Ē, C̄, X and their limits, the decomposition Λ = ⊕Λ^χ and the exact sequence (5).; johnson-leung-kings-2011, §5.4 and Lemma 5.8, pp. 26–27: The relation of the classical modules E\_∞, E′\_∞, A\_∞, C\_∞ to the cohomological ones.

### CZ.2/classical-two-variable-main-conjecture — Rubin's main conjecture and its all-prime classical form

*Theorem · planet: Rubin's two-variable main conjecture.* (Rubin, Theorem 4.1) Under Rubin's hypotheses: (i) if p splits in K, char(A\_∞) = char(Ē\_∞/C̄\_∞) and char(X\_∞) = char(U\_∞/C̄\_∞); (ii) if p is inert or ramified in K, char(A\_∞) divides char(Ē\_∞/C̄\_∞), with equality of χ-parts char(A\_∞)^χ = char(Ē\_∞/C̄\_∞)^χ for every irreducible χ of Δ that is nontrivial on the decomposition group of 𝔭 in Δ. (Johnson-Leung–Kings §5.4) When p ∤ #Δ, for every prime p (2 and 3 included) and every χ, Det\_{Λ\_O}(p\_{χ^{-1}}E\_∞/I\_Λ J\_Λ(ζ(χ))) ≅ Det\_{Λ\_O}(p\_{χ^{-1}}A\_∞), i.e. char(p\_{χ^{-1}}A\_∞) = char(p\_{χ^{-1}}E\_∞/I\_Λ J\_Λ(ζ(χ))), integrally, with no condition on the splitting of p or on χ.

**Hypotheses.**
- Rubin's statement: p ∤ #μ(H) and p ∤ \[K₀ : K\]; Johnson-Leung–Kings' classical form: p ∤ #Δ only.
- The statements are integral equalities of ideals of Λ, not after inverting p.

**Proof route.**
1. Rubin proves (i) and (ii) by Kolyvagin–Thaine methods (Rubin §§8–10, case table p. 58); for nonsplit p only the divisibility in general, equality on χ nontrivial on the decomposition group.
2. For the all-prime form: decompose Ω\_O = ∏\_χ Λ(χ) (possible since p ∤ #Δ), identify p\_{χ^{-1}}E′\_∞ with H^1(O\_K\[1/p\], Λ(χ)(1)) (rubin-iwasawa-modules), and use Lemma 5.8's sequence: the decomposition-group modules at p are pseudo-null, so H^2 and A\_∞ have the same characteristic ideal and E′\_∞ and E\_∞ differ by pseudo-null terms after the augmentation ideal I\_Λ.
3. Apply lambda-main-conjecture to get the determinant isomorphism.

**Acceptance.**
- Consumers needing the inert-prime anticyclotomic input (Agboola–Howard II Proposition 3.3(ii), used by InertAnticyclotomicCMMainConjecture) obtain it from the χ-part equality (ii), as Agboola–Howard do; an inert-prime 'units form' char(X\_∞^χ) = char(U\_∞^χ/C̄\_∞^χ) is not a theorem of Rubin, since those modules are not torsion.
- For K = Q(i), p = 5 (split), f = (1): Δ ≅ Z/4 has order prime to 5 and both forms apply.

**Prerequisites:** CZ.2/rubin-iwasawa-modules, CZ.2/lambda-main-conjecture, CZ.2/lambda-main-conjecture-euler-factors, CZ.0/elliptic-unit-module, PadicMeasuresIwasawaAlgebras:L4/pseudo-null, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal.

**Sources:** rubin-1991-invent, Theorem 4.1 and Remarks (1)–(2), p. 37; proof summary, p. 58: The one- and two-variable main conjectures: both equalities when p splits, divisibility and χ-part equality for χ nontrivial on the decomposition group when p does not split; Remark 2 notes that X\_∞ and U\_∞/C̄\_∞ are not torsion for nonsplit p.; johnson-leung-kings-2011, §5.4, pp. 26–27: The classical form of Theorem 5.2 for p prime to #Δ, with no further restriction on p.; agboola-howard-2005, Proposition 3.3 and its proof, p. 5: Deduces char(X\_str) = char(S\_rel/C) over the anticyclotomic Iwasawa algebra from Rubin's Theorem 4.1(ii).

## CZ.3. Split primes: the Coleman map, Katz's measure and anticyclotomic components

For p = 𝔭𝔭̄ split in K under Rubin's hypotheses: the two-variable Coleman map on local units at 𝔭 for the height-one relative Lubin–Tate group of the CM curve (Two-variable Coleman map), the identification of the image of the elliptic units with Katz's two-variable measure (Yager, de Shalit; imported from AutomorphicPadicLFunctions L3 for the measure), the Katz form char(X\_∞^χ) = (L\_𝔭^χ) of the main conjecture in one and two variables (Katz-measure form of the main conjecture), the anticyclotomic θ-component statement used by Castella–Grossi–Lee–Skinner, including branches tamely ramified at p and the λ-equality λ(𝔛\_θ) = λ(L\_θ) (Anticyclotomic θ-component main conjecture), and the functional equation giving λ(L\_ψ) = λ(L\_φ) for ψ = φ^{-1}ω. Consumer: RankZeroOneBSD BSD.7a.

**Depends on:** AutomorphicPadicLFunctions:L3, AutomorphicPadicLFunctions:L3h, CMAllPrimeMainConjectures:CZ.0, CMAllPrimeMainConjectures:CZ.2, ColemanPowerSeries:L1, ColemanPowerSeries:L2, PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L4, SelmerIwasawaCohomology:L2, SelmerIwasawaCohomology:L3.

### CZ.3/two-variable-coleman-map — The two-variable Coleman map at a split prime

*Construction · planet: Two-variable Coleman map.* Let p = 𝔭𝔭̄ split in K, under Rubin's hypotheses (p ∤ #μ(H)), with K₀ ⊃ H abelian over K, p ∤ \[K₀ : K\], and K\_∞ ⊃ K₀ abelian over K with Gal(K\_∞/K₀) ≅ Z\_p², as in rubin-iwasawa-modules. Let Ô be the ring of integers of the completion of the maximal unramified extension of K\_𝔭 = Q\_p and F the relative Lubin–Tate formal group over Ô attached to the CM curve at 𝔭 (height one). The two-variable Coleman map is the Λ-linear map Col: U\_∞ → Λ\_Ô = Ô\[\[G\]\] obtained by interpolating norm-compatible local units by Coleman power series for F, taking the logarithmic derivative, and Mellin-transforming the resulting measure on the Tate module of F; it is injective on each χ-part with pseudo-null (indeed explicitly computable) cokernel, so char(U\_∞^χ/C̄\_∞^χ) = char(Λ\_Ô^χ/Col(C̄\_∞^χ)) after extending scalars to Ô.

**Hypotheses.**
- p splits in K and p ∤ #μ(H); the construction is local at 𝔭 and uses the CM formal group of height one.
- Scalars are extended to Ô, faithfully flat over Z\_p, so characteristic ideals can be compared after extension.

**Proof route.**
1. Coleman's interpolation of norm-compatible units by power series, for the height-one relative Lubin–Tate group F of the CM curve at 𝔭 (the cyclotomic case is ColemanPowerSeries L1; the relative height-one version over Ô is requested there).
2. The operator (1 − φ/p)·dlog turns the Coleman series into a measure on Z\_p^× ≅ T\_𝔭F-units, and descending along the 𝔭̄-direction of the tower gives a measure on G.
3. Identify kernel and cokernel on χ-parts: they are controlled by the torsion of F over the tower and by the roots of unity, which are pseudo-null for the two-variable algebra under Rubin's hypotheses.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TwoVariableColeman.col` | constructor | Col: U\_∞ → Ô\[\[G\]\], Λ-linear. |
| `TwoVariableColeman.col_injective_chi` | other | Injectivity on each χ-part with pseudo-null cokernel. |
| `TwoVariableColeman.char_eq` | characterisation | char(U\_∞^χ/C̄\_∞^χ) ⊗ Ô = char(Ô\[\[G\]\]^χ/Col(C̄\_∞^χ)). |
| `TwoVariableColeman.restrict` | functoriality | Compatibility with restriction to a Z\_p-subextension (one-variable Coleman maps), in particular the anticyclotomic one. |
| `TwoVariableColeman.cyclotomic_compat` | compatibility | Agreement in shape with the cyclotomic Coleman map of ColemanPowerSeries L2 (height-one Lubin–Tate versus Ĝ\_m). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TwoVariableColeman.col_cyclotomic_unit` | compatibility | Over the cyclotomic one-variable tower of Q\_p the construction specializes to the Coleman map of ColemanPowerSeries L2 on cyclotomic units. |
| `TwoVariableColeman.col_trivial_unit` | degenerate | Col sends the constant norm-compatible unit system (1)\_n to 0. |
| `TwoVariableColeman.not_inert` | non-example | For p inert in K the local units U\_∞ have Λ-rank two (the height-two case of AnticyclotomicLocalUnits) and no injective Λ-linear map into Λ exists. |
| `TwoVariableColeman.char_compare` | characterisation | char(U\_∞^χ/C̄\_∞^χ) and char(Λ^χ/Col(C̄\_∞^χ)) agree after extension of scalars to Ô. |

**Uses.** Rubin, Remark (1) after Theorem 4.1, p. 37: translation of the units form of the main conjecture into the p-adic L-function form; Castella–Grossi–Lee–Skinner Theorem 1.2.2, p. 8: the anticyclotomic θ-component as an ideal generated by a Katz projection.

**Acceptance.**
- For the one-variable cyclotomic analogue over Q\_p this is ColemanPowerSeries L2's Coleman map, with the same sign convention to be fixed.

**Prerequisites:** CZ.2/rubin-iwasawa-modules, ColemanPowerSeries:L1, ColemanPowerSeries:L2, PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L4/pseudo-null.

**Sources:** rubin-1991-invent, Remark (1) after Theorem 4.1, p. 37: When p splits, char(U\_∞/C̄\_∞) is generated by a p-adic L-function; proved by Coates–Wiles in one variable and Yager in two variables, in general by de Shalit, through the Coleman map.; castella-grossi-lee-skinner-2022, Proof of Theorem 1.2.2, p. 8: Uses Rubin's identification of the characteristic ideal of the θ-part with an anticyclotomic projection of Katz's p-adic L-function.

### CZ.3/elliptic-units-to-katz-measure — Elliptic units map to Katz's two-variable measure

*Theorem.* In the setting of two-variable-coleman-map, Col(C̄\_∞) is the Λ\_Ô-submodule generated by Katz's two-variable p-adic L-function (measure) μ\_𝔭 on G, restricted to its χ-parts and with the Euler factors at the primes of the conductor removed as in Rubin's definition of 𝒞; consequently char(U\_∞^χ/C̄\_∞^χ) = (L\_𝔭^χ), the χ-part of Katz's measure, as ideals of Λ\_Ô^χ.

**Hypotheses.**
- p splits; Katz's measure is the one constructed for the p-ordinary CM type determined by 𝔭 (AutomorphicPadicLFunctions L3).

**Proof route.**
1. Evaluate Col on the elliptic-unit system: by the explicit reciprocity law (cm-elliptic-reciprocity, Kato Prop. 15.9, or Coates–Wiles for r = 1), the moments of Col(a z) at characters ψ of infinity type (−r, 0), r ≥ 1, are the values L\_{pf}(ψ̄, χ, r) with explicit periods and Euler factors.
2. Katz's measure has the same interpolation property on a Zariski-dense set of characters (AutomorphicPadicLFunctions L3), so the two measures agree up to the auxiliary factor N(a) − σ\_a, which is removed as in elliptic-unit-module.
3. The identification is due to Yager in two variables and to de Shalit in general; those sources were not read for this design (gap).

**Acceptance.**
- Specializing at a finite-order character of large conductor recovers Kronecker's limit formula's L-value through the p-adic Kronecker limit formula (the trivial-type case r = 0 is outside the interpolation range and is not claimed).

**Prerequisites:** CZ.3/two-variable-coleman-map, CZ.0/elliptic-unit-module, AutomorphicPadicLFunctions:L3.

**Sources:** rubin-1991-invent, Remark (1) after Theorem 4.1, p. 37: Attributes the identification of char(U\_∞/C̄\_∞) with a p-adic L-function to Coates–Wiles, Yager and de Shalit.; castella-grossi-lee-skinner-2022, Proof of Theorem 1.2.2, p. 8: Uses the identification for the anticyclotomic projection.; kato-2004-asterisque-295, Prop. 15.9, p. 258: The explicit reciprocity law that computes the moments of the elliptic units for every r ≥ 1 and every p.

### CZ.3/katz-form-main-conjecture — The Katz-measure form of the main conjecture at split primes

*Theorem · planet: Katz-measure form of the main conjecture.* Let p = 𝔭𝔭̄ split in K under Rubin's hypotheses, K\_∞ ⊃ K₀ with Gal(K\_∞/K₀) ≅ Z\_p or Z\_p². For every irreducible χ of Δ, char(X\_∞^χ) = (L\_𝔭^χ) as ideals of Λ\_Ô^χ, where X\_∞ is the Galois group of the maximal abelian pro-p extension of K\_∞ unramified outside the primes above 𝔭 and L\_𝔭 the (projection of the) Katz measure; for a Z\_p-extension K\_∞ (one-variable case, in particular the anticyclotomic one) L\_𝔭 is the image of the two-variable measure.

**Hypotheses.**
- Integral equality; Rubin's hypotheses p ∤ #μ(H), p ∤ \[K₀ : K\].

**Proof route.**
1. classical-two-variable-main-conjecture (i): char(X\_∞) = char(U\_∞/C̄\_∞).
2. elliptic-units-to-katz-measure: char(U\_∞^χ/C̄\_∞^χ) = (L\_𝔭^χ).
3. For one-variable K\_∞ apply Rubin's Theorem 4.1 directly with Γ ≅ Z\_p, or descend from two variables using that both sides commute with the projection (Rubin §5 tools).

**Acceptance.**
- For K = Q(i), p = 5, the trivial character of Δ ≅ Z/4 is excluded from no statement: the result holds for every χ.

**Prerequisites:** CZ.2/classical-two-variable-main-conjecture, CZ.3/elliptic-units-to-katz-measure, CZ.2/rubin-iwasawa-modules.

**Sources:** rubin-1991-invent, Theorem 4.1(i) and Remark (1), p. 37: Equality char(X\_∞) = char(U\_∞/C̄\_∞) for split p and its connection with the p-adic L-function.; castella-grossi-lee-skinner-2022, Proof of Theorem 1.2.2, p. 8: The anticyclotomic case used there.

### CZ.3/anticyclotomic-theta-main-conjecture — Anticyclotomic θ-components and the λ-invariant equality

*Theorem · planet: Anticyclotomic θ-component main conjecture.* Let p > 2 split in K as v v̄, K\_∞ the anticyclotomic Z\_p-extension, Λ = Z\_p\[\[Gal(K\_∞/K)\]\] (scalars extended as needed), and θ: G\_K → F\_p^× a character (lifted by Teichmüller to Z\_p^×) whose conductor is divisible only by primes split in K, with θ|\_{G\_v̄} ≠ 1, ω. Let K\_θ be its fixed field, Δ\_θ = Gal(K\_θ/K), M\_θ = Z\_p(θ) ⊗ Λ^∨, Σ a finite set of places containing ∞, the primes above p and the conductor of θ, all finite ones split, and 𝔛\_∞ = Gal(M\_∞/K\_∞K\_θ) for M\_∞ the maximal abelian pro-p extension of K\_∞K\_θ unramified outside v. Restriction gives H^1(K^Σ/K, M\_θ) ≅ H^1(K^Σ/K\_θ, M\_θ)^{Δ\_θ} ≅ Hom\_cts((𝔛^Σ\_∞)^θ, Q\_p/Z\_p), 𝔛^Σ\_∞ the Σ-ramified Galois group; imposing the Greenberg local conditions (unramified away from p, relaxed at v, strict at v̄) gives H^1\_{F\_Gr}(K, M\_θ) ≅ Hom\_cts(𝔛\_∞^θ, Q\_p/Z\_p). Then char\_Λ(𝔛\_∞^θ) = (L\_θ), the θ-branch anticyclotomic projection of Katz's measure; in particular 𝔛\_∞^θ is torsion and λ(𝔛\_θ) = λ(L\_θ). For a branch tamely ramified at p, L\_θ means the projection of Katz's measure on Gal(K(𝔠p^∞)/K) along the branch character (the convention of PAPER-CASTELLA-ETAL-22/E3, not stated in Castella–Grossi–Lee–Skinner).

**Hypotheses.**
- p > 2 split in K; p never divides #O\_K^× then, since 3 ramifies in Q(√−3).
- θ has order prime to p, conductor supported on split primes, and θ|\_{G\_v̄} ≠ 1, ω (Castella–Grossi–Lee–Skinner's hypothesis in Theorem 1.2.2).
- μ = 0 for L\_θ is Hida's theorem, owned by AutomorphicPadicLFunctions L3h; it is not needed for the λ-equality but is part of Theorem 1.2.2.

**Proof route.**
1. Restriction to K\_θ is an isomorphism onto Δ\_θ-invariants since p ∤ #Δ\_θ, and Shapiro's lemma identifies H^1(K^Σ/K\_θ, M\_θ)^{Δ\_θ} with the dual of the θ-part of the Σ-ramified Galois group (Castella–Grossi–Lee–Skinner (1.4), where the Δ\_θ-invariants are omitted; PAPER-CASTELLA-ETAL-22/E16). The Greenberg local conditions cut out the Selmer group, which corresponds to the quotient 𝔛\_∞^θ ramified only at v (their Proposition 1.1.3 and the unramified-condition comparison).
2. Apply katz-form-main-conjecture to the one-variable anticyclotomic tower over K₀ = K\_θ·H. Rubin's hypothesis p ∤ \[K₀ : K\] holds when p ∤ h\_K (θ has order prime to p); when p | h\_K it fails and the input is the recorded gap 'Split-prime Katz form when p divides the class number'.
3. For a branch θ tamely ramified at p, define L\_θ as the projection of Katz's measure on the ray tower of conductor 𝔠p^∞ along θ, as PAPER-CASTELLA-ETAL-22/E3 requires; the main conjecture is then a statement about that element.
4. λ-equality: characteristic ideals generate the same principal ideal, so their λ-invariants agree.

**Acceptance.**
- Consumer: RankZeroOneBSD BSD.7a (Castella–Grossi–Lee–Skinner Theorem 2.2.3, which uses λ(L\_φ) = λ(𝔛\_φ) and λ(L\_ψ) = λ(𝔛\_ψ) for ψ = φ^{-1}ω).

**Prerequisites:** CZ.3/katz-form-main-conjecture, SelmerIwasawaCohomology:L3/local-cofree-euler, SelmerIwasawaCohomology:L2/greenberg-condition, AutomorphicPadicLFunctions:L3, AutomorphicPadicLFunctions:L3h.

**Sources:** castella-grossi-lee-skinner-2022, Definition 1.2.1, Theorem 1.2.2 with proof and Remark 1.2.3, pp. 7–8: Defines the Greenberg Selmer group of θ, identifies it with the dual of the θ-part of the v-ramified Galois group over K\_∞K\_θ, and deduces torsion with μ = 0 from Rubin's main conjecture and Hida's μ-theorem.; castella-grossi-lee-skinner-2022, Proof of Theorem 2.2.3, p. 15: Uses Rubin's main conjecture for the equalities λ(L\_φ) = λ(X\_φ) and λ(L\_ψ) = λ(X\_ψ).

### CZ.3/katz-functional-equation-lambda — Functional equation of the anticyclotomic Katz projections and λ(L\_ψ) = λ(L\_φ)

*Theorem.* In the setting of anticyclotomic-theta-main-conjecture, the λ-invariants of the anticyclotomic Katz projections along θ and along θ^{-1}ω agree: λ(L\_θ) = λ(L\_{θ^{-1}ω}). In particular, for ψ = φ^{-1}ω, λ(L\_ψ) = λ(L\_φ). Only the λ-invariants are asserted; the precise relation between the two projections is the functional equation of Katz's measure, which is requested from AutomorphicPadicLFunctions L3.

**Hypotheses.**
- θ and θ^{-1}ω both satisfy the hypotheses of the anticyclotomic node, or the tamely ramified branch convention of PAPER-CASTELLA-ETAL-22/E3 is used for the one that is ramified at p.

**Proof route.**
1. The functional equation of Katz's two-variable measure relates the measure at a character and at its dual twisted by the norm, which on the anticyclotomic line is θ ↦ θ^{-1}ω composed with the inversion of the anticyclotomic variable (request to AutomorphicPadicLFunctions L3; Castella–Grossi–Lee–Skinner cite Kriz 2016, Theorem 27).
2. The involution of Λ induced by γ ↦ γ^{-1} preserves λ-invariants, as Castella–Grossi–Lee–Skinner note; whatever unit or Euler factors the functional equation introduces must be checked to have λ-invariant zero when the supplier states it.

**Acceptance.**
- Applied in Castella–Grossi–Lee–Skinner (2.11), p. 15.

**Prerequisites:** CZ.3/anticyclotomic-theta-main-conjecture, AutomorphicPadicLFunctions:L3.

**Sources:** castella-grossi-lee-skinner-2022, Proof of Theorem 2.2.2, (2.11), p. 15: Since ψ = φ^{-1}ω, the functional equation of Katz's p-adic L-function gives λ(L\_ψ) = λ(L\_φ).

## CZ.4. The rational equivariant main conjecture

At every height-one prime q of Z\_p\[\[G\_{p∞f}\]\] with p ∉ q, length((h¹/z)\_q) = length((H²\_{pf})\_q) = length(h²\_q) + Σ\_{𝔩|f,𝔩∤p} length(Z\_p\[\[G/D\_𝔩\]\]\_q) (Johnson-Leung–Kings §7.2) (Equality at regular height-one primes). Burungale–Tian Theorem 2.1 in corrected form: ξ((h¹/z)\_Q) = ξ(h²\_Q)·∏\_{𝔩|f,𝔩∤p} ξ(Z\_p\[\[G/D\_𝔩\]\]\_Q) over Z\_p\[\[G\_{p∞f}\]\]\[1/p\], equivalently ξ((h¹/z)\_Q) = ξ((H²\_{pf})\_Q), for every prime p (Rational equivariant main conjecture). The printed form holds when every prime of f lies above p and on components ramified at every 𝔩 | f prime to p; it fails on the trivial component otherwise (PAPER-BURUNGALE-TIAN-26/E1). These are rational, not integral, equalities.

**Depends on:** CMAllPrimeMainConjectures:CZ.0, CMAllPrimeMainConjectures:CZ.2.

### CZ.4/regular-prime-equality — The equivariant main conjecture at regular height-one primes

*Theorem · planet: Equality at regular height-one primes.* For K imaginary quadratic, every prime p and nonzero f, with R = Z\_p\[\[G\_{p∞f}\]\], R\_O = R ⊗ O and H^2\_{pf} = lim\_{K'} H^2(O\_{K'}\[1/pf\], Z\_p(1)): at every height-one prime q of R with p ∉ q, length\_{R\_q}((h¹/z)\_q) = length\_{R\_q}((H^2\_{pf})\_q) = length\_{R\_q}(h²\_q) + Σ\_{𝔩|f, 𝔩∤p} length\_{R\_q}(Z\_p\[\[G/D\_𝔩\]\]\_q). In particular length(h²\_q) = length((h¹/z)\_q) whenever q lies on a component on which the inertia group of every such 𝔩 acts nontrivially.

**Hypotheses.**
- Every prime p, including 2 and 3 and primes dividing #Δ\_f.
- Only regular primes (p ∉ q); Johnson-Leung–Kings' singular-prime argument (§7.3) needs a μ-invariant hypothesis that is not assumed and is not needed here.

**Proof route.**
1. Extend scalars to O containing the values of the characters of Δ (Johnson-Leung–Kings Lemma 7.1; faithfully flat).
2. At a regular q, (R\_O)\_q ≅ ∏\_χ Λ(χ)\_q (Lemma 7.6) and RΓ(O\_K\[1/pf\], Ω\_O(1))\_q ≅ ∏\_χ RΓ(O\_K\[1/pf\], Λ(χ)(1))\_q.
3. Lemma 7.7: under this decomposition J\_Ω(ζ(f))\_q corresponds to ∏\_χ J\_Λ(ζ(χ, f))\_q, the χ-projection of a ζ(f) being ∏\_{𝔩|f,𝔩∤p}(1 − χ(𝔩)Frob\_𝔩^{-1})·a ζ(χ) by the distribution relation.
4. lambda-main-conjecture-euler-factors on each factor gives Det(H^1/Jζ(f))\_q ≅ Det(H^2\_{pf})\_q, i.e. length((h¹/z)\_q) = length((H^2\_{pf})\_q) (using tower-kummer-identification and that z\_q = R\_q z\_{p∞f}).
5. h2-euler-comparison and class-module-h2-comparison convert H^2\_{pf} into h² plus the Euler terms Z\_p\[\[G/D\_𝔩\]\].

**Acceptance.**
- If every prime factor of f lies above p, the Euler sum is empty and length(h²\_q) = length((h¹/z)\_q) at every regular q.

**Prerequisites:** CZ.2/lambda-main-conjecture-euler-factors, CZ.2/lambda-main-conjecture, CZ.0/h2-euler-comparison, CZ.0/class-module-h2-comparison, CZ.0/elliptic-unit-module, CZ.0/tower-kummer-identification, CZ.0/ray-tower-iwasawa-algebra.

**Sources:** johnson-leung-kings-2011, §7.1–§7.2: Lemmas 7.1, 7.2, 7.6 and 7.7, with the argument after Lemma 7.7, pp. 34–36: Reduces the Ω-main conjecture at regular height-one primes to the Λ-main conjecture over O\_K\[1/pf\] for each character of Δ, the elliptic-unit element projecting to ζ(χ, f) with its Euler factors.; burungale-tian-2026, Proof of Theorem 2.1, p. 4: Invokes Johnson-Leung–Kings §7.2 for the equality of lengths at height-one primes not containing p.

### CZ.4/rational-equivariant-main-conjecture — The rational equivariant main conjecture (Burungale–Tian Theorem 2.1, corrected)

*Theorem · planet: Rational equivariant main conjecture (BT Theorem 2.1).* For K imaginary quadratic, every prime p and nonzero ideal f, as ideals of R\[1/p\] = Z\_p\[\[G\_{p∞f}\]\] ⊗ Q: ξ((h¹/z)\_Q) = ξ(h²\_Q)·∏\_{𝔩|f, 𝔩∤p} ξ(Z\_p\[\[G\_{p∞f}/D\_𝔩\]\]\_Q), D\_𝔩 the decomposition group of 𝔩; equivalently ξ((h¹/z)\_Q) = ξ((H^2\_{pf})\_Q). The equality ξ(h²\_Q) = ξ((h¹/z)\_Q) printed in Burungale–Tian holds when every prime factor of f lies above p, and after localization at every height-one prime on a component ramified at every 𝔩 | f with 𝔩 ∤ p.

**Hypotheses.**
- A rational, not integral, equality: no statement is made at singular primes, and no μ-invariant hypothesis enters.
- h¹/z and h² are torsion (elliptic-unit-cotorsion, tower-class-module-torsion), so the characteristic ideals are defined.

**Proof route.**
1. After inverting p every height-one prime of R\[1/p\] is regular; characteristic ideals over the normal ring R\_O\[1/p\] are determined by the lengths at these primes (ray-tower-iwasawa-algebra).
2. Apply regular-prime-equality at each height-one prime.
3. Corrected form: the Euler terms are torsion of codimension one and contribute exactly ξ(Z\_p\[\[G/D\_𝔩\]\]\_Q); they are units after localizing on components where I\_𝔩 acts nontrivially (h2-euler-comparison).
4. Record the correction PAPER-BURUNGALE-TIAN-26/E1: as printed, Theorem 2.1 omits these factors, and Kato's quotation of Rubin (15.2(2)) has the same imprecision; the paper's use of it in Theorem 2.6, on ψ-components with f the conductor of ψ, is unaffected.

**Acceptance.**
- Trivial-character test: for f with a prime 𝔩 ∤ p, the factor 1 − Frob\_𝔩^{-1} is a non-unit of R\[1/p\] on the trivial component, so the printed equality fails there.
- On the ψ-components used for Theorem 2.6 (f the conductor of ψ, so every 𝔩 | f is ramified for ψ), the printed equality holds.

**Prerequisites:** CZ.4/regular-prime-equality, CZ.0/elliptic-unit-cotorsion, CZ.0/tower-class-module-torsion, CZ.0/h2-euler-comparison, CZ.0/ray-tower-iwasawa-algebra.

**Sources:** burungale-tian-2026, Theorem 2.1 and its proof, p. 4; footnote 3: States ξ(h²\_Q) = ξ((h¹/z)\_Q) over Z\_p\[\[G\_{p∞f}\]\] ⊗ Q and proves it from Johnson-Leung–Kings §7.2; the footnote asserts the formulation is identical with theirs.; kato-2004-asterisque-295, Theorem 15.2(2) and (15.6), pp. 251 and 255: Rubin's equality as quoted by Kato, and its reformulation with ℓ¹\_𝔭 and ℓ²\_𝔭.; johnson-leung-kings-2011, Lemma 7.7, pp. 35–36: The projection of the elliptic-unit element of modulus fp^n carries the Euler factors 1 − χ(𝔩)Frob\_𝔩^{-1}.

### CZ.4/printed-equivariant-form-range — Where the printed form of Theorem 2.1 holds, and a counterexample component

*Application.* (a) If every prime factor of f lies above p, ξ(h²\_Q) = ξ((h¹/z)\_Q). (b) For any f, after localizing at a height-one prime of R\[1/p\] whose component is the χ-component of a character χ of Δ\_f ramified at every 𝔩 | f with 𝔩 ∤ p, length(h²\_q) = length((h¹/z)\_q). (c) If f has a prime factor 𝔩 ∤ p, then on the trivial-character component ξ(h²\_Q) and ξ((h¹/z)\_Q) differ by the non-unit factor ξ(Z\_p\[\[G/D\_𝔩\]\]\_Q), generated there by 1 − Frob\_𝔩^{-1}.

**Hypotheses.**
- Notation of rational-equivariant-main-conjecture.

**Proof route.**
1. (a) and (b) are immediate from the corrected equality, since the Euler terms vanish or become units.
2. (c): on the trivial-character component Z\_p\[\[G/D\_𝔩\]\]\_Q is the cyclic module R\_Q/(1 − Frob\_𝔩^{-1}) up to the decomposition, and Frob\_𝔩 has infinite order in G/I\_𝔩, so 1 − Frob\_𝔩^{-1} is a nonzero non-unit.

**Acceptance.**
- Example for (c): K = Q(i), p = 5, f = (3) (3 is inert in Q(i), so 𝔩 = (3) ∤ 5); the trivial component of Z\_5\[\[G\_{5∞·3}\]\] ⊗ Q sees the factor 1 − Frob\_{(3)}^{-1}.
- Example for (a): K = Q(i), p = 2, f = (1+i)^3: every prime of f lies above 2.

**Prerequisites:** CZ.4/rational-equivariant-main-conjecture, CZ.0/h2-euler-comparison.

**Sources:** burungale-tian-2026, Theorem 2.1, p. 4: The printed form, valid in the ranges (a) and (b).; johnson-leung-kings-2011, Lemma 4.3 and Corollary 5.3, pp. 20–25: The Euler factors at primes of f prime to p in the determinants.

## CZ.5. CM descent and the CM case of Kato's Theorem 12.4

The three characterizations of CM newforms (self-twist in the sense of ModularForms Layer 9, Kato's CM, θ\_ψ of type (1 − k, 0)) with N = |d\_K|N(f\_ψ) (Three characterizations of CM newforms). Kato's normalizations (15.11.2)–(15.11.3) of the induction V(f) ≅ Ind V(ψ) (the induction itself requested from CM.4). Kato's comparison map (15.12.1) (Kato's CM comparison map) and the reciprocity law (15.12.2). The twisted tower cohomology of lattices T ⊂ V(ψ). Kato's Lemma 15.13 (Kato's descent lemma) and its variant 15.14 when K ⊂ Q(μ\_{p^∞}) — exactly K = Q(√−p) with p ≡ 3 mod 4 and, for p = 2, K = Q(i) or Q(√−2) (Descent in the contained case). Kato's Lemma 14.15. Nonvanishing of cyclotomic twists of CM L-values (Kato 13.5; Rohrlich 1988 Theorem 1). The CM case of Kato's Theorem 12.4 at every prime, from elliptic units only, with no Beilinson–Kato class (CM case of Kato's Theorem 12.4), and Kato's inequality Prop. 15.17. Exports: KatoEulerSystems L4 (CM branch), CMRankZeroConverse.

**Depends on:** AnalyticNumberTheory:AN.4, AutomorphicGaloisRepresentations:R19.1, AutomorphicGaloisRepresentations:R19.3, AutomorphicLFunctionsAndLocalFactors:AL.1, CMAllPrimeMainConjectures:CZ.0, CMAllPrimeMainConjectures:CZ.1, CMAllPrimeMainConjectures:CZ.2, ComplexMultiplicationAndExplicitReciprocity:CM.4, PadicMeasuresIwasawaAlgebras:L4, SelmerIwasawaCohomology:L3, SelmerIwasawaCohomology:L4, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters, tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions, tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer.

### CZ.5/cm-newform-characterization — Three characterizations of CM newforms

*Theorem · planet: Three characterizations of CM newforms.* Let f ∈ S\_k(Γ₁(N)) be a normalized newform, k ≥ 2. The following are equivalent: (a) f has a nontrivial self-twist in the sense of Tau Ceti ModularForms Layer 9 (f is the primitive form of f ⊗ χ for some Dirichlet character χ ≠ 1); (b) f has CM in Kato's sense: there are an imaginary quadratic K and a continuous Hecke character ψ of K with L(f, s) = L(ψ, s); (c) f is the newform θ\_ψ attached to an algebraic Hecke character ψ of an imaginary quadratic K of infinity type (1 − k, 0). In that case χ = ε\_K is the quadratic character of K, ψ in (b) may be replaced by ψ∘c to have type (1 − k, 0), the conductor f\_ψ satisfies N = |d\_K|·N(f\_ψ), the nebentypus is determined by ψ and ε\_K, and the Hecke field F is contained in L = K(ψ(K̂^×)).

**Hypotheses.**
- Normalized newform of weight k ≥ 2 and level N; the self-twist predicate is the one of ModularForms Layer 9, not a second definition.
- Burungale–Tian's proofs need only the direction from ψ to f; the equivalence is the interface with Kato §15 and with the non-CM branch of Kato 12.8.

**Proof route.**
1. (c) ⇒ (b): the L-function of the theta series of ψ is L(ψ, s) (Hecke), with level |d\_K|N(f\_ψ). The level formula and the nebentypus are the classical theta-series computation; they are not stated in the cited places of Kato or Burungale–Tian, and their source (Hecke, Shimura) was not read here.
2. (b) ⇒ (a): comparing Euler factors, a\_ℓ(f) = 0 for ℓ inert in K, so f and f ⊗ ε\_K have the same Hecke eigenvalues away from the level and the same primitive form (strong multiplicity one, ModularForms Layer 5 via Layer 9).
3. (a) ⇒ (c): Ribet's theorem (Kato's \[Ri2\]): a nontrivial self-twist χ is quadratic, cuts out an imaginary quadratic K, and V(f) ⊗ χ ≅ V(f) makes V(f) induced from a character of G\_K, which is algebraic of type (1 − k, 0) by Hodge–Tate weights; its L-function is L(f, s). Ribet's LNM 601 was not read for this design (gap).
4. The conductor and Hecke-field statements follow from (c) and the formula for the level of a theta series.

**Acceptance.**
- The newform 32.2.a.a (y² = x³ − x) has CM by Q(i): ψ of conductor (1+i)^3, |d\_K| N(f\_ψ) = 4·8 = 32.
- The newform 27.2.a.a has CM by Q(√−3): ψ of conductor (3) = (√−3)², and |d\_K|·N(f\_ψ) = 3·9 = 27.
- 11.2.a.a has no CM: a CM form of level 11 would need |d\_K| dividing 11, so K = Q(√−11); 2 is inert in Q(√−11) since −11 ≡ 5 mod 8, but a\_2 = −2 ≠ 0.

**Prerequisites:** tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer, tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions, ComplexMultiplicationAndExplicitReciprocity:CM.4, AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, AutomorphicGaloisRepresentations:R19.3/classical-newform-irreducibility, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic, AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function.

**Sources:** burungale-tian-2026, §2.2.5, p. 5: For a CM newform of weight k, L(s, f) = L(s, ψ) for a Hecke character of the CM field of type (1 − k, 0).; kato-2004-asterisque-295, Remark 12.8, p. 223, and 15.10, p. 260: Kato's definition of CM (equality with the L-function of a Hecke character of an imaginary quadratic field), and for CM f a character ψ of type (1 − k, 0) whose conductor divides N, with F ⊂ L and V\_{L\_λ}(f) induced from V\_{L\_λ}(ψ) by comparing Frobenius polynomials, citing Ribet. The level formula N = |d\_K|N(f\_ψ) is not stated there.

### CZ.5/cm-induction-normalization — Kato's Galois normalization of the CM induction (Lemma 15.11(1))

*Comparison.* Let f be a CM newform attached to ψ of type (1 − k, 0) and conductor f\_ψ, L = K(ψ(K̂^×)), r = k − 1. Assume the Galois isomorphism V\_{L\_λ}(f) ≅ Ind\_{G\_K}^{G\_Q} V\_{L\_λ}(ψ) (Kato 15.10, requested from ComplexMultiplicationAndExplicitReciprocity CM.4) and fix an L-isomorphism (15.11.1) S(ψ) ≅ S(f) ⊗\_F L. Then for each finite λ there is a unique G\_Q-isomorphism (15.11.2) V\_{L\_λ}(f) ≅ Ind V\_{L\_λ}(ψ) =: V~\_{L\_λ}(ψ) such that the composite S(ψ) ⊗ L\_λ ≅ D^r\_dR(V\_{L\_λ}(ψ)) ≅ D^r\_dR(V\_{L\_λ}(f)) ≅ S(f) ⊗ L\_λ is induced by (15.11.1). This is the identification of Galois modules used throughout; the archimedean normalization (15.11.3) is CZ.6/cm-period-normalization and is never used as a Galois identification.

**Hypotheses.**
- The underlying induction isomorphism exists (CM.4 request); uniqueness uses irreducibility of V~(ψ) over L\_λ.

**Proof route.**
1. Any G\_Q-isomorphism h induces an isomorphism S(ψ) ⊗ L\_λ ≅ S(f) ⊗ L\_λ of one-dimensional spaces, equal to c times (15.11.1) for some c ∈ L\_λ^×; take c^{-1}h.
2. Uniqueness: an automorphism of the irreducible representation V~\_{L\_λ}(ψ) is a scalar, and the de Rham condition fixes the scalar.

**Acceptance.**
- For k = 2 and f attached to a CM elliptic curve over Q the isomorphism comes from the curve itself (ComplexMultiplicationAndExplicitReciprocity CM.4/cm-induction-comparison).

**Prerequisites:** CZ.1/cm-hecke-realization, ComplexMultiplicationAndExplicitReciprocity:CM.4, ComplexMultiplicationAndExplicitReciprocity:CM.4/cm-induction-comparison, AutomorphicGaloisRepresentations:R19.3/classical-newform-irreducibility, SelmerIwasawaCohomology:L4/period-realization.

**Sources:** kato-2004-asterisque-295, 15.10 and Lemma 15.11(1) with proof, pp. 260–261: The induction V\_{L\_λ}(f) ≅ Ind V\_{L\_λ}(ψ) with its explicit action, and its unique normalization (15.11.2) compatible with (15.8.1) and a fixed (15.11.1).; kato-2004-asterisque-295, Paragraph after Lemma 15.11, p. 262: In the rest of §15, S(ψ) and S(f) ⊗ L are identified by (15.11.1) and the Galois representations by (15.11.2).

### CZ.5/cm-twist-nonvanishing — Nonvanishing of cyclotomic twists of CM L-values (Kato 13.5 for CM forms)

*Theorem.* Let f be a normalized newform of weight k ≥ 2 (in particular a CM newform, L(f, χ, s) = L(ψ·(χ∘N\_{K/Q}), s)). (1) L(f, χ, s) has no zero in Re(s) ≥ (k + 1)/2 for every Dirichlet character χ. (2) (Rohrlich) If k is even and P is a finite set of primes, then L(f, χ, k/2) ≠ 0 for all but finitely many primitive Dirichlet characters χ unramified outside P and ∞; the same holds for the S-imprimitive values L\_S(f, χ, k/2) with S finite. Consequently, for each height-zero prime of O\_λ\[\[G\_∞\]\] (a sign and a branch character), infinitely many finite-order characters χ in that component have L\_S(f\*, χ, k − 1) = L\_S(ψ̄, χ∘N\_{K/Q}, k − 1) ≠ 0.

**Hypotheses.**
- For k ≥ 3, s = k − 1 lies in Re(s) ≥ (k + 1)/2 and (1) suffices; for k = 2, s = 1 = k/2 is central and (2) is needed.
- Rohrlich's Theorem 1 is for any newform of even weight k, any character and level; the proof combines his 1984 method with Jacquet–Langlands' twisted root numbers and was not decomposed here (gap).

**Proof route.**
1. (1): Kato states Jacquet–Shalika for L(f, s); the twist f ⊗ χ is a cusp form of weight k whose newform differs from it by finitely many Euler factors, nonvanishing in Re(s) ≥ (k+1)/2, so the statement holds for L(f, χ, s). For a CM form, L(f, χ, s) is a Hecke L-function of K and nonvanishing on the edge is Hecke's theorem; the finite-order case is AnalyticNumberTheory AN.4/hecke-nonvanishing-on-line-one and the unitary infinite-order case is requested from AN.4.
2. (2): Rohrlich 1988, Theorem 1.
3. For the components: a height-zero prime of O\_λ\[\[G\_∞\]\] fixes the restriction to the torsion part and the sign; within it the characters of p-power conductor are infinite in number, and by (1) or (2) all but finitely many have nonvanishing value at s = k − 1.

**Acceptance.**
- For f = 32.2.a.a and p = 2, infinitely many even (resp. odd) characters of 2-power conductor have L(f, χ, 1) ≠ 0.

**Prerequisites:** AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one, AnalyticNumberTheory:AN.4, AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation, tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions, CZ.5/cm-newform-characterization.

**Sources:** kato-2004-asterisque-295, Theorem 13.5, pp. 226–227: (1) no zero on Re(s) ≥ (k+1)/2 (Jacquet–Shalika); (2) for even k and finite S, finitely many characters with conductor in S have L\_S(f, χ, k/2) = 0 (Rohrlich \[Ro2\]).; rohrlich-1988-math-ann, Theorem 1, p. 611: For even k and a normalized newform of any character and level, L(k/2, f, χ) ≠ 0 for all but finitely many primitive Dirichlet characters unramified outside a fixed finite set of primes.; kato-2004-asterisque-295, 15.15, p. 265: Uses 13.5 with (15.12.2) to see that the elliptic-unit class is nonzero at each height-zero prime.

### CZ.5/cm-comparison-map — Kato's CM comparison map (15.12.1)

*Construction · planet: Kato's CM comparison map.* For a finite place λ of L, the O\_λ\[\[G\_{p∞f}\]\]-linear map (15.12.1) H^1\_{p∞f}(V\_{L\_λ}(ψ)) → H^1(V\_{L\_λ}(f)) defined as follows: by Shapiro and (15.11.2), H^1(V\_{L\_λ}(f)) = H^1(V~\_{L\_λ}(ψ)) = lim\_n H^1(O\_K ⊗ Z\[ζ\_{p^n}, 1/p\], T) ⊗ Q for any Gal(Q̄/K)-stable O\_λ-lattice T of V\_{L\_λ}(ψ); and the inclusions K ⊗ Q(ζ\_{p^n}) ⊂ K(p^n f) give corestriction maps from the ray tower to the cyclotomic tower over K. Module structures are compatible through the restriction O\_λ\[\[G\_{p∞f}\]\] → O\_λ\[\[G\_∞\]\] (or O\_λ\[\[G′\_∞\]\] when K ⊂ Q(μ\_{p^∞})).

**Hypotheses.**
- f is a CM newform attached to ψ with f ⊂ cond(ψ) (one takes f = cond(ψ) for the main theorem).
- H^1(V(f)) is Kato's cyclotomic Iwasawa cohomology of V\_{F\_λ}(f) ⊗ L\_λ with the j\_\* convention.

**Proof route.**
1. Shapiro's lemma identifies the cohomology of the induced representation over Q with that of V(ψ) over K, layer by layer along Q(ζ\_{p^n}).
2. Corestriction from K(p^n f) to K(ζ\_{p^n}) (the compositum K·Q(ζ\_{p^n}) is inside K(p^n f)) gives the map on each layer; compatibility with the transition maps gives the limit.
3. The identification of coefficients uses (15.11.2) only (cm-induction-normalization).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `cmComparison` | constructor | The O\_λ\[\[G\_{p∞f}\]\]-linear map H^1\_{p∞f}(V\_{L\_λ}(ψ)) → H^1(V\_{L\_λ}(f)). |
| `cmComparison.semilinear` | compatibility | Linear over O\_λ\[\[G\_{p∞f}\]\] → O\_λ\[\[G\_∞\]\] (resp. → O\_λ\[\[G′\_∞\]\] in the contained case). |
| `cmComparison.specialize` | relation | At a finite level n it is the corestriction from K(p^n f) to K(ζ\_{p^n}) followed by Shapiro. |
| `cmComparison.lattice` | functoriality | Integral version for lattices T ⊂ V(ψ) and T~ = Ind T, compatible with the rational one. |
| `cmComparison.uses_15_11_2` | other | Defined through the Galois identification (15.11.2) only. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `cmComparison.finite_level` | computation | At level n = 0 and K ⊄ Q(μ\_{p^∞}) the map is corestriction from K(f) to K followed by Shapiro to Q. |
| `cmComparison.zero_of_zero` | degenerate | The map sends 0 to 0 and commutes with the twist by finite-order characters of G\_∞ pulled back to G\_{p∞f}. |
| `cmComparison.contained_case` | compatibility | When K ⊂ Q(μ\_{p^∞}) the target module is H^1(T) ⊗\_{O\_λ\[\[G′\_∞\]\]} O\_λ\[\[G\_∞\]\] (Kato 15.14), and the map is linear over O\_λ\[\[G\_{p∞f}\]\] → O\_λ\[\[G′\_∞\]\]. |
| `cmComparison.not_via_15_11_3` | non-example | A map defined using (15.11.3) as a Galois identification is not this map for k ≥ 3: Kato does not know that (15.11.3) is Galois-compatible. |

**Uses.** Kato (15.12.2) and (15.16.1), pp. 263 and 265: transport of z\_{p∞f} ⊗ γ to H^1(V(f)) and identification with the Beilinson–Kato element; Kato 15.15 and Prop. 15.17, p. 265: the submodule Z(ψ, T) of H^1(T~) generated by the image of z\_{p∞f} ⊗ T(−1); Burungale–Tian proof of Theorem 2.6, p. 5: the link between elliptic units and Beilinson–Kato elements.

**Acceptance.**
- Composing with the specialization at a finite-order character of G\_∞ gives the finite-level corestriction to K(ζ\_{p^n}).

**Prerequisites:** CZ.0/ray-tower-iwasawa-cohomology, CZ.5/cm-induction-normalization, CZ.1/cm-hecke-realization, SelmerIwasawaCohomology:L3/iwasawa-shapiro, CZ.0/ray-tower-iwasawa-algebra.

**Sources:** kato-2004-asterisque-295, (15.12.1), p. 263: The canonical homomorphism from H^1\_{p∞f}(V\_{L\_λ}(ψ)) to H^1(V\_{L\_λ}(f)), through H^1(V(f)) = H^1(V~(ψ)) and K ⊗ Q(ζ\_{p^∞}) ⊂ K(p^∞f).

### CZ.5/twisted-tower-cohomology — Twisting the tower cohomology to CM coefficients

*Theorem.* Let ψ have conductor f, T ⊂ V\_{L\_λ}(ψ) a stable O\_λ-lattice and χ\_T: G\_{p∞f} → O\_λ^× the character by which Gal(Q̄/K) acts on T(−1) (it factors through G\_{p∞f}). (a) There is a canonical isomorphism H^q\_{p∞f}(T) ≅ (H^q\_{p∞f}(Z\_p(1)) ⊗\_{Z\_p} O\_λ) ⊗ T(−1), semilinear for Tw: g ↦ χ\_T(g)^{±1}g with the sign fixed by Kato's σ^{-1} convention in Lemma 15.13, carrying z ⊗ O\_λ to the span of z\_{p∞f} ⊗ T(−1) at height one. (b) H^1\_{p∞f}(T) is torsion-free with localization of rank one at every height-zero prime, and H^1\_{p∞f}(V\_{L\_λ}(ψ))\_q is free of rank one over O\_λ\[\[G\_{p∞f}\]\]\_q at every height-one prime q lying over a height-zero prime of O\_λ\[\[G\_∞\]\] (the form used in Kato 15.15).

**Hypotheses.**
- T(−1) is unramified outside pf, so its action factors through G\_{p∞f}; the twist is the continuous character χ\_T.

**Proof route.**
1. The Galois module T is Z\_p(1) ⊗ T(−1) with T(−1) a character of G\_{p∞f}; the twisting isomorphism of ray-tower-iwasawa-cohomology (Johnson-Leung–Kings Lemma 4.7) gives (a).
2. The element z\_{p∞f} ⊗ T(−1) corresponds to z under (a) (Kato (15.6.4) after the twist).
3. (b) is the twist of tower-unit-module-structure (torsion-free, generic rank one) and tower-kummer-identification. At height-one primes q lying over height-zero primes of the cyclotomic algebra, p ∉ q and the localized ring is a discrete valuation ring (q regular), so a torsion-free module of rank one is free of rank one there; Kato 15.15 asserts this freeness.

**Acceptance.**
- For ψ the character of y² = x³ − x and p = 2, T = T\_2E-component, the twist χ\_T is the 2-adic character of the curve composed with the cyclotomic inverse.

**Prerequisites:** CZ.0/ray-tower-iwasawa-cohomology, CZ.0/tower-unit-module-structure, CZ.0/tower-kummer-identification, CZ.0/elliptic-unit-module, CZ.1/cm-hecke-realization.

**Sources:** kato-2004-asterisque-295, 15.15 and proof of Prop. 15.17, p. 265: Uses that H^1\_{p∞f}(V(ψ))\_q is free of rank one and the module A·(z\_{p∞f} ⊗ T(−1)).; kato-2004-asterisque-295, Proof of Lemma 15.13, p. 264: The Galois action on O\_λ\[\[G\_{p∞f}\]\] by multiplication by the image of σ^{-1}, which fixes the sign of the twist.; johnson-leung-kings-2011, Lemma 4.7, p. 22: Twisting Iwasawa cohomology by a continuous character.

### CZ.5/cm-descent-lemma — Kato's descent from the ray tower to the cyclotomic tower (Lemma 15.13)

*Theorem · planet: Kato's descent lemma.* Assume K ⊄ Q(μ\_{p^∞}). Let f be the conductor of ψ, Δ the torsion subgroup of G\_{p∞f}, λ | p, 𝔭 a prime of O\_λ\[\[G\_∞\]\] and q its inverse image under the surjection O\_λ\[\[G\_{p∞f}\]\] → O\_λ\[\[G\_∞\]\]. If 2 and #Δ are invertible in the residue field of 𝔭, then (1) O\_λ\[\[G\_∞\]\]\_𝔭 and O\_λ\[\[G\_{p∞f}\]\]\_q are regular local rings and the kernel of O\_λ\[\[G\_{p∞f}\]\]\_q → O\_λ\[\[G\_∞\]\]\_𝔭 is principal, generated by some a; (2) for every stable lattice T ⊂ V\_{L\_λ}(ψ) and T~ = Ind\_K^Q T: (15.13.1) H^2\_{p∞f}(T)\_q/a ≅ H^2(T~)\_𝔭, and (15.13.2) 0 → H^1\_{p∞f}(T)\_q/a → H^1(T~)\_𝔭 → H^2\_{p∞f}(T)\_q\[a\] → 0 is exact.

**Hypotheses.**
- K ⊄ Q(μ\_{p^∞}); 2 and #Δ invertible in the residue field at 𝔭 — automatic when p ∉ 𝔭, since that residue field has characteristic zero; this is all Burungale–Tian's rational setting secures (footnote 4), not the hypothesis K ⊄ Q(μ\_{p^∞}) (PAPER-BURUNGALE-TIAN-26/E13).
- The H^2\[a\] term is retained; specialization is not assumed exact.

**Proof route.**
1. Regularity: the residue characteristic condition makes the group rings of Δ étale at 𝔭, so both localizations are localizations of power series rings over O\_λ; the kernel of the restriction map is generated by one element because G\_{p∞f} → G\_∞ has kernel of Z\_p-rank one modulo Δ.
2. The short exact sequence 0 → T ⊗ O\_λ\[\[G\_{p∞f}\]\] →(a) T ⊗ O\_λ\[\[G\_{p∞f}\]\] → T ⊗ O\_λ\[\[G\_∞\]\] → 0, with σ acting through σ^{-1}.
3. Inertia at v ∤ p acts on T ⊗ O\_λ\[\[G\_{p∞f}\]\] through Δ, so the cokernel of the invariants is killed by #Δ; hence the j\_\*-sequences give the long exact sequence after localization at q, which splits into (15.13.1) and (15.13.2) by Shapiro (T ⊗ O\_λ\[\[G\_∞\]\] computes H^q(T~)).

**Acceptance.**
- For K = Q(√−7) and p = 5 the hypothesis K ⊄ Q(μ\_{5^∞}) holds and the lemma applies at every 𝔭 with 2#Δ invertible.

**Prerequisites:** CZ.5/twisted-tower-cohomology, CZ.5/cm-comparison-map, CZ.0/ray-tower-iwasawa-algebra, CZ.0/ray-tower-iwasawa-cohomology, PadicMeasuresIwasawaAlgebras:L4/iwasawa-algebra-regular-local, SelmerIwasawaCohomology:L3/derived-control.

**Sources:** kato-2004-asterisque-295, Lemma 15.13 and proof, p. 264: Regularity and principality of the kernel at q, and the descent isomorphism (15.13.1) and exact sequence (15.13.2), proved from the exact coefficient sequence and the inertia invariants being controlled by #Δ.; burungale-tian-2026, Proof of Theorem 2.6 and footnote 4, p. 5: Applies Lemma 15.13 in the (Λ ⊗ Q)-setting.

### CZ.5/cm-contained-descent — Descent when the CM field lies in the cyclotomic tower (Kato 15.14)

*Theorem · planet: Descent in the contained case.* Assume K ⊂ Q(μ\_{p^∞}); this happens exactly for K = Q(√−p) with p ≡ 3 mod 4, and for p = 2 with K = Q(i) or Q(√−2) (an elementary classification of the imaginary quadratic subfields of Q(μ\_{p^∞}), not stated by Kato). Put G′\_∞ = Gal(Q(μ\_{p^∞})/K) ⊂ G\_∞ and H^q(T) = lim\_n H^q(Z\[ζ\_{p^n}, 1/p\], T) for a stable lattice T ⊂ V\_{L\_λ}(ψ). Then H^q(T~) ≅ H^q(T) ⊗\_{O\_λ\[\[G′\_∞\]\]} O\_λ\[\[G\_∞\]\], and Lemma 15.13 holds with G\_∞ replaced by G′\_∞ and H^q(T~) by H^q(T): regularity, principality of the kernel a, (15.13.1) and (15.13.2).

**Hypotheses.**
- K ⊂ Q(μ\_{p^∞}); the residue-field condition on 2 and #Δ as in Lemma 15.13.
- This is the case of the congruent-number application (K = Q(i), p = 2) and of the cube-sum application (K = Q(√−3), p = 3); it is not an excluded corner case.

**Proof route.**
1. K ⊂ Q(μ\_{p^∞}) means the image of G\_{p∞f} in the cyclotomic group is the index-two subgroup G′\_∞, and Ind from K to Q of cohomology over Q(μ\_{p^n}) ⊃ K is base change along O\_λ\[\[G′\_∞\]\] → O\_λ\[\[G\_∞\]\] (Shapiro).
2. Run the proof of Lemma 15.13 with G′\_∞ in place of G\_∞.
3. Classification of the contained case: the quadratic subfields of Q(μ\_{p^∞}) are Q(√(p\*)) for p odd (p\* = (−1)^{(p−1)/2}p), imaginary exactly when p ≡ 3 mod 4, and Q(i), Q(√2), Q(√−2) for p = 2.

**Acceptance.**
- K = Q(i), p = 2: contained case; K = Q(√−3), p = 3: contained case; K = Q(√−7), p = 7: contained case; K = Q(i), p = 5: not contained.
- Burungale–Tian footnote 4 overlooks this case (PAPER-BURUNGALE-TIAN-26/E13); Kato's own 15.15 and 15.17 use 15.14 there.

**Prerequisites:** CZ.5/cm-descent-lemma, CZ.5/twisted-tower-cohomology, mathlib:IsCyclotomicExtension.

**Sources:** kato-2004-asterisque-295, 15.14, p. 264; last sentences of 15.15 and of the proof of Prop. 15.17, p. 265: When K ⊂ Q(ζ\_{p^∞}), replaces G\_∞ by G′\_∞ = Gal(Q(ζ\_{p^∞})/K) and H^q(T~) by H^q(T), with H^q(T~) = H^q(T) ⊗ O\_λ\[\[G\_∞\]\]; the proofs of 15.15 and 15.17 go through with this variant.; burungale-tian-2026, Proof of Theorem 1.2, p. 6: Theorem 1.2 follows from Smith's distribution theorem and the 2-converse Theorem 1.1 for the congruent-number curve, which has CM by Q(i); so it rests on the case K = Q(i), p = 2.; kato-2004-asterisque-295, Statement of 15.14, p. 264: Kato states only the case K ⊂ Q(ζ\_{p^∞}); the list of such K (quadratic subfields of cyclotomic p-power fields) is an elementary addition made here.

### CZ.5/grothendieck-length-lemma — Kato's length lemma (Lemma 14.15)

*Lemma.* Let A be a noetherian commutative ring, C the category of finitely generated A-modules with support of codimension ≥ 2, G(C) its Grothendieck group, M a finitely generated A-module with support of codimension ≥ 1, and a ∈ A such that M\_𝔮 = 0 for every height-one prime 𝔮 containing a. Then M/aM and M\[a\] = Ker(a: M → M) lie in C, and \[M/aM\] − \[M\[a\]\] = Σ\_𝔮 length\_{A\_𝔮}(M\_𝔮)·\[A/(𝔮 + aA)\] in G(C), the sum over height-one primes 𝔮 not containing a.

**Hypotheses.**
- A noetherian; M supported in codimension ≥ 1; M\_𝔮 = 0 at height-one primes containing a.

**Proof route.**
1. Filter M with graded pieces either in C or isomorphic to A/𝔮 with 𝔮 of height one not containing a (prime filtration).
2. Both sides are additive in short exact sequences (the snake lemma for multiplication by a).
3. For pieces in C both sides vanish in G(C) after the correction; for A/𝔮 the left side is \[A/(𝔮 + aA)\] and A/𝔮 has no a-torsion.

**Acceptance.**
- Applied to M₁ = H^2\_{p∞f}(T)\_q and M₂ = H^1\_{p∞f}(T)\_q/A·z in the proof of Prop. 15.17 and in equality-descent; Kato's proof of 15.17 misprints the reference as 'Lemma 14.12' (CMAllPrimeMainConjectures/E1).

**Prerequisites:** mathlib:Module.length, PadicMeasuresIwasawaAlgebras:L4/pseudo-null, mathlib:IsLocalization.AtPrime.

**Sources:** kato-2004-asterisque-295, Lemma 14.15 and proof, pp. 243–244: The identity in the Grothendieck group of modules supported in codimension ≥ 2 relating M/aM, M\[a\] and the height-one lengths of M at primes not containing a.; kato-2004-asterisque-295, Proof of Prop. 15.17, p. 265: Applies this lemma (printed as 'Lemma 14.12') to H^2\_{p∞f}(T)\_q and H^1\_{p∞f}(T)\_q/A·(z ⊗ T(−1)).

### CZ.5/cm-h2-torsion — The CM case of Kato's Theorem 12.4: H² torsion and H¹ free of rank one

*Theorem · planet: CM case of Kato's Theorem 12.4.* Let f ∈ S\_k(Γ₁(N)) be a normalized CM newform of weight k ≥ 2 attached to ψ of conductor f, p any prime, λ | p, Λ\_Q = O\_λ\[\[G\_∞\]\]\[1/p\]. Then H^2(V\_{F\_λ}(f)) is a torsion Λ\_Q-module and H^1(V\_{F\_λ}(f)) is Λ\_Q-free of rank one; for every stable lattice T, H^2(T) is torsion and H^1(T) torsion-free. The proof uses only elliptic units, Rubin's inequality and descent; it uses no Beilinson–Kato class and not (15.16.1).

**Hypotheses.**
- Every prime p, including p = 2 with K = Q(i) (the §15.14 case) and p dividing #Δ\_f.
- This is the early export to KatoEulerSystems L4/rational-iwasawa-module-structure for CM forms and to CMRankZeroConverse.

**Proof route.**
1. Extend coefficients to L ⊃ F; since H^2(V\_{F\_λ}(f)) ⊗ O\_v ≅ H^2(V~\_{L\_v}(ψ)), it suffices to treat V~(ψ) (cm-induction-normalization (15.11.2)).
2. Assume K ⊄ Q(μ\_{p^∞}). Let 𝔭 be a height-zero prime of O\_λ\[\[G\_∞\]\] and q its inverse image, a height-one prime with p ∉ q. The image of z\_{p∞f} ⊗ V(ψ)(−1) under H^1\_{p∞f} → H^1(V~(ψ))\_𝔭 (cm-comparison-map) is nonzero: at a finite-order character χ in the component of 𝔭, its dual exponential has period sums L\_{pf}(ψ̄, χ∘N, k − 1)·γ in S(ψ)-terms by cm-elliptic-reciprocity, and cm-twist-nonvanishing gives χ with this value nonzero. Kato phrases this step with (15.12.2); only its S(ψ)-valued form, which needs no archimedean normalization (15.11.3), is used here.
3. H^1\_{p∞f}(V(ψ))\_q is free of rank one (twisted-tower-cohomology (b)), so it is generated by the image of z\_{p∞f} ⊗ V(ψ)(−1).
4. Rubin's inequality at q, in the twisted form given by elliptic-unit-euler-system-bound (Johnson-Leung–Kings Corollary 6.5 after twisting by χ\_T), gives length H^2\_{p∞f}(V(ψ))\_q ≤ length of the quotient by the elliptic units = 0; so H^2\_{p∞f}(V(ψ))\_q = 0 and by (15.13.1) H^2(V~(ψ))\_𝔭 = 0.
5. Hence H^2 is torsion; H^1 is free of rank one by the argument of Kato 13.8 (Euler characteristic and torsion-freeness).
6. If K ⊂ Q(μ\_{p^∞}) use cm-contained-descent in place of Lemma 15.13.

**Acceptance.**
- For f = 32.2.a.a and p = 2 (K = Q(i) ⊂ Q(μ\_{2^∞})): H^2(V\_{Q\_2}(f)) is torsion over Z\_2\[\[Z\_2^×\]\]\[1/2\] and H^1 is free of rank one.
- Kato's Theorem 13.4 does not apply to CM forms because its hypothesis (v) (an element of Gal(Q̄/Q(ζ\_{p^∞})) with one-dimensional fixed quotient) fails; this node is the replacement.

**Prerequisites:** CZ.1/cm-elliptic-reciprocity, CZ.5/cm-comparison-map, CZ.5/cm-twist-nonvanishing, CZ.5/twisted-tower-cohomology, CZ.5/cm-descent-lemma, CZ.5/cm-contained-descent, CZ.2/elliptic-unit-euler-system-bound, CZ.5/cm-induction-normalization, CZ.0/elliptic-unit-module, SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler.

**Sources:** kato-2004-asterisque-295, 15.15, p. 265: Proves Theorem 12.4 for CM f: nonvanishing from 13.5 and (15.12.2), freeness of H^1\_{p∞f}(V(ψ))\_q, Rubin's theorem 15.2 to kill H^2\_{p∞f}(V(ψ))\_q, then (15.13.1); the contained case by 15.14.; kato-2004-asterisque-295, After Theorem 13.4, p. 226: Theorem 13.4 is not applied for CM forms because condition (v) fails.; burungale-tian-2026, Theorem 2.3, p. 4: States Kato's Theorem 12.4 for every newform and every prime.

### CZ.5/cm-length-inequality — Kato's inequality for CM forms (Prop. 15.17)

*Theorem.* Let λ | p be a finite place of L, 𝔭 a height-one prime of O\_λ\[\[G\_∞\]\], and assume 𝔭 ∌ p, or (Rubin's condition (b)) p ∤ #μ(H) and p ∤ #(torsion of G\_{p∞f}). For a stable lattice T ⊂ V\_{L\_λ}(ψ) let Z(ψ, T)\_𝔭 be the O\_λ\[\[G\_∞\]\]\_𝔭-submodule of H^1(T~)\_𝔭 generated by the image of z\_{p∞f} ⊗ T(−1) under (15.12.1). Then length(H^2(T~)\_𝔭) ≤ length(H^1(T~)\_𝔭/Z(ψ, T)\_𝔭).

**Hypotheses.**
- K ⊄ Q(μ\_{p^∞}), or the §15.14 variant when K ⊂ Q(μ\_{p^∞}).
- Only the inequality: Kato does not prove equality in §15 (PAPER-BURUNGALE-TIAN-26/E2).

**Proof route.**
1. Let q be the inverse image of 𝔭 and A = O\_λ\[\[G\_{p∞f}\]\]\_q, regular with the kernel to the cyclotomic localization generated by a (cm-descent-lemma).
2. Apply grothendieck-length-lemma to M₁ = H^2\_{p∞f}(T)\_q and M₂ = H^1\_{p∞f}(T)\_q/A·(z\_{p∞f} ⊗ T(−1)) (Kato misprints the reference as Lemma 14.12; CMAllPrimeMainConjectures/E1).
3. With (15.13.1)–(15.13.2), the lengths over the cyclotomic localization are computed from the height-one lengths of M₁ and M₂ over A; Rubin's inequality at those height-one primes (elliptic-unit-euler-system-bound, twisted) gives the result.

**Acceptance.**
- This node is the CM-branch input for KatoEulerSystems L4/cohomological-divisibility-one-direction in the Z(ψ, T) form; its Z(f) form needs (15.16.1) (cm-zeta-bridge) and is cm-kato-divisibility.

**Prerequisites:** CZ.5/grothendieck-length-lemma, CZ.5/cm-descent-lemma, CZ.5/cm-contained-descent, CZ.5/twisted-tower-cohomology, CZ.2/elliptic-unit-euler-system-bound, CZ.5/cm-comparison-map.

**Sources:** kato-2004-asterisque-295, Prop. 15.17 and proof, p. 265: The inequality between the length of H^2(T~)\_𝔭 and that of H^1(T~)\_𝔭 modulo the image of z\_{p∞f} ⊗ T(−1), under condition (a) or (b) of Theorem 15.2, proved from Lemma 14.15 (printed 14.12), (15.13.1)–(15.13.2) and Rubin's theorem.

## CZ.6. Kato's main conjecture for CM newforms at every prime

The equivariant equality on ψ-components with lattice coefficients, the Euler terms vanishing because f is the conductor of ψ. Kato's (15.16.1): the comparison map sends z\_{p∞f} ⊗ γ ⊗ (ζ\_{p^n})^{⊗(−1)} to the Beilinson–Kato element z\_{γ′}(f) (Elliptic units become Beilinson–Kato elements). The equality step that Kato §15 does not contain: Lemma 14.15 applied to H²\_{p∞f}(T)\_q and H¹\_{p∞f}(T)\_q/A·(z ⊗ T(−1)), the a-torsion terms cancelling (Equality descent). Burungale–Tian Theorem 2.6: for every normalized CM newform f of weight k ≥ 2, every prime p and every λ | p, ξ(H²\_Iw(V(f))) = ξ(H¹\_Iw(V(f))/Z(f)) over O\_λ\[\[Gal(Q(μ\_{p^∞})/Q)\]\]\[1/p\], in Kato's cohomological conventions (Kato's main conjecture for CM newforms). The CM divisibility in Z(f) form for KatoEulerSystems, the normalization dictionary exported to CMRankZeroConverse, and the acceptance cases K = Q(i), p = 2 (congruent-number curve, newform 32.2.a.a) and K = Q(√−3), p = 3 (newform 27.2.a.a). No ordinary p-adic L-function, integral BSD formula or extra restriction on p replaces these endpoints.

**Depends on:** CMAllPrimeMainConjectures:CZ.0, CMAllPrimeMainConjectures:CZ.1, CMAllPrimeMainConjectures:CZ.4, CMAllPrimeMainConjectures:CZ.5, KatoEulerSystems:L2, KatoEulerSystems:L3, ModularIwasawaMainConjectures:L0, PadicMeasuresIwasawaAlgebras:L4, SelmerIwasawaCohomology:L3.

### CZ.6/cm-period-normalization — Kato's archimedean normalization of the CM induction (Lemma 15.11(2))

*Comparison.* With (15.11.1) fixed, let V~\_L(ψ) = V\_L(ψ) ⊕ ιV\_L(ψ) be the representation of Gal(C/R) over L induced from V\_L(ψ), and write per\_ψ also for S(ψ) → V\_C(ψ) ⊂ V~\_C(ψ). There is a unique Gal(C/R)-isomorphism (15.11.3) V~\_L(ψ) ≅ V\_L(f) such that per\_f corresponds to per\_ψ under (15.11.1). It serves only to transport elements γ ∈ V\_L(ψ) to γ′ ∈ V\_L(f): Kato does not know that it is compatible with (15.11.2) for k ≥ 3 (the motives of f and of ψ are not known to coincide) and never uses it as an identification of Galois modules.

**Hypotheses.**
- (15.11.1) is fixed; f is a CM newform attached to ψ.

**Proof route.**
1. Fix a sign ±. By Kato 6.6 (the period computation for modular zeta elements, KatoEulerSystems L3/archimedean-period-quotient-and-critical-values), cm-twist-nonvanishing and (15.9.2) (cm-eisenstein-evaluation), choose m ≥ 1, z ∈ S(ψ) ⊗ Q(ζ\_m), z′ ∈ S(f) ⊗ Q(ζ\_m) and nonzero γ, γ′ such that the χ-twisted period sums of z and z′ are L\_S(ψ̄, χ, k − 1)γ and L\_S(f\*, χ, k − 1)γ′ for every χ of sign ±, S = prime(mN), with some χ of sign ± having nonzero value; the two L-values agree since L(f\*, s) = L(ψ̄, s). Kato writes ψ and f here (CMAllPrimeMainConjectures/E2); the argument is the same.
2. Let b ∈ L(ζ\_m) be the ratio of the images of σ₀(z′) and σ₀(z) in S(ψ) ⊗ L(ζ\_m) for a σ₀ making the image nonzero. Averaging over characters shows that the twisted sums determine b and that b is fixed by Gal(L(ζ\_m)/L), so b ∈ L^×.
3. Define h on the ± part by γ ↦ b^{-1}γ′; then h ∘ per\_ψ = per\_f. Uniqueness is clear since both sides are one-dimensional on each sign.

**Acceptance.**
- For k = 2 and f attached to a CM elliptic curve over Q, (15.11.3) and (15.11.2) are both induced by the curve, so they are compatible.

**Prerequisites:** CZ.5/cm-induction-normalization, CZ.1/cm-eisenstein-evaluation, CZ.5/cm-twist-nonvanishing, CZ.1/cm-hecke-realization, KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values.

**Sources:** kato-2004-asterisque-295, Lemma 15.11(2) with proof, pp. 261–262: Existence and uniqueness of (15.11.3), compatible with per\_ψ and per\_f, proved from 6.6, 13.5 and (15.9.2).; kato-2004-asterisque-295, Paragraph after Lemma 15.11, p. 263: The compatibility of (15.11.3) with (15.11.2) is expected from the philosophy of motives but not proved, so (15.11.3) is never used as an identification.

### CZ.6/cm-coefficient-reciprocity — The reciprocity law in V(f)-coefficients (15.12.2)

*Theorem.* Let γ ∈ V\_L(ψ) and γ′ ∈ V\_L(f) its image under (15.11.3). For n ≥ 0, the composite of (15.12.1) with specialization at level n, localization at p and exp^\*: H^1\_{p∞f}(Z\_p(1)) ⊗ V\_L(ψ) → S(f) ⊗\_F L\_λ ⊗ Q(ζ\_{p^n}), extended to S^{-1}H^1\_{p∞f} for S the non-zero-divisors invertible in Q\_p\[Gal(Q(ζ\_{p^n})/Q)\], sends z\_{p∞f} ⊗ γ into S(f) ⊗\_F L ⊗ Q(ζ\_{p^n}), and for every χ: Gal(Q(ζ\_{p^n})/Q) → C^×, Σ\_σ χ(σ)·per\_f(σ(image)) = L\_{{p}}(f\*, χ, k − 1)·(γ′)^±, with ± = χ(−1), where f\* is the newform with complex-conjugate coefficients and L\_{{p}} omits only the Euler factor at p.

**Hypotheses.**
- r = k − 1, f ⊂ cond(ψ); every prime p.
- (15.11.3) enters only through γ ↦ γ′.

**Proof route.**
1. Apply cm-elliptic-reciprocity (Prop. 15.9) for K′ = K(ζ\_{p^n}) ∩ ... inside K(p^∞f) and transport through (15.12.1).
2. Translate S(ψ)-valued periods into S(f)-valued ones with (15.11.1) and per\_ψ into per\_f with (15.11.3); the sign component of γ′ is selected by χ(−1).
3. Compare L-values: for χ a character of Gal(Q(ζ\_{p^n})/Q), L\_{pf}(ψ̄, χ∘N\_{K/Q}, k − 1) = L\_{{p}}(f\*, χ, k − 1), since L(f\*, s) = L(ψ̄, s) and the Euler factors of f\* at the primes of f (the conductor of ψ, where ψ̄ is ramified) are trivial.

**Acceptance.**
- The value has the same shape as Kato's Theorem 12.5(1) for the Beilinson–Kato elements, (2πi)^{k−r−1}L\_{{p}}(f\*, χ, r)γ^± at r = k − 1, which is what cm-zeta-bridge compares.

**Prerequisites:** CZ.1/cm-elliptic-reciprocity, CZ.5/cm-comparison-map, CZ.5/cm-induction-normalization, CZ.6/cm-period-normalization.

**Sources:** kato-2004-asterisque-295, (15.12.2), p. 263: The image of z\_{p∞f} ⊗ γ under (15.12.1), specialization and exp^\* lies in S(f) ⊗ L ⊗ Q(ζ\_{p^n}), and its χ-twisted period sum is L\_{{p}}(f\*, χ, k − 1) times the ±-component of γ′, deduced from Prop. 15.9 (page image checked).

### CZ.6/twisted-equivariant-equality — The equivariant equality on ψ-components with lattice coefficients

*Theorem.* Let ψ have conductor f, T ⊂ V\_{L\_λ}(ψ) a stable lattice, A = O\_λ\[\[G\_{p∞f}\]\]. For every height-one prime q′ of A with p ∉ q′ that is contained in the inverse image q of a prime 𝔭 ∌ p of O\_λ\[\[G\_∞\]\] (of O\_λ\[\[G′\_∞\]\] when K ⊂ Q(μ\_{p^∞})): length(H^2\_{p∞f}(T)\_{q′}) = length((H^1\_{p∞f}(T)/A·(z\_{p∞f} ⊗ T(−1)))\_{q′}).

**Hypotheses.**
- f is the conductor of ψ, so every 𝔩 | f with 𝔩 ∤ p is ramified for ψ.
- Rational statement: only primes not containing p.

**Proof route.**
1. Twist by twisted-tower-cohomology (a): H^q\_{p∞f}(T)\_{q′} ≅ (H^q\_{p∞f}(Z\_p(1)) ⊗ O\_λ)\_{Tw(q′)}, carrying the elliptic-unit span to z ⊗ O\_λ.
2. Apply rational-equivariant-main-conjecture over O\_λ (flat base change) at the regular prime Tw(q′): lengths of H^2\_{pf} and of h¹/z agree, and h² differs from H^2\_{pf} by the Euler terms Z\_p\[\[G/D\_𝔩\]\].
3. Kill the Euler terms. Let g ∈ I\_𝔩; it has finite order and maps to 1 in G\_∞, so g − 1 lies in the kernel of the restriction map and hence in q. A height-one q′ ⊂ q contains g − ζ for some root of unity ζ (because g^m − 1 = 0), and then ζ − 1 ∈ q; as p ∉ q this forces ζ = 1, so g − 1 ∈ q′. After the twist the Euler module O\_λ\[\[G/D\_𝔩\]\] is killed by χ\_T(g)^{±1}g − 1, which is congruent to χ\_T(g)^{±1} − 1 modulo q′. That is nonzero in the residue field, of characteristic zero, because χ\_T|\_{I\_𝔩} = ψ|\_{I\_𝔩} ≠ 1 (𝔩 divides the conductor of ψ). So the localized Euler term vanishes (h2-euler-comparison).
4. Combine with class-module-h2-comparison to replace h² by H^2\_{p∞f}(Z\_p(1)).

**Acceptance.**
- When every prime of f lies above p there are no Euler terms to kill.

**Prerequisites:** CZ.4/rational-equivariant-main-conjecture, CZ.5/twisted-tower-cohomology, CZ.0/h2-euler-comparison, CZ.0/class-module-h2-comparison, CZ.0/elliptic-unit-module.

**Sources:** kato-2004-asterisque-295, 15.15 and the proof of Prop. 15.17, p. 265: The modules H^2\_{p∞f}(T)\_q and H^1\_{p∞f}(T)\_q/A·(z\_{p∞f} ⊗ T(−1)) to which the length comparison is applied.; burungale-tian-2026, Proof of Theorem 2.6, p. 5: Replaces Rubin's theorem by Theorem 2.1 in Kato's argument; Theorem 2.1 is used on the ψ-components, where the Euler factors of PAPER-BURUNGALE-TIAN-26/E1 are units.

### CZ.6/cm-zeta-bridge — Elliptic units specialize to Beilinson–Kato elements (Kato (15.16.1))

*Theorem · planet: Elliptic units become Beilinson–Kato elements.* Let f be a CM newform attached to ψ, enlarge coefficients to L ⊃ F containing the values of ψ, and let γ ∈ V\_L(ψ) with image γ′ ∈ V\_L(f) under (15.11.3). Then (15.12.1) sends z\_{p∞f} ⊗ γ ⊗ (ζ\_{p^n})\_n^{⊗(−1)} to z^{(p)}\_{γ′} = z\_{γ′}(f), the value at γ′ of Kato's zeta map V\_{F\_λ}(f) → H^1(V\_{F\_λ}(f)) (KatoEulerSystems L2/rational-kato-zeta-morphism), extended L-linearly. Consequently the Λ\_Q-span of the images of z\_{p∞f} ⊗ V\_L(ψ)(−1) is Z(f) ⊗ L.

**Hypotheses.**
- Kato's zeta map for CM forms is constructed using the CM case of Theorem 12.4(2), supplied by cm-h2-torsion; no circularity, since cm-h2-torsion uses only (15.12.2).
- K ⊄ Q(μ\_{p^∞}) in Kato's text; for K ⊂ Q(μ\_{p^∞}) (K = Q(i), p = 2) the same deduction applies, since 13.9–13.13 use only 12.4 and 13.5–13.6.

**Proof route.**
1. Both sides lie in H^1(V(f)), which is free of rank one over Λ\_Q (cm-h2-torsion).
2. Their dual-exponential images at every finite level and every finite-order character agree: for the elliptic side by cm-coefficient-reciprocity, for the Kato side by KatoEulerSystems L3/zeta-class-interpolation-of-complex-L-values (Kato Theorem 12.5(1)), both equal to L\_{{p}}(f\*, χ, k − 1)(γ′)^± (times the same archimedean factor) with the same periods because (15.11.1) and (15.11.3) were fixed compatibly.
3. An element of a free rank-one Λ\_Q-module is determined by these specializations (the uniqueness clause of Kato's characterization, 13.9–13.13); hence the two elements are equal.
4. Integrality is not asserted.

**Acceptance.**
- For f = 32.2.a.a and p = 2 this identifies the elliptic units of the 2-power ray tower of Q(i) with the Beilinson–Kato element of the congruent-number curve, after the §15.14 base change.

**Prerequisites:** CZ.6/cm-coefficient-reciprocity, CZ.6/cm-period-normalization, CZ.5/cm-h2-torsion, CZ.5/cm-comparison-map, CZ.5/cm-induction-normalization, KatoEulerSystems:L2/rational-kato-zeta-morphism, KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values, CZ.0/elliptic-unit-module.

**Sources:** kato-2004-asterisque-295, 15.16 with (15.16.1), p. 265: Having proved 12.4 for f, Kato proves 12.5(1)(2) and 12.6 by 13.9–13.13 and deduces from (15.12.2) and 12.4(2) that (15.12.1) sends z\_{p∞f} ⊗ γ ⊗ (ζ\_{p^n})^{⊗(−1)} to z^{(p)}\_{γ′}.; burungale-tian-2026, Proof of Theorem 2.6, p. 5: The link between Beilinson–Kato elements and elliptic units, Kato (15.16.1), is the basis of the proof.

### CZ.6/equality-descent — From the equivariant equality to Kato's equality at cyclotomic primes

*Theorem · planet: Equality descent.* In the setting of cm-descent-lemma (or cm-contained-descent), with 𝔭 ∌ p, q its inverse image, A = O\_λ\[\[G\_{p∞f}\]\]\_q regular with kernel generated by a prime element a, put M₁ = H^2\_{p∞f}(T)\_q and M₂ = H^1\_{p∞f}(T)\_q/A·(z\_{p∞f} ⊗ T(−1)). If length(M₁)\_{q′} = length(M₂)\_{q′} at every height-one prime q′ of A, then length(H^2(T~)\_𝔭) = length(H^1(T~)\_𝔭/Z(ψ, T)\_𝔭).

**Hypotheses.**
- A is a regular local ring, hence a unique factorization domain; a is a prime element.
- H^1\_{p∞f}(T)\_q is torsion-free of rank one and z\_{p∞f} ⊗ T(−1) generates it at aA (from cm-h2-torsion's argument, Kato 15.15).

**Proof route.**
1. The only height-one prime of A containing a is aA, the inverse image of the generic point of the cyclotomic component; M₁ and M₂ vanish there (H² vanishes and z generates H¹ at aA, by the argument of cm-h2-torsion), so Lemma 14.15 applies. Since A is two-dimensional local, classes of modules supported in codimension two are lengths. Apply grothendieck-length-lemma to M₁ and M₂ with the element a: \[M\_i/aM\_i\] − \[M\_i\[a\]\] = Σ\_{q′ ∌ a} length(M\_i)\_{q′}\[A/(q′ + aA)\], so the hypothesis gives \[M₁/aM₁\] − \[M₁\[a\]\] = \[M₂/aM₂\] − \[M₂\[a\]\].
2. By (15.13.1), M₁/aM₁ = H^2(T~)\_𝔭; by (15.13.2), H^1(T~)\_𝔭/Z(ψ,T)\_𝔭 is an extension of M₁\[a\] by M₂/aM₂.
3. M₂\[a\] = 0: since A is a UFD, a is prime, H^1\_{p∞f}(T)\_q is torsion-free of rank one and z ⊗ T(−1) generates it at aA, the quotient M₂ has no a-torsion.
4. Hence length(H^2(T~)\_𝔭) = length(M₁/aM₁) = length(M₂/aM₂) + length(M₁\[a\]) = length(H^1(T~)\_𝔭/Z(ψ,T)\_𝔭): the Ker(a | M₁) terms cancel.
5. The integrality of z\_{p∞f} ⊗ T(−1) at q, implicit in Kato's proof, follows from (15.6.3) since N(a) − σ\_a is a unit at q for a suitable auxiliary a.

**Acceptance.**
- This is the step Burungale–Tian attribute to Kato §15, which proves only the inequality (PAPER-BURUNGALE-TIAN-26/E2).

**Prerequisites:** CZ.5/grothendieck-length-lemma, CZ.5/cm-descent-lemma, CZ.5/cm-contained-descent, CZ.5/twisted-tower-cohomology, CZ.5/cm-h2-torsion, CZ.0/elliptic-unit-module.

**Sources:** kato-2004-asterisque-295, Proof of Prop. 15.17, p. 265, and Lemma 14.15, pp. 243–244: The same lemma applied to the same two modules, there combined with an inequality instead of an equality.; burungale-tian-2026, Proof of Theorem 2.6, p. 5: Asserts that the CM case of Kato's Conjecture 12.10 follows from the equivariant main conjecture as shown in Kato §15; the equality step is supplied here.

### CZ.6/cm-kato-main-conjecture — Kato's main conjecture for every CM newform and every prime (Burungale–Tian Theorem 2.6)

*Theorem · planet: Kato's main conjecture for CM newforms (BT Thm 2.6).* Let f ∈ S\_k(Γ₁(N)) be a normalized CM newform of weight k ≥ 2, p any prime, F its Hecke field, λ | p, V = V\_{F\_λ}(f) Kato's representation, H^q(V) Kato's cyclotomic Iwasawa cohomology (j\_\* convention at Z\[ζ\_{p^n}, 1/p\]) and Z(f) ⊂ H^1(V) the Λ\_Q-submodule generated by the Beilinson–Kato elements z\_γ(f), γ ∈ V. Then ξ(H^2(V)) = ξ(H^1(V)/Z(f)) as ideals of Λ\_Q = O\_λ\[\[G\_∞\]\]\[1/p\].

**Hypotheses.**
- Rational equality over Λ\_Q; no integral equality, p-adic L-function, ordinarity, good reduction or residual irreducibility hypothesis.
- p = 2 and K = Q(i) included (§15.14); p dividing #Δ included, since only primes not containing p matter after inverting p.

**Proof route.**
1. Extend coefficients to L ⊃ F and identify V\_{L\_λ}(f) with V~\_{L\_λ}(ψ) by (15.11.2); characteristic ideals descend along the faithfully flat O\_λ\[\[G\_∞\]\] → O\_v\[\[G\_∞\]\].
2. By cm-zeta-bridge, Z(f) ⊗ L is the span of the images of z\_{p∞f} ⊗ V(ψ)(−1), i.e. Z(ψ, T) ⊗ Q for any lattice T.
3. For each height-one prime 𝔭 ∌ p of O\_λ\[\[G\_∞\]\]: twisted-equivariant-equality supplies the hypothesis of equality-descent, which gives length(H^2(T~)\_𝔭) = length(H^1(T~)\_𝔭/Z(ψ,T)\_𝔭); use cm-descent-lemma or cm-contained-descent according as K ⊄ or ⊂ Q(μ\_{p^∞}).
4. H^2(V) is torsion and H^1(V) free of rank one (cm-h2-torsion), so both characteristic ideals are defined, and equal lengths at every height-one prime of Λ\_Q give equal ideals.

**Acceptance.**
- f = 32.2.a.a (y² = x³ − x, CM by Q(i)), p = 2: ξ(H^2(V)) = ξ(H^1(V)/Z(f)) over Z\_2\[\[Z\_2^×\]\]\[1/2\]; this is the input of the even-parity Goldfeld result for congruent-number twists (CMRankZeroConverse C.5).
- f = 27.2.a.a (CM by Q(√−3)), p = 3: the contained case; input of the cube-sum application (CMRankZeroConverse C.6).
- The integral equality is not claimed (Burungale–Tian Remark 2.7).

**Prerequisites:** CZ.6/equality-descent, CZ.6/twisted-equivariant-equality, CZ.6/cm-zeta-bridge, CZ.5/cm-h2-torsion, CZ.5/cm-descent-lemma, CZ.5/cm-contained-descent, CZ.5/cm-newform-characterization, CZ.5/cm-induction-normalization, ModularIwasawaMainConjectures:L0, KatoEulerSystems:L2/rational-kato-zeta-morphism, PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal.

**Sources:** burungale-tian-2026, Theorem 2.6 and its proof, p. 5: States ξ(H²(V\_{F\_λ}(f))) = ξ(H¹(V\_{F\_λ}(f))/Z(f)) in Λ ⊗ Q for every CM newform and every p, deduced from Kato §15 with Theorem 2.1 in place of Rubin's theorem.; kato-2004-asterisque-295, Conjecture 12.10, pp. 223–224, and §15: The main conjecture for modular forms in this cohomological form, and the CM argument giving the inequality.

### CZ.6/cm-kato-divisibility — Kato's divisibility for CM forms in the Z(f) form (Theorem 12.5(3), CM case)

*Theorem.* For a CM newform f, p, λ as above and every height-one prime 𝔭 of O\_λ\[\[G\_∞\]\] satisfying condition (a) or (b) of Kato's Theorem 15.2 (the range of Prop. 15.17, to which Kato reduces Theorem 12.5(3) for CM forms), length(H^2(V)\_𝔭) ≤ length(H^1(V)\_𝔭/Z(f)\_𝔭). The local term H^2\_loc of Theorem 12.5(3) does not occur: it is nonzero only in configuration (12.5.1), which requires f not potentially of good reduction at p, whereas a CM newform has potentially good reduction everywhere. For 𝔭 ∌ p the inequality is an equality (cm-kato-main-conjecture).

**Hypotheses.**
- Kato notes that 12.5(4) does not exist in the CM case; the absence of the (12.5.1) local term is deduced here from potential good reduction.

**Proof route.**
1. Translate cm-length-inequality from Z(ψ, T) to Z(f) with cm-zeta-bridge.
2. At primes not containing p, the equality of cm-kato-main-conjecture is stronger.

**Acceptance.**
- This is the CM branch requested by KatoEulerSystems L4/cohomological-divisibility-one-direction; that node's own CM step should import this one rather than restating the elliptic-unit comparison.

**Prerequisites:** CZ.5/cm-length-inequality, CZ.6/cm-zeta-bridge, CZ.6/cm-kato-main-conjecture.

**Sources:** kato-2004-asterisque-295, 15.16–15.17, p. 265: Reduces Theorem 12.5(3) for CM f to Prop. 15.17 through (15.16.1).

### CZ.6/cm-kato-normalization-dictionary — Normalization dictionary exported to CMRankZeroConverse

*Comparison.* The equality of cm-kato-main-conjecture is stated with: V = V\_{F\_λ}(f) Kato's cohomological realization (8.3), whose determinant and Tate dual differ from the covariant convention (V = ρ\_f^∨ in CMRankZeroConverse C.0); H^q(V) = lim\_n H^q(Z\[ζ\_{p^n}, 1/p\], T) ⊗ Q with Kato's j\_\* convention (8.2), not extension by zero and not unrestricted cohomology of a larger set of places; Λ = O\_λ\[\[G\_∞\]\] for the full group G\_∞ = Gal(Q(ζ\_{p^∞})/Q) ≅ Z\_p^×, including its torsion Δ (Z/(p − 1) for odd p, Z/2 for p = 2), so equalities hold on every character component; Z(f) is generated by z\_γ(f) for all γ ∈ V, where z\_γ is Kato's zeta map normalized by Theorem 12.5(1) and satisfying z\_{ιγ} = −σ\_{−1}z\_γ; characteristic ideals are taken over Λ ⊗ Q. These are the conventions of CMRankZeroConverse C.2/zeta-basis, so the equality there is literally this theorem for CM f.

**Hypotheses.**
- The CM newform is any normalized CM newform of weight k ≥ 2 (even k for the rank-zero converse).

**Proof route.**
1. Check each convention against Burungale–Tian §2.2 (V from Kato (8.3), H^q from Kato 8.2, Λ = O\_λ\[\[G\_∞\]\], Z(f) from Theorem 2.4).
2. Check that CMRankZeroConverse C.0/C.2 use the same objects: M\_f = V\_Kato(f) = ρ\_f^∨, the full cyclotomic components and Z(f) generated by the actual z\_Kato.
3. Record that the j\_\* convention is the one of ModularIwasawaMainConjectures L0's cohomological formulation, whose text says 'extension-by-zero' where Kato uses j\_\* (the extraction review notes this; the atlas text is the one to fix).

**Acceptance.**
- The central specialization used by CMRankZeroConverse C.2 is at the kernel of σ\_c ↦ c^{−k/2}, a prime of Λ not containing p, so the rational equality suffices there.

**Prerequisites:** CZ.6/cm-kato-main-conjecture, ModularIwasawaMainConjectures:L0, SelmerIwasawaCohomology:L3/etale-iwasawa-comparison, SelmerIwasawaCohomology:L3/iwasawa-twist.

**Sources:** burungale-tian-2026, §2.2.1–§2.2.4, pp. 4–5: Fixes V\_{F\_λ}(f) as in Kato (8.3), H^q(T) as the limit over Z\[ζ\_{p^n}, 1/p\] with Kato's 8.2 cohomology, Λ = O\_λ\[\[G\_∞\]\] with G\_∞ ≅ Z\_p^× ≅ Z\_p × Δ, and Z(f) generated by the z\_γ(f).; burungale-tian-2026, Proof of Theorem 3.1, p. 6: Specializes at the kernel of σ\_c ↦ c^{−k/2}.

### CZ.6/dyadic-and-triadic-acceptance — Acceptance cases: K = Q(i) at p = 2 and K = Q(√−3) at p = 3

*Application.* (a) For E: y² = x³ − x (newform 32.2.a.a, CM by Z\[i\], ψ of conductor (1+i)^3) and p = 2: K = Q(i) ⊂ Q(μ\_{2^∞}), so the descent is the §15.14 one with G′\_∞ = Gal(Q(μ\_{2^∞})/Q(i)) ≅ 1 + 4Z\_2; cm-h2-torsion and cm-kato-main-conjecture hold. (b) For the newform 27.2.a.a (CM by Q(√−3)) and p = 3: K = Q(√−3) ⊂ Q(μ\_3), again the contained case. (c) For K = Q(i) and p = 5, K ⊄ Q(μ\_{5^∞}) and Lemma 15.13 applies directly.

**Hypotheses.**
- These are worked instances; each verifies the hypotheses of the general theorems rather than assuming them.

**Proof route.**
1. (a): Q(i) = Q(ζ\_4). Every prime of f = (1+i)^3 lies above 2, so K(2^∞f) = K(2^∞), whose Galois group is Z\_2² with Δ trivial (ray-tower test), and there are no Euler terms. After inverting 2 only primes not containing 2 matter.
2. (b): Q(√−3) = Q(ζ\_3).
3. (c): 5 ≡ 1 mod 4, so Q(i) ⊄ Q(ζ\_{5^∞}) (its only quadratic subfield is Q(√5)).

**Acceptance.**
- Burungale–Tian Theorem 1.2 (congruent-number twists, p = 2) and Remark 3.6(i) (cube sums, p = 3) rest on (a) and (b).

**Prerequisites:** CZ.6/cm-kato-main-conjecture, CZ.5/cm-contained-descent, CZ.5/cm-h2-torsion, CZ.5/cm-newform-characterization.

**Sources:** burungale-tian-2026, Theorem 1.2, p. 2; proof of Theorem 1.2 and Remark 3.6(i), pp. 6–7: The congruent-number curve at p = 2 and the cube-sum curves over Q(ζ\_3) at p = 3.; kato-2004-asterisque-295, 15.14, p. 264: The contained case.

## Gaps

- **Integral Tamagawa number conjecture at s = 0 for abelian extensions of K, at p = 2.** Johnson-Leung–Kings Theorem 2.6 and Proposition 2.9 rest, for p = 2, on K. Itakura's preprint ('Tamagawa number conjecture and Iwasawa main conjecture for Dirichlet motives at the prime 2'), which was not available and is not published as far as was checked; for p ≠ 2 on Huber–Kings Proposition 2.3.1 and 1.2.10 (Duke Math. J. 119, 2003), which were not read. The fields are totally complex, so no real-place 2-torsion intervenes. No atlas roadmap owns the passage from the analytic class number formula (in Mathlib) to the integral determinant statement; tamagawa-s0-abelian records it as a node with this unproved input. Needed by: CZ.2/tamagawa-s0-abelian, CZ.2/lambda-main-conjecture.
- **Height-one generalized explicit reciprocity.** Kato's proof of Prop. 15.9 applies \[KK3, Theorem 4.3.1\] with h = 1. PadicHodgeRegulators D.2 is requested for it, but no node there states it yet, and the KK3 paper was not read for this design. Needed by: CZ.1/cm-p-divisible-reciprocity, CZ.1/cm-elliptic-reciprocity.
- **General-weight CM induction not yet planned in CM.4.** ComplexMultiplicationAndExplicitReciprocity CM.4/cm-induction-comparison covers weight two only. The weight-k induction V(f) ≅ Ind V(ψ) (Kato 15.10) is a routed source item of CM.4 with no node. Needed by: CZ.5/cm-induction-normalization, CZ.5/cm-newform-characterization.
- **Ribet's characterization of self-twists.** The direction from a nontrivial self-twist to an induced representation (Ribet, LNM 601, Kato's \[Ri2\]) was not read; LNM 601 is not freely available and not in the cleared library. Needed by: CZ.5/cm-newform-characterization.
- **Rohrlich's central nonvanishing and the infinite-order Hecke edge.** Rohrlich 1988 Theorem 1 was read as a statement (p. 611) but its proof (his 1984 method with Jacquet–Langlands root numbers) is not decomposed by any atlas roadmap; the edge nonvanishing for unitary infinite-order Hecke characters is requested from AN.4. Needed by: CZ.5/cm-twist-nonvanishing.
- **Two-variable Coleman map and its Katz image (de Shalit, Yager).** The construction of the two-variable Coleman map for the height-one relative Lubin–Tate group and the identification of the image of elliptic units with Katz's measure are due to Yager (Ann. of Math. 115, 1982) and de Shalit (Iwasawa theory of elliptic curves with complex multiplication, 1987). Neither is freely available or in the cleared library; they were not read. The nodes record the statements through Rubin's Remark (1) after Theorem 4.1 and Castella–Grossi–Lee–Skinner's use of them. Needed by: CZ.3/two-variable-coleman-map, CZ.3/elliptic-units-to-katz-measure, CZ.3/katz-form-main-conjecture.
- **Split-prime Katz form when p divides the class number.** Rubin's Theorem 4.1 assumes p ∤ \[K₀ : K\] with K₀ ⊃ H, which fails when p divides h\_K. Johnson-Leung–Kings' cohomological main conjecture has no such hypothesis, but its comparison with the module X\_∞ ramified only at one prime above p, and the Coleman-map identification, were not checked in that case. Castella–Grossi–Lee–Skinner's θ-components need this whenever p | h\_K. Needed by: CZ.3/anticyclotomic-theta-main-conjecture, CZ.3/katz-form-main-conjecture.

## Structure and boundaries

- **KatoEulerSystems / CMAllPrimeMainConjectures** (rescope). KatoEulerSystems L4/rational-iwasawa-module-structure, L2/rational-kato-zeta-morphism, L4/nonvanishing-of-the-zeta-submodule-at-height-zero and L4/cohomological-divisibility-one-direction record the CM case as a gap pointing at this roadmap ('All-prime CM module-structure supplier is not staged'). Proposal: Point the CM branch of KatoEulerSystems L4/rational-iwasawa-module-structure at CMAllPrimeMainConjectures:CZ.5/cm-h2-torsion (which uses no Kato class and not (15.16.1)), and the CM branch of L4/cohomological-divisibility-one-direction at CZ.5/cm-length-inequality (Z(ψ, T) form) or CZ.6/cm-kato-divisibility (Z(f) form). Do not make KatoEulerSystems L4 depend on CZ.6 if its L2 node is cited by CZ.6: CZ.6/cm-zeta-bridge imports L2/rational-kato-zeta-morphism, so the Z(f)-form CM divisibility is owned here (CZ.6/cm-kato-divisibility) and KatoEulerSystems' divisibility node should be restricted to non-CM forms. The pure analytic Theorem 13.5 for CM forms is CZ.5/cm-twist-nonvanishing; L4/analytic-twist-nonvanishing may import it.
- **AnticyclotomicLocalUnits / ColemanPowerSeriesPartII / CMAllPrimeMainConjectures** (rescope). AnticyclotomicLocalUnits (gap 'Unregistered early CM special-value supplier', node ALU.4) and ColemanPowerSeriesPartII (AU.4/early-cm-interface and request to AutomorphicPadicLFunctions L3) need early norm-compatible elliptic-unit zeta classes and Kato's (15.9) reciprocity. The Burungale–Tian route 7 brief places these foundations here, owned once. Proposal: Re-point both to CMAllPrimeMainConjectures:CZ.0/standard-elliptic-unit, CZ.0/elliptic-unit-module and CZ.1/cm-elliptic-reciprocity (r = 1 specialization), which depend on no main conjecture. The canonical-character choice, root number, period and Finis's unit theorem stay with the nonordinary CM design (#1689). The two Part II roadmaps also appear to plan the same signed anticyclotomic local units twice; that duplication is outside this roadmap and is noted for the maintainer.
- **ComplexMultiplicationAndExplicitReciprocity / CMAllPrimeMainConjectures** (rescope). Item cm-galois-induction of PAPER-BURUNGALE-TIAN-26 (route 6, to CM.4) bundles Kato 15.10 (the induction) with Lemma 15.11 (its normalizations). Lemma 15.11(2) is proved from Kato 6.6, 13.5 and (15.9.2), and (15.9.2) is this roadmap's CZ.1, which uses CM.4. Proposal: CM.4 owns only Kato 15.10 (V\_{L\_λ}(f) ≅ Ind V\_{L\_λ}(ψ) for every weight, by Frobenius polynomials and irreducibility); CMAllPrimeMainConjectures owns Lemma 15.11: part (1), the Galois normalization (15.11.2), in CZ.5/cm-induction-normalization, and part (2), the archimedean normalization (15.11.3), in CZ.6/cm-period-normalization, with the warning that (15.11.3) is never a Galois identification. This keeps CM.4 → CZ.1 → CZ.5 acyclic, and keeps KatoEulerSystems L3 (Kato 6.6) out of CZ.5, so that KatoEulerSystems L4 can import CZ.5 without a stage cycle.
- **HeegnerPointEulerSystems / RankZeroOneBSD / CMAllPrimeMainConjectures** (rescope). HeegnerPointEulerSystems HE.8b and HE.7s and RankZeroOneBSD BSD.7a record 'imaginary-quadratic elliptic-unit main-conjecture owner' gaps (RT-AREA-iwasawa-1/5) and route Rubin's main conjecture to this design. Proposal: Replace those gaps by CZ.2/classical-two-variable-main-conjecture (Rubin Theorem 4.1 and Johnson-Leung–Kings' all-prime classical form), CZ.3/katz-form-main-conjecture and CZ.3/anticyclotomic-theta-main-conjecture (CGLS Theorem 1.2.2 input, λ-equality) with CZ.3/katz-functional-equation-lambda. Hida–Tilouine Theorem 0.3 and Hida's μ = 0 remain with their own owners (proposed AC L0c, AutomorphicPadicLFunctions L3h). None of these nodes depends on ModularIwasawaMainConjectures L6 or RankZeroOneBSD BSD.7a.
- **CMRankZeroConverse / CMAllPrimeMainConjectures** (rescope). CMRankZeroConverse:C.3/cm-newform-converse has the gap 'Register the all-prime CM main-conjecture supplier'. Proposal: Replace it by CMAllPrimeMainConjectures:CZ.6/cm-kato-main-conjecture (BT Theorem 2.6, rational, every p) and CZ.5/cm-h2-torsion (module structure), with CZ.6/cm-kato-normalization-dictionary as the convention check against C.0/C.2.
- **InertAnticyclotomicCMMainConjecture / CMAllPrimeMainConjectures** (rescope). PAPER-BURUNGALE-KOBAYASHI-OTA-21 route 6 assigns here 'Rubin 1991 Theorem 4.1(ii) in units form: char(X\_∞^χ) = char(U\_∞^χ/C̄\_∞^χ) at an inert prime'. Rubin's Theorem 4.1(ii) (p. 37) is a statement about A\_∞ and Ē\_∞/C̄\_∞ (divisibility, with equality on χ nontrivial on the decomposition group of 𝔭), and his Remark 2 says X\_∞ and U\_∞/C̄\_∞ are not torsion when p does not split. Agboola–Howard II Proposition 3.3(ii) deduces char(X\_str) = char(S\_rel/C) from Theorem 4.1(ii) as stated. Proposal: The inert-prime input exported here is CZ.2/classical-two-variable-main-conjecture part (ii) (and, for p ∤ #Δ, Johnson-Leung–Kings' all-χ classical form). InertAnticyclotomicCMMainConjecture (#1690) should import it and own the Agboola–Howard deduction of the Selmer form; the BKO extraction item's statement should be corrected accordingly. The maintainer may also consider merging #1690 into this roadmap, as the Burungale–Tian review suggested; this design keeps them separate, with #1690 importing CZ.0–CZ.2.

## Acceptance tests for the roadmap

- Contained-field cases: K = Q(i) with p = 2 (newform 32.2.a.a, the congruent-number curve) and K = Q(√−3) with p = 3 (newform 27.2.a.a) go through Kato 15.14; K = Q(i) with p = 5 goes through Lemma 15.13 directly.
- Ray tower: for K = Q(i), p = 2, f = (1), Δ is trivial; for p = 5, Δ ≅ Z/4; for p = 2, f = (3), Δ ≅ Z/8 and p divides #Δ, so the integral Ω-algebra is not normal and only the rational statements apply there.
- Euler factors: for K = Q(i), p = 5, f = (3), the printed equivariant equality fails on the trivial component by the factor 1 − Frob\_{(3)}^{-1}, while the corrected one holds.
- The CM case of Kato 12.4 at p = 2 for 32.2.a.a uses no Beilinson–Kato element: elliptic units, Rubin's inequality in Johnson-Leung–Kings' form, and Kato 15.14.
- No step uses an ordinary p-adic L-function, an integral BSD formula, residual irreducibility or a restriction on p in the route to Theorem 2.6.

