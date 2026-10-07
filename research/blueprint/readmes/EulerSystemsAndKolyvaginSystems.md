# Euler systems, Kolyvagin systems and higher-rank descent

This roadmap builds the general descent machine: a norm-compatible family of Galois cohomology
classes gives a bound on a dual Selmer group; a primitive Kolyvagin or Stark system can give its
exact structure. It takes coefficient modules, continuous cohomology and Selmer structures as
inputs, constructs auxiliary primes and derivative classes, proves descent bounds, and passes
rank-one bounds to Iwasawa towers. The higher-rank finite-level route uses exterior biduals,
Stark systems and Fitting ideals.

A nonzero initial class, a primitive system and an analytic formula are three separate inputs.
The definitions allow the zero system. Nonvanishing gives a bound under the stated hypotheses;
primitivity gives the relevant equality; identifying an initial class with an L-value requires an
arithmetic reciprocity law supplied by an application. None of these inputs follows merely from
the existence of the carrier.

## Scope and boundaries

ES.0–ES.5 give the rank-one finite-level theory, including the distinct Mazur–Rubin, Rubin and
Howard hypotheses and the branches with explicit errors. ES.6–ES.7 give higher-rank finite-level
descent over principal artinian rings, DVRs and the source-qualified Gorenstein orders. ES.8 gives
rank-one Iwasawa theory: Rubin's Euler-system bounds over Z_p^d-towers and Λ-adic Kolyvagin systems
over one-variable towers. The tower dimension d is independent of the exterior rank of an Euler
system. ES.8 imports ES.0–ES.5; its nodes do not require ES.6 or ES.7. The proposed ES.8h higher-rank
Iwasawa stage is a future extension, not a result of this plan.

The neighbouring roadmaps supply the following interfaces, with unresolved contracts recorded
at the end of this document and collected in the assembly handoff.

- `ArithmeticGaloisDuality` R02.1–R02.5 supplies continuous cochains, restriction/corestriction,
  Hochschild–Serre, local Tate and Poitou–Tate duality, and the global Euler-characteristic formula.
- `SelmerIwasawaCohomology` L1–L4 supplies actual local cohomology conditions, Selmer kernels,
  propagation and orthogonal complements, Pontryagin duals, the Selmer Poitou–Tate sequence,
  Iwasawa cohomology, Shapiro and tower control. General-R duality and some finiteness/control
  contracts remain requests; O-adic statements do not automatically cover all coefficient rings.
- `PadicMeasuresIwasawaAlgebras` L1, L4 and L5 supplies completed group rings, twisting, height-one
  primes, characteristic ideals, pseudo-isomorphisms, structure theory and topological Nakayama.
  Its L6 owns general Gorenstein, exterior-bidual and Fitting-ideal algebra. ES.6's generic bidual
  inventory still overlaps that owner; the recorded ownership gap must be resolved before those
  entries are implemented as new declarations here. The arithmetic contraction and Selmer
  transitions are this roadmap's specializations.
- Tau Ceti's `ClassFieldTheory` layer 13 supplies ray class **fields**, rather than only the ray
  class groups already present in the library; layer 7 supplies local reciprocity, layer 5 local
  duality, and layer 12 the global correspondence used for inertia in Z_p^d-towers. These roles
  remain distinct. `LocalFieldsRamification` layer 4 supplies inertia, the unramified quotient,
  arithmetic Frobenius lifts and the tame quotient for ES.1's local comparisons.
- Tau Ceti's `Chebotarev` layer 10 supplies finite-Galois density and infinitude. ES.1 first
  constructs the joint representation/cohomology extension and proves that the requested
  Frobenius conditions give a compatible nonempty conjugacy class. Simultaneous nonvanishing,
  prescribed kernels and core-vertex supply are additional descent results here.

The last three boundaries refine the touching link maps `CFT-L63`, `CH-L11` and the
`LocalFieldsRamification` layer-4 link to ES.1. They import upstream plans without replanning them.
`EulerSystemsCyclotomicMainConjecture`, `KatoEulerSystems`, `HeegnerPointEulerSystems`,
`GeneralizedHeegnerCycles` and `RankZeroOneBSD` construct arithmetic systems, verify their
hypotheses and nonvanishing, and import these bounds. `IntegralIwasawaTheory` I.7 owns the
specialized Dasgupta–Kakde Rubin–Brumer–Stark theorem; the conditional general Rubin–Stark
class-group application and its comparison remain a gap of ES.7.

## Conventions

- K is a number field, p a prime, and R a complete noetherian local ring with maximal ideal m
  and finite residue field k of characteristic p. The theorem in use specifies whether R is
  principal artinian, a DVR or a Gorenstein order. In Rubin's theory O is the ring of integers
  of a finite extension Φ/Q_p, with uniformizer ϖ and D = Φ/O; V = T ⊗_O Φ and W = V/T.
- The lattice dual is Hom_O(T, O(1)); the discrete Cartier dual is Hom(T, μ_{p^∞}). We write
  these explicitly when a source calls both T*. Rubin's W* is the latter. A DVR lattice triple
  has discrete dual Selmer data, not another lattice triple of the same type. Finite artinian
  coefficient duality requires its own identification and supplier hypotheses.
- Frobenius is arithmetic. Rubin's Euler polynomial is
  det(1 − Fr_q^{-1}x | Hom_O(T, O(1))); Mazur–Rubin's is det(1 − Fr_q x | T).
  ES.2/euler-polynomial provides the convention dictionary; norm relations use corestriction.
  Twisting and removing Euler factors are explicit operations with conductor conditions.
- N(P) is the set of squarefree conductors n, with ν(n) prime factors and 1 in N(P).
  An arbitrary restricted prime set P need not be infinite. Chebotarev arguments require the
  containment and nonemptiness hypotheses of the relevant source.
- Mazur–Rubin 2016 uses the signed difference of residual Selmer dimensions as core rank;
  Mazur–Rubin 2004 uses its positive part. The nonnegative signed-rank hypothesis cannot be
  replaced silently by the 2004 convention. ES.0/core-rank states the dictionary.
- Length is over the stated coefficient ring and can be infinite. A zero DVR leading class has
  infinite divisibility index; finite artinian divisibility is truncated at the coefficient
  length. Bounds distinguish a whole dual Selmer group, its quotient by its divisible part,
  and the torsion part of a Pontryagin dual.
- All source-qualified hypothesis records remain separate: MR2004 (H.0)–(H.6), MR2016
  (H.1)–(H.7), Rubin Hyp(K,T), Hyp(K,V) and their tower versions, Howard H.0–H.5, and the
  Burns–Sakamoto–Sano hypotheses. Residual irreducibility and absolute irreducibility differ.
  The reducible-residual error branch needs a weaker Cassels pairing than Howard H.1 supplies.
- Γ = Gal(K∞/K) ≅ Z_p^d, d ≥ 1; Λ = O[[Γ]] = lim_F O[Gal(F/K)], 𝔐 is its maximal ideal and J
  its augmentation ideal. Admissibility means that no finite prime splits completely. The
  anticyclotomic tower uses Howard's theory or Rubin's explicit condition (*), as appropriate.
- ι is the involution γ ↦ γ^{-1}. With 𝐓 = T ⊗_O Λ carrying the tautological action Ψ, Shapiro's
  map to corestriction Iwasawa cohomology is ι-semilinear: multiplication by γ corresponds to
  conjugation by γ^{-1}. Rubin's and Mazur–Rubin's dual Iwasawa modules are consequently related
  by an ι-twist. Transport both sides of a characteristic-ideal bound together.
- Rubin's ind_Λ(c) is an ideal of values of Λ-linear functionals, possibly nonprincipal.
  Mazur–Rubin's Ind(c) is its principal divisorial envelope, with Ind(0) = 0 under the corrected
  convention. For a principal ideal C, ind_Λ(c) ⊆ C iff Ind(c) ⊆ C. “char(B) divides a” means
  a ⊆ char(B), and Rubin sets char(B) = 0 for nontorsion B.
- Pseudo-null means annihilated by an ideal of height at least two for the finitely generated
  modules in use. In several variables this does not imply finiteness. The height-one prime
  of the coefficient uniformizer is ϖΛ; pΛ is prime in the Z_p-coefficient setting. Source
  perturbations written g+p^N retain that setting's hypotheses.
- Residual primitivity is nonvanishing in the generalized module KS‾(T̄); in core rank one it
  equals nonvanishing in KS(T̄). Λ-primitivity means no height-one prime in the blind spot.

## Sources and existing library inputs

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed `AUDIT-24` in
`data/library-coverage.json` reports every layer as not built, while identifying existing
algebra and discrete-cochain inputs. Those inputs are reused below. Continuous corestriction
for discrete modules does not yet provide all compact-coefficient, R-linear and field-subgroup
adapters needed by arithmetic systems.

The source identifiers below are those of the two packets. Identical texts retain their part's
identifier so that every node's citation resolves without changing the recorded editions.
Rubin citations use chapter-relative numbering of the public 1999 draft (II.3.3, VII.1.9);
the published book writes 2.3.3, 7.1.9. Mazur–Rubin's matching author-copy SHA identifies the same
PDF across the two URLs; their inherited page-count descriptions differ, so locators and the
file hash determine the cited text. Howard's published PDF and arXiv PDF remain separate
versions. Section-reading records below belong to the part planners/reviewers and do not assert
that the assembly reread every proof. Version-scoped source issues are listed after the layers.

- **`mr-ks`:** Barry Mazur and Karl Rubin, *Kolyvagin systems*. Memoirs of the American Mathematical Society 168 (2004), no. 799; authors' copy, 96 pp., read 2026-10-06 [Public source](https://web.archive.org/web/2020id_/https://www.math.uci.edu/~krubin/preprints/kolysys.pdf). SHA-256: `4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f`.

  Recorded source coverage: Chapters 1–3 in full (statements and proofs); Chapter 4: statements of §§4.1–4.5 and the proofs of 4.1.5, 4.1.7, 4.1.9, 4.1.16, 4.2.1–4.2.2, 4.4.1 (case k = 1); Chapter 5 §§5.1–5.2: statements and the proofs of 5.2.2, 5.2.9, 5.2.10, 5.2.14; §§6.1–6.2: Definitions 6.1.1, 6.2.1, Lemmas 6.1.5, 6.2.3, Propositions 6.1.6, 6.2.2, 6.2.6; Appendix A: Lemma A.1, Proposition A.2, Definition A.3, Theorem A.4 and the proof of Theorem 3.2.4; Not read: §5.3 (Iwasawa algebras, layer ES.8), Appendix B beyond its statements.

- **`rubin-es`:** Karl Rubin, *Euler systems*. Author's 1999 draft of Annals of Mathematics Studies 147 (Princeton University Press, 2000), 187 pp., read 2026-10-06; chapter-relative numbering as in the draft [Public source](https://swc-math.github.io/notes/files/99RubinES.pdf). SHA-256: `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`.

  Recorded source coverage: Chapter II §§1, 2 and 4 in full; §3 notation only; Chapter IV §1, §2, §3 (statements), §4 (Definitions 4.1, 4.4, 4.10, Lemmas 4.2, 4.12, 4.13, Propositions 4.5, 4.8 statements, Remarks 4.3, 4.11), §5 in full, §8 Corollary 8.1 statement; Chapter V: Lemmas 2.1, 2.3, 2.5, 3.1, 3.2 (statements) and Definition 2.4; Chapter IX §§1, 3, 4, 5 and Lemmas 6.1, 6.3, Corollary 6.4 (statements); Appendix A: Corollaries 2.6 and 2.7; Not read: Chapters III, VI–VIII, Appendices B–D, and the proofs in IV §§6–7 and V §§2–3 beyond their statements.

- **`mr-higher`:** Barry Mazur and Karl Rubin, *Controlling Selmer groups in the higher core rank case*. arXiv:1312.4052v1 (14 December 2013), 32 pp., read 2026-10-06; published in Journal de Théorie des Nombres de Bordeaux 28 (2016) [Public source](https://arxiv.org/abs/1312.4052v1). SHA-256: `15ec72e48fab1790e5b96e7172b4af88c974b0d487a515cdbd9dd0ced3ea4ee8`.

  Recorded source coverage: §§2–4 in full; §5: Definition 5.1, Lemma 5.2, Corollary 5.3, Theorem 5.4, Proposition 5.9; §§6–8: definitions and statements, proofs of Lemma 6.9 and Theorems 6.10, 7.4, 8.6; §§10–13: definitions and statements; Not read: §9, §14 and Appendix A beyond their statements.

- **`bss2`:** David Burns, Ryotaro Sakamoto and Takamichi Sano, *On the theory of higher rank Euler, Kolyvagin and Stark systems, II*. arXiv:1805.08448v1 (22 May 2018), 51 pp., read 2026-10-06; the only version on arXiv [Public source](https://arxiv.org/abs/1805.08448v1). SHA-256: `2f6da843d3dcedde65a2b04b80c711863306f9fd9ab20580d245d2c4d2f06429`.

  Recorded source coverage: §2.1 in full; §2.2 statements of Proposition 2.4, Corollaries 2.6, 2.7; §3.1 in full; Lemma 3.9 statement; §4: §4.1, Definition 4.1, Hypothesis 4.2, Remark 4.3, Corollary 4.5, Theorem 4.6 with proof, §4.3 Hypothesis 4.7, Remarks 4.8–4.9, Definition 4.11, Theorem 4.12; §5: §§5.1–5.3 definitions, Theorem 5.2, Definition 5.24, Theorem 5.25 (statements); §6: §6.1, §6.2, §6.3 (Lemma 6.9, Proposition 6.10), Hypothesis 6.11, Theorem 6.12, Corollaries 6.13, 6.15 (statements); §7: Theorem 7.1 statement; Not read: the proofs in §5.4 and §6.5.

- **`howard`:** Benjamin Howard, *The Heegner point Kolyvagin system*. Compositio Mathematica 140 (2004), 1439–1472, published version, read 2026-10-06 [Public source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf). SHA-256: `89082beb9117b111558f1c62356a0610602781ec2a2b3487ce561920cf4d78d7`.

  Recorded source coverage: §1.2 and §1.3 in full; §1.4: Proposition 1.4.1, Theorem 1.4.2 with proof; §1.5: Lemma 1.5.1, Definition 1.5.2, Lemma 1.5.3, Definition 1.5.4, Propositions 1.5.5, 1.5.9; §1.6: Theorem 1.6.1 statement and the outline of its proof; Not read: §1.7 and Section 2 (Heegner points and the Λ-adic theory).

- **`dk`:** Samit Dasgupta and Mahesh Kakde, *On the Brumer–Stark conjecture*. arXiv:2010.00657v3, 99 pp., read 2026-10-06; published in Annals of Mathematics 197 (2023), 289–388 [Public source](https://arxiv.org/abs/2010.00657v3). SHA-256: `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`.

  Recorded source coverage: §1.2 (equations (8)–(10), the Rubin–Brumer–Stark element, Rubin's lattice, Conjecture 1.5, Theorem 1.6).

- **`ltxzz`:** Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*. arXiv:1912.11942 (latest version, 179 pp.), read 2026-10-06; published in Inventiones mathematicae 228 (2022), 107–375 [Public source](https://arxiv.org/abs/1912.11942). SHA-256: `84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86`.

  Recorded source coverage: §2.1 Definition 2.1.6; §2.3: Definition 2.3.2, Lemmas 2.3.3–2.3.5 (statements); §2.4: Proposition 2.4.6 (statement); §2.6: Definitions 2.6.3, 2.6.5, Lemma 2.6.4, Propositions 2.6.6, 2.6.7 (statements and the first lines of the proofs); The statements were read together with the reviewed extraction research/blueprint/papers/PAPER-LIU-ETAL-22.result.json, whose corrections E1, E2 and E23 are used.

- **`cgls`:** Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*. arXiv:2008.02571v2 (authors' final version), 34 pp., read 2026-10-06; published in Inventiones mathematicae 227 (2022), 517–580 [Public source](https://arxiv.org/abs/2008.02571v2). SHA-256: `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59`.

  Recorded source coverage: §3.2: Theorem 3.2.1; §3.3: statements of Lemma 3.3.1, Proposition 3.3.2, Lemmas 3.3.3–3.3.4, Proposition 3.3.6, Corollary 3.3.7, Theorem 3.3.8, Lemma 3.3.9; Read together with the reviewed extraction research/blueprint/papers/PAPER-CASTELLA-ETAL-22.result.json (items 18–23).

- **`rubin-euler-systems-1999`:** Karl Rubin, *Euler systems*. Author's 1999 draft of Annals of Mathematics Studies 147 (Princeton University Press, 2000); 187 pp., TeX output of 4 August 1999. Numbering II.3.x etc.; the published text numbers the same results 2.3.x. [Public source](https://swc-math.github.io/notes/files/99RubinES.pdf). SHA-256: `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`.

  Recorded source coverage: Ch. II §§1–4 in full (pp. 21–31); Ch. VI in full (pp. 89–96); Ch. VII §§1–4 in full (pp. 97–111); §5 Propositions 5.1–5.2 with proofs; §6 Lemma 6.1 and the special case; §7 Lemma 7.1 with proof and the statements of 7.2–7.7 (pp. 111–122); Ch. IX §2 (p. 136); Appendix C §2, Theorem 2.1 and Corollary 2.2 (pp. 161–162).

- **`rubin-euler-systems-2000`:** Karl Rubin, *Euler systems*. Published version, Annals of Mathematics Studies 147 (Princeton University Press, 2000), xi + 227 pp.; the author's file hosted by W. Stein. Its text layer is unreadable, so only page images were read. [Public source](https://www.wstein.org/people/rubin/book/hEulerSystems.pdf). SHA-256: `1b0229731e38bfaaa55b38a219c055019d1c7db1f0ecec3c083125da87b6e8e4`.

  Recorded source coverage: Page images of printed pp. 36, 41, 42 and 43: Remark 2.1.5, Hypotheses Hyp(K∞/K), Hyp(K∞, T), Hyp(K∞, V), Definition 2.3.1, Theorems 2.3.2–2.3.4, Remarks 2.3.5–2.3.6, Proposition 2.3.7 with proof and Theorem 2.3.8 with proof.

- **`mazur-rubin-kolyvagin-systems`:** Barry Mazur, Karl Rubin, *Kolyvagin systems*. Authors' version dated 20 October 2003 (102 pp.) of Memoirs of the American Mathematical Society 168 (2004), no. 799; the publisher's text (doi:10.1090/memo/0799) was not available. [Public source](https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf). SHA-256: `4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f`.

  Recorded source coverage: Introduction on blind spots (pp. 6–7); §3.1 Definitions 3.1.3–3.1.6 and Remark 3.1.4 (pp. 20–21); §3.2 Definitions 3.2.1–3.2.2, Remark 3.2.3, Theorem 3.2.4 (pp. 23–24); §3.5 hypotheses (H.0)–(H.6) (pp. 27–28); §5.3 in full, Lemma 5.3.1 to Question 5.3.21 (pp. 60–68); Appendix A, proof of Theorem 3.2.4 (start) and proof of Theorem 5.3.3 (pp. 79–82).

- **`howard-heegner-point-kolyvagin-system`:** Benjamin Howard, *The Heegner point Kolyvagin system*. arXiv:1202.6340v1 (28 February 2012); published in Compositio Mathematica (2004), no. 6, 1439–1472 [Public source](https://arxiv.org/pdf/1202.6340v1). SHA-256: `d2d06e851d6aa1fdc33a932b69b5c06a8c56dc2d9e05fb10d97c0358d6d6ea9a`.

  Recorded source coverage: §2 introduction, §2.1 (Definition 2.1.2, Lemma 2.1.1, Proposition 2.1.3 with proof), §2.2 in full (Definitions 2.2.1–2.2.6, Proposition 2.2.4, Lemma 2.2.7, Proposition 2.2.8, Lemma 2.2.9, Theorem 2.2.10 with proof) (pp. 22–28).

- **`buyukboduk-lambda-adic-kolyvagin-systems`:** Kâzım Büyükboduk, *Λ-adic Kolyvagin systems*. arXiv:0706.0377v2 (30 March 2011); published in International Mathematics Research Notices (2011), doi:10.1093/imrn/rnq186 [Public source](https://arxiv.org/pdf/0706.0377v2). SHA-256: `645d299256ae61e1bfd63564c68510785a39e52684cbaa720d7d6017fe1f5bf2`.

  Recorded source coverage: §1 Introduction (pp. 1–5); §2.1–2.2 (pp. 5–6); Remark 2.32 (p. 17); §3.2 end: Theorem 3.23, Remarks 3.24–3.25 (pp. 26–27); §4.1 Propositions 4.1–4.2 with proofs, Remark 4.3 (pp. 28–30).

- **`castella-grossi-lee-skinner-eisenstein`:** Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*. arXiv:2008.02571v2 (14 September 2021, final version); published in Inventiones Mathematicae 227 (2022), 517–580 [Public source](https://arxiv.org/pdf/2008.02571v2). SHA-256: `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59`.

  Recorded source coverage: §3 opening, §3.1 (Definition 3.1.1), §3.2 (Theorem 3.2.1 and its setting), §3.4 in full (Theorem 3.4.1 with proof, Corollary 3.4.2 with proof) (pp. 15–17, 26–27); §4.1 Theorem 4.1.1 statement (p. 27).

### Library declarations reused

| Reference | Module at the pinned commit | Input supplied |
| --- | --- | --- |
| `mathlib:Squarefree` | `Mathlib/Algebra/Squarefree/Basic.lean` | Squarefree elements of a monoid; used for the index set N(P) of squarefree products. |
| `mathlib:Module.length` | `Mathlib/RingTheory/Length.lean` | The length of a module as an element of ℕ∞. |
| `mathlib:LinearMap.charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` | The characteristic polynomial of an endomorphism of a finite free module; the Euler polynomials are its reversals. |
| `mathlib:LinearMap.aeval_self_charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` | Cayley–Hamilton: aeval f f.charpoly = 0. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The group ring k[G], in which N_Γ and D_σ live. |
| `mathlib:Representation.norm` | `Mathlib/RepresentationTheory/Basic.lean` | For a representation ρ of a finite group, norm ρ = Σ_g ρ g. |
| `mathlib:SimpleGraph` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean` | Simple graphs; the graph X(P) is one. |
| `mathlib:exteriorPower.pairingDual` | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean` | The linear map ⋀^n(Dual R M) → Dual R (⋀^n M), with pairingDual (ιMulti f) (ιMulti v) = det(f j (v i)). |
| `mathlib:exteriorPower.bijective_pairingDual` | `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean` | pairingDual R M n is bijective for M finite free. |
| `mathlib:exteriorPower.map` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` | Functoriality of exterior powers. |
| `mathlib:Module.Dual` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | The dual module M →ₗ[R] R. |
| `mathlib:Module.IsReflexive` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | Reflexive modules: evaluation M → Dual (Dual M) is bijective. |
| `mathlib:Module.Injective` | `Mathlib/Algebra/Module/Injective.lean` | Injective modules; R self-injective is Module.Injective R R. |
| `tauceti:TauCeti.ContCohomology.explicitCor1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean` | Corestriction H¹(U, M) → H¹(G, M) for a finite-index subgroup, on continuous cochains of discrete modules. |
| `tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean` | cor ∘ res = multiplication by the index on H¹. |
| `tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0` | `TauCeti/RepresentationTheory/Homological/ContCohomology/DeltaNaturality.lean` | Corestriction commutes with the connecting map δ⁰ of a short exact sequence of discrete modules (Rubin, Proposition IV.4.5(iii)). |
| `tauceti:NumberField.Chebotarev.frobeniusPrimeSet` | `TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean` | The set of primes of K unramified in L whose Artin symbol is a given conjugacy class. |
| `tauceti:NumberField.artinSymbol` | `TauCeti/NumberTheory/NumberField/ArtinSymbol.lean` | The Artin symbol (Frobenius conjugacy class) of an unramified prime in a finite Galois extension of number fields. |
| `tauceti:TauCeti.GlobalNumberFields.RayClassGroup` | `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean` | The ray class group of a modulus: ideals prime to the modulus modulo the ray. |
| `mathlib:PontryaginDual` | `Mathlib/Topology/Algebra/PontryaginDual.lean` | The Pontryagin dual A →ₜ* Circle of a topological group; Hom(·, Q_p/Z_p) of a discrete p-primary module is its p-part, as SelmerIwasawaCohomology L2 records. |
| `mathlib:Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean` | The ideal generated by a set, used to define ind_Λ(x) as the span of {φ(x)}. |
| `mathlib:Module.IsTorsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | A torsion module: every element is killed by a non-zero-divisor; for the domain Λ this is 'torsion Λ-module' in Rubin and Mazur–Rubin. |
| `mathlib:Submodule.torsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | The torsion submodule (killed by some non-zero-divisor), H¹_∞(K, T)_{Λ-tors} and (H¹/Λc)_tors. |
| `mathlib:Ideal.height` | `Mathlib/RingTheory/Ideal/Height.lean` | The height of an ideal (infimum of the heights of its minimal primes), for 'height at least two' and 'height-one prime'. |
| `mathlib:IsIntegralClosure` | `Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Defs.lean` | The characteristic predicate of an integral closure, for S_𝔓 = integral closure of Λ/𝔓 in its fraction field. |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | A local PID that is not a field; S_𝔓 is one. |
| `mathlib:Polynomial.IsDistinguishedAt` | `Mathlib/RingTheory/Polynomial/Eisenstein/Distinguished.lean` | Monic polynomials with non-leading coefficients in an ideal; the generators g and g + p^N of height-one primes and their perturbations. |
| `mathlib:UniqueFactorizationMonoid` | `Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean` | Unique factorization, used for gcds in Ind(c) and for principal characteristic ideals; Mathlib/RingTheory/PowerSeries/Ideal.lean gives the instance for R⟦X⟧ over a principal ideal domain (one variable only). |
| `mathlib:PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | O⟦X⟧, the model of Λ for d = 1 (via PadicMeasuresIwasawaAlgebras L4), noetherian and factorial over a DVR. |
| `mathlib:MvPowerSeries` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | O⟦X_1, …, X_d⟧, the model of Λ for Z_p^d; no factoriality instance at the pinned commit, which is why the multivariable structure theory is requested from PadicMeasuresIwasawaAlgebras L4. |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | Noetherian local rings whose maximal ideal is generated by dim R elements; O⟦Z_p^d⟧ is one of dimension d + 1 (not proved at the pinned commit). |
| `mathlib:Module.length_eq_add_of_exact` | `Mathlib/RingTheory/Length.lean` | Additivity of length in short exact sequences. |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finitely generated modules (X∞, H¹_∞(K, T), H¹(Q, 𝐓)). |

## Layer overview

| Layer | Purpose | Nodes | Planets | Recorded coverage |
| --- | --- | ---: | ---: | --- |
| ES.0 | Coefficient data, quotient propagation and Selmer interfaces | 17 | 6 | partial |
| ES.1 | Auxiliary primes and local comparison maps | 14 | 3 | planned |
| ES.2 | Euler-system modules and norm relations | 8 | 3 | planned |
| ES.3 | Derivative operators and corrected Kolyvagin classes | 11 | 5 | planned |
| ES.4 | Core vertices, descent and error-tolerant bounds | 12 | 5 | partial |
| ES.5 | Primitivity and sharpness over discrete valuation rings | 9 | 5 | planned |
| ES.6 | Exterior biduals, Stark systems and Gorenstein coefficients | 8 | 4 | partial |
| ES.7 | Higher-rank derivatives and Fitting-ideal control | 5 | 4 | partial |
| ES.8 | Rank-one Iwasawa variation and application handoffs | 35 | 6 | planned |

The finite-level route is ES.0 → ES.1 → ES.2 → ES.3 → ES.4 → ES.5, with exact prerequisites
at each node. ES.6–ES.7 branch to higher rank; ES.8 returns to ES.0–ES.5. Its two reading sections
ES.8a and ES.8b are proposed sublayers, and all node IDs retain their existing ES.8 parent.
There are 119 nodes, 370 proposed API items and 222 tests. Definitions and constructions state
their use-driven API; theorem nodes give source-qualified proof outlines and acceptance tests.
These are planning declarations, with implementation status `unchecked`.

The assembled reader synchronizes the packets after independent review. ES.0–ES.7 retains its
`needs_changes` verdict and partial coverage; ES.8 retains its accepted target-level verdict.
The assembly does not certify that the roadmap has no gaps. In particular, many arithmetic
signatures remain comments in the suggested file: compilation of its algebraic prototype does
not meet the full signature requirement of PROTOCOL §13.

Each node below includes its exact ID, statement, hypotheses, proof/construction outline, uses,
API, tests, acceptance criteria and prerequisites as recorded in the packet. A prerequisite is
a planned supplier result unless prefixed `mathlib:` or a pinned Tau Ceti declaration. An open
supplier request is not a proved dependency. Cross-part references in ES.8 name the ES.0–ES.5
nodes actually supplying the input, including ES.3's general Kolyvagin-system module.

## ES.0. Coefficient data, quotient propagation and Selmer interfaces

This layer fixes the data on which everything else is built: Selmer triples, the category of quotients of `T`, cartesian local conditions, the core rank with its Euler-characteristic formula, the canonical Selmer structure, and the hypothesis records. Selmer structures themselves, their propagation and their duals are imported from `SelmerIwasawaCohomology:L2` and `L1`; the Greenberg–Wiles formula from `ArithmeticGaloisDuality:R02.5`. The two hypothesis records refer to the primes and ideals of ES.1. The worked examples compute the core rank and the propagated conditions for a twist of `ℤ_p(1)` and for an elliptic curve, and exhibit the hypothesis that fails for the trivial character.

**Planets of this layer:** Selmer triple; Cartesian local condition; Core rank; Canonical Selmer structure; Mazur–Rubin hypotheses (H.0)–(H.6); Mazur–Rubin hypotheses over number fields.

### Selmer triples and squarefree conductors

`EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple` — definition

**Planet:** Selmer triple.

**Statement.** Fix a number field K, a prime p and a coefficient ring R: a complete noetherian local ring with maximal ideal m and finite residue field k = R/m of characteristic p. A Selmer triple (T, F, P) consists of a free R-module T of finite rank with a continuous R-linear action of G_K unramified outside finitely many primes, a Selmer structure F on T (a finite set Σ(F) of places containing the archimedean places, the places above p and the primes where T is ramified, with an R-submodule H¹_F(K_v, T) ⊆ H¹(K_v, T) for v ∈ Σ(F), and the unramified condition elsewhere), and a set P of primes of K disjoint from Σ(F). N(P) is the set of squarefree products of primes of P, with 1 ∈ N(P), and ν(n) is the number of prime factors of n. Selmer data (T, F, P, r) add an integer r ≥ 1. The dual is T^* = Hom(T, μ_{p^∞}) with the dual structure F^*.

**Hypotheses.**

- R is complete noetherian local with finite residue field of characteristic p
- T is free of finite rank over R
- P ∩ Σ(F) = ∅

**Construction.**

1. The Selmer structure, its Selmer module H¹_F(K, T) and the dual structure F^* are those of SelmerIwasawaCohomology L2 (dual-selmer-structure); this node only adds the prime set P and the index set N(P).
2. N(P) is the set of finite subsets of P, written multiplicatively; divisibility is inclusion and ν is cardinality.
3. Mazur–Rubin 2004 take K = ℚ (Chapter 2 and the first lines of Chapter 3); Mazur–Rubin 2016 Definition 4.1 states the same data over a number field K, and Howard Definition 1.2.1 over an imaginary quadratic field with P ⊆ the rational primes inert in K.

**Uses that determine the API.**

- Mazur–Rubin 2004, Definitions 3.1.2–3.1.3: the vertices of the graph X(P) are the elements of N(P), and a Kolyvagin system has one class for each of them
- Mazur–Rubin 2016, Definition 6.8: Stark systems are an inverse limit over N(P) ordered by divisibility
- Howard, Definition 1.2.3: Kolyvagin systems over an imaginary quadratic field are indexed by N(L) for a set L of inert rational primes

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.SelmerTriple` | structure | The triple (T, F, P): a Selmer structure F on T together with a set P of primes disjoint from Σ(F). |
| `TauCeti.KolyvaginSystems.SelmerTriple.conductors` | data | N(P): the squarefree products of primes of P, as finite subsets of P. |
| `TauCeti.KolyvaginSystems.SelmerTriple.one_mem_conductors` | simp | 1 ∈ N(P). |
| `TauCeti.KolyvaginSystems.SelmerTriple.conductors_dvd_closed` | characterisation | If n ∈ N(P) and m \| n then m ∈ N(P). |
| `TauCeti.KolyvaginSystems.SelmerTriple.restrictPrimes` | functoriality | For P′ ⊆ P, (T, F, P′) is a Selmer triple and N(P′) ⊆ N(P). |
| `TauCeti.KolyvaginSystems.SelmerTriple.dual` | constructor | The Cartier dual data (T^*, F^*, P) use the imported discrete Selmer carrier, with Σ(F^*) = Σ(F). For a DVR lattice T, T^* = Hom(T, μ_{p^∞}) is discrete torsion, not a finite free lattice and hence not an object of the same lattice-triple type. Over a principal artinian ring, the finite Cartier dual is free of the same rank after the coefficient duality identification. |

**Unit tests.**

- `SelmerTriple.conductors_empty` (degenerate): For P = ∅, N(P) = {1}.
- `SelmerTriple.card_conductors_of_finite` (computation): If P has exactly two primes q₁, q₂ then N(P) = {1, q₁, q₂, q₁q₂} has four elements, and ν takes the values 0, 1, 1, 2.
- `SelmerTriple.not_mem_conductors_of_sq` (non-example): For q ∈ P the ideal q² is not in N(P).
- `SelmerTriple.disjoint_sigma` (characterisation): No prime of Σ(F) divides any n ∈ N(P); in particular T is unramified at every prime dividing n and no such prime lies above p.

**Acceptance.**

- For P = ∅ one has N(P) = {1} and a Selmer triple is a Selmer structure.
- N(P) is closed under taking divisors, and n, nq ∈ N(P) with q prime implies q ∈ P and q ∤ n.

**Prerequisites.**

- `SelmerIwasawaCohomology:L2/dual-selmer-structure`
- `SelmerIwasawaCohomology:L2/selmer-kernel`
- `mathlib:Squarefree`

**Sources.**

- `mr-ks`, Chapter 3, first paragraph, p. 19. Definition of a Selmer triple over ℚ. Source excerpt: “A Selmer triple is a triple (T, F, P) where F is a Selmer structure on T and P is a set of rational primes, disjoint from Σ(F).”
- `mr-higher`, Definition 4.1, p. 8. The same data over a number field K, with the rank r. Source excerpt: “By Selmer data we mean a tuple (T, F , P, r) where”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The category of quotients of T

`EulerSystemsAndKolyvaginSystems:ES.0/quotient-category` — definition

**Statement.** Quot_R(T) is the category whose objects are the quotients T/IT for all ideals I of R, and whose morphisms from T/IT to T/JT are the scalar multiplications by elements r ∈ R with rI ⊆ J. A local condition propagated from T to all quotients (images under T → T/IT) is functorial over Quot_R(T). For R principal artinian of length k with uniformiser π, the objects are T/m^iT for 0 ≤ i ≤ k, and multiplication by π^{j−i} is an injective morphism T/m^iT → T/m^jT for i ≤ j.

**Hypotheses.**

- R as in selmer-triple; T an R[[G_K]]-module

**Construction.**

1. Objects are indexed by ideals; a morphism is a class of scalars r modulo the scalars acting by the same map, so that composition is multiplication.
2. Functoriality of propagated conditions: for r with rI ⊆ J, multiplication by r maps the image of H¹_F(K_v, T) in H¹(K_v, T/IT) into its image in H¹(K_v, T/JT), since r commutes with T → T/IT and T → T/JT.

**Uses that determine the API.**

- Mazur–Rubin 2004, Definition 1.1.4 and hypothesis (H.6): the category on which local conditions are required to be cartesian
- Mazur–Rubin 2004, Lemma 1.1.5: the injections π^j : T/m^iT → T/m^{i+j}T give the exact sequences behind the linear growth of lengths

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.QuotCat` | structure | The category Quot_R(T): objects the ideals I of R (standing for T/IT), morphisms I → J the scalars r with rI ⊆ J acting T/IT → T/JT. |
| `TauCeti.KolyvaginSystems.QuotCat.scalarHom` | constructor | For r ∈ R with r·I ≤ J, the G_K-equivariant R-linear map T/IT → T/JT induced by multiplication by r. |
| `TauCeti.KolyvaginSystems.QuotCat.scalarHom_comp` | functoriality | scalarHom s ∘ scalarHom r = scalarHom (sr), and scalarHom 1 is the identity of T/IT. |
| `TauCeti.KolyvaginSystems.QuotCat.scalarHom_injective_iff` | characterisation | For T free and nonzero, multiplication by r : T/IT → T/JT is injective if and only if (J : r) = I. |
| `TauCeti.KolyvaginSystems.QuotCat.propagate_functorial` | compatibility | A local condition propagated to quotients is a subfunctor of H¹(K_v, −) on Quot_R(T). |

**Unit tests.**

- `QuotCat.field_objects` (degenerate): If R is a field, the objects of Quot_R(T) are T/0 = T and T/R·T = 0.
- `QuotCat.zmod_sq_mul_p_injective` (computation): For R = ℤ/p² and T = R, multiplication by p is a morphism T/pT → T and is injective with image pT.
- `QuotCat.not_hom_of_not_le` (non-example): For R = ℤ/p² the scalar 1 is not a morphism from T/pT to T, because 1·(p) ⊄ (0).

**Acceptance.**

- Over a field R = k the category has the two objects 0 and T.
- For R = ℤ/p², the map p : T/pT → T is a morphism and is injective when T is free.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `SelmerIwasawaCohomology:L2/condition-propagation`

**Sources.**

- `mr-ks`, Example 1.1.3, p. 8. Definition of the category of quotients. Source excerpt: “Let QuotR (T ) be the category whose objects are quotients T /IT for all ideals I of R, and where the morphisms from T /IT to T /JT consist of all scalar multiplications r such that rI ⊂ J.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Cartesian local conditions

`EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition` — definition

**Planet:** Cartesian local condition.

**Statement.** A local condition F at a place v, functorial over a category 𝒯 of R[[G_{K_v}]]-modules, is cartesian on 𝒯 if for every injective morphism α : T₁ → T₂ of 𝒯 the square formed by H¹_F(K_v, T₁) ⊆ H¹(K_v, T₁) and H¹_F(K_v, T₂) ⊆ H¹(K_v, T₂) is cartesian: H¹_F(K_v, T₁) is the inverse image of H¹_F(K_v, T₂) under α_*. A Selmer structure F on T is cartesian if for every q ∈ Σ(F) the condition at q, propagated to quotients, is cartesian on Quot_R(T).

**Hypotheses.**

- F is functorial over 𝒯

**Construction.**

1. Equivalently, for injective α the condition on T₁ equals the condition propagated backwards from T₂ (inverse image), as in SelmerIwasawaCohomology L2/condition-propagation.
2. The unramified (finite) condition is cartesian on unramified modules: for injective T₁ → T₂ the map Hom(I, T₁) → Hom(I, T₂) is injective (Mazur–Rubin 2004, Lemma 1.1.9).
3. If R is a discrete valuation ring and H¹(K_q, T)/H¹_F(K_q, T) is torsion-free for q ∈ Σ(F), the structures induced on T/m^kT are cartesian (Lemma 3.7.1(i)); cartesianness passes from T to T/m^jT (Lemma 3.7.3).

**Uses that determine the API.**

- Mazur–Rubin 2004, Lemma 1.1.5 and Theorem 4.1.5: exactness in the middle of the sequence of propagated conditions, which makes lengths linear in the modulus and the core rank well defined
- Mazur–Rubin 2016, hypothesis (H.5): the running hypothesis that the Selmer structure is cartesian
- Howard, hypothesis H.3: the same condition on Quot(T) at every v ∈ Σ(F)

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.IsCartesian` | structure | The predicate: for every injective morphism α of Quot_R(T), H¹_F(K_v, T₁) = α_*⁻¹(H¹_F(K_v, T₂)). |
| `TauCeti.KolyvaginSystems.isCartesian_iff_comap` | characterisation | F is cartesian iff for all i ≤ j the condition on T/m^iT is the inverse image of the condition on T/m^jT under π^{j−i} (R principal artinian). |
| `TauCeti.KolyvaginSystems.isCartesian_unramified` | example | The finite condition is cartesian on any category of unramified modules. |
| `TauCeti.KolyvaginSystems.isCartesian_of_field` | example | If R is a field every local condition on T is cartesian on Quot_R(T). |
| `TauCeti.KolyvaginSystems.isCartesian_of_torsionFree_quotient` | compatibility | R a discrete valuation ring and H¹(K_q, T)/H¹_F(K_q, T) torsion-free imply that the induced condition on T/m^kT is cartesian on Quot(T/m^kT) for every k. |
| `TauCeti.KolyvaginSystems.IsCartesian.quotient` | functoriality | If F is cartesian on Quot_R(T) then the induced condition is cartesian on Quot_{R/m^j}(T/m^jT). |

**Unit tests.**

- `isCartesian_strict_and_relaxed_field` (degenerate): For R = 𝔽_p and T = 𝔽_p the strict and the relaxed conditions are both cartesian.
- `isCartesian_unramified_zmod` (compatibility): For K_v = ℚ_ℓ, ℓ ≠ p, R = ℤ/p^k and T = R with trivial action, the unramified condition Hom(G_{𝔽_ℓ}, T/p^iT) is cartesian: a homomorphism to ℤ/p^i whose composite with p^{j−i} : ℤ/p^i → ℤ/p^j is unramified is unramified.
- `not_isCartesian_torsion_condition` (non-example): For R = ℤ/p², T = R with trivial action and H¹_F(K_v, T) = H¹(K_v, T)[p], the propagated condition on T/pT is 0 (a homomorphism killed by p has values in pT), while the inverse image of H¹_F(K_v, T) under p : T/pT → T is all of H¹(K_v, T/pT) = Hom(G_{K_v}, 𝔽_p) ≠ 0. So F is not cartesian.
- `isCartesian_iff_torsionFree_example` (characterisation): For R = ℤ_p and T = ℤ_p(1) over ℚ_ℓ, ℓ ≠ p, the condition ker(H¹(ℚ_ℓ, T) → H¹(ℚ_ℓ^{ur}, T ⊗ ℚ_p)) has torsion-free quotient, and its propagation to T/p^k is cartesian.

**Acceptance.**

- The unramified condition on unramified modules is cartesian; over a field every condition is cartesian.
- A condition defined by an extension L/K_v need not be cartesian (Mazur–Rubin 2004, Remark 1.1.8); the non-example test below exhibits a failure.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`
- `SelmerIwasawaCohomology:L2/condition-propagation`
- `SelmerIwasawaCohomology:L2/unramified-condition`
- `SelmerIwasawaCohomology:L2/lattice-passage`

**Sources.**

- `mr-ks`, Definition 1.1.4, p. 8. The definition, in its equivalent form. Source excerpt: “Equivalently, F is cartesian on T if whenever α : T1 → T2 is injective, the local condition F on T1 is the same as the local condition obtained by propagating F from T2 to T1 .”
- `mr-higher`, Definition 3.1 and Remark 3.2, p. 7. Cartesian Selmer structures and the two standard sufficient conditions. Source excerpt: “If R is a field (i.e., m = 0) then every Selmer structure on T is cartesian.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Lengths of cartesian conditions grow linearly

`EulerSystemsAndKolyvaginSystems:ES.0/cartesian-length-linearity` — lemma

**Statement.** Let R be principal artinian of length k and F a local condition on T at v, cartesian on Quot_R(T). Then there is an integer r such that length H⁰(K_v, T/m^iT) − length H¹_F(K_v, T/m^iT) = r·i for 0 < i ≤ k.

**Hypotheses.**

- R principal artinian of length k
- F cartesian on Quot_R(T)
- T free of finite rank

**Proof outline.**

1. For i + j ≤ k the sequence 0 → T/m^i → T/m^{i+j} → T/m^j → 0 gives a six-term exact sequence of H⁰ and H¹_F: exactness in the middle of the H¹_F terms is the cartesian condition for π^j, and surjectivity on the right is the definition of propagation to a quotient.
2. Hence λ(i) + λ(j) = λ(i + j) for λ(i) = length H⁰ − length H¹_F, so λ(i) = i·λ(1).

**Acceptance.**

- For the unramified condition on an unramified T one gets r = 0, since H¹_f(K_v, T) ≅ T/(Fr − 1)T has the length of T^{Fr=1}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `mathlib:Module.length`

**Sources.**

- `mr-ks`, Lemma 1.1.5, p. 8. Statement and proof of the linearity. Source excerpt: “Thus λ(i) + λ(j) = λ(i + j), and the lemma follows.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Propagation commutes with local duality

`EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation` — lemma

**Statement.** Let F be a local condition on T at v and I an ideal of R. The two local conditions induced on T^*[I] = (T/IT)^* agree: the orthogonal complement of the condition propagated to the quotient T/IT, and the condition propagated to the submodule T^*[I] from the orthogonal complement F^* on T^*. Consequently, for a Selmer structure F, (F on T/IT)^* = (F^* on T^*[I]), and the same holds for the passages T → V and V → V/T of a lattice in its rational representation.

**Hypotheses.**

- Local Tate duality for T and T^* = Hom(T, μ_{p^∞}) at v

**Proof outline.**

1. The local pairings for T/IT × T^*[I] and T × T^* are compatible with T → T/IT and T^*[I] → T^* (SelmerIwasawaCohomology L1/lattice-pairing-compatibility).
2. Apply the image/inverse-image rule for orthogonal complements (orthogonal_map_eq_comap of L1/orthogonal-complement): (image of L)^⊥ = inverse image of L^⊥.
3. The lattice case T ⊆ V and W = V/T is L2/lattice-passage together with L2/finite-condition-lattice-duality.

**Acceptance.**

- For F relaxed on T both constructions give the strict condition on T^*[I]; for F strict both give the relaxed condition.
- The condition on a quotient remembers T: H¹_{F_can}(ℚ_p, T/IT) is the image of H¹(ℚ_p, T), which can be smaller than H¹(ℚ_p, T/IT) (Mazur–Rubin 2004, Definition 3.2.1 and Lemma A.1).

**Prerequisites.**

- `SelmerIwasawaCohomology:L1/orthogonal-complement`
- `SelmerIwasawaCohomology:L1/lattice-pairing-compatibility`
- `SelmerIwasawaCohomology:L2/condition-propagation`
- `SelmerIwasawaCohomology:L2/dual-selmer-structure`
- `SelmerIwasawaCohomology:L2/finite-condition-lattice-duality`

**Sources.**

- `mr-ks`, Example 1.3.3, p. 12. The square relating propagation and orthogonal complements. Source excerpt: “It is an easy exercise to show that these give the same local condition on T ∗ [I].”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Selmer modules of quotients and torsion submodules

`EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification` — lemma

**Statement.** Assume T̄^{G_K} = (T̄^*)^{G_K} = 0 for T̄ = T/mT (which follows from (H.1) and (H.3) of Mazur–Rubin 2004). (a) For every ideal I of R, T^*[I] → T^* induces an isomorphism H¹_{F^*}(K, T^*[I]) ≅ H¹_{F^*}(K, T^*)[I]. (b) If R is principal artinian of length k and F is cartesian, then for 0 < i ≤ k the injection π^{k−i} : T/m^iT → T induces isomorphisms H¹(K, T/m^iT) ≅ H¹(K, T)[m^i] and H¹_F(K, T/m^iT) ≅ H¹_F(K, T)[m^i], and H¹_F(K, T)[m^i] is the kernel of H¹_F(K, T) → H¹_F(K, T/m^{k−i}T).

**Hypotheses.**

- (T/mT)^{G_K} = (T^*[m])^{G_K} = 0
- for (b): R principal artinian, F cartesian on Quot_R(T)

**Proof outline.**

1. S^{G_K} = 0 for every subquotient S of T or T^* (Mazur–Rubin 2004, Lemmas 2.1.4 and 3.5.2).
2. (a) for I = (β): the sequences 0 → T^*[I] → T^* → IT^* → 0 and 0 → IT^* → T^* give H¹(G, T^*[I]) ≅ H¹(G, T^*)[I]; induct on the number of generators; the Selmer conditions agree because F^* on T^*[I] is the inverse image.
3. (b): the same argument with 0 → T/m^i → T → T/m^{k−i} → 0; the local conditions match by cartesianness at Σ(F) and by Lemma 1.1.9 at the unramified places.

**Acceptance.**

- For T = μ_{p^k} ⊗ ρ^{-1} with ρ ≠ 1, ω, both identifications hold (Mazur–Rubin 2004, Lemma 6.1.5).
- Without the invariants hypothesis the statement fails: for T = ℤ/p² with G_K acting through a nontrivial character χ ≡ 1 (mod p), the connecting map (T/pT)^{G_K} → H¹(K, T/pT) is nonzero, so H¹(K, T/pT) → H¹(K, T)[p] is not injective.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `SelmerIwasawaCohomology:L2/condition-propagation`
- `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`

**Sources.**

- `mr-ks`, Lemma 3.5.3, p. 28. Part (a). Source excerpt: “Suppose that (H.1) and (H.3) hold, and I is an ideal of R. Then the inclusion T ∗ [I] ,→ T ∗ induces an isomorphism”
- `mr-ks`, Lemma 3.5.4, p. 29. Part (b). Source excerpt: “Suppose R is artinian and principal of length k, T satisfies (H.0), (H.1), (H.3), and (H.6), 0 < i ≤ k, and π is a generator of m.”
- `mr-higher`, Proposition 3.3(i)–(ii), p. 7. The same statements over a number field under the invariants hypothesis alone. Source excerpt: “F is a cartesian Selmer structure on T , and T GK = (T ∗ )GK = 0”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The Euler characteristic formula for Selmer modules

`EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference` — theorem

**Statement.** Let T be a finite R[[G_K]]-module and F a Selmer structure on T. Then length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = length H⁰(K, T) − length H⁰(K, T^*) − Σ_{v ∈ Σ(F)} (length H⁰(K_v, T) − length H¹_F(K_v, T)), all lengths over R.

**Hypotheses.**

- T finite
- lengths taken over R (for R = ℤ/p^k these are p-adic valuations of orders)

**Proof outline.**

1. This is the Greenberg–Wiles formula (ArithmeticGaloisDuality R02.5/greenberg-wiles-formula) for M = T, L_v = H¹_F(K_v, T), rewritten additively.
2. To pass from orders to R-lengths apply the formula to T as an R-module: every group in it is an R-module of finite length and #B = (#k)^{length_R B}; the factors at v ∉ Σ(F) are 1 because #H¹_ur(K_v, T) = #H⁰(K_v, T).
3. Mazur–Rubin state it over ℚ and include p = 2; the archimedean term uses ordinary H⁰(K_v, T).

**Acceptance.**

- For K = ℚ, R = 𝔽_p, T = μ_p with the relaxed condition at p and strict at ∞ (p odd), the left side is dim (ℤ[1/p]^×/p) − dim H¹_{F^*}(ℚ, ℤ/p) = 1 − 0 and the right side is 0 − 1 − ((0 − 2) + (0 − 0)) = 1: the term at p is length H⁰(ℚ_p, μ_p) − length H¹(ℚ_p, μ_p) = 0 − 2 and the term at ∞ is 0 − 0.

**Prerequisites.**

- `ArithmeticGaloisDuality:R02.5/greenberg-wiles-formula`
- `SelmerIwasawaCohomology:L2/dual-selmer-structure`
- `mathlib:Module.length`

**Sources.**

- `mr-ks`, Proposition 2.3.5, p. 17. The finite-level Euler characteristic formula. Source excerpt: “The next proposition is Proposition 1.6 of [Wi], adapted to include the case p = 2. It is a consequence of Poitou-Tate global duality, and the proof is the same as in [Wi].”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The core rank of a cartesian Selmer structure

`EulerSystemsAndKolyvaginSystems:ES.0/core-rank` — definition

**Planet:** Core rank.

**Statement.** Let R be principal artinian of length k, F a cartesian Selmer structure on T, and T^{G_K} = (T^*)^{G_K} = 0. There is a unique integer r such that H¹_F(K, T) ≅ H¹_{F^*}(K, T^*) ⊕ R^r if r ≥ 0 and H¹_F(K, T) ⊕ R^{−r} ≅ H¹_{F^*}(K, T^*) if r ≤ 0 (noncanonically). Mazur–Rubin 2016 Definition 3.4 calls the signed integer r the core rank. In the convention of Mazur–Rubin 2004 Definition 4.1.11, the nonnegative core ranks are χ(T, F) = max(r, 0) and χ(T^*, F^*) = max(−r, 0); one of these is zero. Higher-rank systems use the signed r and require r ≥ 1. For R a discrete valuation ring and F cartesian, χ(T, F) is the common value of χ(T/m^kT, F) for k ≥ 1.

**Hypotheses.**

- R principal artinian (or a discrete valuation ring)
- F cartesian
- (T/mT)^{G_K} = (T^*[m])^{G_K} = 0

**Construction.**

1. The isomorphism class of a finitely generated module B over a principal artinian ring is determined by i ↦ length B[m^i]; so it suffices that length H¹_F(K,T)[m^i] − length H¹_{F^*}(K,T^*)[m^i] = t·i for an integer t.
2. By selmer-torsion-identification these are the lengths of H¹_F(K, T/m^i) and H¹_{F^*}(K, T^*[m^i]); by selmer-length-difference their difference is a sum of local terms, each linear in i by cartesian-length-linearity (the global H⁰ terms vanish).
3. Then r = t. Independence of the modulus is core-rank-independence-of-modulus.

**Uses that determine the API.**

- Mazur–Rubin 2004, Theorem 4.2.2 and Corollary 4.5.2: core rank 0 forces KS(T) = 0, and core rank 1 makes KS(T) free of rank one
- Mazur–Rubin 2016, hypothesis (H.6) and Theorem 6.10: Stark systems of rank r = χ(T) form a free module of rank one
- Burns–Sakamoto–Sano II, Hypothesis 4.2: the rank r + ν(n) of the relaxed Selmer module at a core vertex

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.coreRankInt` | data | The integer r with length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = r·k. |
| `TauCeti.KolyvaginSystems.coreRank` | data | χ(T, F) = max(r, 0) as a natural number; χ(T^*, F^*) = max(−r, 0). |
| `TauCeti.KolyvaginSystems.coreRank_mul_length` | characterisation | If χ(T) > 0 then length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = k·χ(T); if χ(T) = 0 the difference is −k·χ(T^*). |
| `TauCeti.KolyvaginSystems.coreRank_eq_zero_or_dual` | relation | χ(T, F) = 0 or χ(T^*, F^*) = 0. |
| `TauCeti.KolyvaginSystems.selmer_equiv_dual_prod_free` | equivalence | If coreRankInt(T,F) = r ≥ 0, there is a noncanonical R-linear isomorphism H¹_F(K,T) ≃ H¹_{F^*}(K,T^*) × R^r. For r ≤ 0 the free factor occurs on the other side. |
| `TauCeti.KolyvaginSystems.coreRank_field` | example | For R = k a field, χ(T) − χ(T^*) = dim_k H¹_F(K, T) − dim_k H¹_{F^*}(K, T^*). |

**Unit tests.**

- `coreRank_cyclotomic_even` (computation): For K = ℚ, R = ℤ/p^k, ρ an even nontrivial character of order prime to p and T = μ_{p^k} ⊗ ρ^{-1} with the structure F of Mazur–Rubin 2004 Definition 6.1.1, χ(T, F) = 1; for ρ odd with ρ ≠ ω, χ(T, F) = 0.
- `coreRank_elliptic_classical` (computation): For E/ℚ and p ≥ 5 with surjective mod-p representation, T = E[p^k] has rank two, χ(T,F) = 0 for the classical Kummer structure, and χ(T,F_can) = 1 for the structure propagated from T_pE.
- `coreRank_field_strict_relaxed` (degenerate): Over R = k, replacing F by the structure relaxed at one prime q ∈ P_1 (so that H¹_s(K_q, T) is one-dimensional) raises r by exactly 1.
- `coreRank_ne_rank` (non-example): For E/ℚ and p ≥ 5 with surjective mod-p representation, T = E[p^k] has rank two, χ(T,F) = 0 for the classical Kummer structure, and χ(T,F_can) = 1 for the structure propagated from T_pE.

**Acceptance.**

- χ(T, F) = 1 for T = μ_{p^k} ⊗ ρ^{-1} with ρ even and nontrivial and F the unit-root structure of Mazur–Rubin 2004 §6.1; χ = 0 for ρ odd, ρ ≠ ω.
- The core rank is not the R-rank of T: Under the hypotheses of example-elliptic, for T = E[p^k], a module of rank 2, χ(T, F_can) = 1 and χ(T, F) = 0 for the classical Selmer structure.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-length-linearity`
- `mathlib:Module.length`

**Sources.**

- `mr-higher`, Proposition 3.3(iii) and Definition 3.4, p. 8. The integer r and the definition of the core rank from it. Source excerpt: “there is a unique integer r, independent of n, such that there is a noncanonical isomorphism”
- `mr-ks`, Theorem 4.1.5 and Definition 4.1.11, pp. 36–38. The same statement over ℚ; the case n = 1 is used here. Source excerpt: “There are nonnegative integers r, s, one of which can be taken to be zero, such that for every n ∈ N there is a noncanonical isomorphism”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The core rank is independent of the modulus

`EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus` — theorem

**Statement.** Let R be principal artinian of length k and F cartesian with the invariants hypothesis of core-rank. Then for 0 < i ≤ k the Selmer triple (T/m^iT, F, P) over R/m^i has χ(T/m^iT) = χ(T) and χ(T^*[m^i]) = χ(T^*), and H¹_F(K, T/m^iT) ≅ (R/m^i)^{χ(T)} ⊕ H¹_{F^*}(K, T^*[m^i]) when χ(T) > 0. If R is a discrete valuation ring and H¹(K_q, T)/H¹_F(K_q, T) is torsion-free for q ∈ Σ(F), then rank_R H¹_F(K, T) − corank_R H¹_{F^*}(K, T^*) = χ(T) − χ(T^*).

**Hypotheses.**

- as in core-rank

**Proof outline.**

1. Take m^i-torsion in the isomorphism of core-rank and apply selmer-torsion-identification.
2. For a discrete valuation ring pass to the limit over k using SelmerIwasawaCohomology L2/selmer-limits and the bounded cokernel of H¹_F(K,T)/m^k → H¹_F(K, T/m^k) (Mazur–Rubin 2004, Lemma 3.7.1(ii)).

**Acceptance.**

- For T = T_pE and F_can, rank H¹_{F_can}(ℚ, T) − corank H¹_{F_can^*}(ℚ, E[p^∞]) = 1.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `SelmerIwasawaCohomology:L2/selmer-limits`

**Sources.**

- `mr-ks`, Theorem 4.1.13 and Definition 5.2.4, pp. 38, 56. Independence of the modulus. Source excerpt: “By Theorem 4.1.13, the core ranks χ(T /mk T ) and χ(T ∗ [mk ]) are independent of k.”
- `mr-ks`, Corollary 5.2.6, p. 56. The rank formula over a discrete valuation ring. Source excerpt: “rankR (HF1 (Q, T )) − corankR (HF1 ∗ (Q, T ∗ )) = χ(T ) − χ(T ∗ ).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The canonical and the unramified Selmer structures

`EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure` — definition

**Planet:** Canonical Selmer structure.

**Statement.** Let R be the ring of integers of a finite extension of ℚ_p (or a discrete valuation ring as in Mazur–Rubin 2016). The canonical Selmer structure F_can on T has Σ(F_can) = {q : T ramified at q} ∪ {v | p} ∪ {v | ∞}; H¹_{F_can}(K_q, T) = ker(H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p)) for q ∈ Σ(F_can), q ∤ p∞; and H¹_{F_can}(K_v, T) = H¹(K_v, T) for v | p∞. On T/IT it is the structure induced from T, which depends on T and not only on T/IT. The unramified structure F_ur of Mazur–Rubin 2016 has the same conditions away from p and, at 𝔭 | p, the saturation of the universal norm subgroup ∩_L Cor_{L/K_𝔭} H¹(L, T) over finite unramified L/K_𝔭.

**Hypotheses.**

- R a discrete valuation ring, finite over ℤ_p for F_can

**Construction.**

1. The condition away from p is the inverse image of the unramified condition on V = T ⊗ ℚ_p (SelmerIwasawaCohomology L2/lattice-passage), so its quotient is torsion-free and F_can is cartesian on quotients by Mazur–Rubin 2004 Lemma 3.7.1(i).
2. At 𝔭 | p, H¹_{F_ur}(K_𝔭, T) = H¹(K_𝔭, T) when H⁰(K_𝔭, T^*) has finite length (Mazur–Rubin 2016, Corollary 5.3), so F_ur = F_can in that case.
3. Euler-system classes lie in H¹_{F_can}(F, T) (SelmerIwasawaCohomology L3/universal-norms-unramified; Rubin, Corollary B.3.5).

**Uses that determine the API.**

- Mazur–Rubin 2004, Theorem 3.2.4: the target of the Euler-system-to-Kolyvagin-system map is KS(T, F_can, P)
- Burns–Sakamoto–Sano II, Theorem 6.12: higher-rank Kolyvagin derivatives land in systems for F_can
- Mazur–Rubin 2004, Theorem 5.2.15; Mazur–Rubin 2016, Theorem 5.4: the core rank formulas are for F_can and F_ur

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.canonicalStructure` | constructor | F_can: relaxed at v \| p∞, and at ramified q ∤ p the kernel of H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p). |
| `TauCeti.KolyvaginSystems.canonicalStructure_torsionFree` | characterisation | H¹(K_q, T)/H¹_{F_can}(K_q, T) is torsion-free for every q, so F_can is cartesian on quotients. |
| `TauCeti.KolyvaginSystems.canonicalStructure_dual_at_p` | compatibility | The dual structure F_can^* is strict at every v \| p and equals the dual of the unramified-saturated condition elsewhere. |
| `TauCeti.KolyvaginSystems.canonicalStructure_quotient_at_p` | relation | H¹_{F_can}(K_𝔭, T/IT) is the image of H¹(K_𝔭, T); it equals H¹(K_𝔭, T/IT) if H⁰(K_𝔭, T^*) is divisible. |
| `TauCeti.KolyvaginSystems.unramifiedStructure` | constructor | F_ur of Mazur–Rubin 2016, Definition 5.1. |
| `TauCeti.KolyvaginSystems.unramifiedStructure_eq_canonical` | compatibility | If H⁰(K_𝔭, T^*) has finite length for every 𝔭 \| p then F_ur = F_can. |

**Unit tests.**

- `canonicalStructure_unramified_place` (compatibility): At a prime q ∤ p where T is unramified, ker(H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p)) = H¹_ur(K_q, T), so adding q to Σ(F_can) does not change the structure.
- `canonicalStructure_zp_one` (computation): For K = ℚ, T = ℤ_p(1), p odd: H¹_{F_can}(ℚ, T) is the p-adic completion of ℤ[1/p]^×, free of rank one over ℤ_p, generated by the class of p.
- `canonicalStructure_quotient_ne_relaxed` (non-example): Local counterexample: p odd, T = ℤ_p(1) ⊗ ψ^{-1}, with ψ unramified at p and ψ(Fr_p) = 1+p. Then H⁰(ℚ_p,T^*) ≅ ℤ/p is finite nondivisible, H²(ℚ_p,T)[p] ≠ 0, and the image of H¹(ℚ_p,T) in H¹(ℚ_p,T/pT) is proper. This is a local continuous character, not a finite-order character with ρ(p)=1.
- `canonicalStructure_elliptic` (computation): For T=T_pE over ℚ and p odd, F_can is the classical lattice Kummer structure relaxed at p, with F_can^* ≤ F ≤ F_can under the Weil-pairing dictionary. On E[p^k] use the image of H¹(ℚ_p,T_pE); it is the full local group when E(ℚ_p)[p^∞]=0 and may be proper otherwise.
- `canonicalStructure_quotient_finite_order_trivial_local` (computation): For T = ℤ_p(1) ⊗ ρ^{-1} with ρ finite order prime to p, unramified at p, and ρ(p)=1, T^* is locally ℚ_p/ℤ_p. Its invariants are divisible, so the propagated canonical condition on T/p^kT is all H¹(ℚ_p,T/p^kT). The unit condition on the lattice remains proper.

**Acceptance.**

- For T = ℤ_p(1) ⊗ ρ^{-1} with ρ(p) ≠ 1, F_can equals the unit structure F of Mazur–Rubin 2004 §6.1 (Lemma 6.1.2).
- H¹_{F_can}(ℚ_p, T/IT) = H¹(ℚ_p, T/IT) when H⁰(ℚ_p, T^*) is divisible (Lemma A.1) and can be smaller otherwise.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `SelmerIwasawaCohomology:L2/lattice-passage`
- `SelmerIwasawaCohomology:L2/unramified-condition`
- `SelmerIwasawaCohomology:L2/dual-selmer-structure`

**Sources.**

- `mr-ks`, Definition 3.2.1, p. 23. Definition of F_can over ℚ. Source excerpt: “We define a canonical Selmer structure Fcan on T by”
- `mr-higher`, Definition 5.1, pp. 9–10. Definition of F_ur over a number field. Source excerpt: “the saturation of H 1 (Kp , T )u in H 1 (Kp , T )”
- `bss2`, §6.2, p. 38. The same structure over a number field and a Gorenstein order. Source excerpt: “The canonical Selmer structure Fcan on T (see [11, Def. 3.2.1]) is the following data:”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Core rank of the canonical and unramified structures

`EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula` — theorem

**Statement.** (a) (K = ℚ) For R the ring of integers of a finite extension of ℚ_p and T satisfying (H.0)–(H.3), χ(T^*, F_can^*) = 0 and χ(T, F_can) = rank_R T^− + corank_R H⁰(ℚ_p, T^*), where T^− is the minus part for a complex conjugation. (b) (K a number field, R a discrete valuation ring) χ(T, F_ur) = Σ_{v | ∞} corank_R H⁰(K_v, T^*).

**Hypotheses.**

- the invariants hypothesis of core-rank
- for (a): K = ℚ and the hypotheses of Mazur–Rubin 2004 §5.2

**Proof outline.**

1. By core-rank-independence-of-modulus and selmer-length-difference applied to T^*[m^k], k(χ(T) − χ(T^*)) is a sum of local terms length H⁰(K_v, T^*[m^k]) − length H¹_{F^*}(K_v, T^*[m^k]) up to a bounded error.
2. At v | ∞ the term is ∼ k·corank H⁰(K_v, T^*); at q ∤ p∞ it is bounded (unramified-dimension-count of SelmerIwasawaCohomology L2); at p it is ∼ k·corank H⁰(ℚ_p, T^*) for F_can^* strict, and bounded for F_ur by Mazur–Rubin 2016 Lemma 5.2.

**Acceptance.**

- T = ℤ_p(1) ⊗ ρ^{-1}: χ(T, F_can) = 1 if ρ is even with ρ(p) ≠ 1; T = T_pE: χ(T, F_can) = 1.
- For an abelian variety A of dimension d over K with large image, χ(T_pA, F) = d[K : ℚ] (Mazur–Rubin 2016, Proposition 5.9): the core rank is not the analytic rank.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`
- `SelmerIwasawaCohomology:L2/unramified-dimension-count`

**Sources.**

- `mr-ks`, Theorem 5.2.15, p. 59. Part (a). Source excerpt: “Suppose F = Fcan , the canonical Selmer structure on T given by Definition 3.2.1.”
- `mr-higher`, Theorem 5.4, p. 10. Part (b). Source excerpt: “Suppose R is a discrete valuation ring. Then”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The Mazur–Rubin 2004 hypotheses (H.0)–(H.6) over ℚ

`EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004` — definition

**Planet:** Mazur–Rubin hypotheses (H.0)–(H.6).

**Statement.** For a Selmer triple (T, F, P) over K = ℚ: (H.0) T is free of finite rank over R. (H.1) T/mT is an absolutely irreducible k[G_ℚ]-representation. (H.2) There is τ ∈ G_ℚ with τ = 1 on μ_{p^∞} and T/(τ − 1)T free of rank one over R. (H.3) H¹(ℚ(T, μ_{p^∞})/ℚ, T/mT) = H¹(ℚ(T, μ_{p^∞})/ℚ, T^*[m]) = 0. (H.4) Either (H.4a) Hom_{𝔽_p[[G_ℚ]]}(T/mT, T^*[m]) = 0, or (H.4b) p > 4. (H.5) P_t ⊆ P ⊆ P_1 for some t ≥ 1, with P_k the Kolyvagin primes of level k. (H.6) For every ℓ ∈ Σ(F) the local condition at ℓ is cartesian on Quot_R(T). Each is a separate proposition; the record has one field for each.

**Hypotheses.**

- K = ℚ

**Construction.**

1. Each field is stated against the carriers of this layer and of ES.1: ℚ(T, μ_{p^∞}) is the fixed field of the kernel of G_ℚ → Aut(T) × Aut(μ_{p^∞}), and P_k is ES.1/kolyvagin-primes.
2. (H.2) holds with τ = 1 when rank T = 1; (H.6) holds when R is a field; (H.0)–(H.4) pass to T ⊗_R R′ for a surjection R → R′ (Remark 3.5.1).
3. (H.3) implies S^{G_ℚ} = 0 for every subquotient S of T or T^* (Lemma 3.5.2).

**Uses that determine the API.**

- Mazur–Rubin 2004, §3.6 and Chapter 4: the standing hypotheses for the Chebotarev lemmas and for all results over principal artinian rings
- Mazur–Rubin 2004, Theorems 5.2.2–5.2.14: over a discrete valuation ring, (H.0)–(H.5) plus torsion-free local quotients
- EulerSystemsCyclotomicMainConjecture L1 and KatoEulerSystems L4: applications verify the fields for their representation

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.MR04Hypotheses` | structure | The record with fields irreducible (H.1), tau (H.2: an element τ with its two properties), h1Vanishing (H.3), homVanishingOrLarge (H.4), primes (H.5), cartesian (H.6). |
| `TauCeti.KolyvaginSystems.MR04Hypotheses.invariants_eq_bot` | characterisation | (H.3) implies S^{G_ℚ} = 0 for every subquotient S of T and of T^*. |
| `TauCeti.KolyvaginSystems.MR04Hypotheses.dual` | functoriality | If T satisfies (H.0)–(H.5) then so does T^* (for R principal artinian). |
| `TauCeti.KolyvaginSystems.MR04Hypotheses.quotient` | functoriality | (H.0)–(H.4) pass to T ⊗_R R′ for surjective R → R′; (H.6) passes to T/m^jT for R principal artinian. |
| `TauCeti.KolyvaginSystems.MR04Hypotheses.of_rank_one` | example | If rank_R T = 1 then (H.1) holds and (H.2) holds with τ = 1. |

**Unit tests.**

- `MR04Hypotheses.cyclotomic_twist` (computation): For p odd, ρ : G_ℚ → ℤ_p^× of finite order prime to p with ρ ≠ 1 and ρ ≠ ω, T = ℤ_p(1) ⊗ ρ^{-1} satisfies (H.0), (H.1), (H.2) with τ = 1, (H.3) and (H.4a).
- `MR04Hypotheses.elliptic` (computation): For E/ℚ with G_ℚ → Aut(E[p]) surjective and p ≥ 5, T = T_pE satisfies (H.0)–(H.3) and (H.4b).
- `MR04Hypotheses.not_trivial_character` (non-example): T = ℤ_p(1) (ρ = 1) does not satisfy (H.3): T^*[m] = Hom(μ_p, μ_p) is the trivial module 𝔽_p, so (T^*[m])^{G_ℚ} ≠ 0, contradicting the consequence S^{G_ℚ} = 0 of (H.3). Likewise ρ = ω fails because T/mT is trivial.
- `MR04Hypotheses.field_cartesian` (degenerate): If R is a field, (H.6) holds for every Selmer structure.

**Acceptance.**

- The record is satisfied by T = ℤ_p(1) ⊗ ρ^{-1}, ρ ≠ 1, ω of order prime to p, with (H.4a); and by T = T_pE with surjective mod-p representation and p ≥ 5, with (H.4b).
- It is not satisfied by T = ℤ_p(1): (H.3) fails.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`

**Sources.**

- `mr-ks`, §3.5, pp. 27–28. The list (H.0)–(H.6). Source excerpt: “(H.2) There is a τ ∈ GQ such that τ = 1 on µp∞ and T /(τ − 1)T is free of rank one over R.”
- `mr-ks`, §3.5, p. 27. The condition on the set of primes. Source excerpt: “(H.5) Pt ⊂ P ⊂ P1 for some t ∈ Z+ , where for k ∈ Z+ Pk is given by Definition 3.1.6.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The Mazur–Rubin 2016 hypotheses (H.1)–(H.7) over a number field

`EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016` — definition

**Planet:** Mazur–Rubin hypotheses over number fields.

**Statement.** For Selmer data (T, F, P, r) over a number field K, let M be the smallest power of p with MR = 0 if R is artinian and M = p^∞ if R is a discrete valuation ring, H the Hilbert class field of K and H_M = H(μ_M, (O_K^×)^{1/M}). (H.1) T̄^{G_K} = (T̄^*)^{G_K} = 0 and T̄ is an absolutely irreducible k[[G_K]]-module. (H.2) There are τ ∈ Gal(K̄/H_M) and a finite Galois extension L of K in H_M such that T/(τ − 1)T is free of rank one over R and P(L, τ) ⊆ P, where P(L, τ) is the set of primes q ∉ Σ(F) unramified in L with Fr_q conjugate to τ in Gal(L/K). (H.3) H¹(H_M(T)/K, T/mT) = H¹(H_M(T)/K, T^*[m]) = 0. (H.4) Either T̄ ≇ T̄^* as k[[G_K]]-modules, or p > 3. (H.5) F is cartesian. (H.6) r = χ(T) > 0. For R artinian only: (H.7) I_q = 0 for every q ∈ P.

**Hypotheses.**

- K a number field
- R principal artinian or a discrete valuation ring

**Construction.**

1. The fields are stated with ES.1/conductor-ideal (I_q) and ES.1/kolyvagin-primes (P(L, τ)).
2. If the properties hold for (T, F, P, r) they hold for T/m^k over R/m^k (Remark 4.3).
3. If R is artinian and (H.1)–(H.6) hold, then (H.1)–(H.7) hold after replacing L by H_M and P by P(H_M, τ) (Lemma 4.5): Fr_q fixes H so q is principal, and [K(q)_q : K_q] is divisible by M.

**Uses that determine the API.**

- Mazur–Rubin 2016, Theorems 6.10, 7.4, 8.9, 11.7, 12.4 and 13.4: the standing hypotheses for Stark and stub Kolyvagin systems
- Burns–Sakamoto–Sano II, Hypotheses 3.2 and 3.3: the Gorenstein-coefficient analogues, compared in ES.6/bss-hypotheses

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.MR16Hypotheses` | structure | The record with fields invariantsAndIrreducible (H.1), tau (H.2: τ, L and the inclusion P(L, τ) ⊆ P), h1Vanishing (H.3), notSelfDualOrLarge (H.4), cartesian (H.5), coreRank (H.6). |
| `TauCeti.KolyvaginSystems.MR16Hypotheses.IsArtinianAdmissible` | structure | (H.7): I_q = 0 for all q ∈ P, for R artinian. |
| `TauCeti.KolyvaginSystems.MR16Hypotheses.quotient` | functoriality | The record for (T, F, P, r) gives the record for (T/m^kT, F, P, r) over R/m^k. |
| `TauCeti.KolyvaginSystems.MR16Hypotheses.artinianAdmissible_of_frobenius` | characterisation | If R is artinian and q ∈ P(H_M, τ) then I_q = 0; so (H.7) holds for P(H_M, τ). |
| `TauCeti.KolyvaginSystems.MR16Hypotheses.of_mr04` | compatibility | For K = ℚ and p odd, a triple satisfying (H.0)–(H.4), (H.6) of 2004 with χ(T) = r > 0 and P ⊇ P(L, τ) for some finite L ⊆ ℚ(μ_M) satisfies the 2016 record; here 2004 (H.4a) gives the first alternative of 2016 (H.4) and p > 4 is p > 3. |

**Unit tests.**

- `MR16Hypotheses.abelian_variety` (computation): For an abelian variety A of dimension d over K with image of G_K in Aut(A[p]) containing GSp_{2d}(𝔽_p) and p > 3, T = T_pA with the structure of Mazur–Rubin 2016 §5 satisfies (H.1)–(H.6) with r = d[K : ℚ].
- `MR16Hypotheses.not_coreRank_zero` (non-example): T = E[p^k] with the classical Selmer structure has χ = 0, so (H.6) fails for every r ≥ 1 although (H.1)–(H.5) can hold.
- `MR16Hypotheses.q_eq_HM` (degenerate): For K = ℚ and p odd, H_M = ℚ(μ_M), so (H.2) asks for τ trivial on μ_M, as in 2004 (H.2).
- `MR16Hypotheses.h4_prime_three` (non-example): For p = 3 and T̄ ≅ T̄^* (for example T̄ = E[3]) hypothesis (H.4) fails; p = 3 is allowed only when T̄ is not self-dual.

**Acceptance.**

- Satisfied by T = T_pA for an abelian variety with large image and p > 3, with r = d[K : ℚ] (Mazur–Rubin 2016, §5).
- (H.6) excludes core rank zero: it is a hypothesis on (T, F), not a consequence of the others.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`

**Sources.**

- `mr-higher`, §4, hypotheses (H.1)–(H.7), p. 9. The list of running hypotheses. Source excerpt: “(H.4) either T̄ ∼6= T̄ ∗ as k[[GK ]]-modules, or p > 3,”
- `mr-higher`, Lemma 4.5, p. 9. How (H.7) is obtained. Source excerpt: “Suppose R is artinian and τ is as in (H.2). If q ∈ P(HM , τ ), then Iq = 0.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Implications between the hypothesis records

`EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-implications` — lemma

**Statement.** (a) (H.0)–(H.4) of 2004 are stable under R → R′ surjective, and (H.6) under T → T/m^jT. (b) For R a discrete valuation ring, torsion-freeness of H¹(K_q, T)/H¹_F(K_q, T) for q ∈ Σ(F) implies (H.6)/(H.5) for every T/m^kT. (c) 2004 (H.3) implies T̄^{G_ℚ} = (T̄^*)^{G_ℚ} = 0, hence 2016 (H.1) given (H.1) of 2004; 2004 (H.3) implies 2016 (H.3) for K = ℚ, because ℚ(T, μ_M) ⊆ ℚ(T, μ_{p^∞}) and inflation is injective on H¹. (d) 2016 (H.1)–(H.6) for artinian R give (H.7) for the prime set P(H_M, τ). (e) Rubin's Hyp(K, T) (ES.4/rubin-hypotheses) gives residual irreducibility and a rank-one τ fixing the maximal p-Hilbert class extension K(1), cyclotomic p-power roots and p-power roots of units. It gives the τ of 2016 (H.2) only with the additional condition that this τ fixes the full Hilbert class field H (and the specified finite extension L); absolute residual irreducibility in 2016 (H.1) is also an additional condition; it does not give (H.3), whose failure is measured by Rubin's error terms n_W and n_W^*.

**Hypotheses.**

- as in the two records

**Proof outline.**

1. (a), (b): Mazur–Rubin 2004, Remark 3.5.1, Lemmas 3.7.1(i) and 3.7.3. (c): Lemma 3.5.2 and inflation–restriction for ℚ(T, μ_M) ⊆ ℚ(T, μ_{p^∞}) (ArithmeticGaloisDuality R02.2/compact-five-term).
2. (d): Mazur–Rubin 2016, Lemma 4.5. (e): compare Rubin's Hyp(K, T)(i) with (H.2): τ fixes μ_{p^∞}, (O_K^×)^{1/p^∞} and only the p-part K(1) of H. Fixing all of H and L must be separately checked; the comparison of (c) and (e) is derived here from the two texts, which do not state it.

**Acceptance.**

- For a rank-one twist the rank-one coinvariant condition alone holds with τ=1 in all three records. This checks that condition only; vanishing, absolute irreducibility and prime-set hypotheses still require their own verifications.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `ArithmeticGaloisDuality:R02.2/compact-five-term`

**Sources.**

- `mr-ks`, Remark 3.5.1, p. 28. Stability under quotients of the coefficient ring. Source excerpt: “is a surjective homomorphism of (complete) local rings and T satisfies (H.i), then so does T ⊗R R0 viewed as an R0 [[GQ ]]-module, for any”
- `mr-higher`, Remark 4.3, p. 9. Passage to (H.7). Source excerpt: “If R is artinian and (H.1) through (H.6) hold, then Lemma 4.5 below shows that (H.1) through (H.7) hold if we replace L by HM and P by P(HM , τ ).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Worked example: twists of ℤ_p(1) by characters of finite order

`EulerSystemsAndKolyvaginSystems:ES.0/example-cyclotomic-twist` — application

**Statement.** Let p be odd, ρ : G_ℚ → ℤ_p^× a character of finite order prime to p, L its field, R = ℤ/p^k (or ℤ_p) and T = μ_{p^k} ⊗ ρ^{-1} (or ℤ_p(1) ⊗ ρ^{-1}). With H¹(ℚ, T) = (L^×/(L^×)^{p^k})^ρ, let F be the structure with H¹_F(ℚ_ℓ, T) = (O_{L,ℓ}^×/(O_{L,ℓ}^×)^{p^k})^ρ for all ℓ. Then: if ρ ≠ 1, ω, T satisfies (H.0)–(H.3), (H.4a), and F, F_can satisfy (H.6); χ(T, F) = 1 if ρ is even and ρ ≠ 1, and χ(T, F) = 0 if ρ is odd and ρ ≠ ω; F = F_can if ρ(p) ≠ 1; and there are exact sequences 0 → (O_L^×/(O_L^×)^{p^k})^ρ → H¹_F(ℚ, T) → Cl(L)[p^k]^ρ → 0 with H¹_{F^*}(ℚ, T^*) ≅ Hom(Cl(L), ℤ/p^k)^{ρ^{-1}}.

**Hypotheses.**

- p odd
- ρ of order prime to p

**Proof outline.**

1. Kummer theory identifies the local and global H¹; the unramified classes are the unit classes (Mazur–Rubin 2004, §6.1).
2. kχ(T, F) = length H¹_F − length H¹_{F^*} = length (O_L^×/(O_L^×)^{p^k})^ρ by the two sequences, which is k for ρ even nontrivial and 0 for ρ odd ≠ ω (Dirichlet's unit theorem).
3. Propagation: the structure on T/p^i is the unit structure for μ_{p^i} ⊗ ρ^{-1}; the dual condition is the unramified one on Hom(G_{L_λ}/I_λ, ℤ/p^k)^{ρ^{-1}}.

**Acceptance.**

- The computed core rank matches core-rank-formula: rank T^− + corank H⁰(ℚ_p, T^*) for F_can.
- For finite-order ρ unramified at p with ρ(p)=1, the propagated condition at p for F_can on T/p^k is all H¹(ℚ_p,T/p^k), since the dual invariants on the lattice are divisible (Lemma A.1). It differs from the unit structure F.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`

**Sources.**

- `mr-ks`, Lemma 6.1.5 and Proposition 6.1.6, pp. 71–72. Hypotheses and core rank for the twists of ℤ_p(1). Source excerpt: “Suppose ρ 6= 1 and ρ 6= ω. Then T satisfies hypotheses (H.0), (H.1), (H.2), (H.3), and (H.4a) of §3.5, and F and Fcan both satisfy (H.6).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Worked example: the Tate module of an elliptic curve

`EulerSystemsAndKolyvaginSystems:ES.0/example-elliptic` — application

**Statement.** Let E/ℚ be an elliptic curve and p ≥ 5 a prime with G_ℚ → Aut(E[p]) surjective, T = E[p^k] or T_pE, and F the classical Selmer structure (images of the local Kummer maps at the bad primes, p and ∞). Then F^* = F under the Weil pairing, H¹_F(ℚ, E[p^k]) is the p^k-Selmer group, T satisfies (H.0)–(H.4), F and F_can satisfy (H.6), χ(T, F) = 0 and χ(T, F_can) = 1, where on T_pE, F_can is F relaxed at p and F_can^* ≤ F ≤ F_can. On E[p^k], F_can is propagated from T_pE; its local condition at p is the image of H¹(ℚ_p,T_pE), which may be proper if E(ℚ_p)[p^∞] ≠ 0.

**Hypotheses.**

- p ≥ 5
- surjective mod-p representation

**Proof outline.**

1. (H.1)–(H.3) follow from surjectivity onto GL₂(𝔽_p); (H.4b) holds as p > 4; (H.6) by Lemma 3.7.1 since the Kummer images on T_pE have torsion-free quotient.
2. χ(T, F) = 0 because F is self-dual (core-rank); χ(T, F_can) = rank T_pE^− = 1 by core-rank-formula.

**Acceptance.**

- Both structures on the same T have different core ranks, 0 and 1: the core rank depends on F.
- The analytic rank of E plays no role in either value.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`

**Sources.**

- `mr-ks`, Proposition 6.2.2 and Lemma 6.2.3, p. 74. Core ranks and hypotheses for T_pE. Source excerpt: “Proposition 6.2.2. χ(T, F) = 0 and χ(T, Fcan ) = 1.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Worked non-example: the trivial and Teichmüller characters

`EulerSystemsAndKolyvaginSystems:ES.0/non-example-inadmissible` — application

**Statement.** For ρ = 1 the module T = ℤ_p(1) does not satisfy (H.3) of Mazur–Rubin 2004: T^*[m] = Hom(μ_p, μ_p) = 𝔽_p with trivial action, so (T^*[m])^{G_ℚ} ≠ 0 and H¹(ℚ(μ_{p^∞})/ℚ, 𝔽_p) = Hom(Gal(ℚ(μ_{p^∞})/ℚ), 𝔽_p) ≠ 0. For ρ = ω, T/mT = μ_p ⊗ ω^{-1} is trivial and (H.3) fails for the same reason. In both cases Lemma 3.5.2 (no invariants in subquotients), on which the definition of the core rank rests, is false, and no instance of the hypothesis record exists. Rubin's error-tolerant theorem still applies to T = ℤ_p(1) through Hyp(K, V), with the finiteness of S_{Σ_p}(K, W^*) equivalent to Leopoldt's conjecture for T = O.

**Hypotheses.**

- p odd

**Proof outline.**

1. Compute T^*[m] and T/mT as Galois modules; Gal(ℚ(μ_{p^∞})/ℚ) ≅ ℤ_p^× has a quotient of order p.
2. Rubin, Remark II.2.7 and Lemma V.3.2: for T = O or O(1) the groups H¹(Ω/K, W), H¹(Ω/K, W^*) are infinite.

**Acceptance.**

- The record MR04Hypotheses has no term for T = ℤ_p(1): the field h1Vanishing is refutable.
- The failure is of (H.3), not of (H.1) or (H.2), which both hold for rank one.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`

**Sources.**

- `mr-ks`, Lemma 6.1.5, proof, p. 71. The two excluded characters are exactly those for which (H.3) fails. Source excerpt: “If ρ 6= 1 and ρ 6= ω, then (H.3) holds as well (note that since ρ has order prime to p, it is not congruent to either 1 or ω modulo p).”
- `rubin-es`, Chapter II, Remark 2.7, p. 25. What remains true in the excluded case. Source excerpt: “In the exceptional case T = O of Theorem 2.3, SΣp (K, W ∗ ) is finite if and only if Leopoldt’s conjecture holds for K.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

## ES.1. Auxiliary primes and local comparison maps

The fields `K(q)`, the ideals `I_n` and the groups `G_n`; the finite, singular and transverse conditions at an auxiliary prime and the finite–singular comparison with its tensor factor; the Selmer structures `F_a^b(c)`; and the Chebotarev theorems that choose primes, in the clean form of Mazur–Rubin, in Rubin's form with losses measured by `H¹(Ω/K, ·)`, and in the bounded-error form of Liu–Tian–Xiao–Zhang–Zhu with its corrections. Depends on ES.0, on Tau Ceti's class field theory and Chebotarev roadmaps, and on local duality from `ArithmeticGaloisDuality:R02.4`.

**Planets of this layer:** Ray class p-extensions K(q); Transverse local condition; Finite–singular comparison map.

### The fields K(q), K(r) and their Galois groups

`EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower` — construction

**Planet:** Ray class p-extensions K(q).

**Statement.** For a prime q of K not dividing p, K(q) is the maximal p-extension of K inside the ray class field of K modulo q, and K(1) is the maximal p-extension of K inside the Hilbert class field. K(q)/K(1) is unramified outside q, totally ramified above q and cyclic, with Γ_q = Gal(K(q)/K(1)) the maximal p-quotient of (O_K/q)^×/(O_K^× mod q). For a squarefree product r = q₁⋯q_k, K(r) = K(q₁)⋯K(q_k), Γ_r = Gal(K(r)/K(1)) ≅ ∏_{q | r} Γ_q with Γ_q the inertia group of q in Γ_r; for s | r, Γ_s is both a subgroup and a quotient of Γ_r. For K ⊆ F ⊆ K_∞ finite over K, F(r) = F·K(r) and Gal(F(r)/K(1)) ≅ Gal(F(1)/K(1)) × Γ_r when K_∞/K is unramified outside p.

**Hypotheses.**

- q ∤ p
- r squarefree and prime to p

**Construction.**

1. Existence of the ray class field modulo q and its Galois group Cl_q(K) come from global class field theory (Tau Ceti's ClassFieldTheory roadmap, layers 12–13); K(q) is the fixed field of the prime-to-p part.
2. The exact sequence 0 → (O_K/q)^×/im(O_K^×) → Cl_q(K) → Cl(K) → 0 of Tau Ceti's ray class groups identifies Γ_q; ramification considerations show the K(q) are linearly disjoint over K(1).
3. For K = ℚ: K(1) = ℚ, ℚ(ℓ) is the maximal p-extension in ℚ(μ_ℓ)^+, and Γ_ℓ is the p-part of 𝔽_ℓ^×/{±1}, which for p odd is the p-part of 𝔽_ℓ^×.

**Uses that determine the API.**

- Rubin, Definition II.1.1: an Euler system needs classes over all K(q), q ∤ N
- Rubin, Definition IV.4.1: the derivative operators D_q live in ℤ[Γ_q]
- Mazur–Rubin 2016, Definition 10.1: the tensor factor G_q is the Galois group of the completion of K(q) at q

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.rayPExtension` | constructor | K(q) as an intermediate field of K̄/K, for q ∤ p; K(1) for the trivial modulus. |
| `TauCeti.KolyvaginSystems.gammaPrime` | data | Γ_q = Gal(K(q)/K(1)), a finite cyclic p-group. |
| `TauCeti.KolyvaginSystems.gammaPrime_equiv` | equivalence | Γ_q is the maximal p-quotient of (O_K/q)^×/(O_K^× mod q). |
| `TauCeti.KolyvaginSystems.gammaConductor_equiv_pi` | equivalence | Γ_r ≅ ∏_{q \| r} Γ_q, compatibly with the inclusions and projections for s \| r. |
| `TauCeti.KolyvaginSystems.card_gammaPrime_dvd` | relation | #Γ_q divides N(q) − 1. |
| `TauCeti.KolyvaginSystems.rayPExtension_ramification` | characterisation | K(q)/K(1) is unramified outside q and totally ramified at the primes above q. |

**Unit tests.**

- `gammaPrime_rat` (computation): For K = ℚ and p = 3, Γ_7 is cyclic of order 3 and Γ_5 is trivial; for p = 2, Γ_7 has order 1 because 6 = 2·3 and (ℤ/7)^×/{±1} has order 3.
- `gammaPrime_trivial_of_not_dvd` (degenerate): If p ∤ #((O_K/q)^×/im O_K^×) then K(q) = K(1) and Γ_q = 1.
- `gammaConductor_two_primes` (compatibility): For K = ℚ, p = 3: Γ_{7·13} ≅ ℤ/3 × ℤ/3, and the maximal 3-extension of ℚ of conductor 91 has this Galois group.
- `rayPExtension_ne_rayClassField` (non-example): For K = ℚ, p = 3, q = 13: the ray class field modulo 13 is ℚ(μ_13)^+, of degree 6, and ℚ(13) is its cubic subfield, a proper subfield.

**Acceptance.**

- [K(q) : K(1)] divides N(q) − 1.
- K(r) is contained in, and in general not equal to, the maximal p-extension of K in the ray class field modulo r.

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`
- `tauceti:TauCeti.GlobalNumberFields.RayClassGroup`

**Sources.**

- `rubin-es`, Chapter IV §1, p. 55. The fields K(q), K(r) and the groups Γ_q, Γ_r. Source excerpt: “Class field theory shows that K(q)/K(1) is unramified outside q, totally ramified above q, and cyclic with Galois group equal”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The ideals I_q, I_n and the groups G_q, G_n

`EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal` — definition

**Statement.** Let (T, F, P) be a Selmer triple and q a prime with q ∤ p∞ and T unramified at q. G_q = Gal(K(q)_q/K_q), the Galois group of the completion of K(q) at q (for K = ℚ and in Mazur–Rubin 2004: G_ℓ = 𝔽_ℓ^× = Gal(ℚ(μ_ℓ)/ℚ)). Over ℚ, I_ℓ is the ideal of R generated by ℓ − 1 and P_ℓ(1), where P_ℓ(x) = det(1 − Fr_ℓ x | T). Over K (R principal): I_q = R if q is not principal, and otherwise I_q is the largest power of m with [K(q)_q : K_q]R ⊆ I_q and T/((Fr_q − 1)T + I_qT) free of rank one over R/I_q. For n ∈ N(P): I_n = Σ_{q | n} I_q (I_1 = 0) and G_n = ⊗_{q | n} G_q (G_1 = ℤ). Then G_n ⊗ R/I_n is free of rank one over R/I_n, and I_q annihilates |𝔽_q^×|-torsion requirements for the finite–singular map on T/I_nT.

**Hypotheses.**

- T free over R, unramified at q, q ∤ p∞

**Construction.**

1. G_q is cyclic and its order lies in I_q, so G_q ⊗ R/I_q ≅ R/I_q noncanonically; tensor over the primes dividing n.
2. The two definitions of I_q agree in their use: both give |G_q|·(T/I_qT) = 0 and det(1 − Fr_q | T/I_qT) = 0 (under the rank-one coinvariants condition), which are the hypotheses of the finite–singular comparison.
3. Howard's variant for K imaginary quadratic and ℓ inert: I_ℓ is the smallest ideal containing ℓ + 1 for which Fr_λ acts trivially on T/I_ℓT, and G_ℓ = k_λ^×/k_ℓ^×.

**Uses that determine the API.**

- Mazur–Rubin 2004, Definition 3.1.2: the stalk at n is H¹_{F(n)}(ℚ, T/I_nT) ⊗ G_n
- Mazur–Rubin 2004, Appendix A, Definition A.3: ρ_ℓ identifies the augmentation quotient of (R/I)[G_ℓ ⊗ R/I] with G_ℓ ⊗ R/I, which carries the correction terms
- HeegnerPointEulerSystems HE.4: the Heegner coefficient ideal is Howard's I_ℓ

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.conductorIdeal` | data | I_q ⊆ R for a prime q, and I_n = ⨆_{q \| n} I_q for squarefree n. |
| `TauCeti.KolyvaginSystems.conductorIdeal_one` | simp | I_1 = ⊥. |
| `TauCeti.KolyvaginSystems.conductorIdeal_mono` | relation | m \| n implies I_m ≤ I_n. |
| `TauCeti.KolyvaginSystems.tameGroup` | data | G_q = Gal(K(q)_q/K_q) and G_n = ⊗_{q \| n} G_q, with G_1 = ℤ. |
| `TauCeti.KolyvaginSystems.tameGroup_tensor_free` | characterisation | G_n ⊗_ℤ R/I_n is a free R/I_n-module of rank one. |
| `TauCeti.KolyvaginSystems.conductorIdeal_rat` | compatibility | For K = ℚ and R principal, the 2016 ideal I_ℓ is the largest power of m containing the 2004 ideal (ℓ − 1, P_ℓ(1)) for which the coinvariants are free of rank one. |

**Unit tests.**

- `conductorIdeal_zp_one` (computation): For K = ℚ, R = ℤ_p, T = ℤ_p(1): I_ℓ = (ℓ − 1)ℤ_p, so ℓ ∈ P_k iff ℓ ≡ 1 (mod p^k).
- `tameGroup_one` (degenerate): G_1 ⊗ R/I_1 = ℤ ⊗ R = R.
- `conductorIdeal_elliptic` (computation): For T = T_pE over ℚ: P_ℓ(1) = 1 − a_ℓ + ℓ and I_ℓ = (ℓ − 1, a_ℓ − 2).
- `conductorIdeal_not_only_norm` (non-example): Two primes ℓ, ℓ′ with ℓ ≡ ℓ′ ≡ 1 (mod p^k) can have I_ℓ ≠ I_ℓ′ for T = T_pE, since a_ℓ ≢ a_ℓ′ in general: I_ℓ is not a function of ℓ − 1 alone.

**Acceptance.**

- For T = ℤ_p(1) over ℚ: P_ℓ(x) = 1 − ℓx and I_ℓ = (ℓ − 1).
- I_n depends on Frobenius and on |G_q|, not only on n.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `mathlib:LinearMap.charpoly`

**Sources.**

- `mr-ks`, Definition 2.2.1, p. 16. I_ℓ, I_n and G_n over ℚ. Source excerpt: “Let P` (x) = det(1 − Fr` x | T ) ∈ R[x], and let I` be the ideal of R generated by ` − 1 and P` (1).”
- `mr-higher`, Definition 2.2, p. 6. I_q over a number field. Source excerpt: “If q is not principal, let Iq := R. If q is principal, let Iq ⊂ R be the largest power of m”
- `howard`, Definition 1.2.1, p. 1444. The inert-prime variant. Source excerpt: “By convention 1 ∈ Nk for every k, I1 = 0, and G1 = Z.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Kolyvagin primes: P_k, P(L, τ) and R_{F,M}

`EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes` — definition

**Statement.** (a) Over ℚ: P_k is the set of primes ℓ ∉ Σ(F) with T/(m^kT + (Fr_ℓ − 1)T) free of rank one over R/m^k and I_ℓ ⊆ m^k; P_1 ⊇ P_2 ⊇ ⋯ and N_k = N(P_k). (b) Over K: P_k = {q ∈ P : I_q ⊆ m^k}; for a finite Galois L/K and τ ∈ G_K, P(L, τ) is the set of primes q ∉ Σ(F) unramified in L with Fr_q conjugate to τ in Gal(L/K). (c) Rubin: for K ⊆ F ⊆ K_∞ finite and 0 ≠ M ∈ O, R_{F,M} is the set of r ∈ R(N) such that every prime q | r satisfies M | [K(q) : K(1)], M | P(Fr_q^{-1} | T^*; 1), and q splits completely in F(1)/K.

**Hypotheses.**

- a Selmer triple; for (c) an ideal N divisible by p and the ramified primes

**Construction.**

1. If τ satisfies (H.2) and the Frobenius class of ℓ in Gal(ℚ(T/m^kT, μ_{p^d})/ℚ) is that of τ (p^d generating the kernel of ℤ_p → R/m^k), then ℓ ∈ P_k (Mazur–Rubin 2004, Lemma 3.5.6(i)).
2. M | [K(q) : K(1)] iff q splits completely in K(μ_M̄, (O_K^×)^{1/M̄}); and if Fr_q is conjugate to τ on F(1)(μ_M̄, (O_K^×)^{1/M̄}, W_M) with T^{τ=1} ≠ 0 then q ∈ R_{F,M} (Rubin, Lemmas IV.1.2–1.3).
3. P(L,τ) is a nonempty conjugacy-class Frobenius set and has positive density. For the unrestricted 2004 P_k, (H.2) provides a nonempty Frobenius subset by Lemma 3.5.6(i). For P_k restricted to a chosen P, require the containment hypothesis (H.5), or 2016 (H.7) and k large enough as specified there. An arbitrary P, including P=∅, need not have positive density. Rubin’s prime-selection hypotheses similarly supply a nonempty Frobenius subset of the allowed primes.

**Uses that determine the API.**

- Mazur–Rubin 2004, hypothesis (H.5) and §3.6: P_t ⊆ P ⊆ P_1, and the useful primes are found inside P_k
- Rubin, Definition IV.4.10: derivative classes κ_{F,r,M} exist for r ∈ R_{F,M}
- Burns–Sakamoto–Sano II, §3.1.2: P is the set of primes with Frobenius conjugate to τ in Gal(K(A)_M/K)

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.kolyvaginPrimes` | data | P_k ⊆ P for k ≥ 1. |
| `TauCeti.KolyvaginSystems.kolyvaginPrimes_antitone` | relation | P_{k+1} ⊆ P_k. |
| `TauCeti.KolyvaginSystems.frobeniusPrimes` | data | P(L, τ), as Tau Ceti's frobeniusPrimeSet of the class of τ minus Σ(F). |
| `TauCeti.KolyvaginSystems.mem_kolyvaginPrimes_of_frobenius` | characterisation | If Fr_ℓ is conjugate to τ in Gal(ℚ(T/m^kT, μ_{p^d})/ℚ) and τ satisfies (H.2), then ℓ ∈ P_k. |
| `TauCeti.KolyvaginSystems.rubinPrimes` | data | R_{F,M} ⊆ R(N). |
| `TauCeti.KolyvaginSystems.mem_rubinPrimes_of_frobenius` | characterisation | Rubin's Lemma IV.1.3: Fr_q conjugate to τ on F(1)(μ_M̄, (O_K^×)^{1/M̄}, W_M) with T^{τ=1} ≠ 0 implies q ∈ R_{F,M}. |
| `TauCeti.KolyvaginSystems.kolyvaginPrimes_infinite` | other | For the unrestricted 2004 P_k, (H.2) implies positive density and infinitude after removing a finite set. For the definition restricted to P, also require P to contain that Frobenius subset, as ensured by the stated (H.5)/(H.7) bounds. |

**Unit tests.**

- `kolyvaginPrimes_zp_one` (computation): For T = ℤ_p(1) over ℚ with Σ(F) = {p, ∞}: P_k = {ℓ ≠ p : ℓ ≡ 1 (mod p^k)}.
- `kolyvaginPrimes_inter` (degenerate): For R = ℤ_p and T = ℤ_p(1), ∩_k P_k = ∅: no prime is ≡ 1 modulo every power of p.
- `rubinPrimes_rat` (compatibility): For K = ℚ, F = ℚ, T = ℤ_p(1) and M = p^k, a prime ℓ ∤ N lies in R_{ℚ,M} iff ℓ ≡ 1 (mod p^k), since P(Fr_ℓ^{-1} | T^*; 1) = 1 − Fr_ℓ^{-1} acting on T^* = ℤ_p is 0 and [ℚ(ℓ) : ℚ] is the p-part of ℓ − 1.
- `not_mem_kolyvaginPrimes` (non-example): For T = T_pE and ℓ ≡ 1 (mod p) with a_ℓ ≢ 2 (mod p), ℓ ∉ P_1: I_ℓ = R.

**Acceptance.**

- For ℓ ∈ P_k with R principal artinian of length k: H¹_f(ℚ_ℓ, T), H¹_s(ℚ_ℓ, T) and their duals are free of rank one and φ^fs_ℓ is an isomorphism (Lemma 3.5.6(ii)).
- All chosen primes avoid Σ(F) and any prescribed finite set.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `tauceti:NumberField.Chebotarev.frobeniusPrimeSet`
- `tauceti:NumberField.artinSymbol`

**Sources.**

- `mr-ks`, Definition 3.1.6, p. 21. The sets P_k. Source excerpt: “T /(mk T + (Fr` − 1)T ) is free of rank one over R/mk , and”
- `mr-higher`, Definition 4.2, p. 9. The sets P(L, τ). Source excerpt: “and Frq is conjugate to τ in Gal(L/K)}.”
- `rubin-es`, Chapter IV, Definition 1.1, p. 57. Rubin's sets R_{F,M}. Source excerpt: “If K ⊂f F ⊂ K∞ and M ∈ O is nonzero, define RF,M ⊂ R by”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Finite and singular parts at an unramified prime

`EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition` — lemma

**Statement.** Let K_v be nonarchimedean of residue characteristic ≠ p with residue field 𝔽, T a finitely generated R-module with unramified G_{K_v}-action and |𝔽^×|·T = 0. There are canonical functorial isomorphisms H¹_f(K_v, T) ≅ T/(Fr − 1)T (evaluate cocycles at Frobenius), H¹_s(K_v, T) := H¹(K_v, T)/H¹_f(K_v, T) ≅ Hom(I, T^{Fr=1}), and H¹_s(K_v, T) ⊗ 𝔽^× ≅ T^{Fr=1}.

**Hypotheses.**

- T unramified, of finite type
- |𝔽^×|·T = 0

**Proof outline.**

1. H¹_f = H¹(G_𝔽, T) ≅ T/(Fr − 1)T is SelmerIwasawaCohomology L2/unramified-condition (unramified_equiv_coinvariants).
2. The sequence 0 → H¹(G_𝔽, T) → H¹(K_v, T) → H¹(I, T)^{G_𝔽} → 0 (vanishing of H²(G_𝔽, T)) gives H¹_s ≅ Hom(I, T)^{Fr=1}; since |𝔽^×|T = 0 and I/|𝔽^×|I ≅ 𝔽^× canonically (tame inertia), Hom(I, T)^{Fr=1} = Hom(𝔽^×, T^{Fr=1}).

**Acceptance.**

- For T = ℤ/p^k with trivial action and p^k | #𝔽^×: H¹_f ≅ ℤ/p^k and H¹_s ≅ Hom(𝔽^×, ℤ/p^k).
- The isomorphisms commute with maps T → T′ of such modules.

**Prerequisites.**

- `SelmerIwasawaCohomology:L2/unramified-condition`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `ArithmeticGaloisDuality:R02.2/compact-five-term`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

**Sources.**

- `mr-ks`, Lemma 1.2.1, p. 10. The two canonical identifications. Source excerpt: “The isomorphism of (i) is induced by evaluating cocycle classes in H 1 (GF , T ) on Frobenius.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The transverse local condition

`EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition` — definition

**Planet:** Transverse local condition.

**Statement.** In the situation of finite-singular-decomposition, fix a maximal totally tamely ramified abelian extension L/K_v (so Gal(L/K_v) ≅ 𝔽^×; for K_v = ℚ_ℓ take L = ℚ_ℓ(μ_ℓ); globally L is the completion of K(q) at q, of degree |G_q|, with T killed by |G_q|). The L-transverse condition is H¹_tr(K_v, T) = ker(H¹(K_v, T) → H¹(L, T)) = H¹(L/K_v, T^{G_L}). It projects isomorphically onto H¹_s(K_v, T), so H¹(K_v, T) = H¹_f(K_v, T) ⊕ H¹_tr(K_v, T), functorially in T. It is defined by restriction to the specified extension L, not by a choice of complement.

**Hypotheses.**

- T unramified with |𝔽^×|·T = 0 (or |Gal(L/K_v)|·T = 0 for the p-part)
- L/K_v totally tamely ramified abelian of maximal degree

**Construction.**

1. Since L/K_v is totally ramified and T unramified, T^{G_L} = T^{Fr=1}; the composite H¹(L/K_v, T^{G_L}) = Hom(Gal(L/K_v), T^{Fr=1}) → Hom(I/|𝔽^×|I, T^{Fr=1}) ≅ H¹_s is an isomorphism (Mazur–Rubin 2004, Lemma 1.2.4).
2. c ∈ H¹(K_v, T) decomposes as c_f + c_tr.

**Uses that determine the API.**

- Mazur–Rubin 2004, Example 2.1.8: the Selmer structure F(n) puts the transverse condition at the primes dividing n
- Mazur–Rubin 2016, Definition 6.2: loc^tr_q is the projection to H¹_tr with kernel H¹_f
- Howard, Proposition 1.1.9 and §1.2: the L-transverse condition for the p-part of the ring class field of conductor ℓ

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.transverse` | constructor | H¹_tr(K_v, T) = ker(res : H¹(K_v, T) → H¹(L, T)). |
| `TauCeti.KolyvaginSystems.transverse_isCompl_finite` | characterisation | H¹_f(K_v, T) and H¹_tr(K_v, T) are complementary submodules of H¹(K_v, T). |
| `TauCeti.KolyvaginSystems.transverse_equiv_singular` | equivalence | The projection H¹_tr(K_v, T) → H¹_s(K_v, T) is an isomorphism. |
| `TauCeti.KolyvaginSystems.transverse_map` | functoriality | A map T → T′ of unramified modules killed by \|𝔽^×\| carries H¹_tr to H¹_tr. |
| `TauCeti.KolyvaginSystems.finitePart` | projection | c ↦ c_f and c ↦ c_tr, the two projections of the decomposition. |
| `TauCeti.KolyvaginSystems.transverse_eq_bot_iff` | simp | H¹_tr(K_v, T) = 0 iff T^{Fr=1} = 0. |

**Unit tests.**

- `transverse_zmod` (computation): For K_v = ℚ_ℓ, ℓ ≡ 1 (mod p^k), T = ℤ/p^k: H¹(ℚ_ℓ, T) = Hom(ℚ_ℓ^×, ℤ/p^k) ≅ (ℤ/p^k)², H¹_f is the homomorphisms trivial on ℤ_ℓ^×, and H¹_tr is the homomorphisms trivial on the norm group ⟨ℓ⟩ × (1 + ℓℤ_ℓ) of ℚ_ℓ(μ_ℓ), that is, those with f(ℓ) = 0.
- `transverse_trivial` (degenerate): If T^{Fr=1} = 0 then H¹_s = 0 = H¹_tr and H¹ = H¹_f.
- `transverse_ne_arbitrary_complement` (non-example): In the example above, {f : f(ℓu) = 0}, for a unit u ∈ ℤ_ℓ^× that is not a p-th power modulo ℓ, is another complement of H¹_f = {f : f(ℤ_ℓ^×) = 0}, and it is not H¹_tr = {f : f(ℓ) = 0}: the transverse condition is determined by L = ℚ_ℓ(μ_ℓ).
- `transverse_dual` (compatibility): H¹_tr(K_v, T) and H¹_tr(K_v, T^*) are exact orthogonal complements under the local Tate pairing.

**Acceptance.**

- Different choices of L give different complements; all are transverse to H¹_f.
- The transverse condition does not in general propagate to subquotients as the transverse condition (Remark 1.1.8), but F(n) stays cartesian on quotients (Lemma 3.7.4).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`

**Sources.**

- `mr-ks`, Definition 1.1.6(iv) and Lemma 1.2.4, pp. 9, 11. Definition of the transverse condition and the splitting. Source excerpt: “In other words, (3) has a functorial splitting (depending on L)”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The finite–singular comparison map

`EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison` — construction

**Planet:** Finite–singular comparison map.

**Statement.** Let T be free of finite rank over R, unramified at v, with |𝔽^×|·T = 0 and det(1 − Fr | T) = 0. Put P(x) = det(1 − Fr x | T) and let Q(x) ∈ R[x] be the unique polynomial with (x − 1)Q(x) = P(x). By Cayley–Hamilton Q(Fr^{-1})T ⊆ T^{Fr=1}, and φ^fs : H¹_f(K_v, T) ≅ T/(Fr − 1)T → T^{Fr=1} ≅ H¹_s(K_v, T) ⊗ 𝔽^× is induced by Q(Fr^{-1}). If R is artinian, |𝔽^×|R = 0 and T/(Fr − 1)T is free of rank one, then det(1 − Fr | T) = 0 automatically and Q(Fr^{-1}) and φ^fs are isomorphisms, so H¹_f and H¹_s are free of rank one. With the tensor factor 𝔽^× (globally G_q) retained the map involves no choice. A generator σ of the tame quotient gives Rubin's map φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q : H¹_f → H¹_s (α_q evaluation at σ, β_q evaluation at Frobenius), and φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ; for another generator σ^a one has φ^fs_{q,σ^a} = a^{-1}·φ^fs_{q,σ}, so the tensor-valued map is independent of the generator.

**Hypotheses.**

- T free of finite rank, unramified
- |𝔽^×|·T = 0
- det(1 − Fr | T) = 0

**Construction.**

1. P(1) = 0 gives Q; P(Fr^{-1}) = 0 on T by Cayley–Hamilton (Mathlib's LinearMap.aeval_self_charpoly after reversing the polynomial), so (Fr^{-1} − 1)Q(Fr^{-1}) = 0 and Q(Fr^{-1}) kills (Fr − 1)T.
2. Compose with the identifications of finite-singular-decomposition.
3. Isomorphism statement: reduce to R a field by Nakayama, where it is Rubin's Corollary A.2.7; then compare lengths of T/(Fr − 1)T and T^{Fr=1} (Mazur–Rubin 2004, Lemma 1.2.3).
4. Rubin's convention uses the Euler polynomial P(Fr_q^{-1} | T^*; x) ≡ det(1 − Fr_q x | W_M) modulo M (Lemma IV.1.2(iii)), so the two maps agree on W_M = T/MT.

**Uses that determine the API.**

- Mazur–Rubin 2004, Definition 3.1.3, relation (5): (κ_{nℓ})_{ℓ,s} = φ^fs_ℓ(κ_n) is the Kolyvagin system relation
- Rubin, Theorem IV.5.4: the singular part of κ_{F,rq,M} at q is φ^fs_q of the finite part of κ_{F,r,M}
- Mazur–Rubin 2016, Definition 6.2: loc^f_q is the finite projection followed by φ^fs_q
- HeegnerPointEulerSystems HE.5: the Heegner finite–singular comparison is this map for T_pE at an inert prime

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.fsQuotientPoly` | data | Q(x) with (x − 1)·Q(x) = det(1 − Fr·x \| T), defined when det(1 − Fr \| T) = 0. |
| `TauCeti.KolyvaginSystems.fsQuotientPoly_spec` | characterisation | (X − 1) * Q = P and Q is unique. |
| `TauCeti.KolyvaginSystems.finiteSingular` | constructor | φ^fs : H¹_f(K_v, T) → H¹_s(K_v, T) ⊗ 𝔽^×, induced by Q(Fr^{-1}) : T/(Fr − 1)T → T^{Fr=1}. |
| `TauCeti.KolyvaginSystems.finiteSingular_bijective` | characterisation | If R is artinian, \|𝔽^×\|R = 0 and T/(Fr − 1)T is free of rank one, φ^fs is bijective and H¹_f, H¹_s are free of rank one. |
| `TauCeti.KolyvaginSystems.finiteSingular_map` | functoriality | The comparison is natural under equivariant maps compatible with the chosen quotient polynomials: f ∘ Q_T(Fr_T^{-1}) = Q_T′(Fr_T′^{-1}) ∘ f. In particular, for reductions of one fixed finite free lattice under R/I → R/J, characteristic and quotient polynomials reduce together, so φ^fs commutes with the coefficient-reduction maps. Arbitrary equivariant maps between representations with different characteristic polynomials need not commute. |
| `TauCeti.KolyvaginSystems.finiteSingular_generator` | compatibility | For a generator σ of the tame quotient, φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ with φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q Rubin's map; φ^fs_{q,σ^a} = a^{-1}·φ^fs_{q,σ}, so the tensor-valued map does not depend on σ. |

**Unit tests.**

- `finiteSingular_cyclotomic` (computation): R = ℤ/p^k, T = μ_{p^k}, ℓ ≡ 1 (mod p^k): Fr = 1 on T, P(x) = 1 − x, Q(x) = −1, and φ^fs = −1 under H¹_f ≅ T, H¹_s ⊗ 𝔽_ℓ^× ≅ T.
- `finiteSingular_rank_two` (computation): R = 𝔽_p, T with Fr = diag(1, a), a ≠ 1: P(x) = (1 − x)(1 − ax), Q(x) = −(1 − ax), Q(Fr^{-1}) = −diag(1 − a, 0), which maps T/(Fr − 1)T = 𝔽_p e₁ isomorphically onto T^{Fr=1} = 𝔽_p e₁.
- `finiteSingular_not_iso` (non-example): R = 𝔽_p, T = 𝔽_p² with Fr = 1: T/(Fr − 1)T has rank two, P(x) = (1 − x)², Q(x) = −(1 − x), and Q(Fr^{-1}) = 0: φ^fs is zero, not an isomorphism. The rank-one hypothesis is needed.
- `finiteSingular_quotient` (compatibility): For R=ℤ/p² and T=R with Fr=1, compare the finite–singular maps for T over R and T/pT over R/p: both quotient polynomials are Q=−1, and the maps on finite and singular terms commute with reduction.
- `finiteSingular_not_natural_inclusion` (non-example): Over 𝔽₅ include the rank-one representation with Fr=1 into the first summand of Fr=diag(1,2). On the fixed line the source Q(1)=−1=4, whereas the target Q(1)=−(1−2)=1. Thus the induced inclusion does not commute with φ^fs; equivariance alone is insufficient.

**Acceptance.**

- φ^fs commutes with the quotient maps T/I_nT → T/JT: both identifications and Q(Fr^{-1}) are functorial.
- For T = ℤ/p^k(1) and ℓ ≡ 1 (mod p^k): P(x) = 1 − ℓx ≡ 1 − x, Q = −1, and φ^fs is −1 times the tautological identification of T/(Fr − 1)T = T with T^{Fr=1} = T.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `mathlib:LinearMap.aeval_self_charpoly`
- `mathlib:LinearMap.charpoly`

**Sources.**

- `mr-ks`, Definition 1.2.2, p. 10. The comparison map with its tensor factor. Source excerpt: “Since P (1) = 0, there is a unique polynomial Q(x) ∈ R[x] such that”
- `rubin-es`, Chapter IV, Definition 5.3, pp. 67–68. Rubin's version with a chosen generator σ_q. Source excerpt: “We define the “finite-singular comparison” map”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The Selmer structures F_a^b(c)

`EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures` — definition

**Statement.** For a Selmer structure F and pairwise coprime a, b, c with c ∈ N(P) (and I_cT = 0 when needed for the transverse condition; in general one works on T/I_cT), F_a^b(c) has Σ = Σ(F) ∪ {q : q | abc} and local conditions: H¹_F(K_q, T) for q ∈ Σ(F), q ∤ ab; 0 for q | a (strict); H¹(K_q, T) for q | b (relaxed); H¹_tr(K_q, T) for q | c (transverse). One writes F(n) = F^1_1(n), F^n, F_n. Then F_n ≤ F ≤ F^n and F_n ≤ F(n) ≤ F^n, and the dual is (F_a^b(c))^* = (F^*)_b^a(c).

**Hypotheses.**

- a, b, c pairwise coprime; c ∈ N(P); T killed by I_c for the transverse places

**Construction.**

1. Built from SelmerIwasawaCohomology L2/selmer-data (withCond, strict, relax) and the transverse condition.
2. Duals: strict and relaxed are exchanged; finite and transverse are self-dual (transverse-duality).
3. If R is principal artinian of length k, (H.2) holds, F is cartesian and n ∈ N_k, then F(n) is cartesian (Mazur–Rubin 2004, Lemma 3.7.4).

**Uses that determine the API.**

- Mazur–Rubin 2004, Definitions 3.1.2 and 3.1.8: stalks H¹_{F(n)} for Kolyvagin systems and H¹_{F^n} for weak ones
- Mazur–Rubin 2016, Definition 6.1: Stark systems use the relaxed Selmer modules H¹_{F^n}
- Mazur–Rubin 2004, Lemma 4.1.6: the lattice of inclusions among F_ℓ(n), F(n), F(nℓ), F^ℓ(n)

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.SelmerTriple.modify` | constructor | F_a^b(c): strict at a, relaxed at b, transverse at c. |
| `TauCeti.KolyvaginSystems.SelmerTriple.modify_le` | relation | If a′ \| a, b \| b′ and c = c′ then F_a^b(c) ≤ F_{a′}^{b′}(c′); in particular F_n ≤ F ≤ F^n and F_n ≤ F(n) ≤ F^n. |
| `TauCeti.KolyvaginSystems.SelmerTriple.dual_modify` | compatibility | (F_a^b(c))^* = (F^*)_b^a(c). |
| `TauCeti.KolyvaginSystems.SelmerTriple.selmer_strict_eq_inf` | characterisation | H¹_{F_n}(K, T) = H¹_F(K, T) ⊓ H¹_{F(n)}(K, T). |
| `TauCeti.KolyvaginSystems.SelmerTriple.modify_isCartesian` | other | Under (H.2), R principal artinian of length k and n ∈ N_k, F cartesian implies F(n) cartesian. |

**Unit tests.**

- `modify_one` (degenerate): F_1^1(1) = F.
- `dual_modify_strict_relaxed` (compatibility): (F^n)^* = (F^*)_n and (F_n)^* = (F^*)^n.
- `modify_sandwich` (characterisation): F_n ≤ F(n) ≤ F^n, and the quotient H¹_{F^n}/H¹_{F_n} injects into ⊕_{q | n} H¹(K_q, T).
- `modify_transverse_ne_finite` (non-example): For q ∈ P_1 with H¹_s(K_q, T) ≠ 0, F(q) ≠ F and neither F(q) ≤ F nor F ≤ F(q).

**Acceptance.**

- H¹_{F_n}(K, T) = H¹_F(K, T) ∩ H¹_{F(n)}(K, T).
- The dual of F(n) is F^*(n): the transverse condition is not replaced by its naive complement.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `SelmerIwasawaCohomology:L2/selmer-data`
- `SelmerIwasawaCohomology:L2/dual-selmer-structure`
- `SelmerIwasawaCohomology:L2/change-of-conditions`

**Sources.**

- `mr-ks`, Example 2.1.8, p. 15. The modified structures. Source excerpt: “In other words, Fab (c) consists of F together with the strict condition at primes dividing a, the unrestricted condition at primes dividing b, and the transverse condition at primes dividing c.”
- `mr-ks`, Example 2.3.2, p. 17. Their duals. Source excerpt: “By Proposition 1.3.2, the dual Fab (c)∗ of the Selmer structure Fab (c) is (F ∗ )ba (c).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The transverse condition is self-dual

`EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality` — theorem

**Statement.** Let K_v be nonarchimedean of residue characteristic ≠ p, T unramified with |𝔽^×|·T = 0, and L/K_v totally ramified abelian of degree |𝔽^×|. Then H¹_tr(K_v, T) and H¹_tr(K_v, T^*) are exact orthogonal complements under the local Tate pairing H¹(K_v, T) × H¹(K_v, T^*) → ℚ_p/ℤ_p, as are H¹_f(K_v, T) and H¹_f(K_v, T^*).

**Hypotheses.**

- v ∤ p
- T unramified
- |𝔽^×|·T = 0

**Proof outline.**

1. The finite parts are orthogonal complements (ArithmeticGaloisDuality R02.4/unramified-exact-annihilators; SelmerIwasawaCohomology L2/finite-condition-lattice-duality).
2. By the splitting it suffices that the transverse parts are orthogonal. Reduce to T = ℤ/p^k with p^k | #𝔽^×: H¹_tr(T) = Hom(K_v^×/N L^×, ℤ/p^k) and H¹_tr(T^*) = ker(K_v^×/p^k → L^×/p^k) by class field theory and Kummer theory; if α = β^{p^k} then N_{L/K_v}β = α^{#𝔽^×/p^k}, so α is divisible by p^k in the cyclic group K_v^×/N L^× of order #𝔽^×.
3. General T: H¹_tr(K_v, T) = H¹_tr(K_v, T^{G_{K_v}}) and T^{G_{K_v}} is a sum of cyclic modules.

**Acceptance.**

- Local orthogonality for the strict, relaxed and transverse modifications: (F_a^b(c))^* = (F^*)_b^a(c).
- For T = ℤ/p^k the pairing of a transverse character with a transverse Kummer class is 0.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators`
- `SelmerIwasawaCohomology:L2/finite-condition-lattice-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

**Sources.**

- `mr-ks`, Proposition 1.3.2, p. 12. Self-duality of the finite and transverse conditions. Source excerpt: “The next proposition says that (on suitable modules T ) the finite and transverse conditions are self-dual.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Simultaneous nonvanishing of localisations

`EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing` — theorem

**Statement.** Let R be principal artinian and (T, F, P) satisfy (H.0)–(H.5) of Mazur–Rubin 2004. If c₁, c₂ ∈ H¹(ℚ, T) and c₃, c₄ ∈ H¹(ℚ, T^*) are all nonzero, then for every k ≥ 1 there is a set S ⊆ P_k of positive density such that for every ℓ ∈ S the four localisations (c_i)_ℓ are nonzero. Over a number field with self-injective coefficients (Burns–Sakamoto–Sano II, Lemma 3.9, under Hypothesis 3.2): for nonzero c₁, …, c_s ∈ H¹(K, A) and c₁^*, …, c_t^* ∈ H¹(K, A^*(1)) with s + t < p, there is a set of primes q ∈ P of positive density with all localisations nonzero.

**Hypotheses.**

- (H.0)–(H.5); this is the only place (H.4) is used
- for the second form: Hypothesis 3.2 of Burns–Sakamoto–Sano II

**Proof outline.**

1. Let F = ℚ(T, μ_{p^k}) and fix τ as in (H.2). By (H.3) restriction C → Hom(G_F, T)^{G_ℚ} is injective; by (H.1) the image of c_i(G_F) in T/(τ − 1)T is nonzero.
2. Each condition 'c_i(γτ) ≠ 0 in T/(τ − 1)T' excludes a proper coset union in G_F; (H.4) ((H.4a), or p > 4 counting four proper subgroups) shows the four conditions hold simultaneously for some γ.
3. Chebotarev (Tau Ceti's Chebotarev roadmap) gives a positive density of ℓ with Frobenius γτ on the field cut out by the classes; such ℓ lie in P_k by kolyvagin-primes, and loc_ℓ(c_i) ≠ 0 since H¹_f(ℚ_ℓ, T) ≅ T/(Fr − 1)T.

**Acceptance.**

- A single prime with Frobenius τ on ℚ(T, μ_{p^k}) does not suffice: the condition is on the larger field cut out by the classes.
- The primes may be chosen outside any finite set, in particular prime to Σ(F) and to a given n ∈ N.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `mr-ks`, Proposition 3.6.1, p. 30. The four-class statement. Source excerpt: “For every k ∈ Z+ there is a set S ⊂ Pk of positive density such that for every ` ∈ S, the localizations (ci )` are all nonzero.”
- `bss2`, Lemma 3.9, p. 17. The version over a number field with Gorenstein coefficients. Source excerpt: “Lemma 3.9 ([11, Prop. 3.6.1]). Assume Hypothesis 3.2.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Primes with prescribed localisation kernels

`EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels` — theorem

**Statement.** In the setting of chebotarev-nonvanishing, suppose the image of R → End(T) is contained in the image of ℤ_p[[G_ℚ]] → End(T). Fix a finite R-submodule C ⊆ H¹(ℚ, T), a homomorphism φ : C → R and k ≥ 1. (i) There is a set S ⊆ P_k of positive density with ker(loc_ℓ : C → H¹(ℚ_ℓ, T)) = ker φ for all ℓ ∈ S. (ii) If also (H.4a) holds, D ⊆ H¹(ℚ, T^*) is a finite submodule and ψ : D → R a homomorphism, then S can be chosen with in addition ker(loc_ℓ on D) = ker ψ.

**Hypotheses.**

- (H.0)–(H.5)
- image of R in End(T) inside the image of ℤ_p[[G_ℚ]]
- (H.4a) for (ii)

**Proof outline.**

1. Via C → Hom(G_F, T/(τ − 1)T) ≅ Hom(G_F, R) (after fixing a generator), find γ ∈ G_F realising φ; the hypothesis on End(T) makes the span of the image of G_F an R-module (Mazur–Rubin 2004, Lemma 3.6.3).
2. (H.4a) makes the extensions cut out by C and D linearly disjoint, so φ and ψ can be realised by one γ; apply Chebotarev as before.

**Acceptance.**

- Used with C = H¹_F(ℚ, T) and ker φ_i cutting out a submodule L to find leading vertices through L (ES.4/leading-vertices).
- Fails without the End(T) hypothesis: only 𝔽_p-rational subspaces occur when T = T₀ ⊗ k (Remark 4.1.17).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`

**Sources.**

- `mr-ks`, Proposition 3.6.2, p. 30. Prescribed kernels of localisation. Source excerpt: “Suppose that the image of R → End(T ) is contained in the image of Zp [[GQ ]] → End(T ).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Rubin's selection of primes with large localisation

`EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection` — theorem

**Statement.** Let p > 2, let T satisfy Hyp(K, T) with its element τ, fix a power M of p, and let L/K be Galois with G_L acting trivially on W_M and W_M^*. (a) For κ ∈ H¹(K, W_M) and η ∈ H¹(K, W_M^*) there is γ ∈ G_L with order(κ(γτ), W_M/(τ − 1)W_M) ≥ order((κ)_L, H¹(L, W_M)) and the same for η. (b) For an Euler system c with derivative classes κ_{r,M} = κ_{K,r,M} and a finite subset C ⊆ H¹(K, W_M^*) with k = |C|, there are primes q₁, …, q_k of K such that, with r_i = q₁⋯q_i: q_i ∈ R_{K,M}; Fr_{q_i} is in the class of τ in Gal(K(W_M)/K); order((κ_{r_{i−1},M})_{q_i}, H¹_f(K_{q_i}, W_M)) ≥ order((κ_{r_{i−1},M})_Ω, H¹(Ω, W_M)); and every η ∈ C vanishing at all q_i lies in H¹(Ω/K, W_M^*). Under Hyp(K, V) alone the same holds with both orders lowered by a + 1 for a constant a (Lemma V.3.1).

**Hypotheses.**

- Hyp(K, T) for (a), (b); Hyp(K, V) for the weakened form
- Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞})

**Proof outline.**

1. (a): the evaluation maps G_L → W_M/(τ − 1)W_M are homomorphisms whose images generate modules of the stated order by irreducibility of T ⊗ k; a group is not the union of two proper subgroups (p > 2 is used here).
2. (b): choose q_i inductively by Chebotarev in the extension of Ω-level cut out by κ_{r_{i−1},M} and η_i, with Frobenius γτ; then q_i ∈ R_{K,M} by Lemma IV.1.3.
3. The loss between K and Ω is H¹(Ω/K, W_M) and H¹(Ω/K, W_M^*): the source of n_W and n_W^*.

**Acceptance.**

- With H¹(Ω/K, W) = H¹(Ω/K, W^*) = 0 the selection has no loss, as in chebotarev-nonvanishing.
- The primes avoid N and all earlier q_j.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `rubin-es`, Chapter V, Lemma 2.3, p. 81. The inductive choice of primes. Source excerpt: “Then there is a finite set Σ = {q1 , . . . , qk } of primes of K satisfying the”
- `rubin-es`, Chapter V, Lemma 3.1, p. 87. The weakened form under Hyp(K, V). Source excerpt: “The extra ‘1’ takes care of the case p = 2.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Exponents, orders and reducibility depth

`EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth` — definition

**Statement.** Let O_λ be a discrete valuation ring with uniformiser λ. For an O_λ-module M and x ∈ M: exp_λ(x, M) = min{d ≥ 0 : λ^d x = 0} ∈ ℤ_{≥0} ∪ {∞} and ord_λ(x, M) = sup{d ≥ 0 : x ∈ λ^d M}. For a profinite group G and a torsion O_λ[G]-module R of finite type, the reducibility depth of R is the smallest integer r_R ≥ 0 such that (1) every G-stable O_λ-submodule R′ ⊆ R not contained in λR contains λ^{r_R}R, and (2) for every m ≥ 1, End_{O_λ[G]}(R̄^{(m)})/O_λ·id is annihilated by λ^{r_R}, where R̄^{(m)} = R/λ^mR. If R/λR is absolutely irreducible then r_R = 0. If R is a lattice with R ⊗ ℚ absolutely irreducible, there is r_R depending only on R bounding the reducibility depth of every R̄^{(m)}.

**Hypotheses.**

- O_λ a discrete valuation ring with finite residue field
- R of finite type

**Construction.**

1. Absolutely irreducible residual representation: a submodule not in λR surjects onto R/λR, so equals R by Nakayama; endomorphisms are scalars by Schur and lifting.
2. Uniform bound: for R_ℚ absolutely irreducible the lattices stable under G in R_ℚ form finitely many homothety classes and End(R) = O_λ; a compactness argument bounds both conditions uniformly in m (Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.3.3).

**Uses that determine the API.**

- Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.3.4 and Definition 2.6.5: the loss λ^{𝔣(r_S) r_R} in the saturation of θ_S and in abundant tuples
- Castella–Grossi–Lee–Skinner, §3.3.1: the constants C_1, C_2 play the role of the reducibility depth for T_pE with reducible residual representation
- HeegnerPointEulerSystems HE.7: exceptional primes need bounds uniform in the torsion exponent

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ErrorTolerant.expAt` | data | exp_λ(x, M) ∈ ℕ∞. |
| `TauCeti.ErrorTolerant.ordAt` | data | ord_λ(x, M) ∈ ℕ∞. |
| `TauCeti.ErrorTolerant.expAt_add_ordAt_le` | relation | In a free O_λ/λ^n-module, exp_λ(x) + ord_λ(x) = n for x ≠ 0. |
| `TauCeti.ErrorTolerant.reducibilityDepth` | data | r_R for a torsion O_λ[G]-module R of finite type. |
| `TauCeti.ErrorTolerant.reducibilityDepth_eq_zero` | example | If R/λR is absolutely irreducible then r_R = 0. |
| `TauCeti.ErrorTolerant.reducibilityDepth_bounded` | other | For a lattice R with R_ℚ absolutely irreducible, sup_m r_{R̄^{(m)}} < ∞. |

**Unit tests.**

- `expAt_zmod` (computation): In M = ℤ/p³, exp_p(p) = 2 and ord_p(p) = 1.
- `reducibilityDepth_irreducible` (degenerate): For R = E[p^m] with E[p] absolutely irreducible, r_R = 0.
- `reducibilityDepth_reducible` (non-example): For R = ℤ/p² ⊕ ℤ/p² with G acting through the upper unipotent matrices (1, p·b; 0, 1), b ∈ ℤ/p, the submodule generated by e₁ is G-stable and not contained in pR but does not contain R, so r_R ≥ 1: r_R ≠ 0 although R is free.
- `ordAt_top_iff` (characterisation): ord_λ(x, M) = ∞ iff x ∈ ∩_d λ^d M; for M of finite length this means x = 0.

**Acceptance.**

- r_R measures the failure of residual irreducibility that Mazur–Rubin's (H.1) excludes; with r_R = 0 the error-tolerant statements reduce to the clean ones.
- exp and ord are the 'order' functions of Rubin's Chapter V.

**Prerequisites.**

- `SelmerIwasawaCohomology:L2/selmer-data`

**Sources.**

- `ltxzz`, Definition 2.3.2, arXiv v3 p. 14. Definition of the reducibility depth. Source excerpt: “we define its reducibility depth to be the smallest integer rR ⩾ 0 such that”
- `ltxzz`, Lemma 2.3.3, arXiv v3 p. 14. The uniform bound. Source excerpt: “there exists an integer rR depending on R only, such that R̄(m) has reducibility depth at most rR”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.

### The field cut out by a Selmer module and saturation of θ_S

`EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation` — theorem

**Statement.** Fix m ≥ 1 and R free of finite rank over O_λ/λ^m with ρ : Γ_F → GL(R), F_ρ the field fixed by ker ρ and G = Gal(F_ρ/F). Restriction Res_ρ : H¹(F, R) → Hom_G(Γ^{ab}_{F_ρ}, R) gives a pairing [ , ] : H¹(F, R) × Γ^{ab}_{F_ρ} → R. For a finitely generated submodule S ⊆ H¹(F, R), F_S/F_ρ is the finite abelian extension with Gal(F^{ab}_ρ/F_S) = {γ : [s, γ] = 0 ∀ s ∈ S}, and θ_S : Gal(F_S/F_ρ) → Hom_{O_λ}(S, R) is injective and G-equivariant. (a) If Res_ρ is injective and S is free of rank r_S over O_λ/λ^m, the O_λ-span of the image of θ_S contains λ^{𝔣(r_S) r_R} Hom_{O_λ}(S, R), where 𝔣(0) = 𝔣(1) = 1, 𝔣(2) = 4, 𝔣(r + 1) = 2(𝔣(r) + 1) for r ≥ 2. (b) Res_ρ is injective if the image of Γ_F in GL(R̄) contains a nontrivial scalar, or if dim R̄ ≤ min{(ℓ + 1)/2, ℓ − 3}, R̄ is semisimple and Hom_{Γ_F}(End(R̄), R̄) = 0.

**Hypotheses.**

- R free over O_λ/λ^m
- for (a): Res_ρ injective

**Proof outline.**

1. θ_S is injective by definition of F_S; equivariance is the compatibility of the pairing with G.
2. (a) by induction on r_S using both conditions of the reducibility depth; (b) by inflation–restriction: ker Res_ρ = H¹(G, R), which vanishes by the scalar trick or by the cited H¹-vanishing for small faithful semisimple modules.

**Acceptance.**

- With r_R = 0 and r_S = 1 the image of θ_S spans Hom(S, R): the clean Chebotarev input of Mazur–Rubin's Proposition 3.6.1.
- (H.3) of Mazur–Rubin 2004 is the statement that Res is injective for the field ℚ(T, μ_{p^∞}).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `ArithmeticGaloisDuality:R02.2/compact-five-term`

**Sources.**

- `ltxzz`, Lemma 2.3.4, arXiv v3 p. 15. The saturation statement. Source excerpt: “Suppose that the map Resρ is injective.”
- `ltxzz`, Lemma 2.3.5, arXiv v3 pp. 15–16. The two criteria for injectivity of restriction. Source excerpt: “Suppose that either one of the following two assumptions holds:”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.

### γ-associated places and (S, γ)-abundant tuples

`EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples` — definition

**Statement.** Setting of Liu–Tian–Xiao–Zhang–Zhu §2.6: F/F⁺ of degree ≤ 2, R a polarised lattice with reductions ρ̄^{(m)} and their extensions ρ̄₊^{(m)} to Γ_{F⁺}, fields F ⊆ F^{(m)} ⊆ F₊^{(m)}, an element γ in the image of ρ̄₊^{(m)} lying in the nontrivial coset, h_γ the first component of γ^{[F:F⁺]}, and S a finitely generated submodule of the Selmer module in H¹(F, R̄^{(m)}). A place w₊ of F₊^{(m)} is γ-associated if it is not above ∞ or ℓ, is unramified over F⁺, its place of F^{(m)} is unramified in F_S, and its Frobenius in Gal(F₊^{(m)}/F⁺) is γ. G_{S,γ} ⊆ Gal(F_S/F^{(m)}) is the set of Frobenius elements Ψ_w of γ-associated places. Corrected Lemma 2.6.4: if the order of γ is prime to ℓ then G_{S,γ} ⊆ θ_S^{-1} Hom_{O_λ}(S, (R̄^{(m)})^{h_γ}), with equality when [F : F⁺] = 1; in general G_{S,γ} = q(N^α) for N the Galois group of the normal closure over F₊^{(m)}, α conjugation by a prime-to-ℓ lift of γ and q restriction to F_S. If S is free of rank r_S over O_λ/λ^{m−m₀}, an r_S-tuple (Ψ₁, …, Ψ_{r_S}) ∈ G_{S,γ}^{r_S} is (S, γ)-abundant if the image of S → ((R̄^{(m)})^{h_γ})^{⊕ r_S}, s ↦ (θ_S(Ψ_i)(s))_i, contains λ^{m₀ + 𝔣(r_S) r_R}((R̄^{(m)})^{h_γ})^{⊕ r_S}.

**Hypotheses.**

- the setting of §2.6 of the source
- order of γ prime to ℓ

**Construction.**

1. Frobenius elements of γ-associated places land in the h_γ-fixed part because Ψ_w is fixed by conjugation by the Frobenius of w₊ raised to [F : F⁺].
2. The exact image q(N^α) is computed by Chebotarev in the normal closure of F_S F₊^{(m)} over F⁺; the printed equality fails when [F : F⁺] = 2 and q(N^α) is a proper subgroup (PAPER-LIU-ETAL-22/E1 in the register of source mistakes).

**Uses that determine the API.**

- Liu–Tian–Xiao–Zhang–Zhu, Proposition 2.6.7 and §8: abundant tuples give primes at which a basis of S localises diagonally with bounded loss
- ES.4/abundant-localization: the bounded-error localisation statement used in descent

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ErrorTolerant.IsAssociatedPlace` | structure | The four conditions for a place of F₊^{(m)} to be γ-associated. |
| `TauCeti.ErrorTolerant.frobeniusSet` | data | G_{S,γ} ⊆ Gal(F_S/F^{(m)}). |
| `TauCeti.ErrorTolerant.frobeniusSet_subset_fixed` | characterisation | θ_S(G_{S,γ}) ⊆ Hom_{O_λ}(S, (R̄^{(m)})^{h_γ}), for γ of order prime to ℓ. |
| `TauCeti.ErrorTolerant.frobeniusSet_eq_image` | characterisation | G_{S,γ} = q(N^α); equality with the full preimage holds iff q : N^α → Gal(F_S/F^{(m)})^{h_γ} is surjective, in particular when [F : F⁺] = 1. |
| `TauCeti.ErrorTolerant.IsAbundant` | structure | The predicate on r_S-tuples of G_{S,γ}. |
| `TauCeti.ErrorTolerant.exists_isAbundant` | other | If Res is injective, R_ℚ is absolutely irreducible, (R̄^{(m)})^{h_γ} is free of rank one and q : N^α → K^{h} is surjective, an abundant r_S-tuple exists (corrected Proposition 2.6.6). |

**Unit tests.**

- `frobeniusSet_split_case` (compatibility): If F = F⁺ then G_{S,γ} = θ_S^{-1} Hom(S, (R̄^{(m)})^{h_γ}) with h_γ = γ: the printed lemma.
- `isAbundant_rank_one_irreducible` (degenerate): For r_S = 1, r_R = 0, m₀ = 0: Ψ is abundant iff θ_S(Ψ) : S → (R̄^{(m)})^{h_γ} is surjective.
- `frobeniusSet_proper` (non-example): For [F : F⁺] = 2 there are data with q(N^α) a proper subgroup of the h_γ-fixed part, so the printed equality of Lemma 2.6.4 fails; the corrected statement is the inclusion.
- `isAbundant_scaling` (characterisation): If (Ψ_i) is abundant for S free over O_λ/λ^{m−m₀}, then it is abundant for λS over O_λ/λ^{m−m₀−1} with m₀ replaced by m₀ + 1.

**Acceptance.**

- For [F : F⁺] = 1 the printed Lemma 2.6.4 holds as stated.
- Abundance is a property of actual Frobenius elements, not of arbitrary elements of Gal(F_S/F^{(m)}).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `ltxzz`, Definition 2.6.5, arXiv v3 p. 20. Definition of abundant tuples. Source excerpt: “is (S, γ)-abundant if the image of the”
- `ltxzz`, Lemma 2.6.4, arXiv v3 p. 19. The printed lemma, used here in its corrected form. Source excerpt: “Suppose that the order of γ is coprime to `. Then we have”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.

## ES.2. Euler-system modules and norm relations

Euler polynomials in the three conventions in use and their dictionary; the module of Euler systems as an equaliser inside a product of cohomology groups; conductor-indexed presentations; twisting; change of Euler factors; the universal Euler system with its freeness and Ext-vanishing; and the variants (rigidity conditions, finite depth, anticyclotomic systems, triviality at a set of primes). Depends on ES.1 for the fields `K(q)` and on `SelmerIwasawaCohomology:L3` for universal norms. The cyclotomic, Kato and Heegner owners map their classes into these modules.

**Planets of this layer:** Euler polynomial; Euler system; Universal Euler system.

### Euler polynomials and their conventions

`EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial` — definition

**Planet:** Euler polynomial.

**Statement.** Let T be a free module of finite rank over O (the ring of integers of a finite extension Φ of ℚ_p, or a coefficient order), with G_K-action unramified at a prime q ∤ p, Fr_q an arithmetic Frobenius, and T^* = Hom_O(T, O(1)). Rubin's Euler polynomial is P(Fr_q^{-1} | T^*; x) = det(1 − Fr_q^{-1}x | T^*) ∈ O[x]; it equals det(1 − N(q)^{-1}Fr_q x | T). Mazur–Rubin use P_q(x) = det(1 − Fr_q x | T). Burns–Sakamoto–Sano use P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) with T^* = Hom_R(T, R), which is Rubin's polynomial. The operators entering norm relations are obtained by substituting x = Fr_q^{-1} (acting on cohomology through Gal(F/K)): P(Fr_q^{-1} | T^*; Fr_q^{-1}) for Rubin and P_q(Fr_q^{-1}) for Mazur–Rubin. The coefficients satisfy a_i^{Rubin} = N(q)^{-i} a_i^{MR}, so the two polynomials are congruent modulo N(q) − 1, hence modulo M whenever M | [K(q) : K(1)].

**Hypotheses.**

- T unramified at q, q ∤ p
- Fr_q arithmetic Frobenius; the dual is the Tate dual Hom(T, O(1))

**Construction.**

1. det(1 − Fr_q^{-1}x | Hom(T, O(1))) = det(1 − N(q)^{-1}Fr_q x | T): Fr_q^{-1} acts on Hom(T, O(1)) as the transpose of Fr_q on T times ε_cyc(Fr_q)^{-1} = N(q)^{-1}.
2. P(Fr_q^{-1} | T^*; N(q)Fr_q^{-1}) annihilates T by Cayley–Hamilton; if M | [K(q) : K(1)] then P(Fr_q^{-1} | T^*; x) ≡ det(1 − Fr_q x | W_M) modulo M and P(Fr_q^{-1} | T^*; Fr_q^{-1}) annihilates W_M (Rubin, Lemma IV.1.2).

**Uses that determine the API.**

- Rubin, Definition II.1.1: the factor in the norm relation for a prime ramifying in F′/F
- Mazur–Rubin 2004, Definitions 2.2.1 and 3.2.2: P_ℓ(1) enters I_ℓ and P_ℓ(Fr_ℓ^{-1}) the norm relation
- EulerSystemsCyclotomicMainConjecture L0; KatoEulerSystems L2: the adapters identify their Euler factors with this polynomial

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.eulerPoly` | data | P(Fr_q^{-1} \| T^*; x) = det(1 − Fr_q^{-1}·x \| T^*) ∈ O[X], for T unramified at q. |
| `TauCeti.EulerSystems.eulerPoly_eq_det_twist` | characterisation | P(Fr_q^{-1} \| T^*; x) = det(1 − N(q)^{-1}·Fr_q·x \| T). |
| `TauCeti.EulerSystems.eulerPolyMR` | data | P_q(x) = det(1 − Fr_q·x \| T), the Mazur–Rubin convention. |
| `TauCeti.EulerSystems.eulerPoly_coeff` | relation | coeff_i(eulerPoly) · N(q)^i = coeff_i(eulerPolyMR). |
| `TauCeti.EulerSystems.eulerPoly_congr` | relation | eulerPoly ≡ eulerPolyMR modulo (N(q) − 1)·O[X]. |
| `TauCeti.EulerSystems.eulerPoly_aeval_annihilates` | characterisation | P(Fr_q^{-1} \| T^*; N(q)Fr_q^{-1}) = 0 on T, and P(Fr_q^{-1} \| T^*; Fr_q^{-1}) = 0 on W_M when M \| [K(q) : K(1)]. |
| `TauCeti.EulerSystems.eulerPoly_twist` | compatibility | For a character χ of finite order unramified at q: P(Fr_q^{-1} \| (T ⊗ χ)^*; x) = P(Fr_q^{-1} \| T^*; χ(Fr_q)x). |

**Unit tests.**

- `eulerPoly_zp_one` (computation): For T = ℤ_p(1): eulerPoly = 1 − X and eulerPolyMR = 1 − N(q)X.
- `eulerPoly_elliptic` (computation): For T = T_pE, q = ℓ of good reduction: eulerPolyMR = 1 − a_ℓX + ℓX² and eulerPoly = 1 − a_ℓ ℓ^{-1}X + ℓ^{-1}X²; at X = 1 they are (1 − a_ℓ + ℓ) and ℓ^{-1}(ℓ − a_ℓ + 1).
- `eulerPoly_ne_eulerPolyMR` (non-example): For T = ℤ_p(1) and N(q) ≠ 1 the two polynomials are different elements of O[X], although congruent modulo N(q) − 1.
- `eulerPoly_rank_zero` (degenerate): For T = 0 both polynomials are 1.

**Acceptance.**

- For T = ℤ_p(1): Rubin's polynomial is 1 − x (T^* = ℤ_p) and Mazur–Rubin's is 1 − N(q)x; they agree modulo N(q) − 1.
- The polynomials differ as elements of O[x]; systems for the two conventions are related by an explicit map, not equal (euler-factor-change).

**Prerequisites.**

- `mathlib:LinearMap.charpoly`
- `mathlib:LinearMap.aeval_self_charpoly`

**Sources.**

- `rubin-es`, Chapter IV, Lemma 1.2 and its proof, p. 57. The identity between the two determinants and the annihilation statements. Source excerpt: “This and the Cayley-Hamilton Theorem prove (ii), (iii), and (iv).”
- `mr-ks`, Remark 3.2.3, p. 23. The two conventions differ and are equivalent. Source excerpt: “However, it is easy to switch back and forth between the two choices, and they give equivalent theories and isomorphic modules ES(T ).”
- `bss2`, §6.1, pp. 36–37. The convention of Burns–Sakamoto–Sano, P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)). Source excerpt: “For a prime q ∈”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### The module of Euler systems

`EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module` — definition

**Planet:** Euler system.

**Statement.** Let 𝒦/K be an abelian extension and N an ideal of K divisible by p and by all primes where T is ramified. Write K ⊂_f F for finite subextensions F of 𝒦/K, and for F ⊆ F′ let Σ(F′/F) be the set of primes of K not dividing N that ramify in F′ but not in F. An Euler system for (T, 𝒦, N) is a family c = (c_F)_F with c_F ∈ H¹(F, T) such that for all K ⊂_f F ⊂_f F′ ⊆ 𝒦, Cor_{F′/F}(c_{F′}) = (∏_{q ∈ Σ(F′/F)} P(Fr_q^{-1} | T^*; Fr_q^{-1})) c_F. The set ES(T, 𝒦, N) of such families is the O[[Gal(𝒦/K)]]-submodule of ∏_F H¹(F, T) cut out by these equations (an equaliser). (𝒦, N) is admissible in Rubin's sense if (i) 𝒦 ⊇ K(q) for every q ∤ N and (ii) 𝒦 contains a ℤ_p^d-extension K_∞ of K, d ≥ 1, in which no finite prime splits completely. The definition itself does not require (i)–(ii); the theorems do. The zero family is an Euler system.

**Hypotheses.**

- 𝒦/K abelian
- p | N and N divisible by the primes where T is ramified

**Construction.**

1. Cor_{F′/F} is corestriction on continuous cohomology (Tau Ceti's explicitCor1 for the open subgroup G_{F′} ⊆ G_F), and Fr_q acts on H¹(F, T) through Gal(F/K), in which q is unramified.
2. The relations are O-linear in c and compatible with the Gal(𝒦/K)-action (σc)_F = σ(c_F), giving the module structure.
3. Since p | N, no Euler factors at primes above p occur and, for F ⊆ F′ ⊆ F K_∞, Cor_{F′/F}(c_{F′}) = c_F: the classes are universal norms in the K_∞-direction. The tower relation and the auxiliary-prime relation are the two cases Σ(F′/F) = ∅ and Σ(F′/F) = {q}.

**Uses that determine the API.**

- Rubin, Theorems II.2.2, II.2.3, II.2.10: an Euler system for an admissible tower bounds the Selmer group of W^*
- Mazur–Rubin 2004, Theorem 3.2.4: the source of the map to Kolyvagin systems
- EulerSystemsCyclotomicMainConjecture L0, KatoEulerSystems L2, HeegnerPointEulerSystems HE.4: the cyclotomic-unit, Kato and Heegner classes are elements of this module after their normalisation maps

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.EulerSystem` | structure | The submodule ES(T, 𝒦, N) ⊆ ∏_{K ⊂_f F ⊆ 𝒦} H¹(F, T) of families satisfying the corestriction relations. |
| `TauCeti.EulerSystems.EulerSystem.eval` | projection | c ↦ c_F, an O-linear map ES(T, 𝒦, N) → H¹(F, T). |
| `TauCeti.EulerSystems.EulerSystem.cor_eval` | relation | Cor_{F′/F}(c_{F′}) = (∏_{q ∈ Σ(F′/F)} P(Fr_q^{-1} \| T^*; Fr_q^{-1}))·c_F. |
| `TauCeti.EulerSystems.EulerSystem.cor_eval_of_ramified_eq` | simp | If Σ(F′/F) = ∅ then Cor_{F′/F}(c_{F′}) = c_F. |
| `TauCeti.EulerSystems.EulerSystem.ext` | extensionality | Two Euler systems with the same classes c_F for all F are equal. |
| `TauCeti.EulerSystems.EulerSystem.lift` | universal-property | A family of O-linear maps f_F : X → H¹(F, T) satisfying the relations is the same as an O-linear map X → ES(T, 𝒦, N); it is determined by the f_F. |
| `TauCeti.EulerSystems.EulerSystem.restrictTower` | functoriality | For 𝒦′ ⊆ 𝒦, restriction of the index family is an O-linear map ES(T, 𝒦, N) → ES(T, 𝒦′, N); for an ideal N′ prime to p and 𝒦₀ the maximal subextension of 𝒦 unramified at the primes dividing N′, it lands in ES(T, 𝒦₀, NN′). |
| `TauCeti.EulerSystems.IsAdmissibleTower` | structure | Rubin's conditions (i) and (ii) on (𝒦, N, K_∞). |

**Unit tests.**

- `EulerSystem.zero_mem` (degenerate): The family c_F = 0 is an Euler system.
- `EulerSystem.cyclotomic_units` (computation): For K = ℚ, T = ℤ_p(1) and the Kummer images of the p-extended cyclotomic units c̃_m, the relation for ℚ(μ_m) ⊆ ℚ(μ_{mℓ}), ℓ ∤ mp, is N(c̃_{mℓ}) = c̃_m^{1 − Fr_ℓ^{-1}}: the factor is P(Fr_ℓ^{-1} | ℤ_p; Fr_ℓ^{-1}) = 1 − Fr_ℓ^{-1}.
- `EulerSystem.not_restriction` (non-example): A family with res_{F′/F}(c_F) = c_{F′} for all F ⊆ F′ and c_K ≠ 0 non-torsion is not an Euler system for a tower containing K_∞: corestriction would give [F′ : F]c_F = c_F for F′ ⊆ F K_∞.
- `EulerSystem.universal_norm` (characterisation): For an admissible tower and F ⊆ F′ ⊆ F K_∞, c_F = Cor_{F′/F}(c_{F′}); hence c_F ∈ ∩_{F′} Cor_{F′/F} H¹(F′, T).

**Acceptance.**

- ES is the equaliser of two maps ∏_F H¹(F, T) ⇉ ∏_{F ⊆ F′} H¹(F, T), so a morphism into ES is a compatible family of morphisms.
- The norm relation uses corestriction: replacing it by restriction or by equality c_{F′} = c_F gives a different (wrong) object.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`
- `tauceti:TauCeti.ContCohomology.explicitCor1`
- `tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1`
- `ArithmeticGaloisDuality:R02.1/carrier-comparison`

**Sources.**

- `rubin-es`, Chapter II, Definition 1.1, pp. 21–22. The definition. Source excerpt: “is an Euler system for (T, K, N ) if, whenever K ⊂f F ⊂f F 0 ⊂ K,”
- `rubin-es`, Chapter II, Remark 2.8, p. 25. The zero system is an Euler system. Source excerpt: “There is always a trivial Euler system defined by cF (r) = 0 for all F and r.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### Euler-system classes are unramified away from p

`EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p` — theorem

**Statement.** Let c be an Euler system for an admissible tower (so 𝒦 ⊇ K_∞ with no finite prime splitting completely). Then for every F and every place w ∤ p of F, (c_F)_w ∈ H¹_ur(F_w, T); that is, c_F ∈ S^{Σ_p}(F, T), and c_F ∈ H¹_{F_can}(F, T). Hence c_F lies in H¹(O_{F,S(F)}, T) for S(F) = S ∪ S_ram(F/K), the cohomology of the maximal extension unramified outside S(F).

**Hypotheses.**

- admissible tower
- T finitely generated over ℤ_p

**Proof outline.**

1. c_F is a universal norm from F K_∞, in which the decomposition group of w is infinite; apply SelmerIwasawaCohomology L3/universal-norms-unramified(ii).
2. The comparison H¹_ur(F_w, T) ⊆ ker(H¹(F_w, T) → H¹(F_w^{ur}, V)) gives the statement for F_can at ramified primes.

**Acceptance.**

- Without condition (ii) the statement fails: c_K is then unconstrained (rigidity-variants).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `SelmerIwasawaCohomology:L3/universal-norms-unramified`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`

**Sources.**

- `rubin-es`, Chapter II, before Theorem 2.10, p. 25. The classes are unramified outside p. Source excerpt: “By Corollary B.3.4 (see also Proposition IV.6.1) and Lemma I.3.5(ii), if c is an Euler system then cK ∈ S Σp (K, T ).”
- `bss2`, Lemma 6.6, p. 38. The same statement for the canonical Selmer structure. Source excerpt: “Then cF belongs to HF1 can (F, T ) for every F in Ω(K/K).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### The conductor-indexed presentations

`EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation` — theorem

**Statement.** (a) For an admissible (𝒦, N), an Euler system is equivalent to a family c̃_m ∈ H¹(K[m] ∩ 𝒦, T) indexed by all generalised ideals m (K[m] the ray class field), with Cor_{K[mq]∩𝒦/K[m]∩𝒦}(c̃_{mq}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c̃_m if q ∤ mN and = c̃_m if q | mN: put c_F = Cor_{K[m]∩𝒦/F}(c̃_m) for m the conductor of F/K, and conversely c̃_m = ∏_q P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{K[m]∩𝒦}, the product over primes dividing m, not dividing N, unramified in (K[m] ∩ 𝒦)/K. (b) For 𝒦_min = K_∞·∏_{q ∤ N} K(q), an Euler system is determined by, and equivalent to, a family {c_{F(r)}} over squarefree r prime to N and K ⊂_f F ⊆ K_∞ with Cor_{F(rq)/F(r)}(c_{F(rq)}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{F(r)} when K(q) ≠ K(1), and Cor_{F′(r)/F(r)}(c_{F′(r)}) = c_{F(r)}; then c_L = Cor_{F(r)/L}(c_{F(r)}) for r, F minimal with L ⊆ F(r).

**Hypotheses.**

- admissible (𝒦, N)

**Proof outline.**

1. Check the relations in both directions using transitivity of corestriction and that Fr_q acts trivially through fields in which q splits.
2. (b): every finite subextension of 𝒦_min lies in some F(r); the family on the cofinal set {F(r)} determines the rest.

**Acceptance.**

- The archimedean part of a generalised ideal is allowed in (a).
- The equivalence is an isomorphism of modules ES(T, 𝒦_min, N) ≅ {families (c_{F(r)})}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`

**Sources.**

- `rubin-es`, Chapter II, Remarks 1.3 and 1.4, pp. 22–23. Both presentations. Source excerpt: “Thus we may view an Euler system for (T, Kmin , N ) as such a collection {cF (r) }.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### Twisting Euler systems by characters of finite order

`EulerSystemsAndKolyvaginSystems:ES.2/twisting` — construction

**Statement.** Let c be an Euler system for (T, 𝒦, N) and χ : Gal(𝒦/K) → O^× a character of finite order with conductor 𝔣 and field L = 𝒦^{ker χ}; let O_χ be free of rank one with generator ξ_χ and T ⊗ χ = T ⊗ O_χ. Define c^χ_F ∈ H¹(F, T ⊗ χ) as the image of c_{FL} under H¹(FL, T) → H¹(FL, T) ⊗ O_χ ≅ H¹(FL, T ⊗ χ) → H¹(F, T ⊗ χ), the last map being corestriction. Then {c^χ_F} is an Euler system for (T ⊗ χ, 𝒦, 𝔣N). If L ⊆ L′ ⊆ 𝒦 have the same conductor, the image of c^χ_F under Res then ⊗ξ_χ^{-1} in H¹(FL′, T) is Σ_{δ ∈ Gal(FL′/F)} χ(δ)δ c_{FL′}. Coefficient extension along O → O′ finite flat acts on families termwise when H¹(F, T) ⊗ O′ = H¹(F, T ⊗ O′), and is used to adjoin the values of χ.

**Hypotheses.**

- χ of finite order on Gal(𝒦/K)
- values of χ in O^× (after enlarging O)

**Construction.**

1. Compute Cor_{F′/F}(c^χ_{F′}) = Cor_{FL/F}((∏ P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{FL}) ⊗ ξ_χ); moving ξ_χ past Fr_q^{-1} multiplies by χ(Fr_q), and P(Fr_q^{-1} | T^*; χ(Fr_q)x) = P(Fr_q^{-1} | (T ⊗ χ)^*; x).
2. Σ(F′L/FL) computed with N equals Σ(F′/F) computed with 𝔣N.
3. The restriction formula follows from Res ∘ Cor = Σ δ and Cor_{FL′/FL} c_{FL′} = c_{FL}.

**Uses that determine the API.**

- Rubin, Chapter III and Mazur–Rubin 2004, Remark 3.2.5: an Euler system for T gives Kolyvagin systems for all twists T ⊗ ρ
- EulerSystemsCyclotomicMainConjecture L0: the χ-twisted cyclotomic class is c^χ_ℚ with the formula of Lemma 4.3

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.EulerSystem.twist` | constructor | c ↦ c^χ : ES(T, 𝒦, N) → ES(T ⊗ χ, 𝒦, 𝔣N), O-linear after fixing ξ_χ. |
| `TauCeti.EulerSystems.EulerSystem.twist_eval` | simp | (c^χ)_F = Cor_{FL/F}(c_{FL} ⊗ ξ_χ). |
| `TauCeti.EulerSystems.EulerSystem.twist_one` | simp | c^1 = c. |
| `TauCeti.EulerSystems.EulerSystem.res_twist` | relation | Res_{FL′/F}(c^χ_F) ⊗ ξ_χ^{-1} = Σ_{δ ∈ Gal(FL′/F)} χ(δ)·δ·c_{FL′}. |
| `TauCeti.EulerSystems.EulerSystem.baseChange` | functoriality | For O → O′ finite flat, ES(T, 𝒦, N) ⊗_O O′ → ES(T ⊗ O′, 𝒦, N) is defined termwise and is injective. |

**Unit tests.**

- `EulerSystem.twist_trivial` (degenerate): For χ = 1, L = K and c^χ_F = c_F.
- `EulerSystem.twist_cyclotomic` (computation): For K = ℚ, T = ℤ_p(1), χ of conductor f: the image of c^χ_ℚ in H¹(L, T) is Σ_{δ ∈ Gal(L/ℚ)} χ(δ)δc_L, the χ^{-1}-component of the Kummer class of the cyclotomic unit of L.
- `EulerSystem.twist_conductor` (non-example): Twisting changes the defining bad modulus to f_χN. It is not guaranteed to satisfy the relations for N: for χ with a new ramified prime q, the construction proves the relation with that q excluded. The zero system does satisfy both sets of relations, so conductor enlargement is not a nonexistence assertion for every c.
- `EulerSystem.twist_inverse_norm` (characterisation): With compatible character generators, (c^χ)^{χ^{-1}}_F=Cor_{FL_χ/F}(c_{FL_χ})=∏_{q∈Σ(FL_χ/F)}P_q(Fr_q^{-1})c_F. This can differ from c_F when f_χ has primes outside N; no extra degree factor occurs.

**Acceptance.**

- Twisting by the trivial character is the identity.
- Twisting is O-linear after choosing compatible generators. For finite-order χ,ψ, the iterated twist is obtained by corestriction from FL_χL_ψ, while the direct χψ-twist uses FL_{χψ}. Comparing these by the Euler relation introduces the Euler factors for primes ramifying in the former and not the latter outside N. In particular (c^χ)^{χ^{-1}}_F = Cor_{FL_χ/F}(c_{FL_χ}), after cancelling generators; this equals the applicable Euler-factor product times c_F and need not equal c_F. Both families are compared in the common conductor f_χ f_ψ N.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`

**Sources.**

- `rubin-es`, Chapter II, Proposition 4.2, p. 30. The twisted family is an Euler system. Source excerpt: “defined above is an Euler system for (T ⊗ χ, K, fN ).”
- `rubin-es`, Chapter II, Lemma 4.3, p. 31. The restriction formula. Source excerpt: “and the conductor of L0 /K is equal to the conductor of L/K, then the image of cχF”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### Changing the Euler factors

`EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change` — theorem

**Statement.** (a) Let f_q, g_q ∈ O[x] (q ∤ N) with f_q ≡ g_q modulo N(q) − 1, and c̃ a family with Cor_{F′/F}(c̃_{F′}) = (∏_{q ∈ Σ(F′/F)} f_q(Fr_q^{-1})) c̃_F. Then there is a family c with the same relations for g_q, with c_F = c̃_F for every finite abelian F/K unramified outside N, and with Σ_γ χ(γ)γc_F = Σ_γ χ(γ)γc̃_F whenever χ is a character of Gal(F/K) of conductor 𝔣 and every prime ramified in F/K divides N𝔣; the construction is an explicit O-linear map c̃ ↦ c. (b) Units u_q ∈ O^× and a shift x ↦ x^d of the variable can be absorbed similarly. (c) In particular a family satisfying the relations with P(Fr_q^{-1} | T; Fr_q) gives an Euler system in the sense of Definition II.1.1, and the modules of Euler systems for the conventions of Rubin and of Mazur–Rubin are isomorphic. The change of factors is a map of systems, not an equality.

**Hypotheses.**

- f_q ≡ g_q (mod N(q) − 1)

**Proof outline.**

1. Since [K(q) : K(1)] divides N(q) − 1, (f_q − g_q)(Fr_q^{-1}) is divisible by the degree of the q-part; correct c̃_F by an explicit alternating sum over the primes ramified in F (Rubin, Lemma IX.6.1).
2. The Mazur–Rubin and Rubin polynomials are congruent modulo N(q) − 1 by euler-polynomial.

**Acceptance.**

- Rubin's Example IX.6.2: K = ℚ, f_q = 1 − x and g_q = 1 − q^{-1}x.
- The map is the identity on classes over fields unramified outside N.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`

**Sources.**

- `rubin-es`, Chapter IX, Lemma 6.1, p. 141. Changing congruent Euler factors. Source excerpt: “collections of polynomials such that fq (x) ≡ gq (x) (mod N(q) − 1) for every q, and”
- `mr-ks`, Remark 3.2.3, p. 23. The two conventions give isomorphic modules. Source excerpt: “See §9.6 of [Ru6].”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### The universal Euler system

`EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system` — construction

**Planet:** Universal Euler system.

**Statement.** Fix N and K_∞/K as in an admissible tower, R(N) the squarefree products of primes not dividing N. For r ∈ R(N) and K ⊂_f F ⊆ K_∞, X_{F(r)} = Y_{F(r)}/Z_{F(r)}, where Y_{F(r)} is the free O[Gal(F(r)/K)]-module on symbols x_{F(s)}, s | r, and Z_{F(r)} is generated by σx_{F(s)} − x_{F(s)} (σ ∈ Gal(F(r)/F(s))), N_q x_{F(qs)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_{F(s)} (qs | r, K(q) ≠ K(1)) and x_{F(qs)} − x_{F(s)} (qs | r, K(q) = K(1)). The universal Euler system is X = colim_{F,r} X_{F(r)}; X_{∞,r} = lim_F X_{F(r)}. Sending x_{F(r)} ↦ c_{F(r)} gives G_K-equivariant maps X_{F(r)} → H¹(F(r), T) for every Euler system c. Structure: X_{F(r)} is a finitely generated free O-module, free over O[Gal(F(r)/K(r))] of rank [K(r) : K], X_{F(r)} ⊗ Φ is free of rank one over Φ[Gal(F(r)/K)], X_{F′(r)} ⊗ O[Gal(F(r)/K)] ≅ X_{F(r)}, X_{F(s)} ≅ X_{F′(r)}^{Gal(F′(r)/F(s))}; X_{∞,r} is free of rank [K(r) : K] over O[[Gal(K_∞(r)/K(r))]]; and Ext¹_{(O/M)[G]}(X_{F(r)}/M, (O/M)[G]^k) = 0 for G = Gal(F(r)/K), with the analogue for X_{∞,r}.

**Hypotheses.**

- N, K_∞ as in an admissible tower

**Construction.**

1. The relations of X_{F(r)} are exactly the Euler system relations in the presentation of conductor-presentation(b); this gives the universal property (Rubin, Lemma IV.2.3).
2. Freeness: an explicit O-basis of X_{F(r)} built from coset representatives and Γ_q − {1} (Proposition IV.3.1).
3. Ext vanishing: for B free over R[[H]] with H of finite index in G, Ext¹_{R[[G]]}(B, R[[G]]) = 0 (Lemma IV.3.3).

**Uses that determine the API.**

- Rubin, Lemma IV.4.2: D_r x_{F(r)} is Gal(F(r)/F)-invariant modulo M, proved in X_{F(r)}
- Rubin, Proposition IV.4.8: the Ext vanishing lifts an Euler system to maps X_{F(r)} → 𝕎_M/W_M, the key step in defining derivative classes without assuming W^{G_{F(r)}} = 0

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.Universal.X` | constructor | X_{F(r)} as a quotient of a free O[Gal(F(r)/K)]-module by the three families of relations. |
| `TauCeti.EulerSystems.Universal.gen` | data | The class x_{F(s)} ∈ X_{F(r)} for s \| r. |
| `TauCeti.EulerSystems.Universal.norm_gen` | relation | N_q·x_{F(qs)} = P(Fr_q^{-1} \| T^*; Fr_q^{-1})·x_{F(s)} when K(q) ≠ K(1), and x_{F(qs)} = x_{F(s)} otherwise. |
| `TauCeti.EulerSystems.Universal.lift` | universal-property | For an Euler system c, the unique O[G_K]-linear map X_{F(r)} → H¹(F(r), T) with x_{F(s)} ↦ res(c_{F(s)}). |
| `TauCeti.EulerSystems.Universal.free` | instance | X_{F(r)} is free of finite rank over O and free of rank [K(r) : K] over O[Gal(F(r)/K(r))]. |
| `TauCeti.EulerSystems.Universal.ext_eq_zero` | other | Ext¹_{(O/M)[G]}(X_{F(r)}/M X_{F(r)}, (O/M)[G]^k) = 0 for G = Gal(F(r)/K). |

**Unit tests.**

- `Universal.X_one` (degenerate): If K(1) = K then X_K is free of rank one over O on x_K.
- `Universal.rank_one_prime` (computation): For K = ℚ, F = ℚ, r = ℓ with Γ_ℓ of order n > 1: X_{ℚ(ℓ)} is the quotient of O[Γ_ℓ]x_ℓ ⊕ O[Γ_ℓ]x_1 by (σ − 1)x_1 and N_ℓx_ℓ − P(1)x_1, which is free over O of rank n + 1 − 1 = n; indeed rank_O = [K(r) : K] = n.
- `Universal.not_free_group_ring` (non-example): X_{F(r)} is not free over O[Gal(F(r)/K)] in general: only X_{F(r)} ⊗ Φ is free of rank one over Φ[Gal(F(r)/K)].

**Acceptance.**

- For r = 1 and F = K with K(1) = K: X_K = O·x_K.
- Hom_{G_K}(X_{∞,R}, colim_r lim_F H¹(F(r), T)) recovers Euler systems for 𝒦_min (Remark IV.2.4).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `mathlib:MonoidAlgebra`

**Sources.**

- `rubin-es`, Chapter IV, Definitions 2.1–2.2, p. 58. Definition of X_{F(r)} and X. Source excerpt: “The universal Euler system (for (T, N , K∞ /K)) is”
- `rubin-es`, Chapter IV, Proposition 3.1, p. 59. Freeness of the universal Euler system. Source excerpt: “XF (r) is a free O[Gal(F (r)/K(r))]-module of rank [K(r) : K].”
- `rubin-es`, Chapter IV, Proposition 3.4, p. 61. The Ext¹ vanishing. Source excerpt: “Proposition 3.4. Suppose r ∈ R, k ≥ 0, and M ∈ O is nonzero.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### Variants: rigidity conditions, finite depth and anticyclotomic systems

`EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants` — definition

**Statement.** (a) Rigidity. Without condition (ii) of an admissible tower the class c_K can be unconstrained: if K has class number one, P(Fr_q^{-1} | T^*; 1) = 0 for every q ∤ N and 𝒦 is the maximal abelian extension unramified at every prime dividing N, the only relations involving c_K are Cor_{F/K}c_F = ∏_{q ∈ Σ(F/K)} P(Fr_q^{-1} | T^*; 1)c_K = 0, and the family c_F = 0 (F ≠ K), c_K arbitrary is an Euler system. Condition (ii) is therefore replaced by (ii)′: at least one of (a) 𝒦 contains a ℤ_p^d-extension of K in which no finite prime splits completely; (b) c_{K(r)} ∈ S^{Σ_p}(K(r), T) for every r, and there is γ ∈ G_K with γ = 1 on K(1)(μ_{p^∞}, (O_K^×)^{1/p^∞}) and γ − 1 injective on T; (c) c_{K(r)} ∈ S^{Σ_p}(K(r), T) for every r, Fr_q^n − 1 is injective on T for every prime q ∤ N and every power n of p, and the family {c_{K(r)}} satisfies the congruence of Corollary IV.8.1. Under (ii)′ and T^{G_{K(1)}} = 0, Theorems II.2.2, II.2.3 and II.2.10 hold as stated. (b) Finite depth. For 0 ≠ M ∈ O an Euler system for W_M (of depth M) is a family as in the definition with c_F ∈ H¹(F, W_M). (c) Anticyclotomic. For a character χ of Gal(K′/K) of order d and an abelian extension 𝒦′/K′ on which Gal(K′/K) acts through χ, a χ-anticyclotomic Euler system for (T, 𝒦′, N) is a family c_F ∈ H¹(F, T), K′ ⊂_f F ⊆ 𝒦′, with the corestriction relations for primes q of K and one of the three rigidity conditions adapted to χ. (d) An Euler system is trivial at a finite set Σ of primes not dividing p if c_F ∈ S_Σ^{Σ_p}(F, T) for all F.

**Hypotheses.**

- as in each variant

**Construction.**

1. Each variant is the module cut out by the same corestriction equations in a different product; the predicates (b), (c) are stated with ES.3/derivative-class and ES.3/congruence.
2. For d = 1 a χ-anticyclotomic system is an Euler system; for K = ℚ, d = 2 and χ odd quadratic, K′ is imaginary quadratic and 𝒦′ an anticyclotomic p-extension (the setting of Heegner points).

**Uses that determine the API.**

- Rubin, Theorems IX.3.3, IX.4.3, IX.5.3: the bounds for each variant, planned in ES.4
- HeegnerPointEulerSystems HE.4: Heegner points form a χ-anticyclotomic Euler system with rigidity (c)

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.IsRigid` | structure | Condition (ii)′: one of the alternatives (a), (b), (c). |
| `TauCeti.EulerSystems.FiniteDepthEulerSystem` | structure | Euler systems for W_M. |
| `TauCeti.EulerSystems.EulerSystem.toFiniteDepth` | functoriality | ES(T, 𝒦, N) → ES(W_M, 𝒦, N) by reduction modulo M, compatible in M. |
| `TauCeti.EulerSystems.AnticyclotomicEulerSystem` | structure | χ-anticyclotomic Euler systems for (T, 𝒦′, N). |
| `TauCeti.EulerSystems.AnticyclotomicEulerSystem.of_trivial` | compatibility | For d = 1 (χ trivial) a χ-anticyclotomic Euler system is an Euler system. |
| `TauCeti.EulerSystems.EulerSystem.IsTrivialAt` | structure | c_F ∈ S_Σ^{Σ_p}(F, T) for every F. |

**Unit tests.**

- `IsRigid.of_admissible` (compatibility): An admissible tower satisfies (ii)′(a).
- `not_isRigid_isolated_class` (non-example): If K has class number one, P(Fr_q^{-1} | T^*; 1) = 0 for all q ∤ N and 𝒦 is the maximal abelian extension of K unramified at every prime dividing N, the family c_K = x, c_F = 0 for F ≠ K is an Euler system for every x ∈ H¹(K, T); for x ∉ S^{Σ_p}(K, T) it satisfies none of (a), (b), (c).
- `AnticyclotomicEulerSystem.heegner_shape` (computation): For K = ℚ, χ the quadratic character of an imaginary quadratic field K′: d = 2 and the relation at a prime ℓ inert in K′ uses P(Fr_ℓ^{-1} | T^*; Fr_ℓ^{-1}) with Fr_ℓ ∈ G_ℚ, whose square is the Frobenius of the prime of K′ above ℓ.

**Acceptance.**

- A system of infinite depth gives one of depth M for every M.
- The counterexample family (c_K arbitrary, others 0) satisfies none of (a), (b), (c) when c_K ∉ S^{Σ_p}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`

**Sources.**

- `rubin-es`, Chapter IX §1, p. 133. The failure of rigidity without condition (ii) and the replacement (ii)′. Source excerpt: “is an Euler system. Since there are”
- `rubin-es`, Chapter IX, Definition 3.1, p. 136. Finite depth. Source excerpt: “An Euler system for WM (or an Euler system of depth M ) is a collection of cohomology classes satisfying all the”
- `rubin-es`, Chapter IX, Definition 4.1, p. 138. Anticyclotomic Euler systems. Source excerpt: “is a χ-anticyclotomic Euler system for (T, K0 , N ) (or simply for T ) if”
- `rubin-es`, Chapter IX, Definition 5.1, p. 140. Triviality at Σ. Source excerpt: “We say c is trivial at Σ if”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

## ES.3. Derivative operators and corrected Kolyvagin classes

The operators `N_q` and `D_q` with the telescoping identity; Kolyvagin's derivative classes, defined without assuming vanishing invariants through the universal Euler system and an induced module; their local behaviour; the congruence; the modules of Kolyvagin systems; and the Mazur–Rubin map from Euler systems to Kolyvagin systems with its correction terms, checked on two primes. Depends on ES.1 and ES.2.

**Planets of this layer:** Kolyvagin derivative operator; Kolyvagin derivative class; Finite–singular relation for derivative classes; Kolyvagin system; Euler-to-Kolyvagin system map.

### The norm and Kolyvagin derivative operators

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators` — definition

**Planet:** Kolyvagin derivative operator.

**Statement.** Let Γ be a finite cyclic group of order n with generator σ. In ℤ[Γ] put N_Γ = Σ_{γ ∈ Γ} γ and D_σ = Σ_{i=0}^{n−1} i·σ^i. Then (σ − 1)D_σ = n − N_Γ. For a prime q ∤ p, with Γ_q = Gal(K(q)/K(1)) and the generator σ_q fixed through tame inertia (a generator ξ of lim μ_{p^n} and a prime of K̄ above q), write N_q = N_{Γ_q} and D_q = D_{σ_q}; for squarefree r, N_r = ∏_{q | r} N_q = Σ_{σ ∈ Γ_r} σ and D_r = ∏_{q | r} D_q ∈ ℤ[Γ_r], with N_r = N_sN_{r/s} and D_r = D_sD_{r/s} for s | r. Under the augmentation ε, ε(N_Γ) = n and ε(D_σ) = n(n − 1)/2. For another generator σ^a (a prime to n) and a′a ≡ 1 (mod n), D_{σ^a} − a′D_σ ∈ nℤ[Γ].

**Hypotheses.**

- Γ finite cyclic with a chosen generator

**Construction.**

1. Telescoping: (σ − 1)Σ_{i<n} iσ^i = Σ_{i=1}^{n} (i − 1)σ^i − Σ_{i<n} iσ^i = (n − 1)σ^n − Σ_{i=1}^{n−1} σ^i = n − N_Γ, using σ^n = 1.
2. Products: Γ_r ≅ ∏ Γ_q, and elements of ℤ[Γ_q] for different q commute.
3. Change of generator: D_{σ^a} = Σ_i i·σ^{ai} = Σ_j (a′j mod n)·σ^j, which is congruent to a′·Σ_j j·σ^j modulo n.

**Uses that determine the API.**

- Rubin, Lemma IV.4.2 and Definition IV.4.10: D_r applied to the Euler system class over F(r) is invariant modulo M, and descends to κ_{F,r,M}
- Burns–Sakamoto–Sano II, §6.3: the higher-rank derivative uses the same D_n on the induced module
- HeegnerPointEulerSystems HE.4: Kolyvagin's derivative of Heegner points

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.normElement` | data | N_Γ = Σ_{γ ∈ Γ} γ ∈ ℤ[Γ] for a finite group Γ. |
| `TauCeti.KolyvaginSystems.kolyvaginDerivative` | data | D_σ = Σ_{i < n} i·σ^i ∈ ℤ[Γ] for σ of order n. |
| `TauCeti.KolyvaginSystems.sub_one_mul_kolyvaginDerivative` | relation | (σ − 1)·D_σ = n − N_Γ when σ generates Γ of order n. |
| `TauCeti.KolyvaginSystems.augmentation_kolyvaginDerivative` | simp | ε(D_σ) = n(n − 1)/2 and ε(N_Γ) = n. |
| `TauCeti.KolyvaginSystems.kolyvaginDerivative_prod` | relation | For Γ = Γ₁ × Γ₂ and r = st: D_r = D_s·D_t and N_r = N_s·N_t in ℤ[Γ₁ × Γ₂]. |
| `TauCeti.KolyvaginSystems.kolyvaginDerivative_generator` | compatibility | For a·a′ ≡ 1 (mod n): D_{σ^a} − a′·D_σ ∈ n·ℤ[Γ]. |
| `TauCeti.KolyvaginSystems.normElement_eq_representation_norm` | compatibility | For a representation ρ of Γ, the action of N_Γ is Mathlib's Representation.norm ρ. |

**Unit tests.**

- `kolyvaginDerivative_order_two` (computation): For Γ = {1, σ}: D_σ = σ, N_Γ = 1 + σ and (σ − 1)σ = 2 − (1 + σ).
- `kolyvaginDerivative_order_three` (computation): For n = 3: D_σ = σ + 2σ² and (σ − 1)(σ + 2σ²) = 3 − (1 + σ + σ²).
- `kolyvaginDerivative_trivial` (degenerate): For Γ = 1: D = 0 and N = 1, and the identity reads 0 = 1 − 1.
- `kolyvaginDerivative_not_norm_multiple` (non-example): D_σ is not annihilated by σ − 1 in ℤ[Γ] for n ≥ 2: (σ − 1)D_σ = n − N_Γ ≠ 0; it is invariant only modulo (n, N_Γ).

**Acceptance.**

- For n = 2: D_σ = σ and (σ − 1)σ = 1 − σ = 2 − (1 + σ).
- The identity is the only property of D_q used in the invariance of derivative classes.

**Prerequisites.**

- `mathlib:MonoidAlgebra`
- `mathlib:Representation.norm`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`

**Sources.**

- `rubin-es`, Chapter IV, Definition 4.1 and (4), p. 62. The operators D_q, D_r and the identity (σ_q − 1)D_q = |Γ_q| − N_q. Source excerpt: “We have the easy “telescoping” identity”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Invariance of the derivative of the universal class

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-invariance` — lemma

**Statement.** Let K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O and r ∈ R_{F,M}. If N_{F(1)/F} ∈ ℤ[Gal(F(r)/F)] restricts to Σ_{γ ∈ Gal(F(1)/F)} γ, then N_{F(1)/F}D_r x_{F(r)} ∈ (X_{F(r)}/M X_{F(r)})^{Gal(F(r)/F)}, independently of the choice of N_{F(1)/F}. Consequently for an Euler system c the image of N_{F(1)/F}D_r c_{F(r)} in H¹(F(r), W_M) is fixed by Gal(F(r)/F).

**Hypotheses.**

- r ∈ R_{F,M}

**Proof outline.**

1. Show (σ − 1)D_r x_{F(r)} ∈ M X_{F(r)} for σ ∈ Gal(F(r)/F(1)) by induction on the number of primes of r: for r = qs, (σ_q − 1)D_r = (|Γ_q| − N_q)D_s and N_q x_{F(r)} = P(Fr_q^{-1} | T^*; Fr_q^{-1})x_{F(s)} ≡ P(Fr_q^{-1} | T^*; 1)x_{F(s)} modulo (Fr_q − 1)D_s x_{F(s)}.
2. Both M | |Γ_q| and M | P(Fr_q^{-1} | T^*; 1) hold by definition of R_{F,M}; Fr_q acts on x_{F(s)} through Gal(F(s)/K), where the induction hypothesis applies since q splits completely in F(1)/K.

**Acceptance.**

- For r = q: (σ_q − 1)D_q x_{F(q)} = |Γ_q|x_{F(q)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_F ∈ M X_{F(q)}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`
- `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`

**Sources.**

- `rubin-es`, Chapter IV, Lemma 4.2, p. 62. The invariance statement. Source excerpt: “Further, NF (1)/F Dr xF (r) is independent of the choice of NF (1)/F .”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The induced module, the connecting map and lifts of an Euler system

`EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module` — theorem

**Statement.** Let 𝕎_M = Maps_cont(G_K, W_M) with (γf)(g) = f(gγ), containing W_M via t ↦ (g ↦ gt). (a) For K ⊂_f L ⊆ K_∞(r) there is a canonical δ_L : (𝕎_M/W_M)^{G_L} → H¹(L, W_M) with 0 → W_M^{G_L} → 𝕎_M^{G_L} → (𝕎_M/W_M)^{G_L} → H¹(L, W_M) → 0 exact; δ_L(f) is represented by γ ↦ (γ − 1)f̂ for a lift f̂ ∈ 𝕎_M; and δ commutes with restriction and with norm/corestriction. (b) For an Euler system c and r ∈ R there is a family of O[G_K]-maps d_F : X_{F(r)} → (𝕎_M/W_M)^{G_{F(r)}}, K ⊂_f F ⊆ K_∞, with δ_{F(r)} ∘ d_F equal to x_{F(s)} ↦ c_{F(s)} (mod M) and compatible with norms N_{F′(r)/F(r)}; each d_F is unique up to Hom_{O[G_K]}(X_{F(r)}, 𝕎_M).

**Hypotheses.**

- an Euler system for an admissible tower
- 0 ≠ M ∈ O

**Proof outline.**

1. (a): 𝕎_M is induced, hence H¹(L, 𝕎_M) = 0; take G_L-cohomology of 0 → W_M → 𝕎_M → 𝕎_M/W_M → 0. The cocycle formula and the compatibility with corestriction are in Tau Ceti for discrete coefficients (the connecting map of a short exact sequence and explicitCor_delta0).
2. (b): the obstruction to lifting X_{F(r)}/M → H¹(F(r), W_M) through δ lies in Ext¹ of X_{F(r)}/M against the induced module, which vanishes by the freeness of the universal Euler system (ES.2/universal-euler-system, Proposition IV.3.4) and the structure of 𝕎_M^{G_{F(r)}} as a free (O/M)[Gal(F(r)/K)]-module (Lemma IV.4.6); pass to the limit over F using Proposition IV.4.7.

**Acceptance.**

- If W^{G_{F(r)}} = 0 the lift is unnecessary: restriction H¹(F, W_M) → H¹(F(r), W_M)^{Gal(F(r)/F)} is an isomorphism.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`
- `tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0`
- `tauceti:TauCeti.ContCohomology.explicitCor1`

**Sources.**

- `rubin-es`, Chapter IV, Proposition 4.5, pp. 63–64. The connecting map δ_L and its properties. Source excerpt: “For every r ∈ R and every L, K ⊂f L ⊂ K∞ (r) there is a canonical map”
- `rubin-es`, Chapter IV, Proposition 4.8, p. 65. Existence and uniqueness of the lifts d_F. Source excerpt: “These conditions determine each dF uniquely up to an element of HomO[GK ] (XF (r) , WM ).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Kolyvagin's derivative classes κ_{F,r,M}

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-class` — construction

**Planet:** Kolyvagin derivative class.

**Statement.** For an Euler system c, K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O and r ∈ R_{F,M}, fix a lift d = d_F and put D_{r,F} = N_{F(1)/F}D_r. Then d(D_{r,F}x_{F(r)}) ∈ (𝕎_M/W_M)^{G_F} and κ_{F,r,M} = δ_F(d(D_{r,F}x_{F(r)})) ∈ H¹(F, W_M). It is independent of the choices of N_{F(1)/F} and d, and is represented by γ ↦ (γ − 1)f for any f ∈ 𝕎_M lifting d(D_{r,F}x_{F(r)}). Properties: (i) κ_{F,1,M} is the image of c_F in H¹(F, W_M); (ii) the restriction of κ_{F,r,M} to F(r) is the image of D_{r,F}c_{F(r)}; (iii) for M | M′ and r ∈ R_{F,M′}, κ_{F,r,M′} ↦ κ_{F,r,M} under H¹(F, W_{M′}) → H¹(F, W_M) and κ_{F,r,M} ↦ (M′/M)κ_{F,r,M′} under H¹(F, W_M) → H¹(F, W_{M′}). The class depends only on the images of c_{F(s)}, s | r, in H¹(F(r), W_M), so the construction applies to Euler systems of finite depth and to χ-anticyclotomic ones.

**Hypotheses.**

- r ∈ R_{F,M}
- an Euler system (or one of the variants of ES.2/rigidity-variants)

**Construction.**

1. derivative-invariance places d(D_{r,F}x_{F(r)}) in the G_F-invariants; independence of d follows since two lifts differ by Hom(X_{F(r)}, 𝕎_M), whose values on the invariant element lie in the image of 𝕎_M^{G_F} = ker δ_F.
2. (i): r = 1, D_{1,F} = N_{F(1)/F} and Cor_{F(1)/F}c_{F(1)} = c_F; (ii), (iii) from the definition and the compatibilities of δ.
3. The intrinsic target: with the generators σ_q not fixed, the same construction gives a class in H¹(F, W_M) ⊗ G_r, independent of the generators (derivative-operators, change of generator).

**Uses that determine the API.**

- Rubin, Theorems IV.5.1 and IV.5.4: the local behaviour of κ_{F,r,M} is what bounds Selmer groups
- Mazur–Rubin 2004, Appendix A: κ_n = κ_{[ℚ,n,I_n]} are the inputs to the corrected Kolyvagin system
- HeegnerPointEulerSystems HE.4: derivative classes of Heegner points, with invariants not assumed to vanish

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.derivativeClass` | constructor | κ_{F,r,M} ∈ H¹(F, W_M) for r ∈ R_{F,M}; in intrinsic form an element of H¹(F, W_M) ⊗ G_r. |
| `TauCeti.KolyvaginSystems.derivativeClass_one` | simp | κ_{F,1,M} = image of c_F. |
| `TauCeti.KolyvaginSystems.res_derivativeClass` | characterisation | res_{F(r)/F}(κ_{F,r,M}) = image of D_{r,F}·c_{F(r)} in H¹(F(r), W_M). |
| `TauCeti.KolyvaginSystems.derivativeClass_reduction` | functoriality | For M \| M′: reduction sends κ_{F,r,M′} to κ_{F,r,M}, and multiplication M′/M : W_M → W_{M′} sends κ_{F,r,M} to (M′/M)·κ_{F,r,M′}. |
| `TauCeti.KolyvaginSystems.derivativeClass_cocycle` | characterisation | κ_{F,r,M} is the class of γ ↦ (γ − 1)·f for any lift f of d(D_{r,F}x_{F(r)}). |
| `TauCeti.KolyvaginSystems.derivativeClass_linear` | structure | c ↦ κ_{F,r,M}(c) is O-linear in the Euler system. |
| `TauCeti.KolyvaginSystems.derivativeClass_generator` | compatibility | κ ⊗ (⊗_q σ_q) ∈ H¹(F, W_M) ⊗ G_r does not depend on the generators σ_q. |

**Unit tests.**

- `derivativeClass_conductor_one` (degenerate): For r = 1 and F = K with K(1) = K, κ_{K,1,M} = c_K mod M.
- `derivativeClass_cyclotomic_units` (computation): For K = ℚ, T = ℤ_p(1), M = p^k and ℓ ≡ 1 (mod p^k): κ_{ℚ,ℓ,M} ∈ ℚ^×/(ℚ^×)^{p^k} is the unique class whose image in ℚ(ℓ)^×/p^k is D_ℓ applied to the cyclotomic unit of ℚ(ℓ) (here W^{G_{ℚ(ℓ)}} = 0 for p odd).
- `derivativeClass_zero` (degenerate): For the zero Euler system every κ_{F,r,M} is 0.
- `derivativeClass_not_cor` (non-example): κ_{F,r,M} is not Cor_{F(r)/F}(c_{F(r)}) = N_r c: corestriction gives the Euler-factor multiple of c_F, which is 0 modulo M for r ∈ R_{F,M} with r ≠ 1, while κ_{F,r,M} is in general nonzero.

**Acceptance.**

- When W^{G_{F(r)}} = 0, κ_{F,r,M} is the unique class restricting to D_{r,F}c_{F(r)}.
- Scalar and quotient compatibility: κ(ac) = aκ(c), and (iii).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-invariance`
- `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`

**Sources.**

- `rubin-es`, Chapter IV, Definition 4.10, p. 66. Definition of the derivative class. Source excerpt: “Lemma 4.2 shows that d(Dr,F xF (r) ) ∈ (WM /WM )GF and we define”
- `rubin-es`, Chapter IV, Lemma 4.13, p. 67. The three basic properties. Source excerpt: “The class κF,1,M is the image of cF in H 1 (F, WM ).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Local behaviour of derivative classes

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties` — theorem

**Planet:** Finite–singular relation for derivative classes.

**Statement.** Let c be an Euler system for T, K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O. (a) If r ∈ R_{F,M} and w is a place of F not dividing pr, then (κ_{F,r,M})_w ∈ H¹_f(F_w, W_M); equivalently κ_{F,r,M} ∈ S^{Σ_{pr}}(F, W_M). (b) If rq ∈ R_{F,M}, then the image of κ_{F,rq,M} in H¹_s(F_Q, W_M) is φ^fs_q of the localisation of κ_{F,r,M}: (κ_{F,rq,M})^s_q = φ^fs_q(κ_{F,r,M}). (c) If W_M/(Fr_q − 1)W_M is free of rank one over O/M, the order of (κ_{K,rq,M})^s_q in H¹_s(K_q, W_M) equals the order of (κ_{K,r,M})_q in H¹_f(K_q, W_M). (d) If c is trivial at a finite set Σ of primes not dividing p, then κ_{F,r,M} ∈ S_Σ^{Σ_{pr}}(F, W_M). For Euler systems of finite depth (b) holds and (a) holds after multiplying by a constant m independent of M.

**Hypotheses.**

- an Euler system for an admissible tower (so the classes are universal norms)
- r, rq ∈ R_{F,M}

**Proof outline.**

1. (a): the Euler system classes are unramified outside p (ES.2/classes-unramified-outside-p, Proposition IV.6.1); the local lifts of Proposition IV.6.8 and the local induced modules show the derivative class is locally a coboundary of an unramified element; at archimedean places use Lemma IV.6.3.
2. (b): compute with the cocycle of derivative-class on a decomposition group at q, using the lifted telescoping identity and the key relation Lemma IV.7.3, which expresses (σ̄_q − 1) of the lift through Q_q(Fr_q^{-1}) applied to the Frobenius value of the lift for r.
3. (c): φ^fs_q is an isomorphism by ES.1/finite-singular-comparison; (d): Theorem IX.5.2, using uniqueness of local lifts.

**Acceptance.**

- For r = 1 and q ∈ R_{K,M}: the singular part of κ_{K,q,M} at q is φ^fs_q(c_K mod M).
- Together (a) and (b) say that (κ_{K,r,M} ⊗ generators)_r is a weak Kolyvagin system for F_can relaxed at p.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`
- `SelmerIwasawaCohomology:L3/semilocal-cohomology`

**Sources.**

- `rubin-es`, Chapter IV, Theorem 5.1, p. 67. Finiteness away from pr. Source excerpt: “Theorem 5.1. Suppose K ⊂f F ⊂ K∞ , M ∈ O is nonzero, and r ∈ RF,M .”
- `rubin-es`, Chapter IV, Theorem 5.4, p. 68. The finite–singular relation. Source excerpt: “In other words, the singular part of κF,rq,M at q is controlled by the (finite) localization of κF,r,M at q.”
- `rubin-es`, Chapter IX, Theorem 5.2, p. 140. Triviality at Σ is inherited. Source excerpt: “trivial at Σ, then the derivative classes κF,r,M constructed in”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Kolyvagin's congruence

`EulerSystemsAndKolyvaginSystems:ES.3/congruence` — theorem

**Statement.** Let c be an Euler system for T, K ⊂_f F ⊆ K_∞, q ∈ R prime and rq ∈ R. For every prime Q of F(rq) above q, (c_{F(rq)})_Q = ((P_q(Fr_q^{-1}) − P_q(N(q)Fr_q^{-1}))/[K(q) : K(1)]) (c_{F(r)})_Q in H¹(F(rq)_Q, T), where P_q(x) = P(Fr_q^{-1} | T^*; x) and (P_q(x) − P_q(N(q)x))/[K(q) : K(1)] ∈ O[x].

**Hypotheses.**

- an Euler system for an admissible tower

**Proof outline.**

1. The quotient polynomial is integral because [K(q) : K(1)] divides N(q) − 1.
2. Apply the local computation behind derivative-local-properties(b) to the lift d̂ over the tower F K_∞: H¹(F(rq)_Q, T) is the limit of the finite-level groups, and P_q(N(q)Fr_q^{-1}) annihilates T.

**Acceptance.**

- For T = ℤ_p(1) this is the classical congruence between cyclotomic units modulo the primes above q (Example IV.8.2).
- The congruence is a consequence of the definition for towers extending in the p-direction; it is an extra hypothesis in rigidity condition (c).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`

**Sources.**

- `rubin-es`, Chapter IV, Corollary 8.1, p. 77. The congruence relation. Source excerpt: “Corollary 8.1. Suppose c is an Euler system for T , K ⊂f F ⊂ K∞ , q ∈ R is”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Kolyvagin systems, weak Kolyvagin systems and their limits

`EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module` — definition

**Planet:** Kolyvagin system.

**Statement.** For a Selmer triple (T, F, P): a Kolyvagin system is a family κ = (κ_n)_{n ∈ N(P)} with κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n such that for every prime q with nq ∈ N(P), (κ_{nq})_{q,s} = φ^fs_q(κ_n) in H¹_s(K_q, T/I_{nq}T) ⊗ G_{nq}, where the left side is localisation at q followed by projection to the singular quotient, and the right side is localisation, reduction modulo I_{nq} and φ^fs_q ⊗ 1. KS(T, F, P) is the R-module of Kolyvagin systems. A weak Kolyvagin system has κ_n ∈ H¹_{F^n}(K, T/I_nT) ⊗ G_n with the same relation. The generalised module is K̄S(T, F, P) = lim_k colim_j KS(T/m^kT, F, P ∩ P_j), with a natural map KS → K̄S; every κ̄ ∈ K̄S has a class κ̄_1 ∈ H¹_F(K, T). The order of vanishing of κ ≠ 0 is ord(κ) = min{ν(n) : κ_n ≠ 0}, and L(T) = {κ_1 : κ ∈ KS(T)} ⊆ H¹_F(K, T) is the module of L-values. The blind spot of κ̄ is the set of ideals I with zero image in K̄S(T/I).

**Hypotheses.**

- a Selmer triple; for the relation, T/I_{nq}T satisfies the hypotheses of the finite–singular comparison at q

**Construction.**

1. KS is the submodule of ∏_n H¹_{F(n)}(K, T/I_nT) ⊗ G_n cut out by the relations: an equaliser, containing 0.
2. Functoriality (Remark 3.1.4): direct sums; change of ring KS(T) ⊗ R′ → KS(T ⊗ R′); restriction to P′ ⊆ P; inclusion KS(T, F′) ⊆ KS(T, F) for F′ ≤ F; and for n ∈ N a map KS(T, F, P) ⊗ Hom(G_n, R/I_n) → KS(T/I_nT, F(n), P(n)).
3. In a Kolyvagin system (κ_{nq})_q is determined by (κ_n)_q (Remark 3.1.7); a weak system determines κ_n only modulo H¹_F(K, T/I_nT) (Remark 3.1.9).

**Uses that determine the API.**

- Mazur–Rubin 2004, Theorems 4.5.6, 5.2.2, 5.2.12: the bounds and structure theorems are statements about elements of KS(T)
- Mazur–Rubin 2004, Theorem 3.2.4: the Euler-system map lands in K̄S, and in KS under a divisibility hypothesis
- Howard, Definition 1.2.3; HeegnerPointEulerSystems HE.5: the Heegner point Kolyvagin system is an element of this module over an imaginary quadratic field

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.KolyvaginSystem` | structure | The R-submodule KS(T, F, P) of ∏_{n ∈ N(P)} H¹_{F(n)}(K, T/I_nT) ⊗ G_n defined by the finite–singular relations. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.eval` | projection | κ ↦ κ_n, R-linear. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.singular_eq_finiteSingular` | relation | (κ_{nq})_{q,s} = φ^fs_q(κ_n) for nq ∈ N(P). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.ext` | extensionality | κ = κ′ iff κ_n = κ′_n for all n. |
| `TauCeti.KolyvaginSystems.WeakKolyvaginSystem` | structure | Families in ∏_n H¹_{F^n}(K, T/I_nT) ⊗ G_n with the same relations; KS ≤ weak KS. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.map` | functoriality | Change of ring, of P, and of F as in Remark 3.1.4, each R-linear and compatible with eval. |
| `TauCeti.KolyvaginSystems.GeneralizedKolyvaginSystem` | constructor | K̄S(T, F, P) = lim_k colim_j KS(T/m^kT, F, P ∩ P_j), with toGeneralized : KS → K̄S and κ̄ ↦ κ̄_1 ∈ H¹_F(K, T). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.ord` | data | ord(κ) = min{ν(n) : κ_n ≠ 0} ∈ ℕ∞, with ord(0) = ⊤. |

**Unit tests.**

- `KolyvaginSystem.zero_mem` (degenerate): The zero family is a Kolyvagin system, of order ⊤.
- `KolyvaginSystem.eval_one` (characterisation): κ_1 ∈ H¹_F(K, T) ⊗ ℤ = H¹_F(K, T): the stalk at 1 has I_1 = 0, G_1 = ℤ and F(1) = F.
- `KolyvaginSystem.empty_primes` (degenerate): For P = ∅, KS(T, F, ∅) = H¹_F(K, T) via κ ↦ κ_1.
- `WeakKolyvaginSystem.not_kolyvagin` (non-example): For T = ℤ_p(1), Σ(F) = {p, ∞} relaxed at p, the raw derivative classes of cyclotomic units form a weak Kolyvagin system whose finite parts (κ_n)_{ℓ,f}, ℓ | n, are not zero in general, so it is not a Kolyvagin system (Example 3.1.10).

**Acceptance.**

- The zero family is a Kolyvagin system; a system may have κ_1 = 0.
- For core rank one KS → K̄S is an isomorphism (ES.5); in general it is neither injective nor surjective.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`

**Sources.**

- `mr-ks`, Definition 3.1.3, p. 20. The concrete definition and relation (5). Source excerpt: “Concretely, a Kolyvagin system for (T, F, P) is a collection of cohomology classes”
- `mr-ks`, Definition 3.1.6, p. 21. The generalised module and the map to it. Source excerpt: “which in general need not be either injective or surjective.”
- `mr-ks`, Definition 3.1.8, p. 21. Weak Kolyvagin systems. Source excerpt: “A weak Kolyvagin system for (T, F, P) is a global section of the sheaf”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/KolyvaginSystem`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Derivative classes form a weak Kolyvagin system; their finite parts

`EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula` — theorem

**Statement.** Let K = ℚ, R the integers of a finite extension of ℚ_p, F = F_can and P a set of primes ℓ ≠ p, unramified for T, with T/(Fr_ℓ − 1)T cyclic and Fr_ℓ^{p^k} − 1 injective on T for all k ≥ 0. For an Euler system c for (T, P, 𝒦) with 𝒦 containing the maximal abelian p-extension unramified outside p and P, let κ_n = κ_{[ℚ,n,I_n]} ⊗ (generators) ∈ H¹(ℚ, T/I_nT) ⊗ G_n, κ_1 = c_ℚ. (a) If H⁰(ℚ_p, T^*) is divisible, (κ_n) is a weak Kolyvagin system for (T, F_can, P); in general for each k and all large j the images κ_n^{(k)}, n ∈ N_j, form a weak Kolyvagin system for (T/m^kT, F_can, P_j). (b) For ℓ | n, (κ_n)_{ℓ,f} = Σ_{π ∈ S_1(n), π(ℓ) ≠ ℓ} (−1)^{ν(n/d_π)} (κ_{d_π})_{ℓ,f} ⊗ ⊗_{q | (n/d_π)} ρ_q(P_q(Fr_{π(q)}^{-1})), where S_1(n) is the set of permutations of the primes dividing n whose non-fixed primes form a single orbit, d_π = ∏_{π(ℓ)=ℓ} ℓ, and ρ_q : A_{q,I}/A_{q,I}² ≅ G_q ⊗ R/I is σ − 1 ↦ σ ⊗ 1 on the augmentation ideal A_{q,I} of (R/I)[G_q ⊗ R/I].

**Hypotheses.**

- K = ℚ
- the two conditions on the primes of P
- 𝒦 contains the maximal abelian p-extension of ℚ unramified outside p and P

**Proof outline.**

1. (a): derivative-local-properties gives κ_n ∈ H¹_{F^{np}} and relation (5); the condition at p is automatic if H⁰(ℚ_p, T^*) is divisible (Lemma A.1) and holds for the images in T/m^k after restricting to N_j (Proposition A.2).
2. (b): compute the restriction of κ_m to ℚ(ℓ)_ℓ through the ℓ-finite quotient of the universal Euler system and the augmentation filtration (Propositions A.8, A.13, A.15); P_q(Fr_{π(q)}^{-1}) lies in the augmentation ideal because P_q(1) ∈ I_q.

**Acceptance.**

- For n = ℓ: S_1(ℓ) has no π with π(ℓ) ≠ ℓ, so (κ_ℓ)_{ℓ,f} = 0.
- For n = ℓq the only π is the transposition, d_π = 1, and (κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f} ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`

**Sources.**

- `mr-ks`, Appendix A, Proposition A.2, p. 79. The raw derivative classes form a weak system. Source excerpt: “is a weak Kolyvagin system for (T, F, P) in the sense of Definition 3.1.8.”
- `mr-ks`, Appendix A, Theorem A.4, p. 80. The formula for the finite parts. Source excerpt: “Theorem A.4. If n ∈ N and ` | n then”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/KolyvaginSystem`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The map from Euler systems to Kolyvagin systems

`EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin` — construction

**Planet:** Euler-to-Kolyvagin system map.

**Statement.** In the setting of finite-part-formula, define for n ∈ N κ′_n = Σ_{π ∈ S(n)} sign(π) κ_{d_π} ⊗ ⊗_{ℓ | (n/d_π)} ρ_ℓ(P_ℓ(Fr_{π(ℓ)}^{-1})) ∈ H¹(ℚ, T/I_nT) ⊗ G_n, the sum over all permutations of the primes dividing n. Then (κ′_n) satisfies the finite–singular relations and (κ′_n)_{ℓ,f} = 0 for ℓ | n. Theorem (Mazur–Rubin 3.2.4): if 𝒦 contains the maximal abelian p-extension of ℚ unramified outside p and P, and (a) T/(Fr_ℓ − 1)T is cyclic and (b) Fr_ℓ^{p^k} − 1 is injective on T for all ℓ ∈ P, k ≥ 0, then c ↦ κ′ is a canonical G_ℚ-equivariant homomorphism ES(T) → K̄S(T, F_can, P) with κ̄_1 = c_ℚ; if moreover H⁰(ℚ_p, T^*) is divisible it is a homomorphism ES(T) → KS(T, F_can, P) with κ_1 = c_ℚ. Variant (3.2.7): if 𝒦 contains the maximal abelian p-extension unramified outside a cofinite set of primes containing P (no p-direction), c_F ∈ H¹_{F_can}(F, T) for all F, and there is γ ∈ G_ℚ with γ − 1 killing μ_{p^∞} and injective on T, the same conclusions hold. The output in K̄S is a generalised Kolyvagin system; the ordinary one needs the local divisibility condition at p. Over a number field K the rank-one case of ES.7/higher-kolyvagin-derivative gives the corresponding map.

**Hypotheses.**

- K = ℚ, R the integers of a finite extension of ℚ_p
- (a), (b) of Theorem 3.2.4; the Euler factors are P_ℓ(Fr_ℓ^{-1}) with P_ℓ(x) = det(1 − Fr_ℓ x | T)

**Construction.**

1. Relation (5) for κ′ follows from that for κ by inspection of the sum.
2. Group the sum according to π(ℓ) = ℓ or not: κ′_n = Σ_{π(ℓ)=ℓ} sign(π) s_π ⊗ (⋯) with s_π = κ_{d_π} − Σ_{π′ ∈ S_1(d_π), π′(ℓ)≠ℓ} (−1)^{ν(d_π/d_{π′})} κ_{d_{π′}} ⊗ (⋯); finite-part-formula gives (s_π)_{ℓ,f} = 0.
3. Hence κ′_n ∈ H¹_{F(n)}(ℚ, T/I_nT) ⊗ G_n. Without divisibility at p the construction is carried out for T/m^k on N_j, j large, giving an element of the limit K̄S.
4. To use Rubin's Euler systems first change the Euler factors by ES.2/euler-factor-change.

**Uses that determine the API.**

- Mazur–Rubin 2004, §6.1 and §6.2: the cyclotomic-unit and Kato Kolyvagin systems are images of Euler systems under this map
- EulerSystemsCyclotomicMainConjecture L1; KatoEulerSystems L4: applications feed their Euler systems through it to apply the bounds of ES.4 and ES.5

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.correctedClass` | constructor | κ′_n = Σ_{π ∈ Perm(primes of n)} sign(π)·κ_{d_π} ⊗ ⊗_{ℓ \| n/d_π} ρ_ℓ(P_ℓ(Fr_{π(ℓ)}^{-1})). |
| `TauCeti.KolyvaginSystems.correctedClass_one` | simp | κ′_1 = c_ℚ, and κ′_ℓ = κ_ℓ for a prime ℓ. |
| `TauCeti.KolyvaginSystems.correctedClass_finite_eq_zero` | characterisation | (κ′_n)_{ℓ,f} = 0 for every ℓ \| n. |
| `TauCeti.KolyvaginSystems.eulerToKolyvagin` | constructor | The R-linear, G_ℚ-equivariant map ES(T, P, 𝒦) → K̄S(T, F_can, P). |
| `TauCeti.KolyvaginSystems.eulerToKolyvagin_one` | characterisation | (eulerToKolyvagin c)_1 = c_ℚ. |
| `TauCeti.KolyvaginSystems.eulerToKolyvagin_ordinary` | other | If H⁰(ℚ_p, T^*) is divisible, the map factors through KS(T, F_can, P) → K̄S. |
| `TauCeti.KolyvaginSystems.eulerToKolyvagin_twist` | compatibility | For ρ of finite order, eulerToKolyvagin(c^ρ) is the system for T ⊗ ρ, and systems for ρ ≡ ρ′ (mod m^k) agree in K̄S((T/m^k) ⊗ ρ). |

**Unit tests.**

- `correctedClass_prime` (computation): For n = ℓ: Perm = {id}, κ′_ℓ = κ_ℓ and (κ_ℓ)_{ℓ,f} = 0 by the finite-part formula.
- `correctedClass_two_primes` (computation): For n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})); the sign of the transposition is −1 and d_π = 1.
- `eulerToKolyvagin_zero` (degenerate): The zero Euler system maps to the zero Kolyvagin system.
- `eulerToKolyvagin_not_ordinary` (non-example): For T with H⁰(ℚ_p, T^*) not divisible, H¹_{F_can}(ℚ_p, T/IT) can be a proper submodule of H¹(ℚ_p, T/IT) (Lemma A.1), the classes κ′_n need not satisfy the condition at p, and the map is defined only into K̄S: the ordinary and the generalised outputs are different statements.

**Acceptance.**

- κ′_1 = κ_1 = c_ℚ and κ′_ℓ = κ_ℓ.
- For n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})).
- Compatibility: with twisting (Remark 3.2.5), with scalars and with T → T/m^k.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change`
- `EulerSystemsAndKolyvaginSystems:ES.2/twisting`

**Sources.**

- `mr-ks`, Theorem 3.2.4, pp. 23–24. The theorem. Source excerpt: “Then there is a canonical homomorphism ES(T ) → KS(T, Fcan , P) which is GQ - equivariant”
- `mr-ks`, Appendix A, proof of Theorem 3.2.4, (33), p. 80. The corrected classes. Source excerpt: “By inspection we see that since the κn satisfy (5) of §3.1, so do the κ0n .”
- `mr-ks`, Theorem 3.2.7, p. 24. The variant without the p-direction. Source excerpt: “Suppose in addition that cF ∈ HF1 can (F, T ) for every F and that there is a γ ∈ GQ such that γ − 1 kills µp∞ and γ − 1 is injective”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/KolyvaginSystem`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The two-prime check of the correction terms

`EulerSystemsAndKolyvaginSystems:ES.3/two-prime-test` — application

**Statement.** For distinct ℓ, q ∈ P and n = ℓq: (i) (κ_{ℓq})_{ℓ,s} = φ^fs_ℓ(κ_q) and (κ_{ℓq})_{q,s} = φ^fs_q(κ_ℓ); (ii) (κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f} ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})); (iii) the corrected class κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})) has zero finite part at ℓ and at q and the same singular parts as κ_{ℓq} at ℓ and q, because the correction term κ_1 is unramified at ℓ and q; (iv) κ′_{ℓq} is symmetric in ℓ and q. Hence κ′ satisfies both edge relations of the square 1 — ℓ — ℓq — q — 1.

**Hypotheses.**

- the setting of euler-to-kolyvagin

**Proof outline.**

1. (i) is derivative-local-properties(b) with κ′_ℓ = κ_ℓ; (ii) is finite-part-formula for the transposition, with sign (−1)^{ν(n/d_π)} = (−1)² = 1; (iii) subtract; (iv) the correction term is symmetric.

**Acceptance.**

- The sign in (iii) is −1 = sign of the transposition, opposite to the sign +1 = (−1)^{ν(ℓq)} in (ii): the two formulas are consistent.
- Omitting the correction leaves (κ_{ℓq})_{ℓ,f} ≠ 0 in general, so κ_{ℓq} ∉ H¹_{F(ℓq)}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`
- `EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula`

**Sources.**

- `mr-ks`, Appendix A, Theorem A.4 and (33), p. 80. The two formulas specialised to two primes. Source excerpt: “where sign(π) is the sign of the permutation π.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/KolyvaginSystem`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Derivative classes of χ-anticyclotomic Euler systems

`EulerSystemsAndKolyvaginSystems:ES.3/anticyclotomic-derivative` — theorem

**Statement.** Let χ : G_K → ℤ_p^× have order d | p − 1, K′ the field cut out by χ, and c a χ-anticyclotomic Euler system for T. For a power M of p let R_{K′,M} be the squarefree ideals of K divisible only by primes q ∤ N with M | [K′(q)_χ : K′(1)_χ] and M | P(Fr_q^{-1} | T^*; 1). The construction of derivative-class gives κ_{K′,r,M} ∈ H¹(K′, W_M) for r ∈ R_{K′,M}, satisfying the analogues of derivative-local-properties (a) and (b): loc^s_q(κ_{K′,rq,M}) = φ^fs_q(κ_{K′,r,M}). The map φ^fs_q : H¹_f(K′_q, W_M) → H¹_s(K′_q, W_M) is not Gal(K′/K)-equivariant: it sends the χ^i-part into the χ^{i−1}-part.

**Hypotheses.**

- d | p − 1
- one of the rigidity conditions (a), (b), (c) of the anticyclotomic definition

**Proof outline.**

1. Proceed as in Chapter IV §4 with K′(q)_χ in place of K(q); the generator σ_q of Gal(K′(q)_χ/K′(1)_χ) is an eigenvector for χ under conjugation by Gal(K′/K), which shifts eigenspaces by one.
2. For d = 1 this is derivative-class.

**Acceptance.**

- For d = 2 (Heegner points): the derivative classes for r with an even number of primes lie in the same eigenspace as c_{K′}, and with an odd number in the opposite one.
- The finite–singular relation with the tensor factor G_q retained is equivariant; the shift is the action of Gal(K′/K) on G_q through χ.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`

**Sources.**

- `rubin-es`, Chapter IX, Remark 4.4, p. 139. The eigenspace shift of the finite–singular map. Source excerpt: “But φfq s is not Gal(K 0 /K)-equivariant; for”
- `rubin-es`, Chapter IX §4, p. 138. Derivative classes exist for χ-anticyclotomic systems. Source excerpt: “These classes satisfy analogues of Theorems IV.5.1 and IV.5.4, and can be used along with”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

## ES.4. Core vertices, descent and error-tolerant bounds

The Selmer graph and sheaf, hubs and monodromy, core vertices, the stub sheaf and the Kolyvagin-system bound over artinian rings and discrete valuation rings; then the second interface, Rubin's bound with the error terms `n_W` and `n_W^*`, the bounds for the variants of ES.2, and the bounded-error statements. Depends on ES.0–ES.3 and on the Poitou–Tate sequence for Selmer groups (`SelmerIwasawaCohomology:L2`).

**Planets of this layer:** Selmer sheaf; Core vertex; Stub Selmer sheaf; Kolyvagin system bound; Rubin's bound with error terms.

### The Selmer graph and the Selmer sheaf

`EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf` — construction

**Planet:** Selmer sheaf.

**Statement.** A sheaf S of R-modules on a graph X assigns a module S(v) to each vertex, a module S(e) to each edge and a map ψ_v^e : S(v) → S(e) whenever v is an endpoint of e; a global section is a family (κ_v) with ψ_v^e(κ_v) = ψ_{v′}^e(κ_{v′}) for every edge e = {v, v′}; Γ(S) is the module of global sections. For a Selmer triple (T, F, P), X(P) is the graph with vertex set N(P) and an edge joining n and nq whenever n, nq ∈ N(P) with q prime. The Selmer sheaf ℋ = ℋ_{(T,F,P)} has ℋ(n) = H¹_{F(n)}(K, T/I_nT) ⊗ G_n; for the edge e joining n and nq, ℋ(e) = H¹_s(K_q, T/I_{nq}T) ⊗ G_{nq}; ψ_{nq}^e is localisation at q followed by projection to H¹_s; and ψ_n^e is localisation at q, reduction to T/I_{nq}T and φ^fs_q ⊗ 1. Then KS(T, F, P) = Γ(ℋ). The sheaf ℋ̂ with ℋ̂(n) = H¹_{F^n}(K, T/I_nT) ⊗ G_n and the same edges has Γ(ℋ̂) the weak Kolyvagin systems, and ℋ ⊆ ℋ̂.

**Hypotheses.**

- a Selmer triple

**Construction.**

1. The maps are well defined: classes in H¹_{F(n)} are finite at q ∤ n, and φ^fs_q applies because I_q kills T/I_{nq}T.
2. Γ(ℋ) = KS: the compatibility at the edge {n, nq} is relation (5) of ES.3/kolyvagin-system-module.
3. Functoriality in (T, F, P) as in Remark 3.1.4; restriction to P′ ⊆ P is restriction to the full subgraph X(P′).

**Uses that determine the API.**

- Mazur–Rubin 2004, §3.4 and Chapter 4: monodromy and hubs of the stub subsheaf compute Γ(ℋ)
- Mazur–Rubin 2016, Definition 10.3: the rank-r Selmer sheaf on the same graph
- Burns–Sakamoto–Sano II, Definition 5.12: the core graph X⁰

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.conductorGraph` | constructor | X(P): the simple graph on N(P) with n adjacent to m iff m = nq or n = mq for a prime q ∈ P. |
| `TauCeti.KolyvaginSystems.GraphSheaf` | structure | Vertex modules, edge modules and vertex-to-edge maps on a simple graph. |
| `TauCeti.KolyvaginSystems.GraphSheaf.sections` | data | Γ(S), the submodule of ∏_v S(v) of compatible families. |
| `TauCeti.KolyvaginSystems.GraphSheaf.mem_sections` | characterisation | κ ∈ Γ(S) iff ψ_v^e(κ_v) = ψ_{v′}^e(κ_{v′}) for every edge e = {v, v′}. |
| `TauCeti.KolyvaginSystems.selmerSheaf` | constructor | ℋ_{(T,F,P)} on X(P). |
| `TauCeti.KolyvaginSystems.sections_selmerSheaf` | equivalence | Γ(ℋ) = KS(T, F, P) as submodules of ∏_n ℋ(n). |
| `TauCeti.KolyvaginSystems.GraphSheaf.Subsheaf` | structure | Subsheaves: submodules of the stalks and edge modules stable under the maps; Γ of a subsheaf is a submodule of Γ. |

**Unit tests.**

- `conductorGraph_two_primes` (computation): For P = {q₁, q₂}, X(P) is the 4-cycle 1 — q₁ — q₁q₂ — q₂ — 1.
- `sections_one_vertex` (degenerate): For P = ∅ the graph has the single vertex 1 and Γ(ℋ) = ℋ(1) = H¹_F(K, T).
- `selmerSheaf_stalk_one` (compatibility): ℋ(1) = H¹_F(K, T) and ℋ̂(1) = H¹_F(K, T).
- `sections_ne_product` (non-example): For P = {q} with φ^fs_q ≠ 0 on the image of H¹_F(K, T), the pair (κ_1, 0) with φ^fs_q((κ_1)_q) ≠ 0 is not a global section: Γ(ℋ) is a proper submodule of ℋ(1) × ℋ(q).

**Acceptance.**

- For P = {q}: X has two vertices and one edge, and Γ(ℋ) = {(κ_1, κ_q) : (κ_q)_{q,s} = φ^fs_q(κ_1)}.
- X(P) is the 1-skeleton of the cube on P; it is connected.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `mathlib:SimpleGraph`

**Sources.**

- `mr-ks`, Definition 3.1.2, pp. 19–20. The graph and the sheaf. Source excerpt: “The Selmer sheaf associated to (T, F, P) is the simplicial sheaf H = H(T,F ,P) of R-modules on X defined as follows.”
- `mr-ks`, Definition 3.1.1, p. 19. Sheaves on graphs and global sections. Source excerpt: “A global section of S is a collection {κv ∈ S(v) : v ∈ V } such that for every”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Locally cyclic sheaves, hubs, monodromy and primitive sections

`EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy` — definition

**Statement.** Let S be a sheaf of R-modules on a graph X. S is locally free of rank r if all S(v), S(e) are free of rank r and all ψ_v^e are isomorphisms; locally cyclic if all S(v), S(e) are cyclic and all ψ_v^e are surjective. For S locally cyclic, a surjective path from v to w is a path (v = v₁, …, v_k = w) such that each ψ_{v_{i+1}}^{e_i} is an isomorphism; it induces a surjection ψ_P : S(v) → S(w). A vertex v is a hub if every vertex is reached from v by a surjective path. S has trivial monodromy if for surjective paths P, P′ from v to w, w′ joined by an edge e, ψ_w^e ∘ ψ_P = ψ_{w′}^e ∘ ψ_{P′}. A global section κ is primitive if κ_v generates S(v) for every v. Proposition: if S is locally cyclic and v is a hub, then Γ(S) → S(v), κ ↦ κ_v, is injective, and surjective iff S has trivial monodromy; Γ(S) is isomorphic to a submodule of the cyclic hub stalk S(v). It is isomorphic to an ideal of R if the hub stalk is free of rank one, or if R is principal artinian (every cyclic module is then isomorphic to an ideal). The ideal conclusion is false for a general complete noetherian local R; and if κ_u ≠ 0 generates m^iS(u) for some u then κ_w generates m^iS(w) for every w.

**Hypotheses.**

- R local with maximal ideal m

**Construction.**

1. Fix surjective paths P_w from the hub; then κ_w = ψ_{P_w}(κ_v), which gives injectivity; trivial monodromy is exactly the condition for w ↦ ψ_{P_w}(c) to be a section.

**Uses that determine the API.**

- Mazur–Rubin 2004, Theorem 4.3.4 and Corollary 4.3.5: the stub Selmer sheaf is locally cyclic with every core vertex a hub, so KS(T) is free of rank one
- Mazur–Rubin 2016, Theorem 11.7: the same argument for the rank-r stub sheaf

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.GraphSheaf.IsLocallyCyclic` | structure | All stalks and edge modules cyclic, all vertex-to-edge maps surjective. |
| `TauCeti.KolyvaginSystems.GraphSheaf.IsHub` | structure | v is a hub: every vertex is the end of a surjective path from v. |
| `TauCeti.KolyvaginSystems.GraphSheaf.HasTrivialMonodromy` | structure | The compatibility of ψ_P along surjective paths. |
| `TauCeti.KolyvaginSystems.GraphSheaf.eval_injective_of_isHub` | characterisation | For S locally cyclic and v a hub, κ ↦ κ_v is injective on Γ(S). |
| `TauCeti.KolyvaginSystems.GraphSheaf.eval_surjective_iff` | characterisation | For v a hub, κ ↦ κ_v is surjective iff S has trivial monodromy. |
| `TauCeti.KolyvaginSystems.GraphSheaf.IsPrimitive` | structure | κ_v generates S(v) for all v. |
| `TauCeti.KolyvaginSystems.GraphSheaf.generates_of_generates` | relation | If κ_u ≠ 0 generates m^i S(u) then κ_w generates m^i S(w) for all w (S locally cyclic with a hub). |

**Unit tests.**

- `isHub_of_locallyFree_connected` (compatibility): If S is locally free of rank one on a connected graph then every vertex is a hub.
- `sections_constant_sheaf` (computation): For the constant sheaf R with identity maps on a connected graph, Γ = R and every nonzero section generating at one vertex is primitive iff it is a unit.
- `monodromy_nontrivial_cycle` (non-example): On the triangle graph with all modules R = 𝔽₃ and all maps the identity except one vertex-to-edge map equal to −1, the sheaf is locally free of rank one but has nontrivial monodromy, Γ = 0, and evaluation at a hub is not surjective.
- `isPrimitive_zero_module` (degenerate): If all stalks are 0 the zero section is primitive.
- `sections_cyclic_not_ideal_dvr` (non-example): On the one-vertex graph, take R=ℤ_p and S(v)=ℤ_p/p. The vertex is a hub and monodromy is trivial, but Γ(S)=ℤ/p cannot be isomorphic to any ideal of the domain ℤ_p. Injectivity into S(v) does not identify S(v) with an ideal.

**Acceptance.**

- A locally free sheaf of rank one on a connected graph is locally cyclic and every vertex is a hub.
- A locally cyclic sheaf with a hub has a primitive section iff it has trivial monodromy.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`

**Sources.**

- `mr-ks`, Definition 3.4.2 and Proposition 3.4.4, pp. 26–27. Hubs, monodromy and the evaluation map. Source excerpt: “We say that the vertex v is a hub of S if for every vertex w there is an S-surjective path from v to w.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Selmer lengths across an edge

`EulerSystemsAndKolyvaginSystems:ES.4/vertex-step` — lemma

**Statement.** Let R be principal artinian of length k and (T, F, P) satisfy (H.0)–(H.6) with P ⊆ P_k. Put λ(n, T) = length H¹_{F(n)}(ℚ, T) and λ(n, T^*) = length H¹_{F(n)^*}(ℚ, T^*). (a) λ(n, T) − λ(n, T^*) is independent of n ∈ N. (b) For nℓ ∈ N the four inclusions H¹_{F_ℓ(n)} ⊆ H¹_{F(n)}, H¹_{F(nℓ)} ⊆ H¹_{F^ℓ(n)} have cyclic cokernels of lengths c, d, a, b with 0 ≤ a, b, c, d ≤ k, a + c = b + d, a ≥ d, b ≥ c, and dually a^* + a = b^* + b = c^* + c = d^* + d = k. (c) |λ(nℓ, T) − λ(n, T)| ≤ k; if H¹_{F(n)}(ℚ, T) → H¹_f(ℚ_ℓ, T) is surjective then H¹_{F(nℓ)^*}(ℚ, T^*) = H¹_{F^ℓ(n)^*}(ℚ, T^*); the images of m^{λ(n,T^*)}H¹_{F(n)} under φ^fs_ℓ ∘ loc_ℓ and of m^{λ(nℓ,T^*)}H¹_{F(nℓ)} under loc_ℓ in H¹_s(ℚ_ℓ, T) are equal; and if both localisations H¹_{F(n)}(ℚ, T)[m] → H¹_f(ℚ_ℓ, T) and H¹_{F(n)^*}(ℚ, T^*)[m] → H¹_f(ℚ_ℓ, T^*) are nonzero then λ(nℓ, T̄) = λ(n, T̄) − 1 and λ(nℓ, T̄^*) = λ(n, T̄^*) − 1.

**Hypotheses.**

- (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

**Proof outline.**

1. (a): Corollary 2.3.6 — by ES.0/selmer-length-difference the difference only depends on the lengths of the local conditions, and H¹_f and H¹_tr at ℓ | n have the same length (ES.1/finite-singular-comparison).
2. (b): the local modules at ℓ are free of rank one, giving the bounds; the dual relations are global duality (SelmerIwasawaCohomology L2/selmer-structure-poitou-tate) for the pairs (F(n), F^ℓ(n)) etc.
3. (c): read off from the two diamonds of inclusions.

**Acceptance.**

- For n a core vertex with λ(n, T^*) = 0 and surjective localisation at ℓ, nℓ is again a core vertex.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`

**Sources.**

- `mr-ks`, Lemma 4.1.7, p. 37. How the Selmer lengths change along an edge. Source excerpt: “Lemma 4.1.7. Suppose n` ∈ N with ` prime.”
- `mr-ks`, Corollary 2.3.6, p. 17. Invariance of the length difference. Source excerpt: “so the right-hand side of Proposition 2.3.5 is unchanged when we replace F by F (n).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Core vertices and leading vertices

`EulerSystemsAndKolyvaginSystems:ES.4/core-vertices` — definition

**Planet:** Core vertex.

**Statement.** In the setting of vertex-step, a vertex n ∈ N is a core vertex if λ(n, T) = 0 or λ(n, T^*) = 0 (equivalently for T̄). Theorem: for every n there is a noncanonical isomorphism H¹_{F(n)}(ℚ, T) ⊕ R^r ≅ H¹_{F(n)^*}(ℚ, T^*) ⊕ R^s with r, s ≥ 0 independent of n and rs = 0; at a core vertex H¹_{F(n)}(ℚ, T) and H¹_{F(n)^*}(ℚ, T^*) are free, of ranks χ(T) and χ(T^*), which are the core ranks of ES.0/core-rank. With r₀ = min{dim H¹_F(ℚ, T̄), dim H¹_{F^*}(ℚ, T̄^*)}: every core vertex has ν(n) ≥ r₀, there are core vertices in N_j with ν(n) = r₀ for every j ≥ k, and every m ∈ N_j divides a core vertex. If χ(T) > 0, a leading vertex is a core vertex with ν(n) = dim_k H¹_{F^*}(ℚ, T̄^*). Over a number field with the 2016 hypotheses a core vertex is an n with λ(n) = length H¹_{F(n)^*}(K, T^*) = 0.

**Hypotheses.**

- (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

**Construction.**

1. The structure theorem is ES.0/core-rank applied to (T, F(n)), which satisfies the hypotheses by Lemma 3.7.4, with independence of n from vertex-step(a).
2. Existence: if m is not a core vertex, ES.1/chebotarev-nonvanishing gives ℓ ∈ P_j at which nonzero classes of H¹_{F(m)}(ℚ, T̄) and of H¹_{F(m)^*}(ℚ, T̄^*) localise nontrivially; by vertex-step(c) both residual lengths drop by one. Iterate.
3. ν(n) ≥ r₀ at a core vertex because each step changes λ(·, T̄) by at most one.

**Uses that determine the API.**

- Mazur–Rubin 2004, Corollary 4.5.2(iii): for core rank one, evaluation at a core vertex identifies KS(T) with the free rank-one stalk
- Mazur–Rubin 2016, Theorem 11.6; Burns–Sakamoto–Sano II, Hypothesis 4.2 and Definition 5.8: existence and connectivity of core vertices in higher rank and over Gorenstein rings
- Mazur–Rubin 2004, Theorem 5.1.3: leading vertices realise every line of the Selmer group as a stalk

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.selmerLength` | data | λ(n, T) and λ(n, T^*) as elements of ℕ. |
| `TauCeti.KolyvaginSystems.IsCoreVertex` | structure | λ(n, T) = 0 or λ(n, T^*) = 0. |
| `TauCeti.KolyvaginSystems.isCoreVertex_iff_residual` | characterisation | n is a core vertex for T iff it is one for T̄ = T/mT. |
| `TauCeti.KolyvaginSystems.free_of_isCoreVertex` | characterisation | At a core vertex, H¹_{F(n)}(ℚ, T) is free of rank χ(T) and H¹_{F(n)^*}(ℚ, T^*) is free of rank χ(T^*). |
| `TauCeti.KolyvaginSystems.exists_isCoreVertex_dvd` | other | Every m ∈ N_j (j ≥ k) divides a core vertex in N_j, and there are core vertices with exactly r₀ prime factors. |
| `TauCeti.KolyvaginSystems.IsLeadingVertex` | structure | Core vertices with ν(n) = dim_k H¹_{F^*}(ℚ, T̄^*), for χ(T) > 0. |
| `TauCeti.KolyvaginSystems.selmerLength_sub` | relation | λ(n, T) − λ(n, T^*) = k·(χ(T) − χ(T^*)) for every n. |

**Unit tests.**

- `isCoreVertex_one_iff` (characterisation): For χ(T) > 0, 1 is a core vertex iff H¹_{F^*}(ℚ, T^*) = 0.
- `isCoreVertex_field_coreRank_one` (computation): For R = k and χ(T) = 1, n is a core vertex iff dim H¹_{F(n)}(ℚ, T) = 1 iff H¹_{F(n)^*}(ℚ, T^*) = 0.
- `not_isCoreVertex_small` (non-example): If ν(n) < min{dim H¹_F(ℚ, T̄), dim H¹_{F^*}(ℚ, T̄^*)} then n is not a core vertex.
- `coreRank_at_core_vertex` (compatibility): rank H¹_{F(n)}(ℚ, T) at a core vertex equals ES.0's χ(T, F), defined from n = 1.

**Acceptance.**

- If H¹_{F^*}(ℚ, T^*) = 0 then 1 is a core vertex and the only leading vertex.
- The core rank computed at any core vertex equals the integer of ES.0/core-rank computed at n = 1.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`

**Sources.**

- `mr-ks`, Definition 4.1.8 and Corollary 4.1.9, p. 38. Core vertices and their existence. Source excerpt: “that m is a core vertex (of the graph X of Definition 3.1.2).”
- `mr-ks`, Theorem 4.1.10 and Definition 4.1.11, p. 38. Freeness at core vertices and the core rank. Source excerpt: “The ranks of these modules are independent of the choice of core vertex n, and one of them is zero.”
- `mr-higher`, §11, p. 22. Core vertices over a number field. Source excerpt: “We say that a vertex n ∈ N is a core vertex if λ(n) = 0.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Leading vertices through a prescribed submodule

`EulerSystemsAndKolyvaginSystems:ES.4/leading-vertices` — theorem

**Statement.** In the setting of core-vertices suppose χ(T) > 0, 1 is not a core vertex, (H.4a) holds and the image of R → End(T) is contained in the image of ℤ_p[[G_ℚ]]. If L ⊆ H¹_F(ℚ, T) satisfies dim_k L[m] = χ(T), there are infinitely many leading vertices n with L ⊆ H¹_{F(n)}(ℚ, T). For R = k and χ(T) = 1: for every line L in H¹_F(ℚ, T) there is a leading vertex n with κ_n generating L ⊗ G_n for any nonzero κ ∈ KS(T).

**Hypotheses.**

- (H.0)–(H.6), (H.4a), image of R in End(T) inside that of ℤ_p[[G_ℚ]]

**Proof outline.**

1. Choose homomorphisms φ_i on H¹_F(ℚ, T) with common kernel L and ψ_i on H¹_{F^*}(ℚ, T^*) with common kernel 0; ES.1/chebotarev-prescribed-kernels gives primes ℓ_i realising them; n = ∏ℓ_i is a leading vertex by vertex-step(c).

**Acceptance.**

- Fails without the End(T) hypothesis: only 𝔽_p-rational subspaces occur (Remark 4.1.17).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels`

**Sources.**

- `mr-ks`, Theorem 4.1.16, p. 39. Leading vertices through L. Source excerpt: “Then there are infinitely many leading vertices n ∈ N such that L ⊂ HF1 (n) (Q, T ).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The sheaf of stub Selmer modules

`EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf` — definition

**Planet:** Stub Selmer sheaf.

**Statement.** In the setting of core-vertices, the stub subsheaf ℋ′ ⊆ ℋ has ℋ′(n) = m^{λ(n,T^*)}ℋ(n) = m^{λ(n,T^*)}H¹_{F(n)}(ℚ, T) ⊗ G_n, ℋ′(e) the image of ℋ′(n) in ℋ(e) for e joining n and nℓ, and the restricted maps, which are surjective. ℋ′(n) = 0 if λ(n, T^*) ≥ k, and otherwise ℋ′(n) is free of rank χ(T) over R/m^{k−λ(n,T^*)}. Theorems: (Howard) Γ(ℋ′) → ℋ′(n) is surjective for every n; if χ(T) = 1, Γ(ℋ′) contains a free R-module of rank one, and if χ(T) > 1 it contains free modules of every rank. If χ(T) = 1, ℋ′ is locally cyclic, the core subgraph X⁰ (vertices the core vertices) is connected, every n with λ(n, T^*) = 0 is a hub, ℋ′ has trivial monodromy and Γ(ℋ′) is free of rank one. If χ(T) = 1, or R is a field, or (H.4a) holds with the End(T) condition, then Γ(ℋ′) = Γ(ℋ): every Kolyvagin system has κ_n ∈ ℋ′(n). If χ(T) = 0 then KS(T) = 0.

**Hypotheses.**

- (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

**Construction.**

1. Well-definedness and surjectivity of the maps: vertex-step(c), third statement. The description of ℋ′(n): the structure theorem of core-vertices.
2. Local cyclicity and hubs for χ = 1: Theorem 4.3.4 via paths in X⁰ (Lemmas 4.3.8–4.3.9, Propositions 4.3.10–4.3.11, Theorem 4.3.12); then sheaf-monodromy.
3. Γ(ℋ′) = Γ(ℋ): induction on λ(n, T̄^*) using Lemma 4.2.1 and ES.1/chebotarev-nonvanishing (Theorem 4.4.1). χ = 0: Theorem 4.2.2 by the same lemma.
4. Howard's theorem (Appendix B of Mazur–Rubin): construct sections from an element of ∧^{χ+ν(n)} at a core vertex.

**Uses that determine the API.**

- Mazur–Rubin 2004, Corollary 4.4.5: κ_1 ∈ ℋ′(1) = m^{length H¹_{F^*}}H¹_F is the bound on the dual Selmer group
- Mazur–Rubin 2016, Definition 11.3: the rank-r stub sheaf S′
- Howard, Definition 1.5.4: the self-dual stub Selmer module S(n) = m^{λ(n)}H(n)

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.stubSheaf` | constructor | ℋ′ as a subsheaf of ℋ, with ℋ′(n) = m^{λ(n,T^*)}·ℋ(n). |
| `TauCeti.KolyvaginSystems.stubSheaf_stalk_eq_bot` | simp | ℋ′(n) = 0 iff λ(n, T^*) ≥ k (for χ(T) > 0). |
| `TauCeti.KolyvaginSystems.stubSheaf_stalk_free` | characterisation | If λ(n, T^*) < k, ℋ′(n) is free of rank χ(T) over R/m^{k − λ(n,T^*)}. |
| `TauCeti.KolyvaginSystems.stubSheaf_isLocallyCyclic` | instance | For χ(T) = 1 the stub sheaf is locally cyclic and every vertex with λ(n, T^*) = 0 is a hub. |
| `TauCeti.KolyvaginSystems.sections_stubSheaf_eq` | equivalence | Γ(ℋ′) = Γ(ℋ) under any of the three conditions of Theorem 4.4.1. |
| `TauCeti.KolyvaginSystems.kolyvaginSystem_eq_bot_of_coreRank_zero` | other | χ(T) = 0 implies KS(T, F, P) = 0. |

**Unit tests.**

- `stubSheaf_core_vertex` (compatibility): If λ(n, T^*) = 0 then ℋ′(n) = ℋ(n).
- `stubSheaf_field` (computation): For R = k and χ(T) = 1: ℋ′(n) = ℋ(n) is one-dimensional if n is a core vertex and ℋ′(n) = 0 otherwise.
- `stubSheaf_ne_selmerSheaf` (non-example): If λ(n, T^*) > 0 and χ(T) = 1 then ℋ′(n) ≠ ℋ(n): the stalk ℋ(n) ≅ R ⊕ H¹_{F(n)^*}(ℚ, T^*) is not cyclic.
- `stubSheaf_zero_of_large` (degenerate): If λ(n, T^*) ≥ k then ℋ′(n) = 0 and every Kolyvagin system has κ_n = 0 (χ(T) = 1).

**Acceptance.**

- At a core vertex with λ(n, T^*) = 0, ℋ′(n) = ℋ(n).
- For χ(T) > 1 the module KS(T) is not finitely generated (Remark 5.1.2), so the rank-one theory uses ℋ′.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`
- `EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy`
- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels`

**Sources.**

- `mr-ks`, Definition 4.3.1, p. 41. Definition of the stub subsheaf. Source excerpt: “The sheaf of stub Selmer modules”
- `mr-ks`, Theorem 4.3.4, p. 41. Local cyclicity and hubs. Source excerpt: “Then the sheaf H0 is locally cyclic and connected, and every n ∈ N with λ(n, T ∗ ) = 0 is a hub.”
- `mr-ks`, Theorem 4.4.1, p. 45. Kolyvagin systems are stub sections. Source excerpt: “Then the inclusion Γ(H0 ) ⊂ Γ(H) is an isomorphism.”
- `mr-ks`, Theorem 4.2.2, p. 40. Vanishing in core rank zero. Source excerpt: “Theorem 4.2.2. If the core rank χ(T ) = 0, then KS(T ) = 0.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The Kolyvagin system bound

`EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound` — theorem

**Planet:** Kolyvagin system bound.

**Statement.** (a) (R principal artinian of length k, (H.0)–(H.6), and one of the conditions of Theorem 4.4.1, or κ sufficiently liftable.) For κ ∈ KS(T): length H¹_{F^*}(ℚ, T^*) ≤ sup{i : κ_1 ∈ m^iH¹_F(ℚ, T)} ∈ ℕ∞ (∞ when κ_1=0). (b) (R a discrete valuation ring, (H.0)–(H.5), H¹(ℚ_ℓ, T)/H¹_F(ℚ_ℓ, T) torsion-free for ℓ ∈ Σ(F), P = P_1.) For κ ∈ KS(T) put ∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(ℚ, T)} ≤ ∞. Then length_R H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ); in particular if κ_1 ≠ 0 then H¹_{F^*}(ℚ, T^*) is finite. The same holds for κ̄ ∈ K̄S(T). The bound concerns the whole dual Selmer group H¹_{F^*}(ℚ, T^*) of the discrete module T^* = Hom(T, μ_{p^∞}), not a cotorsion quotient; for κ_1 = 0 it is vacuous (∂^{(0)} = ∞).

**Hypotheses.**

- as stated in (a), (b)

**Proof outline.**

1. (a): κ_1 ∈ ℋ′(1) = m^{λ(1,T^*)}H¹_F(ℚ, T) by stub-sheaf.
2. (b): ∂^{(0)}(κ) is finite when κ_1 ≠ 0 since H¹(ℚ, T) has no nonzero divisible submodule; the image κ^{(k)} ∈ KS(T/m^k) has κ^{(k)}_1 ∈ m^{∂^{(0)}}H¹_F(ℚ, T/m^k); T/m^k satisfies (H.6) by Lemma 3.7.1(i); apply (a) and H¹_{F^*}(ℚ, T^*)[m^k] = H¹_{F^*}(ℚ, T^*[m^k]) (ES.0/selmer-torsion-identification), then take the union over k.

**Acceptance.**

- Kato's Kolyvagin system gives length Sel(E[p^∞]) ≤ the divisibility of the Kato class, under the hypotheses of §6.2.
- Over a DVR, scaling a nonzero initial class by π raises the bound by one; the zero system gives no information.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`

**Sources.**

- `mr-ks`, Theorem 5.2.2, p. 56. The bound over a discrete valuation ring. Source excerpt: “In particular if κ1 6= 0 then HF1 ∗ (Q, T ∗ ) is finite.”
- `mr-ks`, Corollary 4.4.5, p. 47. The artinian bound. Source excerpt: “Suppose κ ∈ KS(T ). If one of the three hypotheses of Theorem 4.4.1 holds for T , or if the hypothesis of Theorem 4.4.3 holds for T and κ, then”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Rubin's hypotheses, index of divisibility and error terms

`EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses` — definition

**Statement.** Let T be a p-adic representation of G_K over O, V = T ⊗ Φ, W = V/T, W_M = M^{-1}T/T, 𝔭 the maximal ideal of O, k = O/𝔭, K(1) the maximal p-extension of K in the Hilbert class field. Hyp(K, T): (i) there is τ ∈ G_K acting trivially on μ_{p^∞}, on (O_K^×)^{1/p^∞} and on K(1), with T/(τ − 1)T free of rank one over O; (ii) T ⊗ k is an irreducible k[G_K]-module. Hyp(K, V): (i) there is such a τ with dim_Φ V/(τ − 1)V = 1; (ii) V is an irreducible Φ[G_K]-module. For an Euler system c, ind_O(c) = sup{n : c_K ∈ 𝔭^nH¹(K, T) + H¹(K, T)_tors} ≤ ∞. Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞}), and the error terms are n_W = ℓ_O(H¹(Ω/K, W) ∩ S^{Σ_p}(K, W)) and n_W^* = ℓ_O(H¹(Ω/K, W^*) ∩ S_{Σ_p}(K, W^*)), where S^{Σ_p} and S_{Σ_p} are the Selmer groups relaxed and strict at the primes above p. H¹(Ω/K, W) and H¹(Ω/K, W^*) are finite if T ≠ O and T ≠ O(1).

**Hypotheses.**

- T a p-adic representation unramified outside finitely many primes

**Construction.**

1. Hyp(K, T) holds with τ = 1 when rank T = 1. Hyp(K, T) implies Hyp(K, V).
2. Finiteness of H¹(Ω/K, W): Rubin's Corollary C.2.2 (cohomology of p-adic analytic groups), under irreducibility of V.

**Uses that determine the API.**

- Rubin, Theorems II.2.2, II.2.3, II.2.10: the statements of the error-tolerant bounds
- EulerSystemsCyclotomicMainConjecture L1: the cyclotomic application proves n_W = n_W^* = 0 for its characters
- HeegnerPointEulerSystems HE.7: exceptional primes are those where the hypotheses or the vanishing of the error terms fail

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.HypKT` | structure | Hyp(K, T): the element τ with its three triviality conditions and free rank-one coinvariants, and residual irreducibility. |
| `TauCeti.EulerSystems.HypKV` | structure | Hyp(K, V). |
| `TauCeti.EulerSystems.HypKT.toHypKV` | functoriality | Hyp(K, T) implies Hyp(K, V). |
| `TauCeti.EulerSystems.indexOfDivisibility` | data | ind_O(c) ∈ ℕ∞. |
| `TauCeti.EulerSystems.indexOfDivisibility_eq_top_iff` | characterisation | ind_O(c) = ∞ iff c_K ∈ H¹(K, T)_tors. |
| `TauCeti.EulerSystems.errorTerm` | data | n_W and n_W^* ∈ ℕ∞, finite when T ≠ O, O(1) and V is irreducible. |
| `TauCeti.EulerSystems.indexOfDivisibility_smul` | relation | ind_O(π·c) = ind_O(c) + 1 for a uniformiser π. |

**Unit tests.**

- `HypKT.of_rank_one` (computation): If rank_O T = 1 then Hyp(K, T) holds with τ = 1.
- `indexOfDivisibility_zero_system` (degenerate): For the zero Euler system ind_O(c) = ∞ and the bounds say nothing.
- `errorTerm_infinite_trivial` (non-example): For T = O with trivial action, H¹(Ω/K, W) = Hom(Gal(Ω/K), Φ/O) is infinite: the finiteness statement excludes T = O and T = O(1).
- `errorTerm_cyclotomic` (computation): For K = ℚ, T = ℤ_p(1) ⊗ χ^{-1}, χ ≠ 1, ω of order prime to p: H¹(Ω/ℚ, W) = H¹(Ω/ℚ, W^*) = 0, so n_W = n_W^* = 0.

**Acceptance.**

- For T = ℤ_p(1) ⊗ χ^{-1} with χ even nontrivial of order prime to p: n_W = n_W^* = 0.
- The two error terms are distinct; neither is assumed zero.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `SelmerIwasawaCohomology:L2/selmer-limits`
- `SelmerIwasawaCohomology:L2/galois-selmer-group`

**Sources.**

- `rubin-es`, Chapter II §2, p. 24. The two hypothesis packages. Source excerpt: “Hypotheses Hyp(K, T ).”
- `rubin-es`, Chapter II, Definition 2.1, p. 24. The index of divisibility. Source excerpt: “If c is an Euler system, we define the index of divisibility of c to be”
- `rubin-es`, Chapter V, Lemma 3.2, p. 87. Finiteness of the error groups. Source excerpt: “If T 6= O and T 6= O(1) then H 1 (Ω/K, W ) and H 1 (Ω/K, W ∗ )”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinBound`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### Rubin's bound with error terms

`EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound` — theorem

**Planet:** Rubin's bound with error terms.

**Statement.** Let c be an Euler system for T (admissible tower). (a) If p > 2 and T satisfies Hyp(K, T), then ℓ_O(S_{Σ_p}(K, W^*)) ≤ ind_O(c) + n_W + n_W^*. (b) If V satisfies Hyp(K, V), T is not the one-dimensional trivial representation and c_K ∉ H¹(K, T)_tors, then S_{Σ_p}(K, W^*) is finite (any p). (c) Let H¹_f(K_v, V), H¹_f(K_v, V^*) be orthogonal complements for v | p and loc^s_{Σ_p} : S^{Σ_p}(K, T) → H¹_s(K_p, T) = ⊕_{v|p} H¹_s(K_v, T). If loc^s_{Σ_p}(c_K) ≠ 0: under the hypotheses of (b) and [H¹_s(K_p, T) : O·loc^s_{Σ_p}(c_K)] finite, S(K, W^*) is finite; under those of (a), ℓ_O(S(K, W^*)) ≤ ℓ_O(H¹_s(K_p, T)/O·loc^s_{Σ_p}(c_K)) + n_W + n_W^*. (d) If c is trivial at a finite set Σ of primes not above p, then under the hypotheses of (a), ℓ_O(S_{Σ_p}^Σ(K, W^*)) ≤ ind_O(c) + n_W + n_W^* with n_W = ℓ_O(H¹(Ω/K, W) ∩ S_Σ^{Σ_p}(K, W)) and n_W^* as before. The constants n_W, n_W^* are independent of the torsion exponent M, so the finite-level bounds are uniform in M before passing to W^* = colim W_M^*.

**Hypotheses.**

- an Euler system for an admissible tower (or rigidity (ii)′ with T^{G_{K(1)}} = 0)
- p > 2 and Hyp(K, T) for (a); Hyp(K, V) for (b)

**Proof outline.**

1. Fix M with ord_𝔭 M ≥ n + (k + 1)n_W + ind_O(c). ES.1/rubin-prime-selection gives primes q₁, …, q_k adapted to a generating set of S_{Σ_p}(K, W_M^*) and to the derivative classes.
2. Lemma V.2.5: for such a set Σ, the cokernel of loc^s_{Σ,W_𝔪} : S^{Σ∪Σ_p}(K, W_𝔪) → ⊕_{q∈Σ} H¹_s(K_q, W_𝔪) has length ≤ ind_O(c) + n_W; the singular parts of the derivative classes κ_{r_i,M} (ES.3/derivative-local-properties) generate a submodule of bounded index, using Corollary A.2.6 to control Q_q(Fr_q^{-1}) when coinvariants are not free (the 2b term).
3. Global duality (SelmerIwasawaCohomology L2/selmer-structure-poitou-tate): the kernel of S_{Σ_p}(K, W_M^*) → ⊕_{q ∈ Σ} H¹_f(K_q, W_M^*) is dual to that cokernel; the classes dying at all q_i lie in H¹(Ω/K, W_M^*), of length ≤ n_W^*.
4. (b): the same with the losses a + 1 of Lemma V.3.1, bounding the exponent rather than the length. (c): Corollary I.7.5 compares S(K, W^*) and S_{Σ_p}(K, W^*). (d): Theorem IX.5.3.

**Acceptance.**

- Cyclotomic units: with n_W = n_W^* = 0 the bound is the class-group divisibility of Rubin's Chapter III.
- Each of ind_O(c), n_W, n_W^* is retained; an application may drop an error term only after proving it vanishes.
- The bound is for S_{Σ_p}(K, W^*), strict at p, not for the Bloch–Kato Selmer group; (c) is the passage to S(K, W^*).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`
- `SelmerIwasawaCohomology:L2/selmer-limits`

**Sources.**

- `rubin-es`, Chapter II, Theorem 2.2, p. 24. The bound with error terms. Source excerpt: “Theorem 2.2. Suppose that p > 2 and that T satisfies Hyp(K, T ). If c is an”
- `rubin-es`, Chapter II, Theorem 2.3, p. 24. Finiteness under Hyp(K, V). Source excerpt: “Note that Theorem 2.3 holds even if p = 2.”
- `rubin-es`, Chapter V, Lemma 2.5, p. 82. The key estimate on the cokernel of the singular localisation. Source excerpt: “Lemma 2.5. Suppose m = pn is a nonzero ideal of O, k ∈ Z+ , M is a power”
- `rubin-es`, Appendix A, Corollary 2.6, p. 148. The kernel and cokernel of q(σ) on W_M are bounded. Source excerpt: “have length at most 2b.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinBound`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### Bounds for the variants: finite depth and anticyclotomic systems

`EulerSystemsAndKolyvaginSystems:ES.4/variant-bounds` — theorem

**Statement.** (a) (Finite depth.) Let 0 ≠ M ∈ O and c an Euler system for W_M. Suppose Hyp(K, T) holds, n_W = n_W^* = 0 and W_M^{G_K} = 0. Let m = sup_{q ∤ p} [W^{I_q} : (W^{I_q})_div] and n the order of m·c_K in H¹(K, W_M). Then n·S_{Σ_p}(K, W_M^*) = 0; in particular if m·c_K ≠ 0 then S_{Σ_p}(K, W^*) is finite for a compatible family. (b) (Anticyclotomic.) Let c be a χ-anticyclotomic Euler system for T with H¹(Ω′/K′, W) = H¹(Ω′/K′, W^*) = 0, T ⊗ k irreducible over G_{K′}, and τ ∈ G_K with ε_cyc(τ) = χ(τ), τ^d the identity on K′(1)_χ(μ_{p^∞}, (O_{K′}^×)^{1/p^∞}) and T/(τ − 1)T free of rank one. Then for every i, 𝔭^{ind_O(c, χ^i)} S_{Σ_p}(K′, W^*)^{χ^{1−i}} = 0, where ind_O(c, χ^i) is the index of divisibility of the χ^i-component of c_{K′}. This bounds exponents of eigenspaces, not lengths.

**Hypotheses.**

- as stated

**Proof outline.**

1. (a): derivative classes exist for systems of depth M and satisfy the finite–singular relation; the finiteness away from pr holds after multiplying by m (Corollary IV.6.5); run the argument of rubin-bound for the exponent.
2. (b): ES.3/anticyclotomic-derivative with r = 1 gives classes in the χ^{i−1}-part ramified at one prime, with ramification governed by the χ^i-part of c_{K′}; they annihilate S_{Σ_p}(K′, W^*)^{χ^{1−i}} by global duality.

**Acceptance.**

- For d = 1, (b) is the exponent form of rubin-bound with zero error terms.
- For Heegner points (d = 2) the induction to a length bound uses T^* ≅ T and is carried out in ES.5/howard-dvr-theorem.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.3/anticyclotomic-derivative`
- `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`

**Sources.**

- `rubin-es`, Chapter IX, Theorem 3.3, p. 137. The finite-depth bound. Source excerpt: “Theorem 3.3. Suppose M ∈ O is nonzero and c is an Euler system for WM .”
- `rubin-es`, Chapter IX, Theorem 4.3, p. 139. The anticyclotomic exponent bound. Source excerpt: “Theorem 4.3. Suppose c is a χ-anticyclotomic Euler system for T . Suppose”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinBound`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### Localisation at abundant tuples with bounded loss

`EulerSystemsAndKolyvaginSystems:ES.4/abundant-localization` — theorem

**Statement.** Setting of ES.1/abundant-tuples. (a) (Uniform annihilation.) Let R be a lattice with R_ℚ^𝔠 ≅ R_ℚ^∨(1), pure of weight −1 at every nonarchimedean place not above ℓ. For every finite set Σ of places there is m_Σ ≥ 1 such that for every saturated free submodule S of the Bloch–Kato Selmer module with images S^{(m)} modulo λ^m and every m > m_Σ, loc_w(λ^{m_Σ}S^{(m)}) = 0 for every nonarchimedean w ∈ Σ not above ℓ. (b) (Corrected Proposition 2.6.7.) Let S be free of rank r over O_λ/λ^{m−m₀} and (Ψ₁, …, Ψ_r) an (S, γ)-abundant tuple realised by γ-associated places w_i. Put c = 𝔣(r)r_R and let A be the matrix of s ↦ (θ_S(Ψ_i)(s))_i in a basis e₁, …, e_r of S, after identifying the λ^{m−m₀}-torsion of (R̄^{(m)})^{h_γ} with O_λ/λ^{m−m₀}; abundance says that the image of A contains λ^c(O_λ/λ^{m−m₀})^r. Then there is an integral matrix C with AC = CA = λ^c·I in the finite coefficient ring, and the elements s_j = Ce_j ∈ S satisfy loc_{w_i}(s_j) = 0 for i ≠ j and exp_λ(loc_{w_i}(s_i), H¹_ns(F_{w_i}, R̄^{(m)})) ≥ m − m₀ − 𝔣(r)r_R; the s_j span a submodule containing λ^{𝔣(r)r_R}S and form a basis of S when 𝔣(r)r_R = 0. For r = 2 and a primitive v ∈ S one can moreover choose a primitive t ∈ S with loc_{w₁}(t) = 0 and exp_λ(loc_{w₂}(t)) ≥ m − m₀ − 𝔣(2)r_R after possibly interchanging the two places. The printed statement (a basis for every abundant tuple) is false when the loss is positive.

**Hypotheses.**

- as in ES.1/abundant-tuples
- for (a): the purity and polarisation hypotheses

**Proof outline.**

1. (a): local cohomology H¹_ns at w ∤ ℓ of a pure weight −1 lattice is finite, of exponent bounded independently of m; saturation makes S^{(m)} free and its localisation factor through the torsion of the local group.
2. (b): linear algebra over the discrete valuation ring: use Smith normal form over the DVR: if c < m−m₀, each nonzero diagonal exponent is at most c, giving an integral scaled inverse of a suitable lift and a reduction C with AC=CA=λ^cI; if c ≥ m−m₀ take C=0. An arbitrary matrix over the finite quotient need not be invertible there; for r = 2 take t = (−u₂, u₁) from the first row π^a(u₁, u₂) of A. The localisation statement follows because loc_{w_i} on S factors through θ_S(Ψ_i) (evaluation at Frobenius, ES.1/finite-singular-decomposition).

**Acceptance.**

- With r_R = 0: a basis of S diagonalising the localisations, with exp ≥ m − m₀: the clean statement.
- The linear-algebra step of the printed form fails when the loss is positive: for A = (λ, 1; 0, λ) over O_λ/λ^n with n ≥ 3, whose image contains λ²(O_λ/λ^n)², there is no basis s₁, s₂ with A(s_j) supported on the j-th coordinate, since that would write A = D·B with D diagonal and B invertible, and the second row (0, λ) forces det B ∈ λO_λ. The corrected statement uses the scaled inverse C = λ²A^{-1} = (λ, −1; 0, λ).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`

**Sources.**

- `ltxzz`, Proposition 2.4.6(2), arXiv v3 p. 17. Uniform annihilation of localisations. Source excerpt: “exists a positive integer mΣ , depending on R and Σ, such that for every S as in (1) and”
- `ltxzz`, Proposition 2.6.7, arXiv v3 p. 20. The printed statement, corrected here (PAPER-LIU-ETAL-22/E2 in the register of source mistakes). Source excerpt: “For every (S, γ)-abundant r-tuple (Ψ1 , . . . , Ψr ), one can choose a basis {s1 , . . . , sr } of S such that”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.

### Self-dual descent with explicit error constants

`EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors` — theorem

**Statement.** (Castella–Grossi–Lee–Skinner, Theorem 3.2.1.) Let E/ℚ be an elliptic curve of conductor N, p ∤ 2N a prime of good ordinary reduction, K an imaginary quadratic field of discriminant prime to Np with E(K)[p] = 0, Γ the Galois group of the anticyclotomic ℤ_p-extension, R the integers of a finite extension Φ/ℚ_p, α : Γ → R^× a character with α ≠ 1, T_α = T_pE ⊗ R(α), A_α = T_α ⊗ Φ/R, and F_ord the ordinary Selmer structure. If κ_α ∈ KS(T_α, F_ord, 𝓛_E) has κ_{α,1} ≠ 0, then H¹_{F_ord}(K, T_α) has rank one and H¹_{F_ord}(K, A_α) ≅ (Φ/R) ⊕ M_α ⊕ M_α with M_α finite and length_R(M_α) ≤ length_R(H¹_{F_ord}(K, T_α)/R·κ_{α,1}) + E_α, where E_α ≥ 0 depends only on C_α, T_pE and rank_{ℤ_p}R. Here C_α = v_p(α(γ) − α^{-1}(γ)) if α ≠ α^{-1} and 0 otherwise, C_1 = min{v_p(u − 1) : u ∈ ℤ_p^× ∩ im ρ_E|_{G_{K_∞}}}, C_2 is minimal with p^{C_2}End(T_pE) ⊆ ρ_E(ℤ_p[G_ℚ]), and e = rank_{ℤ_p}(R)(C_1 + C_2 + C_α). Inputs: (i) for c₁, c₂, c₃ ∈ H¹(K, T^{(k)}) with Rc₁ + Rc₂ ⊇ 𝔪^{d₁}R^{(k)} ⊕ 𝔪^{d₂}R^{(k)} there are infinitely many ℓ ∈ 𝓛^{(k)} with ord(loc_ℓ c₃) ≥ ord(c₃) − e and R·loc_ℓc₁ + R·loc_ℓc₂ ⊇ 𝔪^{d₁+d₂+2e}(R^{(k)})²; (ii) if N ⊆ M are finitely generated torsion R-modules then their invariant factors satisfy d_i(N) ≤ d_i(M). When ρ_E|_{G_K} is surjective, E_α = 0 and the statement is ES.5/howard-dvr-theorem. Residual irreducibility is not assumed.

**Hypotheses.**

- as stated; in particular α ≠ 1 and (h1) E(K)[p] = 0

**Proof outline.**

1. Structure H¹_{F(n)}(K, T^{(k)}) ≅ (R^{(k)})^ε ⊕ M^{(k)}(n) ⊕ M^{(k)}(n): ES.5/cassels-structure, which needs only self-duality and vanishing invariants.
2. (i) replaces ES.1/chebotarev-nonvanishing: restriction to the field cut out by T^{(k)} has kernel killed by p^{C_1}-type constants, and the O-span of the image of Galois is controlled by C_2 and C_α.
3. Induction on the number of primes as in Howard's proof, using (ii) and the module lemmas 3.3.10–3.3.11; in the branch M = 0 the canonical injection 0 ↪ X is used and no summand is omitted (PAPER-CASTELLA-ETAL-22/E43 in the register of source mistakes).
4. The length of M_α is bounded, not only its exponent.

**Acceptance.**

- E_α = 0 when ρ_E is surjective on G_K.
- The bound is uniform in k: the constants C_1, C_2, C_α do not depend on the torsion exponent.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`

**Sources.**

- `cgls`, Theorem 3.2.1, arXiv v2 p. 17. The bound with the error constant. Source excerpt: “for some constant Eα ∈ Z⩾0 depending only on Cα , Tp E, and rankZp (R).”
- `cgls`, Proposition 3.3.6, arXiv v2 p. 19. The Chebotarev statement with error terms. Source excerpt: “Proposition 3.3.6. Suppose α 6= 1. Let c1 , c2 , c3 ∈ H1 (K, T (k) ).”
- `cgls`, Lemma 3.3.9, arXiv v2 p. 22. The module lemma used in the induction. Source excerpt: “Lemma 3.3.9. Let N ⊂ M be finitely-generated torsion R-modules.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.

## ES.5. Primitivity and sharpness over discrete valuation rings

Divisibility indices, elementary divisors and primitivity; the rank-one module theorem; the structure theorem for the dual Selmer group; the Kolyvagin-constructed dual Selmer group; and Howard's self-dual theory, of which this layer is the single owner. Depends on ES.4.

**Planets of this layer:** Primitive Kolyvagin system; Rank-one freeness of Kolyvagin systems; Structure theorem for the dual Selmer group; Howard's hypotheses H.0–H.5; Howard's self-dual Kolyvagin bound.

### Divisibility indices, elementary divisors and primitivity

`EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants` — definition

**Planet:** Primitive Kolyvagin system.

**Statement.** Let (T, F, P) be a Selmer triple and κ ∈ KS(T). (a) R principal artinian of length k: ∂^{(r)}(κ) = min{k − length(Rκ_n) : n ∈ N, ν(n) = r} and e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ) for i ≥ 0. (b) R a discrete valuation ring: ∂^{(r)}(κ) = max{j : κ_n ∈ m^j H¹_{F(n)}(K, T/I_nT) ⊗ G_n for every n ∈ N with ν(n) = r} ∈ ℕ ∪ {∞}, ∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(K, T)}, e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ) for i ≥ ord(κ), and ∂^{(∞)}(κ) = min{∂^{(r)}(κ) : r ≥ 0}. κ is primitive if its image in KS(T/mT) is nonzero. In the DVR case, the index ∂^{(0)}(κ) is ∞ when κ_1=0. In the artinian case use the truncated definition k−length(Rκ_1), which equals k for κ_1=0, not ∞. The two conventions agree through limits for nonzero DVR systems under the rank-one admissibility hypotheses.

**Hypotheses.**

- For the definitions: R principal artinian (length k) or a DVR, with its specified Kolyvagin-system carrier.
- For monotonicity, scaling, elementary-divisor and order characterisations: the admissibility hypotheses of rank-one-module-theorem and χ(T)=1; use nonzero κ for DVR elementary divisors.

**Construction.**

1. In the artinian case length(Rκ_n) = k − (largest j with κ_n ∈ m^j of a free stalk); the two definitions agree in the limit: ∂^{(s)}(κ) = lim_k ∂^{(s)}(κ^{(k)}) (Theorem 5.2.12(i)).
2. Primitivity uses the reduction map KS(T) → KS(T/mT) of ES.3/kolyvagin-system-module; for core rank one it is equivalent to κ generating KS(T), and to κ_n generating the stub stalk ℋ′(n) for one n with ℋ′(n) ≠ 0, or for all n (Corollary 4.5.4).

**Uses that determine the API.**

- Mazur–Rubin 2004, Theorems 5.2.2 and 5.2.12: ∂^{(0)} bounds the length of the dual Selmer group and the e_i give its elementary divisors
- RankZeroOneBSD BSD.7a; HeegnerPointEulerSystems HE.6: applications separate nonzero, primitive and analytic statements using these invariants

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex` | data | ∂^{(r)}(κ) ∈ ℕ∞ for r ≥ 0. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_zero` | characterisation | ∂^{(0)}(κ) = sup{j : κ_1 ∈ m^j H¹_F(K, T)}; it is ⊤ iff κ_1 = 0 (R a discrete valuation ring, H¹_F torsion-free). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.elementaryDivisor` | data | e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ), defined for i ≥ ord(κ). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndexInfty` | data | ∂^{(∞)}(κ) = inf_r ∂^{(r)}(κ). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.IsPrimitive` | structure | The image of κ in KS(T/mT) is nonzero. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_smul` | relation | Under the rank-one admissibility hypotheses, over a DVR ∂^{(r)}(πκ)=∂^{(r)}(κ)+1 with ∞+1=∞. Over a principal artinian ring of length k, ∂^{(r)}(πκ)=min(k,∂^{(r)}(κ)+1). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.not_isPrimitive_smul` | relation | π·κ is not primitive. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.ord_eq` | characterisation | For nonzero κ under the rank-one admissibility hypotheses: over a DVR ord(κ)=min{r:∂^{(r)}(κ)<∞}; over a principal artinian ring ord(κ)=min{r:∂^{(r)}(κ)<k}. Set ord(0)=∞ in both cases. |

**Unit tests.**

- `divIndex_zero_system` (degenerate): For κ=0 over a DVR, ∂^{(r)}=∞ for all r; over a principal artinian ring of length k, ∂^{(r)}=k. In both cases ord(κ)=∞ and κ is not primitive.
- `divIndex_scaling` (computation): For a DVR rank-one admissible triple and primitive κ with ∂^{(0)}=3, ∂^{(0)}(π²κ)=5. Over an artinian ring of length k the value is min(k,5). If k=4 it equals 4 and (π²κ)_1=0. The scaled system is not primitive.
- `isPrimitive_field` (characterisation): For R = k a field, κ is primitive iff κ ≠ 0.
- `isPrimitive_ne_nonzero_initial` (non-example): Over a DVR, for primitive κ₀ with (κ₀)_1≠0, πκ₀ has nonzero initial class and is not primitive. In an artinian quotient the initial class can be killed by π, so nonvanishing must be checked separately.

**Acceptance.**

- Over a DVR under rank-one admissibility, ∂^{(r)}(πκ)=∂^{(r)}(κ)+1 and e_i(πκ)=e_i(κ) for their finite range. Over length-k artinian rings the values truncate at k, so elementary divisors need not remain unchanged.
- The order uses threshold ∞ over a DVR and k over an artinian ring.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf`
- `mathlib:Module.length`

**Sources.**

- `mr-ks`, Definition 5.2.11, pp. 57–58. The invariants over a discrete valuation ring. Source excerpt: “For κ ∈ KS(T ) and r ∈ Z+ define (compare Definition 4.5.7)”
- `mr-ks`, Definition 4.5.5, p. 49. Primitivity. Source excerpt: “We say that κ ∈ KS(T ) is primitive if the image of κ in”
- `mr-ks`, Definition 4.5.7, p. 49. The artinian invariants. Source excerpt: “The elementary divisors of κ are defined by”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Primitivity`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Kolyvagin systems in core rank one

`EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem` — theorem

**Planet:** Rank-one freeness of Kolyvagin systems.

**Statement.** Let (T, F, P) satisfy (H.0)–(H.6) with χ(T) = 1. (a) R principal artinian of length k: KS(T) is free of rank one over R; for a core vertex n, κ ↦ κ_n is an isomorphism KS(T) ≅ ℋ(n); if κ_m ≠ 0 generates m^jℋ′(m) then κ_n generates m^jℋ′(n) for every n; for j ≥ k restriction KS(T, P) → KS(T, P ∩ P_j) is an isomorphism; for j ≤ k reduction KS(T) → KS(T/m^jT) is surjective; and KS(T) → K̄S(T) is an isomorphism. (b) R a discrete valuation ring, (H.0)–(H.5), torsion-free local quotients, P = P_1: KS(T) ≅ lim_k KS(T/m^kT, P_k) ≅ K̄S(T), and KS(T) is free of rank one, generated by a primitive κ. If χ(T) = 0 then KS(T) = 0 in both cases; if χ(T) ≥ 2 and R is artinian, KS(T) contains free modules of every rank.

**Hypotheses.**

- (H.0)–(H.6) (artinian), or (H.0)–(H.5) with torsion-free local quotients (discrete valuation ring)
- χ(T) = 1 for the main statements

**Proof outline.**

1. (a): KS(T) = Γ(ℋ′) (ES.4/stub-sheaf), a locally cyclic sheaf with trivial monodromy and hubs at the core vertices; apply ES.4/sheaf-monodromy.
2. (b): injectivity of KS(T) → lim KS(T/m^k) (Lemma 5.2.7); surjectivity by assembling κ_n from κ^{(j)}_n with j maximal such that n ∈ N_j; the transition maps are surjective by Lemma 5.2.8.

**Acceptance.**

- For T = ℤ_p(1) ⊗ ρ^{-1}, ρ even nontrivial: KS(T) is free of rank one, generated up to a unit by the cyclotomic-unit system when that system is primitive.
- Reduction surjectivity: every Kolyvagin system modulo m^j lifts.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf`
- `EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy`
- `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`

**Sources.**

- `mr-ks`, Corollary 4.5.2, p. 48. The artinian statement. Source excerpt: “KS(T ) is a free R-module of rank one.”
- `mr-ks`, Theorem 5.2.10, p. 57. The statement over a discrete valuation ring. Source excerpt: “If χ(T ) = 1 then KS(T ) is a free R-module of rank one, generated by a”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Primitivity`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Structure of the dual Selmer group from a Kolyvagin system

`EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem` — theorem

**Planet:** Structure theorem for the dual Selmer group.

**Statement.** Let χ(T) = 1 and 0 ≠ κ ∈ KS(T). (a) R = k a field: dim KS(T) = 1, κ_n ≠ 0 iff n is a core vertex, and dim_k H¹_{F^*}(ℚ, T^*) = ord(κ). (b) R principal artinian of length k, κ_1 ≠ 0: ∂^{(0)}(κ) ≥ ∂^{(1)}(κ) ≥ ⋯, e_0(κ) ≥ e_1(κ) ≥ ⋯ ≥ 0 and H¹_{F^*}(ℚ, T^*) ≅ ⊕_{i ≥ 0} R/m^{e_i(κ)}; if κ is primitive and κ_1 ≠ 0 then length H¹_{F^*}(ℚ, T^*) = k − length(Rκ_1) = max{i : κ_1 ∈ m^iH¹_F(ℚ, T)}, and if κ_1 = 0 then length H¹_{F^*}(ℚ, T^*) ≥ k. (c) R a discrete valuation ring: ∂^{(s)}(κ) is nonincreasing and finite for s ≥ ord(κ); the e_i(κ) are nonincreasing, nonnegative and independent of κ ≠ 0, as is ord(κ); corank_R H¹_{F^*}(ℚ, T^*) = ord(κ); H¹_{F^*}(ℚ, T^*)/(H¹_{F^*}(ℚ, T^*))_div ≅ ⊕_{i ≥ ord(κ)} R/m^{e_i(κ)}; its length is ∂^{(ord κ)}(κ) − ∂^{(∞)}(κ); and κ is primitive iff ∂^{(∞)}(κ) = 0. Hence: length H¹_{F^*}(ℚ, T^*) is finite iff κ_1 ≠ 0; length H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ) with equality iff κ is primitive; and length H¹_{F^*}(ℚ, T^*) = length(H¹_F(ℚ, T)/L(T)) for the module of L-values L(T).

**Hypotheses.**

- the hypotheses of rank-one-module-theorem in each case
- χ(T) = 1

**Proof outline.**

1. (b): if κ_m generates m^jℋ′(m), then ∂^{(r)}(κ) = min{k, j + Σ_{i>r} d_i} for H¹_{F^*}(ℚ, T^*) ≅ ⊕R/m^{d_i} (Proposition 4.5.8), because the minimum of λ(n, T^*) over n with ν(n) = r is Σ_{i>r} d_i by ES.4/vertex-step and ES.1/chebotarev-nonvanishing.
2. (c): pass to the limit over T/m^k using rank-one-module-theorem(b) and ∂^{(s)}(κ) = lim ∂^{(s)}(κ^{(k)}).
3. The final equality: KS(T) is generated by a primitive κ, L(T) = Rκ_1, and H¹_F(ℚ, T) is free of rank corank H¹_{F^*} + 1.

**Acceptance.**

- Three separate conclusions: κ_1 ≠ 0 gives finiteness and an upper bound; primitivity gives equality; an analytic formula needs in addition an identification of κ_1 with an L-value.
- The higher e_i give every elementary divisor of the dual Selmer group, not only its exponent or length.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`
- `EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`

**Sources.**

- `mr-ks`, Theorem 5.2.12, p. 58. The structure theorem over a discrete valuation ring. Source excerpt: “Theorem 5.2.12. Suppose χ(T ) = 1 and κ ∈ KS(T ), κ 6= 0. Then”
- `mr-ks`, Corollary 5.2.13, p. 58. Sharpness under primitivity. Source excerpt: “with equality if and only if κ is primitive.”
- `mr-ks`, Theorem 4.5.9, p. 50. The artinian structure theorem. Source excerpt: “Theorem 4.5.9. Suppose χ(T ) = 1, κ ∈ KS(T ), and κ1 6= 0. Then”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Primitivity`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The Kolyvagin-constructed dual Selmer group

`EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer` — construction

**Statement.** Let S be a sheaf on X(P) with isomorphisms S(e_{n,nℓ}) ≅ S(e_ℓ) for all edges (for the Selmer sheaf with I_ℓ = 0 for all ℓ ∈ P, given by generators of the G_ℓ). For a vertex n let ψ_n : S(n) → ⊕_{ℓ | n} S(e_ℓ) be the sum of the vertex-to-edge maps. For a global section κ, Sel^*(κ; n) = (⊕_{ℓ | n} S(e_ℓ))/Σ_{d | n} ψ_d(Rκ_d) and Sel^*(κ) = colim_n Sel^*(κ; n). For the Selmer sheaf there is a canonical map H¹_{F^*}(ℚ, T^*) → Hom(Sel^*(κ), ℚ_p/ℤ_p) with kernel ∩_n H¹_{(F^*)_n}(ℚ, T^*), the classes vanishing at every prime of P. Theorem: if χ(T) = 1, (H.4a) holds, the image of R → End(T) lies in that of ℤ_p[[G_ℚ]] and κ is primitive, this map is an isomorphism. For general (T, F, P), Sel^*_∞(κ) = lim_k Sel^*(κ^{(k)}).

**Hypotheses.**

- I_ℓ = 0 for ℓ ∈ P (after reduction modulo m^k and restriction to P_k)

**Construction.**

1. Global duality for F_n ≤ F (ES.1/modified-selmer-structures; SelmerIwasawaCohomology L2/selmer-structure-poitou-tate) gives 0 → H¹_{(F^*)_n} → H¹_{F^*} → Hom(⊕_{ℓ|n} H¹_s(ℚ_ℓ, T)/image(H¹_{F^n}(ℚ, T)), ℚ_p/ℤ_p), and κ_d ∈ H¹_{F^n} for d | n.
2. Surjectivity under primitivity: Lemmas 4.5.13–4.5.14 and Proposition 4.5.15, walking through core vertices.

**Uses that determine the API.**

- Mazur–Rubin 2004, Theorem 4.5.12 and Remark 4.5.16: generators and relations for the dual Selmer group in terms of κ
- ES.5/structure-theorem: an alternative route to the elementary divisors

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.kolyvaginDualSelmer` | constructor | Sel^*(κ; n) and Sel^*(κ) = colim_n Sel^*(κ; n). |
| `TauCeti.KolyvaginSystems.kolyvaginDualSelmer_map` | functoriality | For n \| m the natural map Sel^*(κ; n) → Sel^*(κ; m). |
| `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual` | constructor | The canonical map H¹_{F^*}(ℚ, T^*) → Hom(Sel^*(κ), ℚ_p/ℤ_p). |
| `TauCeti.KolyvaginSystems.ker_dualSelmerToKolyvaginDual` | characterisation | Its kernel is ⨅_n H¹_{(F^*)_n}(ℚ, T^*). |
| `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual_bijective` | other | Bijective when χ(T) = 1, (H.4a), the End(T) condition and κ primitive. |

**Unit tests.**

- `kolyvaginDualSelmer_one` (degenerate): Sel^*(κ; 1) = 0.
- `kolyvaginDualSelmer_zero_system` (computation): For κ = 0, Sel^*(κ; n) = ⊕_{ℓ | n} S(e_ℓ), free of rank ν(n) when the edge modules are free of rank one.
- `dualSelmerToKolyvaginDual_not_surjective` (non-example): For κ = πκ₀ with κ₀ primitive and H¹_{F^*}(ℚ, T^*) = 0, Sel^*(κ; ℓ) = S(e_ℓ)/πS(e_ℓ) ≠ 0 at a core edge, so the map from 0 is not surjective.

**Acceptance.**

- The construction recovers the Pontryagin dual of the whole dual Selmer group, as a module, from the classes κ_n.
- For a non-primitive κ the map need not be surjective.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`
- `SelmerIwasawaCohomology:L2/pontryagin-dual`

**Sources.**

- `mr-ks`, Definition 3.3.1, p. 25. Definition of Sel^*(κ; n). Source excerpt: “Kolyvagin-constructed dual Selmer group by”
- `mr-ks`, Theorem 4.5.12, p. 51. The isomorphism under primitivity. Source excerpt: “If κ ∈ KS(T ) is primitive then the canonical map”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Primitivity`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Scaling, vanishing leading class and a non-primitive arithmetic system

`EulerSystemsAndKolyvaginSystems:ES.5/sharpness-examples` — application

**Statement.** (a) Scaling: for κ primitive with κ_1 ≠ 0 over a discrete valuation ring (χ(T) = 1), length H¹_{F^*}(ℚ, T^*) = ∂^{(0)}(κ); for κ′ = πκ, ∂^{(0)}(κ′) = ∂^{(0)}(κ) + 1 > length H¹_{F^*}(ℚ, T^*), the e_i are unchanged and κ′ is not primitive: the bound for κ′ is true and not sharp. (b) A nonzero Kolyvagin system with κ_1 = 0 is a valid element of KS(T); for it ∂^{(0)} = ∞, the bound is vacuous, and by the structure theorem H¹_{F^*}(ℚ, T^*) is infinite when χ(T) = 1. For κ=0 the bound remains vacuous and gives no finiteness conclusion. (c) Kato's Kolyvagin system for T_pE: if L(E, 1) ≠ 0, p satisfies the hypotheses of Mazur–Rubin 2004 Theorem 6.2.4(ii) and p divides a Tamagawa factor c_ℓ for some ℓ ≠ p, then κ^{Kato} is not primitive: it is a Kolyvagin system for the finer structure F_u with unramified conditions away from p, whose dual Selmer group is larger by the Tamagawa defect. The defect is recorded as a length.

**Hypotheses.**

- χ(T) = 1; for (c) the hypotheses of Theorem 6.2.4(ii) of the source

**Proof outline.**

1. (a), (b): ES.5/divisibility-invariants and ES.5/structure-theorem. (c): Remark A.5 — the classes lie in H¹_{(F_u)(n)}; apply the bound for F_u and compare H¹_{F_u^*} with H¹_{F_can^*}.

**Acceptance.**

- A nonzero point or class is not automatically primitive.
- Sharpness is a property of the system, checked through reduction modulo m, not of the representation.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`
- `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`

**Sources.**

- `mr-ks`, Proposition 6.2.6, p. 75. A naturally occurring non-primitive system. Source excerpt: “If p | c` for some ` 6= p, then κKato is not primitive.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Primitivity`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Howard's self-dual Selmer triples and hypotheses H.0–H.5

`EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses` — definition

**Planet:** Howard's hypotheses H.0–H.5.

**Statement.** Let K be an imaginary quadratic field, τ a complex conjugation, R a coefficient ring (complete noetherian local, finite residue field of characteristic p; in §1.5 principal artinian, in §1.6 a discrete valuation ring) and T an R-module with continuous G_K-action. 𝓛₀ is the set of rational primes ℓ inert in K (prime to p and to the ramification of T), λ the prime of K above ℓ; I_ℓ is the smallest ideal of R containing ℓ + 1 for which Fr_λ acts trivially on T/I_ℓT; 𝓛_k = {ℓ ∈ 𝓛₀ : I_ℓ ⊆ p^kR}; G_ℓ = k_λ^×/k_ℓ^×; I_n = Σ_{ℓ | n} I_ℓ and G_n = ⊗_{ℓ | n} G_ℓ. The transverse condition at λ is defined by the maximal p-subextension of K[ℓ]_λ/K_λ, K[ℓ] the ring class field of conductor ℓ. A Selmer triple (T, F, 𝓛) has 𝓛 ⊆ 𝓛₀ disjoint from Σ(F); Kolyvagin systems κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n, n ∈ N(𝓛), satisfy the finite–singular relations at every ℓ with nℓ ∈ N(𝓛). Hypotheses: H.0 T is free of rank two. H.1 T̄ is absolutely irreducible. H.2 there is a Galois extension F/ℚ containing K with G_F acting trivially on T and H¹(F(μ_{p^∞})/K, T̄) = 0. H.3 F is cartesian on Quot(T) at every v ∈ Σ(F). H.4 there is a perfect symmetric R-bilinear pairing ( , ) : T × T → R(1) with (s^σ, t^{τστ^{-1}}) = (s, t)^σ, and F is its own exact orthogonal complement under the induced pairings H¹(K_v, T) × H¹(K_{v̄}, T) → R. H.5 (a) the action of G_K on T̄ extends to G_ℚ and τ splits T̄ into one-dimensional eigenspaces T̄^±; (b) F on T̄ is stable under G_ℚ; (c) the residual pairing satisfies (s^τ, t^τ) = (s, t)^τ.

**Hypotheses.**

- K imaginary quadratic
- p odd

**Construction.**

1. The transverse and finite conditions at an inert prime are free of rank two when I_n = 0 (Howard, Proposition 1.1.7); the finite–singular map is the one of ES.1/finite-singular-comparison for K_λ, with tensor factor the p-part of k_λ^×/k_ℓ^×.
2. H.0–H.5 are stable under base change of R (Remark 1.3.1) and under F ↦ F(n) (Lemma 1.5.1).
3. For R = ℤ_p, T = T_pE and (s, t) = e(s, t^τ) with e the Weil pairing, H.4 holds (Remark 1.3.2).

**Uses that determine the API.**

- Howard, Theorems 1.6.1 and 2.2.10: the standing hypotheses of the self-dual descent
- HeegnerPointEulerSystems HE.5–HE.6; GeneralizedHeegnerCycles GH.5: applications verify H.0–H.5 for their representation and import the theorem

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses` | structure | The record H.0–H.5, one field for each hypothesis, with the pairing of H.4 as data. |
| `TauCeti.KolyvaginSystems.SelfDual.inertPrimes` | data | 𝓛_k(T) for k ≥ 0 and the ideals I_ℓ ∋ ℓ + 1. |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.modify` | functoriality | (T, F(n), 𝓛(n)) satisfies H.0–H.5 when (T, F, 𝓛) does. |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.baseChange` | functoriality | H.0–H.5 are stable under R → R′. |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.ofWeilPairing` | example | T_pE over an imaginary quadratic field with the pairing (s, t) = e(s, t^τ) satisfies H.4, given the local conditions of Howard's Theorem 1.6.5. |

**Unit tests.**

- `SelfDual.conductorIdeal_inert` (computation): For T = T_pE and ℓ inert in K with ℓ ∤ pN: Fr_λ = Fr_ℓ² has characteristic polynomial X² − (a_ℓ² − 2ℓ)X + ℓ², and I_ℓ = (ℓ + 1, a_ℓ).
- `SelfDual.rank_two_local` (compatibility): For ℓ ∈ 𝓛_k and R = ℤ/p^k, H¹_f(K_λ, T) and H¹_tr(K_λ, T) are free of rank two, in contrast with rank one at Mazur–Rubin's primes.
- `SelfDual.not_mr04` (non-example): An inert prime ℓ ∈ 𝓛_k is not in Mazur–Rubin's P_k for K: T/(Fr_λ − 1)T is free of rank two, not one.
- `SelfDual.hypotheses_field` (degenerate): For R a field H.3 is automatic.

**Acceptance.**

- These hypotheses differ from Mazur–Rubin's by the self-duality H.4 and by the absence of an analogue of (H.4a)/(p > 4): they are a separate record.
- With H.4, χ-type invariants are replaced by the parity ε ∈ {0, 1} of ES.5/cassels-structure.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`

**Sources.**

- `howard`, §1.3, hypotheses H.0–H.5, p. 1446. The hypothesis list. Source excerpt: “H.0) T is a free, rank-two R-module.”
- `howard`, §1.3, hypothesis H.4, p. 1446. The self-duality hypothesis. Source excerpt: “There is a perfect, symmetric, R-bilinear pairing”
- `howard`, Definition 1.2.3, p. 1445. Kolyvagin systems over an imaginary quadratic field. Source excerpt: “be a collection of cohomology classes”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### The generalised Cassels pairing and the structure R^ε ⊕ M ⊕ M

`EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure` — theorem

**Statement.** Let R be principal artinian of length k and (T, F, 𝓛) satisfy H.1, H.3 and H.4 (with vanishing residual invariants). (a) For positive integers s, t with s + t ≤ k there is a pairing ( , )_{s,t} : H¹_F(K, T/m^sT) × H¹_{F^*}(K, T^*[m^t]) → R whose left and right kernels are the images of H¹_F(K, T/m^{s+t}T) and of π^s : H¹_{F^*}(K, T^*[m^{s+t}]) → H¹_{F^*}(K, T^*[m^t]). (b) There are an R-module M and ε ∈ {0, 1} with H¹_F(K, T) ≅ R^ε ⊕ M ⊕ M. (c) Under H.0–H.5 with 𝓛 ⊆ 𝓛_k, for n ∈ N(𝓛) write H¹_{F(n)}(K, T) ≅ R^ε ⊕ M(n) ⊕ M(n); then ε ≡ ρ(n) = ρ(n)^+ + ρ(n)^− (mod 2), where ρ(n)^± = dim H¹_{F(n)}(K, T̄)^±, and ε is independent of n: if loc_ℓ(H̄(n)^±) ≠ 0 then ρ(nℓ)^± = ρ(n)^± − 1, and otherwise ρ(nℓ)^± = ρ(n)^± + 1.

**Hypotheses.**

- H.1, H.3, H.4; R principal artinian
- H.0–H.5 and 𝓛 ⊆ 𝓛_k for (c)

**Proof outline.**

1. (a): Flach's construction of the Cassels–Tate pairing by lifting cocycles; the kernels by global duality.
2. (b): with H = H¹_F(K, T), the spaces V_s = H[m^s]/mH[m^{s+1}] carry nondegenerate alternating pairings induced by ( , )_{s,1} via H.4 and ES.0/selmer-torsion-identification, so are even-dimensional; conclude by the structure theorem for modules over R.
3. (c): Lemma 1.5.3 by global duality for F_ℓ(n) ≤ F(n), F(nℓ) ≤ F^ℓ(n) on each eigenspace.

**Acceptance.**

- For T = E[p^k] with the classical structure: Sel_{p^k} ≅ (ℤ/p^k)^ε ⊕ M ⊕ M.
- Self-duality replaces the core rank: ε is a parity, not a rank difference.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`

**Sources.**

- `howard`, Proposition 1.4.1, p. 1448. The pairing. Source excerpt: “Proposition 1.4.1. For positive integers s and t with s + t ⩽ k there is a pairing”
- `howard`, Lemma 1.5.3, p. 1450. Parity is constant on the graph. Source excerpt: “In particular this implies that ρ(n) (mod 2) is independent of n ∈ N .”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Stub Selmer modules in the self-dual setting

`EulerSystemsAndKolyvaginSystems:ES.5/howard-stub` — theorem

**Statement.** In the setting of cassels-structure(c) put λ(n) = length M(n) and the stub Selmer module S(n) = m^{λ(n)}H¹_{F(n)}(K, T). Then for nℓ ∈ N(𝓛): loc_ℓ(S(n)) = 0 implies loc_ℓ(S(nℓ)) = 0. Moreover, with a, b, δ ≥ 0 the lengths in Howard's Lemma 1.5.8 for the diamond of H_ℓ(n) ⊆ H(n), H(nℓ) ⊆ H^ℓ(n), one has λ(nℓ) = λ(n) + k − a − b − δ.

**Hypotheses.**

- H.0–H.5, R principal artinian of length k, 𝓛 ⊆ 𝓛_k

**Proof outline.**

1. H^ℓ(n)/(H(n) + H(nℓ)) ≅ (R/m^δ)² (Lemma 1.5.7) and the local modules are free of rank two; compare lengths in the diamond as in ES.4/vertex-step, using the structure R^ε ⊕ M ⊕ M at both vertices.

**Acceptance.**

- This is the self-dual replacement for ES.4/vertex-step(c) and Lemma 4.2.1 of Mazur–Rubin.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`

**Sources.**

- `howard`, Definition 1.5.4, p. 1451. The self-dual stub module. Source excerpt: “b) the stub Selmer module S(n) = mλ(n) H(n).”
- `howard`, Proposition 1.5.9, proof, p. 1452. Vanishing of localisation propagates along an edge. Source excerpt: “kills the lower right quotient. The proposition follows.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

### Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring

`EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem` — theorem

**Planet:** Howard's self-dual Kolyvagin bound.

**Statement.** Let R be a discrete valuation ring with fraction field Φ, D = Φ/R, (T, F, 𝓛) a Selmer triple satisfying H.0–H.5 with 𝓛_s(T) ⊆ 𝓛 for s large, and A = T ⊗ D with the propagated structure. If there is a Kolyvagin system κ ∈ KS(T, F, 𝓛) with κ_1 ≠ 0, then H¹_F(K, T) is free of rank one over R and there is a finite R-module M with H¹_F(K, A) ≅ D ⊕ M ⊕ M and length_R(M) ≤ length_R(H¹_F(K, T)/R·κ_1). The conclusion is about the discrete module A: its corank is one and its cotorsion quotient is M ⊕ M, so its length is twice that of M, bounded by twice the index of κ_1. This is the single owner of the self-dual descent used for Heegner points and for generalised Heegner cycles; the Λ-adic version (Howard, Theorem 2.2.10) belongs to layer ES.8.

**Hypotheses.**

- H.0–H.5
- 𝓛_s(T) ⊆ 𝓛 for s ≫ 0
- κ_1 ≠ 0

**Proof outline.**

1. Reduce modulo m^k: κ^{(k)} ∈ KS(T^{(k)}, F, 𝓛^{(k)}) and H¹_{F(n)}(K, T^{(k)}) ≅ (R^{(k)})^ε ⊕ M^{(k)}(n) ⊕ M^{(k)}(n) (cassels-structure).
2. Lemma 1.6.4: κ_n ∈ S^{(k)}(n) ⊗ G_n for n ∈ N^{(2k−1)}, by induction using howard-stub and a Chebotarev choice of ℓ at which a class in each τ-eigenspace localises nontrivially (Lemma 1.6.2, from H.1, H.2, H.5).
3. Hence κ_1 ∈ m^{λ^{(k)}(1)}H¹_F(K, T^{(k)}); as κ_1 ≠ 0, ε = 1 and λ^{(k)}(1) is bounded by the index of κ_1; pass to the limit over k.

**Acceptance.**

- For T = T_pE and the Heegner point Kolyvagin system: Kolyvagin's theorem, rank one and #Ш[p^∞] dividing the square of the index (Howard, Theorem 1.6.5).
- Distinct from the Mazur–Rubin equality under primitivity: here the bound is an inequality for M with H¹_F(K, A)_{/div} = M ⊕ M, and the factor two comes from self-duality, not from a general principle.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/howard-stub`
- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `howard`, Theorem 1.6.1, p. 1453. The theorem. Source excerpt: “is a free rank-one R module, and there is a finite R-module M such that”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.

## ES.6. Exterior biduals, Stark systems and Gorenstein coefficients

This layer specializes the imported exterior-bidual algebra to Selmer modules and defines Stark systems, their regulator and Kolyvagin systems of rank r. The current generic bidual inventory is retained for traceability, with its L6 ownership gap explicit. The principal-artinian/DVR and Gorenstein routes keep their distinct hypothesis records and integral lattices.

**Planets of this layer:** Exterior bidual; Stark system; Stark systems control Fitting ideals; Regulator isomorphism.

### The exterior bidual

`EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual` — definition

**Planet:** Exterior bidual.

**Statement.** For a commutative ring R, an R-module X and r ≥ 0, with X^* = Hom_R(X, R), the r-th exterior bidual is ⋂^r_R X = Hom_R(⋀^r_R(X^*), R). There is a canonical map ξ^r_X : ⋀^r_R X → ⋂^r_R X, x ↦ (Φ ↦ Φ(x)), where Φ ∈ ⋀^r(X^*) acts on ⋀^r X by φ₁ ∧ ⋯ ∧ φ_r ↦ (x₁ ∧ ⋯ ∧ x_r ↦ det(φ_i(x_j))). ξ^r_X is neither injective nor surjective in general, and is an isomorphism when X is finitely generated projective. ⋂^1_R X = X^{**}, and ⋂^0_R X = R. For Φ ∈ ⋀^r(X^*) and r ≤ s the contraction ⋂^s_R X → ⋂^{s−r}_R X is the R-dual of Ψ ↦ Φ ∧ Ψ, and it is compatible with the contraction ⋀^s X → ⋀^{s−r} X under ξ. For an order R in a semisimple algebra 𝒬 over the fraction field of a Dedekind domain and X finitely generated, ⋂^r_R X is identified with the lattice {a ∈ 𝒬 ⊗_R ⋀^r_R X : Φ(a) ∈ R for all Φ ∈ ⋀^r_R(X^*)} (Rubin's lattice).

**Hypotheses.**

- R commutative

**Construction.**

1. ξ is Mathlib's exteriorPower.pairingDual with the roles of X and X^* exchanged, transposed: pairingDual R (X^*) r composed with evaluation X → X^{**}.
2. For X finitely generated free, pairingDual is bijective (Mathlib, bijective_pairingDual) and X is reflexive, so ξ is an isomorphism; pass to direct summands for projective X.
3. The lattice description: Hom_R(⋀^r X^*, R) ⊗ 𝒬 ≅ 𝒬 ⊗ ⋀^r X because 𝒬 is semisimple and X^* ⊗ 𝒬 is the 𝒬-dual.

**Uses that determine the API.**

- Burns–Sakamoto–Sano II, §4.1 and Definition 6.4: Stark systems and higher-rank Euler systems take values in exterior biduals of cohomology
- Dasgupta–Kakde, §1.2 and Conjecture 1.5: Rubin's lattice is the intersection of an exterior power with ⋂^r_{ℤ[G]} U_{S,T}
- PadicMeasuresIwasawaAlgebras L6: base-change and denominator lemmas for biduals over Gorenstein orders are owned there

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ExteriorBidual.exteriorBidual` | constructor | ⋂^r_R X := Module.Dual R (⋀[R]^r (Module.Dual R X)). |
| `TauCeti.ExteriorBidual.toBidual` | constructor | ξ^r_X : ⋀[R]^r X →ₗ[R] ⋂^r_R X. |
| `TauCeti.ExteriorBidual.toBidual_ιMulti_ιMulti` | simp | ξ(x₁ ∧ ⋯ ∧ x_r)(φ₁ ∧ ⋯ ∧ φ_r) = det(φ_i(x_j)). |
| `TauCeti.ExteriorBidual.toBidual_bijective` | characterisation | ξ^r_X is bijective for X finitely generated projective. |
| `TauCeti.ExteriorBidual.map` | functoriality | A linear map f : X → Y induces ⋂^r f : ⋂^r X → ⋂^r Y (dual of ⋀^r of the transpose), with map_id and map_comp, compatible with ξ. |
| `TauCeti.ExteriorBidual.contract` | constructor | For Φ ∈ ⋀^r(X^*) and r ≤ s, the map ⋂^s X → ⋂^{s−r} X dual to Ψ ↦ Φ ∧ Ψ. |
| `TauCeti.ExteriorBidual.contract_toBidual` | compatibility | contract Φ ∘ ξ^s = ξ^{s−r} ∘ (contraction by Φ on ⋀^s X). |
| `TauCeti.ExteriorBidual.one_equiv_bidual` | equivalence | ⋂^1_R X ≃ X^{**}; in particular ⋂^1 X ≃ X for X reflexive. |
| `TauCeti.ExteriorBidual.equivLattice` | equivalence | For an order R in a semisimple 𝒬 and X finitely generated: ⋂^r_R X ≃ {a ∈ 𝒬 ⊗ ⋀^r X : Φ(a) ∈ R ∀ Φ}. |

**Unit tests.**

- `TauCeti.ExteriorBidual.free_rank` (computation): ⋂^2_R(R³) is free of rank 3, and ξ is an isomorphism.
- `TauCeti.ExteriorBidual.trivial_module_group_ring` (computation): R = ℤ[C₂], X = ℤ² with trivial action: X^* ≅ ℤ² generated by e_i ↦ N (N = 1 + σ), ⋀²(X^*) ≅ ℤ, ⋂²X ≅ ℤ generated by Φ ↦ N, and ξ(e₁ ∧ e₂) is the functional with value N² = 2N, twice the generator: the image of ξ has index 2.
- `TauCeti.ExteriorBidual.zero_power` (degenerate): ⋂^0_R X = Hom_R(R, R) = R for every X.
- `TauCeti.ExteriorBidual.torsion_killed` (non-example): R = ℤ_p, X = ℤ_p ⊕ ℤ/p: ⋂^1 X = X^{**} = ℤ_p while ⋀^1 X = X; ξ is not injective, so the bidual is not the exterior power for modules with torsion.
- `TauCeti.ExteriorBidual.not_surjective` (non-example): In the group-ring example ξ is injective and not surjective: replacing ⋂² by ⋀² loses the element ½·e₁ ∧ e₂.

**Acceptance.**

- ⋂^r_R R^n ≅ ⋀^r_R R^n, free of rank (n choose r).
- For R = ℤ[G], G finite, and X = ℤ^r with trivial action (r ≥ 1): ⋂^r_R X = |G|^{-(r−1)}·⋀^r_ℤ X inside ℚ ⊗ ⋀^r X; for r ≥ 2 and G ≠ 1 the exterior power is a proper sublattice of index |G|^{r−1}.

**Prerequisites.**

- `mathlib:exteriorPower.pairingDual`
- `mathlib:exteriorPower.bijective_pairingDual`
- `mathlib:Module.Dual`
- `mathlib:Module.IsReflexive`
- `mathlib:exteriorPower.map`

**Sources.**

- `bss2`, Definition 2.1, p. 7. The definition, the map ξ and the contraction maps. Source excerpt: “we define the ‘r-th exterior bidual’ of X”
- `dk`, §1.2, p. 8. The lattice form over ℤ[G], in Rubin's original normalisation. Source excerpt: “that ϕ(u) ∈ Z[G] for all r-tuples (ϕ1 , . . . , ϕr ) ∈ HomZ[G] (US,T , Z[G])⊕r . Rubin’s lattice is”

**Suggested library placement:** `TauCeti/LinearAlgebra/ExteriorPower/Bidual`, namespace `TauCeti.ExteriorBidual`. Implementation status: `unchecked`.

### Injectivity, rank reduction and base change for exterior biduals

`EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality` — theorem

**Statement.** (a) If ι : X → Y is injective and Ext¹_R(coker ι, R) = 0, then ⋂^r X → ⋂^r Y is injective for all r. (b) If Y is free of rank r + s and Y → R^s → Z → 0 is exact with components φ₁, …, φ_s, then Fitt⁰_R(Z) is generated by the images im(F) of the elements F in the image of ⋀_{i} φ_i : ⋂^{r+s} Y → ⋂^r Y. (c) If R is self-injective and 0 → X → Y → R^s is exact with components φ_i, then im(⋀_i φ_i : ⋂^{r+s} Y → ⋂^r Y) ⊆ ⋂^r X, so ⋀φ_i induces ⋂^{r+s} Y → ⋂^r X. (d) (Rank reduction.) If R is self-injective and Y ⊆ X, then ⋂^r Y = {x ∈ ⋂^r X : Φ(x) ∈ ⋂^1 Y = Y for all Φ ∈ ⋀^{r−1}X^*}. (e) If R is self-injective and f : X → R, then ⋂^r ker(f) = ker(f : ⋂^r X → ⋂^{r−1} X). (f) For a surjection R → S of self-injective rings, a free R-module F of finite rank, an R-module X with a map X → F and an S-module Y with an injection Y ↪ F ⊗_R S, in a commutative square with X → Y and the projection π : F → F ⊗_R S, there is a natural map ⋂^r_R X → ⋂^r_S Y for r ≥ 1. Over a self-injective ring Hom_R(−, R) is exact and finitely generated modules are reflexive.

**Hypotheses.**

- R commutative noetherian; all modules in the duality/reflexivity assertions finitely generated.
- R self-injective (zero-dimensional Gorenstein) for (c)–(f).
- r≥1 in (d),(e); in (c) r≥0 and s≥1, with contraction from degree r+s to degree r.

**Proof outline.**

1. (a): dualising 0 → X → Y → coker gives X^* ↞ Y^* surjective when Ext¹ vanishes, so ⋀^r Y^* → ⋀^r X^* is surjective and its dual injective.
2. (c)–(e): exactness of duality over self-injective rings and (a); (b): Fitting ideals as determinantal ideals of a presentation (imported from PadicMeasuresIwasawaAlgebras L6).
3. (f): Corollary 2.7, by (d) and bijectivity of Hom_R(F, R) ⊗ S → Hom_S(F ⊗ S, S).

**Acceptance.**

- For R = k a field these are standard facts about exterior powers.
- The transition maps of Stark systems are instances of (c).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `mathlib:Module.Injective`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `bss2`, Proposition 2.3, p. 8. The map into the bidual of a kernel. Source excerpt: “Suppose that R is self-injective, i.e. R”
- `bss2`, Proposition 2.4, p. 8. Rank reduction. Source excerpt: “Proposition 2.4. Suppose that R is self-injective. Let X be an R-module and Y an R-”
- `bss2`, Corollary 2.7, p. 10. Coefficient change. Source excerpt: “Corollary 2.7. We suppose to be given a surjective homomorphism R → S of self-injective”

**Suggested library placement:** `TauCeti/LinearAlgebra/ExteriorPower/Bidual`, namespace `TauCeti.ExteriorBidual`. Implementation status: `unchecked`.

### Stark systems

`EulerSystemsAndKolyvaginSystems:ES.6/stark-systems` — definition

**Planet:** Stark system.

**Statement.** (a) (Mazur–Rubin 2016; R principal artinian of length k, Selmer data (T, F, P, r) with I_q = 0 for q ∈ P.) For n ∈ N put W_n = ⊕_{q | n} Hom(H¹_tr(K_q, T), R), free of rank ν(n), and Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n. For m | n the square of H¹_{F^m} ⊆ H¹_{F^n} with the transverse localisations is cartesian and induces Ψ_{n,m} : Y_n → Y_m, with Ψ_{n′,n″} ∘ Ψ_{n,n′} = Ψ_{n,n″}. SS_r(T) = SS_r(T, F, P) = lim_{n ∈ N} Y_n. For R a discrete valuation ring, SS_r(T) = lim_k SS_r(T/m^kT, P_k). (b) (Burns–Sakamoto–Sano; R self-injective local with finite residue field, A free of finite rank.) SS_r(A, F) = lim_{n ∈ N} ⋂^{r+ν(n)}_R H¹_{F^n}(K, A) with transition maps v_{m,n} = ⋀_{q | m/n} v_q, where v_q : H¹_{F^m}(K, A) → H¹_{/f}(K_q, A) ≅ R, signs chosen so that v_{m′,n} = v_{m,n} ∘ v_{m′,m}. For ε ∈ SS_r(A, F) and i ≥ 0, I_i(ε) = Σ_{ν(n) = i} im(ε_n) ⊆ R, each ε_n being a homomorphism ⋀^{r+ν(n)}H¹_{F^n}(K, A)^* → R. For a local Gorenstein order R and T free over R, SS_r(T, F) = lim_m SS_r(T/p^mT, F) and I_i(ε) = lim_m I_i(ε^{(m)}).

**Hypotheses.**

- as in (a) or (b)

**Construction.**

1. (a): Ψ_{n,m} is contraction against h_{s+1} ∘ loc^tr_{q_{s+1}}, …, h_t ∘ loc^tr_{q_t} tensored with h₁ ∧ ⋯ ∧ h_t ↦ h₁ ∧ ⋯ ∧ h_s; it is independent of the generators h_i and of the ordering (Mazur–Rubin 2016, Proposition A.3).
2. (b): v_{m,n} lands in the bidual of the kernel H¹_{F^n} by ES.6/bidual-functoriality(c).
3. Over a principal artinian ring and at vertices where H¹_{F^n}(K, T) is free the two definitions agree through ξ; the comparison at all vertices is recorded as remaining work.

**Uses that determine the API.**

- Mazur–Rubin 2016, Theorems 6.10, 7.4, 8.6, 8.9: freeness of rank one and the structure of the dual Selmer group
- Burns–Sakamoto–Sano II, Theorems 4.6 and 4.12: I_i(ε) = I_∞(ε)·Fitt^i of the dual Selmer module
- Dasgupta–Kakde, Conjecture 1.5: Rubin–Stark elements are the conjectural source of Stark systems for ℤ_p(1)

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.StarkSystems.stalk` | constructor | Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n (Mazur–Rubin), and ⋂^{r+ν(n)} H¹_{F^n}(K, A) (Burns–Sakamoto–Sano). |
| `TauCeti.StarkSystems.transition` | constructor | Ψ_{n,m} : Y_n → Y_m for m \| n, and v_{m,n} on biduals. |
| `TauCeti.StarkSystems.transition_comp` | functoriality | Ψ_{n′,n″} ∘ Ψ_{n,n′} = Ψ_{n,n″} and Ψ_{n,n} = id. |
| `TauCeti.StarkSystems.StarkSystem` | structure | SS_r = the submodule of ∏_n Y_n of families with Ψ_{n,m}(ε_n) = ε_m. |
| `TauCeti.StarkSystems.StarkSystem.ideal` | data | I_i(ε) = Σ_{ν(n)=i} im(ε_n), an ideal of R; I_∞(ε) = ⋃_i I_i(ε). |
| `TauCeti.StarkSystems.StarkSystem.eval_one` | projection | ε ↦ ε_1 ∈ ⋀^r H¹_F(K, T) (resp. ⋂^r H¹_F(K, A)). |

**Unit tests.**

- `TauCeti.StarkSystems.stalk_one` (degenerate): Y_1 = ⋀^r H¹_F(K, T) ⊗ R, and ⋀^0 W_1 = R.
- `TauCeti.StarkSystems.rank_one_core_vertex` (computation): If H¹_{(F^*)_n}(K, T^*) = 0 and r = χ(T), then H¹_{F^n}(K, T) is free of rank r + ν(n) and Y_n is free of rank one.
- `TauCeti.StarkSystems.transition_one_prime` (computation): For n = q, m = 1, r = 1 and H¹_{F^q} free with basis c₁, c₂: Ψ_{q,1}(c₁ ∧ c₂ ⊗ h) = h(loc^tr_q c₁)c₂ − h(loc^tr_q c₂)c₁ up to the sign convention, an element of H¹_F(K, T).
- `TauCeti.StarkSystems.not_product` (non-example): A family (ε_n) with ε_1 ≠ 0 and ε_q = 0 for a prime q is not a Stark system unless Ψ_{q,1}(0) = ε_1, i.e. it is not one.

**Acceptance.**

- For n = 1: Y_1 = ⋀^r H¹_F(K, T), and ε_1 is the leading term of the Stark system.
- The zero family is a Stark system.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`

**Sources.**

- `mr-higher`, Definition 6.8, p. 14. Stark systems over principal artinian rings. Source excerpt: “SSr (T, F , P) of Stark systems of rank r to be the inverse limit”
- `bss2`, §4.1, p. 19. Stark systems in exterior biduals. Source excerpt: “By definition, a Stark system of rank r (for (A, F)) is an element”
- `bss2`, Definition 4.1, p. 20. The ideals I_i(ε). Source excerpt: “Definition 4.1. Let ǫ = (ǫn )n ∈ SSr (A, F). Then for each non-negative integer i we define”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.

### Freeness of Stark systems and control of the dual Selmer group

`EulerSystemsAndKolyvaginSystems:ES.6/stark-structure` — theorem

**Planet:** Stark systems control Fitting ideals.

**Statement.** (a) (Mazur–Rubin 2016; (H.1)–(H.7), R principal artinian.) SS_r(T) is free of rank one over R, and the image of SS_r(T) → Y_n is Y′_n = m^{length H¹_{(F^*)_n}(K, T^*)} Y_n; for R a discrete valuation ring with (H.1)–(H.6), SS_r(T, P) is free of rank one, generated by ε with nonzero image in SS_r(T/mT), and SS_r(T, P) → SS_r(T/m^k, P_k) is surjective. With φ_ε(n) = max{j : ε_n ∈ m^jY_n}, ∂φ_ε(i) = min{φ_ε(n) : ν(n) = i}, ord(ε) = min{ν(n) : ε_n ≠ 0} and d_ε(i) = ∂φ_ε(i) − ∂φ_ε(i + 1): for R a discrete valuation ring and ε ≠ 0, corank H¹_{F^*}(K, T^*) = ord(ε), H¹_{F^*}(K, T^*)/div ≅ ⊕_{i ≥ ord ε} R/m^{d_ε(i)}, ε is primitive iff ∂φ_ε(∞) = 0, and length H¹_{F^*}(K, T^*) ≤ ∂φ_ε(0) = max{s : ε_1 ∈ m^s ⋀^r H¹_F(K, T)} with equality iff ε is primitive. (b) (Burns–Sakamoto–Sano; Hypothesis 4.2.) For n with H¹_{(F^*)_n}(K, A^*(1)) = 0, SS_r(A, F) → ⋂^{r+ν(n)}H¹_{F^n}(K, A) is bijective, so SS_r(A, F) is free of rank one; for all ε and i: I_i(ε) ⊆ I_{i+1}(ε), I_∞(ε) = R iff ε is a basis, and I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, A^*(1))^*). For a local Gorenstein order under Hypothesis 4.7 and Hypothesis 4.2 of fixed rank r for (T/p^mT,F,P_m) at every m≥1, SS_r(T, F) is free of rank one with I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, T^∨(1))^∨). The regulator and the ideals commute with the admissible scalar reductions R → R/(p^m) and R → S of bidual-functoriality(f).

**Hypotheses.**

- (H.1)–(H.7) of ES.0/hypotheses-mr2016 for (a)
- Hypothesis 4.2 (finite level) and 4.7 plus 4.2 for every T/p^mT with the same r (orders) of ES.6/bss-hypotheses for (b)

**Proof outline.**

1. (a): Y_n is free of rank one when H¹_{(F^*)_n} = 0 (Corollary 3.5), such n exist and are cofinal (ES.1/chebotarev-nonvanishing), and Ψ_{n,m}(Y_n) = Y′_m (Lemma 6.9); the structure theorem follows from ∂μ(t) = Σ_{i>t} e_i for H¹_{F^*} ≅ ⊕R/m^{e_i}.
2. (b): Theorem 4.6, combining Burns–Sano and Sakamoto; Fitting ideals of the dual Selmer module are generated by the images of Stark systems at vertices with i primes (Corollary 4.5) by bidual-functoriality(b).

**Acceptance.**

- For r = 1 and R a discrete valuation ring this recovers ES.5/structure-theorem through the regulator isomorphism.
- Over a non-domain order the statement is an equality of ideals, not a valuation formula.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`
- `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `mr-higher`, Theorem 6.10, p. 15. Freeness over principal artinian rings. Source excerpt: “Then the R-module SSr (T ) is free of rank one, and for every n ∈ N , the image of”
- `mr-higher`, Theorem 8.9, p. 19. The structure theorem. Source excerpt: “Theorem 8.9. Suppose R is a discrete valuation ring, ǫ ∈ SSr (T ) and ǫ 6= 0.”
- `bss2`, Theorem 4.6, p. 21. Freeness and Fitting ideals over self-injective rings. Source excerpt: “is bijective. In particular, the R-module SSr (A, F) is free of rank one.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.

### The Burns–Sakamoto–Sano hypotheses

`EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses` — definition

**Statement.** Let (R, 𝔭) be a self-injective local ring with finite residue field k of characteristic p, A a free R-module of finite rank with continuous G_K-action, M = min{p^n : p^nR = 0}, K_M = K(μ_M, (O_K^×)^{1/M})K(1) and K(A)_M = K(A)K_M. Hypothesis 3.2: (i) A ⊗ k is an irreducible k[G_K]-module; (ii) there is τ ∈ G_{K_M} with A/(τ − 1)A ≅ R; (iii) H¹(K(A)_M/K, A) = H¹(K(A)_M/K, A^*(1)) = 0. Hypothesis 3.3: (A ⊗ k)^{G_K} = ((A ⊗ k)^*(1))^{G_K} = 0. The prime set P is the set of q ∉ S with Fr_q conjugate to τ in Gal(K(A)_M/K). Hypothesis 4.2: there is n ∈ N with H¹_{(F^*)_n}(K, A^*(1)) = 0 and H¹_{F^n}(K, A) free of rank r + ν(n). For a local Gorenstein O-order R and T free over R with T̄ = T/𝔭T, Hypothesis 4.7: (i) T̄ is an irreducible (R/𝔭)[G_K]-module; (ii) there is τ ∈ G_{K_{p^∞}}, K_{p^∞} = ⋃_m K_{p^m}, with T/(τ − 1)T ≅ R (the source prints G_{K(T)_{p^∞}}, a misprint recorded as source issue E1); (iii) H¹(K(T)_{p^∞}/K, T̄) = H¹(K(T)_{p^∞}/K, T̄^∨(1)) = 0. Hypothesis 4.7 implies 3.2 and 3.3 for every T/p^mT. These are properties of (T, F), proved in each application; they do not follow from R being Gorenstein. The structure theorems for Kolyvagin systems additionally require p > 3.

**Hypotheses.**

- R self-injective local, or a local Gorenstein order

**Construction.**

1. Each item is a separate field. Hypothesis 4.2 replaces the cartesian condition and the core rank: it asserts the existence of a relaxed core vertex of the expected free rank.
2. Remark 4.3: under 4.2, H¹_{F^m}(K, A) is free of rank r + ν(m) at every m with H¹_{(F^*)_m} = 0. Remark 4.9: 4.7 ⇒ 3.2, 3.3 modulo p^m.
3. For R principal artinian, Hypotheses 3.2 and 3.3 follow from Mazur–Rubin's (H.1)–(H.3), and 4.2 from (H.5)–(H.6) by Corollary 3.5(ii) of Mazur–Rubin 2016.

**Uses that determine the API.**

- Burns–Sakamoto–Sano II, Theorems 4.6, 4.12, 5.2, 5.25: the standing hypotheses of the Gorenstein theory
- ES.7/fitting-bounds: the hypotheses for A_F = Ind(T/MT) over R[Gal(F/K)]

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.StarkSystems.BSSHypothesis32` | structure | Fields irreducible, tau, h1Vanishing. |
| `TauCeti.StarkSystems.BSSHypothesis33` | structure | Vanishing of the residual invariants of A and A^*(1). |
| `TauCeti.StarkSystems.BSSHypothesis42` | structure | A vertex n with vanishing strict dual Selmer module and H¹_{F^n} free of rank r + ν(n). |
| `TauCeti.StarkSystems.BSSHypothesis47` | structure | The three conditions for a Gorenstein order. |
| `TauCeti.StarkSystems.BSSHypothesis47.toFiniteLevel` | functoriality | Hypothesis 4.7 for T gives 3.2 and 3.3 for T/p^mT for every m ≥ 1. |
| `TauCeti.StarkSystems.BSSHypothesis42.free_of_core` | characterisation | Under 4.2, H¹_{F^m}(K, A) is free of rank r + ν(m) whenever H¹_{(F^*)_m}(K, A^*(1)) = 0. |

**Unit tests.**

- `TauCeti.StarkSystems.bss32_of_mr16` (compatibility): For R principal artinian, (H.1)–(H.3) of ES.0/hypotheses-mr2016 give Hypotheses 3.2 and 3.3 with the same τ.
- `TauCeti.StarkSystems.bss42_rank_one_field` (computation): For R = k and χ(A) = r: any core vertex n has dim H¹_{F^n}(K, A) = r + ν(n), so 4.2 holds.
- `TauCeti.StarkSystems.not_bss33_trivial` (non-example): A = R with trivial action: (A ⊗ k)^{G_K} = k ≠ 0, so Hypothesis 3.3 fails for every self-injective R.
- `TauCeti.StarkSystems.bss47_rank_one` (degenerate): If rank_R T = 1 then 4.7(i) holds and 4.7(ii) holds with τ = 1.

**Acceptance.**

- Satisfied by A = (ℤ/p^m)(1) ⊗ χ^{-1} ⊗ ℤ_p[Gal(F/K)] under the hypotheses of Theorem 7.1.
- Not implied by the ring-theoretic hypotheses: for A with trivial residual representation 3.3 fails over every R.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `bss2`, Hypothesis 3.2, p. 13. The finite-level hypotheses. Source excerpt: “(ii) there exists τ ∈ GKM such that A/(τ − 1)A ≃ R as R-modules;”
- `bss2`, Hypothesis 4.2, p. 20. Existence of a relaxed core vertex. Source excerpt: “Hypothesis 4.2. There exists an ideal n in N such that”
- `bss2`, Hypothesis 4.7, p. 22. The hypotheses over a Gorenstein order. Source excerpt: “(i) T is an irreducible (R/p)[GK ]-module;”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.

### Kolyvagin systems of rank r and the regulator map

`EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r` — definition

**Statement.** (a) (Mazur–Rubin 2016.) The rank-r Selmer sheaf on X(P) has stalks S(n) = ⋀^r H¹_{F(n)}(K, T/I_nT) ⊗ G_n, edge modules S(e) = H¹_tr(K_q, T/I_{nq}T) ⊗ ⋀^{r−1}H¹_{F_q(n)}(K, T/I_{nq}T) ⊗ G_{nq} for e = {n, nq}, and vertex-to-edge maps the contractions against loc^f_q (finite projection followed by φ^fs_q) from n and against loc^tr_q from nq. KS_r(T, F, P) = Γ(S); for r = 1 this is ES.3/kolyvagin-system-module. The stub subsheaf has S′(n) = m^{λ(n)}S(n), λ(n) = length H¹_{F(n)^*}(K, T^*), and KS′_r(T) = Γ(S′). (b) (Burns–Sakamoto–Sano.) KS_r(A, F) is the module of families κ_n ∈ ⋂^r_R H¹_{F(n)}(K, A) ⊗ G_n with v_q(κ_n) = φ^fs_q(κ_{n/q}) in ⋂^{r−1}_R H¹_{F_q(n/q)}(K, A) ⊗ G_n for q | n; with generators of the G_q fixed, I_i(κ) = Σ_{ν(n)=i} im(κ_n). For a Gorenstein order, KS_r(T, F) = lim_m KS_r(T/p^mT, F). (c) The regulator: Reg_r : SS_r(A, F) → KS_r(A, F), ε ↦ (⋀_{q | n} φ^fs_q (ε_n))_n; in Mazur–Rubin's setting Π : SS_r(T) → KS′_r(T), ε ↦ ((−1)^{ν(n)}Π_n(ε_n))_n.

**Hypotheses.**

- as in ES.6/stark-systems

**Construction.**

1. The edge compatibility of Reg_r(ε): v_q(⋀_{q′ | n} φ^fs_{q′}(ε_n)) = φ^fs_q(⋀_{q′ | n/q} φ^fs_{q′}(v_q ε_n)) = φ^fs_q(κ(ε_{n/q})), using the Stark relation v_q(ε_n) = ε_{n/q}.
2. The contraction maps are those of ES.6/exterior-bidual; the sign (−1)^{ν(n)} in Π fixes the ordering conventions.

**Uses that determine the API.**

- Mazur–Rubin 2016, Theorems 11.7, 12.4, 13.4: stub Kolyvagin systems are free of rank one and isomorphic to Stark systems
- Burns–Sakamoto–Sano II, Theorems 5.2 and 6.12: the regulator is an isomorphism for p > 3, and higher Kolyvagin derivatives land in KS_r

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.StarkSystems.KolyvaginSystemRank` | structure | KS_r(T, F, P) = Γ of the rank-r Selmer sheaf; KS_r(A, F) in biduals. |
| `TauCeti.StarkSystems.KolyvaginSystemRank.rank_one_equiv` | equivalence | KS_1(T, F, P) ≃ KS(T, F, P). |
| `TauCeti.StarkSystems.KolyvaginSystemRank.stub` | constructor | KS′_r(T) ≤ KS_r(T), sections of the stub subsheaf. |
| `TauCeti.StarkSystems.regulator` | constructor | Reg_r : SS_r → KS_r, R-linear. |
| `TauCeti.StarkSystems.regulator_eval_one` | simp | Reg_r(ε)_1 = ε_1. |
| `TauCeti.StarkSystems.KolyvaginSystemRank.ideal` | data | I_i(κ) = Σ_{ν(n)=i} im(κ_n). |

**Unit tests.**

- `TauCeti.StarkSystems.regulator_zero` (degenerate): Reg_r(0) = 0.
- `TauCeti.StarkSystems.kolyvaginSystemRank_one` (compatibility): For r = 1 the edge module is H¹_tr(K_q, T/I_{nq}T) ⊗ G_{nq} ≅ H¹_s ⊗ G_{nq} and the relation is (5) of Mazur–Rubin 2004.
- `TauCeti.StarkSystems.regulator_one_prime` (computation): For n = q: Reg_r(ε)_q = φ^fs_q(ε_q) ∈ ⋂^r H¹_{F(q)}(K, A) ⊗ G_q, and v_q(Reg_r(ε)_q) = φ^fs_q(ε_1).
- `TauCeti.StarkSystems.stub_ne_all` (non-example): For χ(T)>1 over a field, the rank-one module KS_1(T) is infinite-dimensional whereas the stub module KS′_χ(T)(T) is one-dimensional. They concern different exterior ranks; this is a comparison of two modules, not a claim that the latter is a proper submodule of the former. A same-rank strict-inclusion non-example needs a separate calculation.

**Acceptance.**

- For r = 1: KS_1 = KS and Reg_1(ε)_1 = ε_1.
- Reg_r commutes with R → R/(p^m) and with restriction of P.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`
- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`

**Sources.**

- `mr-higher`, Definition 10.4, p. 21. Kolyvagin systems of rank r. Source excerpt: “tem of rank r for T , if F and P are fixed) is a global section of the Selmer sheaf S.”
- `bss2`, §5.2, p. 25. The regulator map. Source excerpt: “The regulator map is defined by setting Regr (ǫ) := (κ(ǫn ))n .”
- `mr-higher`, Proposition 12.3, p. 24. The map Π. Source excerpt: “Proposition 12.3. Suppose ǫ = {ǫn : n ∈ N } is a Stark system of rank r for T .”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.

### The regulator isomorphism and structure of Kolyvagin systems of rank r

`EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism` — theorem

**Planet:** Regulator isomorphism.

**Statement.** (a) (Mazur–Rubin 2016; (H.1)–(H.7), R principal artinian.) There are core vertices; any two are joined by a path through core vertices along which all vertex-to-edge maps are isomorphisms; S′ is locally cyclic with every core vertex a hub and trivial monodromy; KS′_r(T) is free of rank one and κ ↦ κ_n is an isomorphism onto S′(n) at core vertices; Π : SS_r(T) → KS′_r(T) is an isomorphism. For R a discrete valuation ring ((H.1)–(H.6)), KS′_r(T, P) ≅ lim_k KS′_r(T/m^k, P_k) is free of rank one, and for 0 ≠ κ ∈ KS′_r(T) the conclusions of ES.6/stark-structure(a) hold with ε replaced by κ; in particular length H¹_{F^*}(K, T^*) ≤ max{s : κ_1 ∈ m^s ⋀^r H¹_F(K, T)}, with equality iff κ is primitive. (b) (Burns–Sakamoto–Sano; Hypotheses 3.2, 3.3, 4.2 and p > 3.) Reg_r : SS_r(A, F) → KS_r(A, F) is an isomorphism, so KS_r(A, F) is free of rank one; for κ ∈ KS_r(A, F) and n ∈ N, im(κ_n) ⊆ Fitt⁰_R(H¹_{F(n)^*}(K, A^*(1))^*), with equality if κ is a basis; and I_i(κ) ⊆ Fitt^i_R(H¹_{F^*}(K, A^*(1))^*), with equality if R is a principal ideal ring and κ is a basis. The same holds over a local Gorenstein order under Hypothesis 4.7, Hypothesis 4.2 of fixed rank r for every (T/p^mT,F,P_m), and p > 3 for KS_r(T, F) and H¹_{F^*}(K, T^∨(1))^∨. The restriction p > 3 is part of the statements for Kolyvagin systems; it is not needed for Stark systems.

**Hypotheses.**

- as stated; p > 3 in (b)

**Proof outline.**

1. (a): Theorem 11.6 (proved in §14 by the Chebotarev lemmas) and ES.4/sheaf-monodromy; Π is surjective onto each S′(n) (Lemma 12.2) between free modules of rank one.
2. (b): Theorem 5.2 — connectivity of the core graph X⁰ (Theorem 5.18, where p > 3 is used to find a common prime for two pairs of classes via Lemma 3.9 with s + t < p) and the computation of im(κ_n) at core vertices (Theorem 5.20); pass to the limit for orders (Theorem 5.25).

**Acceptance.**

- For r = 1 over a discrete valuation ring: KS(T) free of rank one, as in ES.5/rank-one-module-theorem.
- Over a non-principal Gorenstein ring only the inclusion I_i(κ) ⊆ Fitt^i is asserted for i > 0.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r`
- `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`
- `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `mr-higher`, Theorem 12.4, p. 25. Stark systems and stub Kolyvagin systems. Source excerpt: “map Π : SSr (T ) → KS′r (T ) of Proposition 12.3 is an isomorphism.”
- `bss2`, Theorem 5.2, pp. 25–26. The regulator isomorphism and Fitting bounds. Source excerpt: “Theorem 5.2. Assume Hypotheses 3.2, 3.3 and 4.2, and also suppose p > 3.”
- `bss2`, Theorem 5.25, p. 36. The statement over a Gorenstein order. Source excerpt: “Theorem 5.25. Suppose that p > 3.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.

### T-modified S-units, the order map and Rubin's lattice

`EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice` — definition

**Statement.** Let H/F be a finite abelian extension of number fields with group G, S ⊇ S_∞ ∪ S_ram and T finite sets of places with S ∩ T = ∅ and the T-modified units torsion-free, and v₁, …, v_r finite primes of F splitting completely in H with chosen primes w_j of H above v_j. In the normalisation of Dasgupta–Kakde §1.2, U_{S,T} = {u ∈ H_T^* : |u|_w = 1 for all finite primes w not above the v_j}, where H_T^* is the group of elements congruent to 1 modulo every prime above T, and ℚU_{S,T} = U_{S,T} ⊗ ℚ. The order map ord_G : ⋀^r_{ℚ[G]} ℚU_{S,T}^− → ℚ[G]^− is the ℚ[G]-linear map with ord_G(u₁ ∧ ⋯ ∧ u_r) = det(Σ_{σ ∈ G} [σ^{-1}] ord_{w_j}(σ(u_i)))_{i,j}; it is an isomorphism of ℚ[G]-modules. Rubin's lattice is 𝓛 = (⋀^r_{ℚ[G]} ℚU_{S,T}^−) ∩ ⋂^r_{ℤ[G]} U_{S,T}, where ⋂^r_{ℤ[G]} U_{S,T} is the set of u ∈ ⋀^r_{ℚ[G]} ℚU_{S,T} with φ(u) ∈ ℤ[G] for all φ₁, …, φ_r ∈ Hom_{ℤ[G]}(U_{S,T}, ℤ[G]), φ(u₁ ∧ ⋯ ∧ u_r) = det(φ_i(u_j)).

**Hypotheses.**

- H/F abelian with H a CM field and F totally real for the minus parts
- the v_j split completely in H

**Construction.**

1. ord_G is the determinant of the ℚ[G]-linear maps u ↦ Σ_σ [σ^{-1}] ord_{w_j}(σu); on minus parts the unit group of H contributes nothing, so ℚU_{S,T}^− is free of rank r over ℚ[G]^− on a basis dual to the w_j, which gives the isomorphism.
2. The bidual description is ES.6/exterior-bidual (equivLattice) for R = ℤ[G] and X = U_{S,T}.

**Uses that determine the API.**

- Dasgupta–Kakde, Conjecture 1.5 and Theorem 1.6: u_RBS ∈ 𝓛 is Rubin's conjecture, proved away from 2
- IntegralIwasawaTheory I.7: imports these definitions for the proof of Theorem 1.6
- ES.7/rubin-brumer-stark: the element whose integrality is conjectured

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.RubinStark.modifiedUnits` | constructor | U_{S,T} as a ℤ[G]-module. |
| `TauCeti.RubinStark.ordG` | constructor | ord_G : ⋀^r_{ℚ[G]} ℚU_{S,T}^− → ℚ[G]^−. |
| `TauCeti.RubinStark.ordG_ιMulti` | simp | ord_G(u₁ ∧ ⋯ ∧ u_r) = det(Σ_σ [σ^{-1}]·ord_{w_j}(σ u_i)). |
| `TauCeti.RubinStark.ordG_bijective` | characterisation | ord_G is an isomorphism of ℚ[G]-modules. |
| `TauCeti.RubinStark.rubinLattice` | constructor | 𝓛 = (⋀^r ℚU^−) ⊓ ⋂^r_{ℤ[G]} U_{S,T}. |
| `TauCeti.RubinStark.rubinLattice_rank_one` | example | For r = 1, 𝓛 = U_{S,T}^−. |

**Unit tests.**

- `TauCeti.RubinStark.ordG_change_w` (characterisation): Replacing w_j by g·w_j multiplies ord_G by [g]^{±1} ∈ G (a unit of ℚ[G]); so 𝓛-membership statements do not depend on the w_j.
- `TauCeti.RubinStark.rubinLattice_trivial_group` (degenerate): For G = 1: ⋂^r_ℤ U = ⋀^r_ℤ U for U free, and 𝓛 = ⋀^r_ℤ U^−.
- `TauCeti.RubinStark.rubinLattice_ne_exteriorPower` (non-example): Algebraic minus-part test: let G=C₂=⟨σ⟩ act by −1 on X=ℤ². Then Hom_{ℤ[G]}(X,ℤ[G]) has values in ℤ(1−σ), and (1−σ)²=2(1−σ). Thus the determinant-integrality lattice in ⋀²_{ℚ[G]}ℚX is (1/2)⋀²_ℤX, strictly larger than the exterior-power image. This tests the minus-part normalization without claiming X is a specific arithmetic unit lattice.

**Acceptance.**

- For r = 1, 𝓛 = U_{S,T}^− (U_{S,T} is reflexive), and membership of the element is the Brumer–Stark statement.
- For r ≥ 2 the lattice 𝓛 is in general strictly larger than the image of ⋀^r_{ℤ[G]} U_{S,T}^−.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`

**Sources.**

- `dk`, §1.2, (8)–(10), p. 8. The unit group and the order map. Source excerpt: “Choose a prime wj of H above each vj . The map”
- `dk`, §1.2, p. 8. Rubin's lattice. Source excerpt: “Rubin conjectured that uRBS lies in a certain Z[G]-lattice that is nowadays called “Rubin’s”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinStark`, namespace `TauCeti.RubinStark`. Implementation status: `unchecked`.

## ES.7. Higher-rank derivatives and Fitting-ideal control

Euler systems of rank `r` in exterior biduals, the higher Kolyvagin derivative, the resulting Fitting-ideal bounds, the rank-one comparison with ES.3, and the Rubin–Brumer–Stark element with Rubin's conjecture stated as a proposition. Depends on ES.6 and ES.3.

**Planets of this layer:** Higher-rank Euler system; Higher Kolyvagin derivative; Fitting-ideal control; Rubin–Brumer–Stark element.

### Euler systems of rank r

`EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems` — definition

**Planet:** Higher-rank Euler system.

**Statement.** Let R be a semilocal Gorenstein O-order in a finite-dimensional semisimple commutative algebra over a finite extension of ℚ_p, T a free R-module of finite rank with continuous R-linear G_K-action, S ⊇ S_∞ ∪ S_p ∪ S_ram(T) finite, P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) for q ∉ S, 𝒦/K an abelian pro-p extension in which all archimedean places split completely, Ω(𝒦/K) the set of finite subextensions, S(F) = S ∪ S_ram(F/K) and 𝒢_F = Gal(F/K). Hypothesis 6.1: (i) H¹(O_{F,S(F)}, T) is a reflexive R[𝒢_F]-module for every F (equivalently free over O); (ii) H⁰(F, T) = 0 for every F. An Euler system of rank r for (T, 𝒦) is a family c_F ∈ ⋂^r_{R[𝒢_F]} H¹(O_{F,S(F)}, T), F ∈ Ω(𝒦/K), with Cor_{F′/F}(c_{F′}) = (∏_{q ∈ S(F′)∖S(F)} P_q(Fr_q^{-1})) c_F in ⋂^r_{R[𝒢_F]} H¹(O_{F,S(F′)}, T) for F ⊆ F′. ES_r(T, 𝒦) is the R[[Gal(𝒦/K)]]-module of such families. Hypothesis 6.7: 𝒦 contains K(q) for every q ∉ S and a ℤ_p^d-extension of K in which no finite place splits completely. For r = 1 on the common towers satisfying Hypothesis 6.7, under Hypothesis 6.1(i) and the universal-norm/unramified comparison, ⋂^1 H¹ = H¹ and ES_1(T, 𝒦) is ES.2/euler-system-module with coefficients R.

**Hypotheses.**

- R a semilocal Gorenstein order
- Hypothesis 6.1 for the comparison with rank one

**Construction.**

1. Cor on biduals is induced by corestriction H¹(O_{F′,S(F′)}, T) → H¹(O_{F,S(F′)}, T), which is R[𝒢_{F′}]-linear onto an R[𝒢_F]-module; functoriality of ⋂^r (ES.6/exterior-bidual, map) and change of group ring.
2. Reflexivity fails for torsion unit examples (T = ℤ_p(1) with μ_p ⊆ F); then a T-modified cohomology is used, with its own comparison (Remark 6.3). This packet states the theory under Hypothesis 6.1.

**Uses that determine the API.**

- Burns–Sakamoto–Sano II, Theorem 6.12: the source of higher Kolyvagin derivatives
- Burns–Sakamoto–Sano II, Theorem 7.1; Dasgupta–Kakde §1.2: Rubin–Stark elements conjecturally form an Euler system of rank r for ℤ_p(1) ⊗ χ^{-1}

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.HigherEulerSystem` | structure | ES_r(T, 𝒦) ≤ ∏_F ⋂^r_{R[𝒢_F]} H¹(O_{F,S(F)}, T), cut out by the corestriction relations. |
| `TauCeti.EulerSystems.HigherEulerSystem.eval` | projection | c ↦ c_F. |
| `TauCeti.EulerSystems.HigherEulerSystem.rank_one_equiv` | equivalence | On common towers satisfying 6.7, under 6.1 and the universal-norm/unramified comparison, ES_1(T,𝒦)≃ES(T,𝒦,N), with N containing the finite primes of S. The comparison includes the transport from S(F)-ramified cohomology to global H¹ and the coefficient/Euler-polynomial dictionaries. |
| `TauCeti.EulerSystems.BSSHypothesis61` | structure | Reflexivity of H¹(O_{F,S(F)}, T) over R[𝒢_F] and H⁰(F, T) = 0, for all F. |
| `TauCeti.EulerSystems.BSSHypothesis61.iff_free` | characterisation | 6.1(i) holds iff every H¹(O_{F,S(F)}, T) is free over O. |
| `TauCeti.EulerSystems.HigherEulerSystem.cor_eval` | relation | Cor_{F′/F}(c_{F′}) = (∏_{q ∈ S(F′)∖S(F)} P_q(Fr_q^{-1}))·c_F. |

**Unit tests.**

- `TauCeti.EulerSystems.HigherEulerSystem.zero_mem` (degenerate): The zero family is in ES_r(T, 𝒦).
- `TauCeti.EulerSystems.HigherEulerSystem.rank_one` (compatibility): For r = 1, R = O and Hypothesis 6.1: the relation is Rubin's, with P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) = P(Fr_q^{-1} | T^*; x) in Rubin's notation.
- `TauCeti.EulerSystems.not_BSSHypothesis61_mu_p` (non-example): For T = ℤ_p(1) and F ⊇ μ_p, H¹(O_{F,S(F)}, T) ⊇ μ_{p^∞}(F) has torsion, so Hypothesis 6.1(i) fails: reflexivity is not automatic.

**Acceptance.**

- For R = O = ℤ_p, T = ℤ_p(1): Hypothesis 6.1(i) says the p-completion of O_{F,S(F)}^× is torsion-free for all F.
- The zero family is an Euler system of rank r.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `bss2`, Definition 6.4, p. 37. The definition. Source excerpt: “is said to be an Euler system of rank r for (T, K) if”
- `bss2`, Hypothesis 6.1, p. 37. Reflexivity and vanishing of invariants. Source excerpt: “(ii) H 0 (F, T ) = 0 for every F ∈ Ω(K/K).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/HigherRank`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### The higher Kolyvagin derivative

`EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative` — construction

**Planet:** Higher Kolyvagin derivative.

**Statement.** Assume Hypotheses 6.1, 6.7 and 6.11 (Fr_q^{p^k} − 1 is injective on T for every q ∈ P and k ≥ 0). Fix a power M of p, a field E ∈ Ω(𝒦/K) unramified outside S with K(1) ⊆ E, and put R̄ = R/(M), ℛ = R̄[Gal(E/K)], A = Ind_{G_E}^{G_K}(T/MT), a free ℛ-module. For n ∈ N let E(n) = E·K(n), H_n = Gal(E(n)/E), B=T/MT (uninduced), c_n=c_{E(n)}, and c̄_n its image in ⋂^r_{R̄[Gal(E(n)/K)]} H¹(O_{E(n),S_n},B). The reduction is the map (9) of §6.3. The full Galois group ring is used; no splitting Gal(E(n)/K)≃Gal(E/K)×H_n is assumed. H_n-invariant descent identifies the resulting class with ⋂^r_ℛ H¹(O_{E,S_n},B), then with ⋂^r_ℛ H¹(O_{K,S_n},A) by Shapiro. Then D_n·c̄_n is H_n-invariant and defines the Kolyvagin derivative κ′(c_n) = D_n·c̄_n ∈ ⋂^r_ℛ H¹(O_{K,S_n}, A). With 𝓘_n the augmentation ideal of ℤ[H_n] and G_n ≅ ⟨∏_{q | n}(σ_q − 1)⟩ ⊆ 𝓘_n^{ν(n)}/𝓘_n^{ν(n)+1}, write P_q^m for the image of P_q(Fr_q^{-1}) in R̄⊗𝓘_m/𝓘_m² when q∤m. For m=q₁⋯q_t define Δ_m=det(B_m), where (B_m)_{ij}=0 if i=j and P_{q_j}^{q_i} otherwise; put Δ_1=1 (empty determinant) and Δ_q=0. Define κ(c)_n=Σ_{d|n}(κ′(c_d)⊗∏_{q|d}(σ_q−1))Δ_{n/d}, transporting κ′(c_d) to S_n and multiplying the disjoint augmentation factors. This is the explicit correction formula of §6.4, p.41; and Theorem: κ(c)_n ∈ ⋂^r_ℛ H¹_{F_can(n)}(K, A) ⊗ ⟨∏_{q | n}(σ_q − 1)⟩ and v_q(κ(c)_n) = φ^fs_q(κ(c)_{n/q}) for every q | n; so κ(c) ∈ KS_r(A, F_can). For a subfield F of E/K and A_F = Ind_{G_F}^{G_K}(T/MT) this gives the canonical homomorphism D_r = D_r^F : ES_r(T, 𝒦) → KS_r(A_F, F_can), independent of E and of the generators σ_q, with D_r(c)_1 = c_F (mod M).

**Hypotheses.**

- Hypotheses 6.1, 6.7, 6.11
- M a power of p

**Construction.**

1. Invariance: (σ_q − 1)D_q = |G_q| − N_{G_q} (ES.3/derivative-operators) and the Euler system relation, as in ES.3/derivative-invariance, now in the bidual (Lemma 6.9); descent to K uses Hypothesis 6.1 (Proposition 6.10): reflexivity and H⁰ = 0 identify invariants of the bidual with the bidual over the base.
2. Local properties and the correction: reduce to rank one by the rank-reduction formalism (ES.6/bidual-functoriality(d)) applied to Φ ∈ ⋀^{r−1}, then use ES.3/derivative-local-properties and the correction of ES.3/euler-to-kolyvagin (Mazur–Rubin Appendix A), whose hypothesis (b) is Hypothesis 6.11.
3. Independence of generators: the class is recorded in the tensor factor ⟨∏(σ_q − 1)⟩ ≅ G_n.

**Uses that determine the API.**

- Burns–Sakamoto–Sano II, Corollaries 6.15, 6.17, 6.18: Fitting-ideal bounds for Selmer modules from higher-rank Euler systems
- ES.3/euler-to-kolyvagin: the rank-one map over a number field K

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.rawHigherDerivative` | constructor | κ′(c_n) = D_n·c̄_n ∈ ⋂^r_ℛ H¹(O_{K,S_n}, A). |
| `TauCeti.EulerSystems.higherDerivative` | constructor | D_r^F : ES_r(T, 𝒦) → KS_r(A_F, F_can). |
| `TauCeti.EulerSystems.higherDerivative_one` | characterisation | D_r(c)_1 = c_F modulo M, under ⋂^r_{R[𝒢_F]} H¹(O_{F,S}, T/M) ≅ ⋂^r_{R̄[𝒢_F]} H¹(O_{K,S}, A_F). |
| `TauCeti.EulerSystems.higherDerivative_singular` | relation | v_q(D_r(c)_n) = φ^fs_q(D_r(c)_{n/q}) for q \| n. |
| `TauCeti.EulerSystems.higherDerivative_indep` | compatibility | D_r^F does not depend on the auxiliary field E nor on the generators σ_q. |
| `TauCeti.EulerSystems.higherDerivative_rank_one` | compatibility | For r = 1 and K = ℚ the map agrees with eulerToKolyvagin modulo M after the Euler-factor dictionary. |

**Unit tests.**

- `TauCeti.EulerSystems.higherDerivative_zero` (degenerate): D_r(0) = 0.
- `TauCeti.EulerSystems.rawHigherDerivative_one` (computation): For n = 1: κ′(c_1) = c̄_E, the image of c_E.
- `TauCeti.EulerSystems.higherDerivative_needs_611` (non-example): For T=O with trivial action, Fr_q−1=0 is not injective and 6.11 fails (6.1(ii) also fails). The determinant expression still exists as an expression in the raw classes; Theorem 6.12 cannot be invoked to prove the local Kolyvagin relations. In particular its zero expression is well-defined.
- `TauCeti.EulerSystems.higherDerivative_one_prime` (computation): For n = q: κ(c)_q = κ′(c_q) ⊗ (σ_q − 1), with singular part φ^fs_q(c_F mod M) at q.
- `TauCeti.EulerSystems.higherDerivative_two_primes` (computation): For n=q₁q₂, Δ_n=−P_{q₂}^{q₁}P_{q₁}^{q₂} and Δ_{q_i}=0. Hence κ(c)_n=κ′(c_n)⊗(σ_{q₁}−1)(σ_{q₂}−1)−κ′(c_1)⊗P_{q₂}^{q₁}P_{q₁}^{q₂}. This detects both the sign and the missing rank-r correction.

**Acceptance.**

- For r = 1, K = ℚ, R = O, E = ℚ: D_1 is the map of ES.3/euler-to-kolyvagin reduced modulo M, after the dictionary P_q(Fr_q^{-1}) between the conventions (ES.2/euler-factor-change).
- D_r is R[[Gal(𝒦/K)]]-semilinear through Gal(𝒦/K) → Gal(F/K).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`
- `EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r`
- `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change`

**Sources.**

- `bss2`, Theorem 6.12, p. 41. The derivative classes form a Kolyvagin system of rank r. Source excerpt: “Theorem 6.12. Let r be a positive integer and c ∈ ESr (T, K). Let F := Fcan be the”
- `bss2`, Corollary 6.13, p. 42. The homomorphism D_r. Source excerpt: “‘higher Kolyvagin derivative’ homomorphism”
- `bss2`, Proposition 6.10, p. 40. The uncorrected derivative. Source excerpt: “The element κ′ (cn ) is called a Kolyvagin derivative.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/HigherRank`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### Fitting-ideal control from higher-rank Euler systems

`EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds` — theorem

**Planet:** Fitting-ideal control.

**Statement.** Let p > 3, r ≥ 1, c ∈ ES_r(T, 𝒦), F = F_can, F a subfield of E/K and A_F = Ind_{G_F}^{G_K}(T/MT). Assume Hypotheses 6.1, 6.7, 6.11 and Hypotheses 3.2, 3.3, 4.2 for A_F and F_can, and let κ(c) = D_r^F(c). Then (i) for n ∈ N, im(κ(c)_n) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F(n)^*}(K, A_F^*(1))^*); in particular im(c_F) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*); (ii) for every i ≥ 0, I_i(κ(c)) ⊆ Fitt^i_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*). In (i), equality holds whenever κ(c) is a basis of KS_r, without a principal-ring assumption. For the higher I_i in (ii), equality for a basis is asserted when R̄[𝒢_F] is a principal ideal ring. These are containments of ideals of the group ring R̄[𝒢_F], which is not a domain: they are not valuation formulas and do not reduce to orders of underlying groups.

**Hypotheses.**

- p > 3
- Hypotheses 6.1, 6.7, 6.11; 3.2, 3.3, 4.2 for A_F

**Proof outline.**

1. Apply ES.6/regulator-isomorphism(b) to κ(c) ∈ KS_r(A_F, F_can), with κ(c)_1 = c_F.

**Acceptance.**

- For the Rubin–Stark setting (Theorem 7.1): im(η^χ_{L/K,S}) ⊆ Fitt⁰_O((ℤ_p ⊗ Cl(O_L))^χ), conditionally on the Rubin–Stark conjecture.
- For r = 1 over a discrete valuation ring this is the bound of ES.4/kolyvagin-bound in Fitting-ideal form.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`
- `EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism`
- `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `bss2`, Corollary 6.15, p. 42. The Fitting-ideal bounds. Source excerpt: “Corollary 6.15. Suppose p > 3. Let r be a positive integer, c ∈ ESr (T, K) and F := Fcan .”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/HigherRank`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

### The Rubin–Brumer–Stark element and Rubin's conjecture

`EulerSystemsAndKolyvaginSystems:ES.7/rubin-brumer-stark` — construction

**Planet:** Rubin–Brumer–Stark element.

**Statement.** In the setting of ES.6/rubin-lattice let Θ_{S,T} ∈ ℚ[G]^− be the Stickelberger element for S ⊇ S_∞ ∪ S_ram and T. The Rubin–Brumer–Stark element is the unique u_RBS ∈ ⋀^r_{ℚ[G]} ℚU_{S,T}^− with ord_G(u_RBS) = Θ_{S,T}. It depends on the choice of the w_j only up to multiplication by an element of G. Rubin's conjecture is the proposition u_RBS ∈ 𝓛; its validity is independent of the w_j. It is stated here as a proposition and is a hypothesis of any application of the higher-rank machinery to these elements: a conjectural Rubin–Stark element is an Euler system of rank r only once its integrality (membership in the bidual lattices) and its norm relations along Ω(𝒦/K) are proved. The prime-to-2 part of the conjecture is a theorem of Dasgupta–Kakde, owned by IntegralIwasawaTheory I.7.

**Hypotheses.**

- as in ES.6/rubin-lattice
- Θ_{S,T} ∈ ℚ[G]^− defined by the partial zeta values at 0

**Construction.**

1. Existence and uniqueness: ord_G is an isomorphism (ES.6/rubin-lattice).
2. Dependence on w_j: replacing w_j by g·w_j multiplies ord_G by a group element.

**Uses that determine the API.**

- Dasgupta–Kakde, Theorem 1.6: u_RBS ∈ 𝓛 ⊗ ℤ[1/2]
- Burns–Sakamoto–Sano II, Theorem 7.1: Rubin–Stark elements as a conditional Euler system of rank r for T_χ

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.RubinStark.rubinBrumerStark` | constructor | u_RBS = ord_G⁻¹(Θ_{S,T}). |
| `TauCeti.RubinStark.ordG_rubinBrumerStark` | simp | ord_G(u_RBS) = Θ_{S,T}. |
| `TauCeti.RubinStark.rubinBrumerStark_change_w` | relation | For another choice of the w_j, u_RBS changes by multiplication by an element of G. |
| `TauCeti.RubinStark.RubinConjecture` | structure | The proposition u_RBS ∈ 𝓛, with no instance provided. |
| `TauCeti.RubinStark.rubinConjecture_indep` | characterisation | RubinConjecture does not depend on the choice of the w_j. |

**Unit tests.**

- `TauCeti.RubinStark.rubinBrumerStark_rank_one` (compatibility): For r = 1, u_RBS is the element of ℚU_{S,T}^− with Σ_σ [σ^{-1}] ord_w(σu) = Θ_{S,T}: the Brumer–Stark unit, and RubinConjecture is u ∈ U_{S,T}.
- `TauCeti.RubinStark.rubinBrumerStark_zero` (degenerate): If Θ_{S,T} = 0 then u_RBS = 0 and RubinConjecture holds trivially.
- `TauCeti.RubinStark.rubinConjecture_not_exteriorPower` (non-example): RubinConjecture is not the statement u_RBS ∈ image of ⋀^r_{ℤ[G]} U_{S,T}^−: exterior-bidual integrality can be weaker when r≥2. Use the explicit minus-part lattice computation of rubin-lattice as an algebraic witness; strictness is not asserted for every arithmetic unit lattice.

**Acceptance.**

- For r = 1: u_RBS is the Brumer–Stark unit and Rubin's conjecture is the Brumer–Stark conjecture.
- Conditional application: Burns–Sakamoto–Sano II, Theorem 7.1(iii) assumes the Rubin–Stark conjecture for LF/K for each F.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`

**Sources.**

- `dk`, §1.2, p. 8. Definition of u_RBS. Source excerpt: “Define the Rubin–Brumer–Stark element”
- `dk`, Conjecture 1.5, p. 8. Rubin's conjecture. Source excerpt: “Conjecture 1.5 (Rubin). We have uRBS ∈ L .”
- `bss2`, Theorem 7.1, p. 49. The conditional application. Source excerpt: “(iii) If the Rubin-Stark Conjecture is valid for LF/K for each F in Ω(K/K), then one”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinStark`, namespace `TauCeti.RubinStark`. Implementation status: `unchecked`.

### Rank-one specialisation of the higher-rank theory

`EulerSystemsAndKolyvaginSystems:ES.7/rank-one-comparison` — comparison

**Statement.** On common admissible towers satisfying 6.7, under Hypothesis 6.1 and the universal-norm/unramified comparison, ES_1(T, 𝒦) is the module of ES.2/euler-system-module with coefficients R, with the dictionary P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) = Rubin's P(Fr_q^{-1} | T^*; x); KS_1(A, F) is ES.3/kolyvagin-system-module for A; D_1 is the map of ES.3/euler-to-kolyvagin modulo M (over ℚ) and supplies that map over a general number field K under Hypotheses 6.1, 6.7 and 6.11; and for R a discrete valuation ring the bound I_0(κ) ⊆ Fitt⁰ is length H¹_{F^*} ≤ ∂^{(0)}(κ) of ES.4/kolyvagin-bound. The conventions differ in two places, both explicit: the Euler factor (ES.2/euler-polynomial) and the identification G_q ≅ ⟨σ_q − 1⟩ ⊆ 𝓘/𝓘² (Mazur–Rubin's ρ_q).

**Hypotheses.**

- Hypotheses 6.1 and 6.7 on a common tower, plus the cohomology/unramified and coefficient dictionaries.
- Hypothesis 6.11 for the derivative comparison; rank-one admissibility and a DVR for the length/Fitting comparison.

**Proof outline.**

1. ⋂^1 = identity on reflexive modules (ES.6/exterior-bidual); compare definitions termwise.
2. The correction terms of Theorem 6.12 for r = 1 are those of Mazur–Rubin's Appendix A, cited by the source.

**Acceptance.**

- For T = ℤ_p(1) ⊗ χ^{-1} over ℚ both constructions give the cyclotomic-unit Kolyvagin system modulo M.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`
- `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound`

**Sources.**

- `bss2`, Remark 6.5, p. 37. Rank-one Euler systems are the classical ones. Source excerpt: “Thus our definition generalizes the classical definition of”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/HigherRank`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.

## ES.8. Rank-one Iwasawa variation and application handoffs

This layer passes rank-one descent to the tower. The two routes below share the completed group
ring, the class c_{K,∞}, index ideals and supplier control results. The Z_p-extension datum in
ES.8a is reusable by ES.8b without assuming that the anticyclotomic tower is admissible.

### ES.8a. Rubin's Iwasawa theory of Euler systems

First fix the tower, Hyp(K∞,T), Hyp(K∞,V), the exceptional Leopoldt hypothesis, X∞ and the
class/index of the Euler system. Twisting, restriction control, finite generation and evaluation
maps feed weak Leopoldt and the Kolyvagin-sequence induction. Iterating the induction gives
the error a_τ^{5r}; setting a_τ = 1 gives the integral bound, while rational large image gives
the bound up to a power of p. Poitou–Tate then relates restricted and true Selmer modules.
The true-Selmer bound has its own singular-local non-torsion and torsion-quotient hypotheses.
Condition (*) states the separate route for towers with completely split primes.

#### Z_p^d-extensions in which no finite prime splits completely

`EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension` — definition

**Statement.** Let K be a number field and p a prime. A Z_p^d-extension of K is an abelian extension K∞/K, inside a fixed algebraic closure K̄, together with the profinite group Γ = Gal(K∞/K) and a topological isomorphism Γ ≅ Z_p^d for some d ≥ 1. It is admissible (Rubin's standing hypothesis of Definition II.1.1(ii) and of Chapter II §3) when no finite prime of K splits completely in K∞/K; equivalently, for every finite prime v of K the decomposition group D_v ⊂ Γ is infinite. The finite subextensions K ⊂_f F ⊂ K∞ form a directed set; for a complete discrete valuation ring O finite over Z_p put Λ_F = O[Gal(F/K)] and Λ = O[[Γ]] = lim_F Λ_F (the completed group ring of PadicMeasuresIwasawaAlgebras L1), with the O-algebra involution ι induced by γ ↦ γ^{-1} (Rubin's η ↦ η^•).

**Hypotheses.**

- d ≥ 1; the trivial extension is excluded.
- Admissibility is a property of K∞/K alone, not of any representation.
- It fails for the anticyclotomic Z_p-extension of an imaginary quadratic field, where every rational prime inert in K splits completely; that tower is handled by Howard's Λ-adic Kolyvagin systems (self-dual-lambda-adic-kolyvagin-bound) or by Rubin's condition (*) (unramified-at-split-primes-condition), never by this definition.

**Construction.**

1. A closed subgroup of Z_p^d is finite only if it is trivial, so a finite prime v splits completely in K∞/K exactly when D_v = 1; this is Rubin's Remark II.1.2.
2. K∞/K is unramified at every finite v ∤ p: by class field theory (Tau Ceti ClassFieldTheory layer 12) the inertia subgroup of Γ at v is the image of the pro-p completion of O_v^×, which is finite for v ∤ p, and Γ is torsion-free.
3. If K∞ contains the cyclotomic Z_p-extension K^cyc, the decomposition group of v in Γ surjects onto that in Gal(K^cyc/K). For v ∤ p the Frobenius of v acts on μ_{p^∞} by Nv ∈ Z_p^×, which is not a root of unity since Nv > 1, so its image in Gal(K^cyc/K) ≅ Z_p is nonzero and generates an infinite subgroup; for v | p the extension K^cyc/K is ramified at v with infinite inertia. Hence K∞/K is admissible (Remark II.1.2).

**Uses that determine the API.**

- Rubin, Definition II.1.1(ii): the field 𝒦 of an Euler system for (T, K∞) contains an admissible K∞, which makes every class c_F a universal norm in the K∞-direction
- Rubin, Chapter II §3 and Chapter VII: fixed throughout the statements and proofs of Theorems II.3.2–II.3.4 and II.3.8
- Rubin, Corollary B.3.5 (SelmerIwasawaCohomology L3, universal-norms-unramified): infinite decomposition groups at v ∤ p make universal norms unramified at v
- EulerSystemsCyclotomicMainConjecture L2: proves the no-completely-split hypothesis for the cyclotomic Z_p-extension of Q before importing Rubin II.3
- HeegnerPointEulerSystems HE.8: the anticyclotomic tower is not admissible, so the Heegner application uses Howard's Λ-adic Kolyvagin systems instead

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.ZpdExtension` | constructor | A Z_p^d-extension of K: an abelian extension K∞ ⊂ K̄ with a topological group isomorphism Gal(K∞/K) ≅ Z_p^d, d ≥ 1. |
| `TauCeti.EulerSystem.ZpdExtension.NoSplitPrimes` | data | The predicate that no finite prime of K splits completely in K∞/K. |
| `TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_iff_infinite_decompositionGroup` | characterisation | NoSplitPrimes holds iff the decomposition group D_v ⊂ Γ is infinite for every finite prime v of K. |
| `TauCeti.EulerSystem.ZpdExtension.unramified_of_not_dvd_p` | other | K∞/K is unramified at every finite prime v not above p. |
| `TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_of_cyclotomic_le` | compatibility | If K∞ contains the cyclotomic Z_p-extension of K (built from Mathlib's IsCyclotomicExtension tower), then NoSplitPrimes holds. |
| `TauCeti.EulerSystem.ZpdExtension.noSplitPrimes_mono` | functoriality | If K∞ ⊂ K∞' are Z_p^d- and Z_p^{d'}-extensions of K and K∞/K is admissible then so is K∞'/K, since decomposition groups surject. |
| `TauCeti.EulerSystem.ZpdExtension.iwasawaAlgebra` | data | Λ = O[[Γ]] = lim_F O[Gal(F/K)] over the finite subextensions F, with projections Λ → Λ_F and the involution ι. |
| `TauCeti.EulerSystem.ZpdExtension.layer_finite` | other | Every finite subextension F has Gal(F/K) a finite abelian p-group, and the F form a cofinal directed system indexed by the open subgroups of Γ. |

**Unit tests.**

- `TauCeti.EulerSystem.ZpdExtension.cyclotomic_rat_noSplitPrimes` (computation): For p odd, the cyclotomic Z_p-extension Q∞/Q is admissible: the Frobenius of a prime ℓ ≠ p maps to the image of ℓ in Z_p^×/μ_{p−1} ≅ Z_p, which has infinite order, and p is totally ramified.
- `TauCeti.EulerSystem.ZpdExtension.anticyclotomic_not_noSplitPrimes` (non-example): For K = Q(√−7), p = 3 and K∞ the anticyclotomic Z_3-extension of K, the prime 5 is inert in K and splits completely in K∞/K: a Frobenius of 5 lies in the coset of Gal(K∞/Q) acting on Γ by inversion, so its square, the Frobenius of 5O_K, is trivial.
- `TauCeti.EulerSystem.ZpdExtension.split_iff_decompositionGroup_trivial` (characterisation): For every finite prime v, v splits completely in K∞/K iff D_v = 1 iff D_v is finite.
- `TauCeti.EulerSystem.ZpdExtension.trivial_excluded` (degenerate): The trivial extension K/K is not a Z_p^d-extension (d ≥ 1 is required); in it every prime splits completely, so no admissibility statement is made about it.

**Acceptance.**

- For K = Q, p odd, the cyclotomic Z_p-extension is admissible.
- For K = Q(√−7), p = 3 and K∞ the anticyclotomic Z_3-extension, the prime 5 (inert in K) splits completely, so this K∞/K is not admissible.

**Prerequisites.**

- `PadicMeasuresIwasawaAlgebras:L1`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §1, Definition 1.1(ii), p. 21 (published: Definition 2.1.1(ii)). The definition and the standing hypothesis this node formalises. Source excerpt: “K contains an extension K∞ of K such that Gal(K∞/K) ≅ Z_p^d for some d ≥ 1, no (finite) prime of K splits completely in K∞/K.”
- `rubin-euler-systems-1999`, Ch. II §1, Remark 1.2, p. 22. The characterisation by infinite decomposition groups (the API item noSplitPrimes_iff). Source excerpt: “since Z_p^d has no proper finite subgroups, to say that a prime does not split completely in K∞/K is equivalent to saying that its decomposition group is infinite.”
- `rubin-euler-systems-1999`, Ch. II §3, opening paragraph and Notation, pp. 26–27. The setting of all Iwasawa-theoretic statements of this layer; Λ = O[[Γ]] = lim Λ_F is fixed in the same Notation paragraph. Source excerpt: “Fix for this section an abelian extension K∞ of K such that Gal(K∞/K) ≅ Z_p^d for some d and such that no finite prime of K splits completely in K∞.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Rubin's hypotheses Hyp(K∞, T) and Hyp(K∞, V)

`EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses` — definition

**Statement.** Let K∞/K be admissible, T a free O-module of finite rank with a continuous action of G_K unramified outside finitely many primes, V = T ⊗_O Φ, k = O/ϖ, and K(1) the maximal p-extension of K inside the Hilbert class field. Hyp(K∞, T): (i) there is τ ∈ G_{K∞} acting trivially on μ_{p^∞}, on (O_K^×)^{1/p^∞} and on K(1), such that T/(τ−1)T is free of rank one over O; (ii) T ⊗ k is an irreducible k[G_{K∞}]-module. Hyp(K∞, V): (i) there is such a τ with dim_Φ V/(τ−1)V = 1; (ii) V is an irreducible Φ[G_{K∞}]-module. These are the hypotheses Hyp(K, T), Hyp(K, V) of EulerSystemsAndKolyvaginSystems ES.4 (Rubin's Theorem II.2.2) with G_K replaced by G_{K∞}, and Hyp(K∞, T) ⇒ Hyp(K∞, V), Hyp(K∞, T) ⇒ Hyp(K, T), Hyp(K∞, V) ⇒ Hyp(K, V).

**Hypotheses.**

- Irreducibility is required over G_{K∞}, not over G_K: irreducibility over G_K is strictly weaker.
- τ is an element of G_{K∞}; Rubin's Chapter VII fixes it once and for all.
- These are Rubin's hypotheses; Mazur–Rubin's (H.0)–(H.6) and Kato's hypotheses (i)–(v) of his Theorem 13.4 are different records, related to these by implication lemmas proved by their owners (ES.0 and KatoEulerSystems L4).

**Construction.**

1. Hyp(K∞, T)(i) ⇒ Hyp(K∞, V)(i): V/(τ−1)V = (T/(τ−1)T) ⊗ Φ.
2. Hyp(K∞, T)(ii) ⇒ Hyp(K∞, V)(ii): a G_{K∞}-stable Φ-subspace V′ ≠ 0, V gives the saturated sublattice T ∩ V′, whose reduction is a proper nonzero G_{K∞}-submodule of T ⊗ k.
3. Replacing G_{K∞} by the larger group G_K preserves both clauses, giving the implications to Hyp(K, ·).
4. Since τ fixes μ_{p^∞}, dim_Φ V*/(τ−1)V* = 1 as well (Rubin, Chapter VII §1), where V* = Hom(V, Φ(1)).

**Uses that determine the API.**

- Rubin, Theorems II.3.2 and II.3.4: Hyp(K∞, V) is the large-image hypothesis of the weak Leopoldt theorem and of the divisibility up to p^t
- Rubin, Theorem II.3.3: Hyp(K∞, T) gives the integral divisibility char(X∞) | ind_Λ(c)
- Rubin, Lemma VII.1.3: a_τ is finite under Hyp(K∞, V) and equals 1 under Hyp(K∞, T)
- Rubin, Theorem VI.4.1: the hypotheses are unchanged by twisting T by characters of Γ
- EulerSystemsCyclotomicMainConjecture L2: verifies Hyp(Q∞, T*) with τ = 1 for T* = O_{χ^{-1}}(1)
- KatoEulerSystems L4: compares Kato's hypotheses (iv)–(v) of Theorem 13.4 with this record

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.IwasawaHypT` | structure | The record Hyp(K∞, T): an element τ of G_{K∞} with the three triviality conditions, a proof that T/(τ−1)T is free of rank one over O, and irreducibility of T ⊗ k over G_{K∞}. |
| `TauCeti.EulerSystem.IwasawaHypV` | structure | The record Hyp(K∞, V): τ ∈ G_{K∞} with the triviality conditions and dim_Φ V/(τ−1)V = 1, and irreducibility of V over G_{K∞}. |
| `TauCeti.EulerSystem.IwasawaHypT.toHypV` | relation | Hyp(K∞, T) implies Hyp(K∞, V) with the same τ. |
| `TauCeti.EulerSystem.IwasawaHypT.toBase` | relation | Hyp(K∞, T) implies ES.4's Hyp(K, T), and Hyp(K∞, V) implies Hyp(K, V). |
| `TauCeti.EulerSystem.IwasawaHypV.dual` | other | Under Hyp(K∞, V)(i), dim_Φ V*/(τ−1)V* = 1 for V* = Hom(V, Φ(1)). |
| `TauCeti.EulerSystem.IwasawaHypT.of_rank_one` | example | If rank_O T = 1 then Hyp(K∞, T) holds with τ = 1. |
| `TauCeti.EulerSystem.IwasawaHypT.twist_iff` | compatibility | For a character ρ of Γ, Hyp(K∞, T⊗ρ) ⇔ Hyp(K∞, T) and Hyp(K∞, V⊗ρ) ⇔ Hyp(K∞, V), because G_{K∞} acts on T⊗ρ as on T. |
| `TauCeti.EulerSystem.IwasawaHypT.aTau_eq_one` | other | Under Hyp(K∞, T) the constant a_τ of iwasawa-evaluation-maps equals 1 (Rubin, Lemma VII.1.3(ii)). |

**Unit tests.**

- `TauCeti.EulerSystem.IwasawaHypT.rank_one_example` (example): For T = O_{χ^{-1}}(1) with χ a finite-order character, Hyp(Q∞, T) holds with τ = 1.
- `TauCeti.EulerSystem.IwasawaHypT.elliptic_surjective` (computation): For E/Q with ρ_{E,p}: G_Q → GL_2(Z_p) surjective and p odd, Hyp(Q∞, T_pE) holds: take τ ∈ G_{Q(μ_{p^∞})} with ρ(τ) = (1 1; 0 1), so det ρ(τ) = 1, τ fixes μ_{p^∞} and the p-power roots of ±1, K(1) = Q, T/(τ−1)T ≅ Z_p, and E[p] is irreducible over G_{Q∞} because ρ̄(G_{Q∞}) ⊇ SL_2(F_p).
- `TauCeti.EulerSystem.IwasawaHypV.cm_fails` (non-example): For E/Q with complex multiplication and p odd, no τ ∈ G_{Q(μ_{p^∞})} has dim V_pE/(τ−1)V_pE = 1: on the Cartan part τ has eigenvalues u, u^{-1}, both 1 or neither; off it, det ρ(τ) = 1 and trace 0 force eigenvalues ±√−1. So Hyp(Q∞, V_pE)(i) fails.
- `TauCeti.EulerSystem.IwasawaHypV.irreducible_K_not_Kinf` (non-example): For p odd, K' the first layer of K∞/K and ψ a character of G_{K'} with ψ^σ ≠ ψ for a generator σ of Gal(K'/K), V = Ind_{K'}^{K} ψ is irreducible over G_K, but V restricted to G_{K∞} is a sum of characters, so Hyp(K∞, V)(ii) fails while Hyp(K, V)(ii) holds.

**Acceptance.**

- Rank one: for rank_O T = 1 both hypotheses hold with τ = 1.
- Elliptic curves: for E/Q with ρ_{E,p} surjective onto GL_2(Z_p), p odd, and K∞ = Q∞, Hyp(Q∞, T_pE) holds with ρ(τ) unipotent.
- CM elliptic curves fail Hyp(Q∞, V_pE)(i).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §3, Hypotheses Hyp(K∞, T), p. 27 (published p. 41). The definition of Hyp(K∞, T) verbatim. Source excerpt: “(i) There is a τ ∈ G_K∞ such that • τ acts trivially on μ_p∞, on (O_K^×)^{1/p^∞}, and on K(1), • T/(τ − 1)T is free of rank one over O. (ii) T ⊗ k is an irreducible k[G_K∞]-module.”
- `rubin-euler-systems-1999`, Ch. II §3, p. 27. The relation to the finite-level hypotheses of ES.4. Source excerpt: “We also write Hyp(K∞, T) (resp. Hyp(K∞, V)) for hypotheses Hyp(K, T) (resp. Hyp(K, V)) with G_K replaced by G_K∞”
- `rubin-euler-systems-1999`, Ch. II §2, Remark 2.4, p. 24. The rank-one example (stated for Hyp(K, T); the same argument applies over G_K∞). Source excerpt: “If rank_O(T) = 1, then (i) holds with τ = 1, and (ii) holds as well.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Rubin's hypothesis Hyp(K∞/K)

`EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis` — definition

**Statement.** For an admissible Z_p^d-extension K∞/K and V = T ⊗ Φ: Hyp(K∞/K) holds unless rank_{Z_p} Γ = 1, G_{K∞} acts on V either trivially or by the cyclotomic character, and K is neither a totally real field satisfying Leopoldt's conjecture (the p-adic completion of O_K^× injects into (O_K ⊗ Z_p)^×) nor an imaginary quadratic field. Equivalently: if rank_{Z_p} Γ = 1 and G_{K∞} acts on V trivially or by ε_cyc, then K is totally real with Leopoldt's conjecture, or K is imaginary quadratic.

**Hypotheses.**

- The condition rules out a very special family of bad cases, all of rank one: by Hyp(K∞, V)(ii) the action of G_{K∞} on V can be scalar only if dim V = 1.
- It holds for K = Q (O_Q^× is finite, so Leopoldt's conjecture is trivially true).

**Construction.**

1. It is used only through Lemma VII.3.7 (rank-one-leopoldt-case), which shows X∞/Ann_Λ(T)X∞ (resp. X∞/Ann_Λ(T(−1))X∞) finite in the two exceptional actions.
2. It depends only on the action of G_{K∞} on V, so it is invariant under twisting by characters of Γ (Rubin, proof of Theorem VI.4.1).

**Uses that determine the API.**

- Rubin, Theorems II.3.3, II.3.4 and II.3.8: a standing hypothesis of the divisibilities
- Rubin, Lemma VII.3.7: gives finiteness of X∞/Ann_Λ(T)X∞ in the exceptional rank-one actions, used to keep char(X∞) prime to the relevant annihilators
- EulerSystemsCyclotomicMainConjecture L2: verifies Hyp(Q∞/Q) for the cyclotomic application (K = Q)

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.LeopoldtTowerHyp` | data | The predicate Hyp(K∞/K) on (K, K∞, V). |
| `TauCeti.EulerSystem.LeopoldtTowerHyp.of_two_le_rank` | example | If rank_{Z_p} Γ ≥ 2 then Hyp(K∞/K) holds vacuously. |
| `TauCeti.EulerSystem.LeopoldtTowerHyp.of_action_not_scalar` | example | If G_{K∞} acts on V neither trivially nor by ε_cyc (in particular if dim V ≥ 2 and Hyp(K∞, V)(ii) holds) then Hyp(K∞/K) holds. |
| `TauCeti.EulerSystem.LeopoldtTowerHyp.rat` | example | For K = Q, Hyp(K∞/K) holds for every V. |
| `TauCeti.EulerSystem.LeopoldtTowerHyp.imaginaryQuadratic` | example | For K imaginary quadratic, Hyp(K∞/K) holds for every V. |
| `TauCeti.EulerSystem.LeopoldtTowerHyp.twist_iff` | compatibility | Hyp(K∞/K) holds for V iff it holds for V ⊗ ρ, ρ a character of Γ. |
| `TauCeti.EulerSystem.LeopoldtTowerHyp.of_totallyReal_abelian` | compatibility | For K totally real and abelian over Q, Hyp(K∞/K) holds, by Leopoldt's conjecture for abelian fields (Brumer–Ax) as imported by the cyclotomic owner. |

**Unit tests.**

- `TauCeti.EulerSystem.LeopoldtTowerHyp.rat_cyclotomic_Zp1` (computation): K = Q, K∞ = Q∞, T = Z_p(1): Hyp(Q∞/Q) holds, since Q is totally real and O_Q^× = {±1} is finite.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.pure_cubic_fails` (non-example): K = Q(∛2), which has one real and one complex place, K∞ its cyclotomic Z_p-extension and T = Z_p(1): G_{K∞} acts on V by ε_cyc, rank Γ = 1, and K is neither totally real nor imaginary quadratic, so Hyp(K∞/K) fails.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.Zp2_vacuous` (degenerate): K imaginary quadratic and K∞ its Z_p²-extension: rank_{Z_p} Γ = 2, so the hypothesis is vacuous.
- `TauCeti.EulerSystem.LeopoldtTowerHyp.elliptic` (example): For T = T_pE with Hyp(K∞, V) and dim V = 2, G_{K∞} cannot act by a scalar character, so Hyp(K∞/K) holds for every K.

**Acceptance.**

- K = Q with its cyclotomic Z_p-extension satisfies the hypothesis for every T.
- A cubic field with one complex place, with its cyclotomic Z_p-extension and T = Z_p(1), does not.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §3, Hypothesis Hyp(K∞/K), p. 27 (published p. 41). The hypothesis verbatim. Source excerpt: “If rank_Zp(Γ) = 1 and G_K∞ acts either trivially or by the cyclotomic character on V, then either K is a totally real field and Leopoldt's conjecture holds for K (i.e., the p-adic completion of O_K^× injects into (O_K ⊗ Zp)^×), or K is an imaginary quadratic field.”
- `rubin-euler-systems-1999`, Ch. II §3, p. 27. Its role and the case K = Q. Source excerpt: “We will need the following weak assumption to rule out some very special bad cases. In particular it is satisfied if K = Q.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### The Iwasawa module X∞ of the restricted Selmer groups

`EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module` — construction

**Statement.** Let K∞/K be admissible, W* = Hom(T, μ_{p^∞}) and D = Φ/O. For K ⊂_f F ⊂ K∞ let S_{Σp}(F, W*) ⊂ H¹(F, W*) be Rubin's restricted Selmer group: classes whose localisation is 0 at every prime above p and lies in H¹_f(F_w, W*) at every other place (the Selmer module of SelmerIwasawaCohomology L2 with the strict condition on Σ_p). Define S_{Σp}(K∞, W*) = colim_F S_{Σp}(F, W*) along restriction, a discrete Λ-module, and X∞ = Hom_O(S_{Σp}(K∞, W*), D) with the contragredient action (γφ)(s) = φ(γ^{-1}s), a compact Λ-module. Together with the Iwasawa cohomology H¹_∞(K, T) = lim_F H¹(F, T) along corestriction (SelmerIwasawaCohomology L3) this is Rubin's Definition II.3.1.

**Hypotheses.**

- X∞ is built from the restricted Selmer groups (strict at p). The true Selmer group, with chosen local conditions at p, is true-iwasawa-selmer-and-singular-quotient; the two are related by Proposition II.3.7.
- The Λ-action on X∞ is the contragredient one; with the other convention every characteristic ideal is replaced by its image under ι.

**Construction.**

1. The restriction maps S_{Σp}(F, W*) → S_{Σp}(F', W*) for F ⊂ F' are compatible, so the colimit is a discrete O[[Γ]]-module, Γ acting through the conjugation action on each H¹(F', W*) (SelmerIwasawaCohomology L2, selmer-functoriality).
2. X∞ is its Pontryagin dual (SelmerIwasawaCohomology L2, pontryagin-dual) with the stated action; it is a finitely generated Λ-module by x-infinity-finitely-generated.
3. For F = K, and every d ≥ 1, Pontryagin duality gives X∞/JX∞ = Hom(S_{Σp}(K∞, W*)^{Γ}, D) for the augmentation ideal J, the identity used in Rubin's Lemma VII.4.1.

**Uses that determine the API.**

- Rubin, Definition II.3.1: X∞ is the module whose characteristic ideal Theorems II.3.3 and II.3.4 bound
- Rubin, Theorem II.3.2: the weak Leopoldt conclusion is that X∞ is Λ-torsion
- Rubin, Proposition II.3.7: X∞ is the quotient of the dual of the true Selmer group by the local term at p
- Rubin, Chapter VII §§1–7: the evaluation maps take values in X∞ and its elementary divisors drive the induction
- EulerSystemsCyclotomicMainConjecture L2: for T = O_{χ^{-1}}(1) the dual of the true Selmer group is A∞^χ, built from this X∞ and Proposition II.3.7

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.restrictedSelmerInf` | constructor | S_{Σp}(K∞, W*) = colim_F S_{Σp}(F, W*), a discrete Λ-module. |
| `TauCeti.EulerSystem.Xinf` | data | X∞ = Hom_O(S_{Σp}(K∞, W*), D) with (γφ)(s) = φ(γ^{-1}s), a compact Λ-module. |
| `TauCeti.EulerSystem.restrictedSelmerInf.res` | projection | The restriction maps S_{Σp}(F, W*) → S_{Σp}(K∞, W*)^{Gal(K∞/F)}. |
| `TauCeti.EulerSystem.Xinf_coinvariants` | characterisation | For every F, X∞ ⊗_Λ Λ_F ≅ Hom_O(S_{Σp}(K∞, W*)^{Gal(K∞/F)}, D); for F = K this is X∞/JX∞. |
| `TauCeti.EulerSystem.Xinf_finitelyGenerated` | other | X∞ is a finitely generated Λ-module (x-infinity-finitely-generated). |
| `TauCeti.EulerSystem.Xinf_twist` | compatibility | For ρ: Γ → O^×, X∞(T ⊗ ρ) ≅ X∞(T) ⊗ ρ as Λ-modules (Rubin, Proposition VI.2.1(ii) and proof of Theorem VI.4.1). |
| `TauCeti.EulerSystem.Xinf_eq_mazurRubin` | compatibility | For K = Q and K∞ = Q∞, Shapiro's lemma identifies X∞ with Mazur–Rubin's X∞ = Hom(H¹_{F_Λ*}(Q, 𝐓*), Q_p/Z_p) for the canonical Λ-adic Selmer structure of lambda-adic-selmer-structure: at ℓ ≠ p the conditions H¹_f vanish in the colimit because every ℓ ≠ p has infinite decomposition group. The identification is semilinear for the involution ι: with G_Q acting on Λ through Ψ and Λ acting on a Pontryagin dual by (λφ)(x) = φ(λx), Mazur–Rubin's X∞ is this X∞ with Λ acting through ι, so its characteristic ideal is ι(char X∞). |

**Unit tests.**

- `TauCeti.EulerSystem.Xinf_rat_Zp1` (computation): For K = Q, p odd, K∞ = Q∞ and T = Z_p(1) (so W* = Q_p/Z_p), S_{Σp}(Q_n, Q_p/Z_p) is the dual of the Galois group of the maximal abelian p-extension of Q_n unramified everywhere and split completely at p; since p is totally ramified in Q∞/Q and h(Q) = 1, the class numbers of the Q_n are prime to p and X∞ = 0.
- `TauCeti.EulerSystem.Xinf_coinvariants_rank_one` (characterisation): For d = 1, X∞/(γ − 1)X∞ is the Pontryagin dual of S_{Σp}(K∞, W*)^Γ, for γ a topological generator of Γ.
- `TauCeti.EulerSystem.Xinf_not_true_selmer` (non-example): X∞ is not in general the dual of the true Selmer group: for T = T_pE (E/Q) with H¹_f(F_w, V) = 0 at p, the kernel H¹_{∞,s}(Q_p, T)/loc^s(H¹_∞(Q, T)) of Proposition II.3.7 has Λ-rank at least 2 − 1 = 1, since H¹_∞(Q_p, T) has Λ-rank 2 by the local Euler characteristic formula while rank_Λ H¹_∞(Q, T) = rank T^- = 1 once X∞ is torsion (Mazur–Rubin, Remark 5.3.18); so Hom(S(Q∞, W*), D) is not torsion although X∞ is.
- `TauCeti.EulerSystem.Xinf_contragredient` (compatibility): If X∞ ≅ Λ/fΛ with the contragredient action, then with the naive action (γφ)(s) = φ(γs) the same group is Λ/ι(f)Λ; the two conventions agree on characteristic ideals iff char(X∞) = ι(char(X∞)).

**Acceptance.**

- For K = Q, K∞ = Q∞ and T = Z_p(1), X∞ = 0.
- Twisting T by a character ρ of Γ replaces X∞ by X∞ ⊗ ρ.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`
- `SelmerIwasawaCohomology:L2/selmer-kernel`
- `SelmerIwasawaCohomology:L2/pontryagin-dual`
- `SelmerIwasawaCohomology:L2/selmer-limits`
- `SelmerIwasawaCohomology:L3/iwasawa-cohomology`
- `mathlib:PontryaginDual`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §3, Definition 3.1, p. 28 (published Definition 2.3.1). The construction verbatim. Source excerpt: “Define Λ-modules S_Σp(K∞, W*) = lim→ S_Σp(F, W*), X∞ = Hom_O(S_Σp(K∞, W*), D), H¹_∞(K, T) = lim← H¹(F, T), limits with respect to restriction and corestriction maps, respectively.”
- `rubin-euler-systems-1999`, Ch. VII §4, proof of Lemma 4.1, p. 110. The coinvariants identity recorded as an API item. Source excerpt: “Let J denote the augmentation ideal in Λ. Then X∞/JX∞ = Hom(S_Σp(K∞, W*)^G_K, D).”
- `rubin-euler-systems-1999`, Ch. VII §2, proof of Lemma 2.4, p. 103. The contragredient convention for duals used throughout Chapter VII. Source excerpt: “Note that σ acts on ψ ∈ Hom_O(B, O/MO) by (σψ)(b) = ψ(σ^{-1}b)”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### The Λ-adic class c_{K,∞} of an Euler system

`EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system` — construction

**Statement.** Let c be an Euler system for (T, 𝒦, N) in the sense of EulerSystemsAndKolyvaginSystems ES.2 (Rubin, Definition II.1.1), with K∞ ⊂ 𝒦 admissible. For K ⊂_f F ⊂_f F' ⊂ K∞, no prime outside N ramifies in F'/F, so the Euler relation reads Cor_{F'/F}(c_{F'}) = c_F. Hence c_{K,∞} = (c_F)_{K ⊂_f F ⊂ K∞} ∈ H¹_∞(K, T), and more generally c_{L,∞} = (c_{LF})_F ∈ H¹_∞(L, T) = lim_F H¹(LF, T) for K ⊂_f L ⊂ 𝒦. The map ES(T, 𝒦, N) → H¹_∞(K, T), c ↦ c_{K,∞}, is O[[Gal(𝒦/K)]]-linear, Gal(𝒦/K) acting on H¹_∞(K, T) through Γ, and c_{K,∞} lies in lim_F S^{Σp}(F, T) (classes unramified at every v ∤ p).

**Hypotheses.**

- The Euler factors at primes of N do not intervene because N is divisible by p and by every prime where T is ramified (Rubin, discussion after Remark II.1.2).
- The unramifiedness of c_{K,∞} away from p uses admissibility (infinite decomposition groups); without it Rubin's condition (*) is needed (unramified-at-split-primes-condition).

**Construction.**

1. Universal norms: if K ⊂_f F ⊂_f F' ⊂ FK∞ then Σ(F'/F) is empty, so Cor_{F'/F}(c_{F'}) = c_F (Rubin, p. 22).
2. Linearity: σ ∈ Gal(𝒦/K) acts on Euler systems by (σc)_F = σ(c_F), compatibly with corestriction.
3. Unramifiedness: every v ∤ p has infinite decomposition group in K∞/K, so the norm-coherent family is unramified at v (SelmerIwasawaCohomology L3, universal-norms-unramified (ii)); Rubin records cK ∈ S^{Σp}(K, T) via Corollary B.3.4 and Lemma I.3.5(ii).

**Uses that determine the API.**

- Rubin, Definition II.3.1: ind_Λ(c) is formed from c_{K,∞}
- Rubin, Theorem II.3.2: the hypothesis that c_{K,∞} is not Λ-torsion gives the weak Leopoldt conclusion
- Rubin, Theorem II.3.8: loc^s_{Σp}(c_{K,∞}) bounds the true Selmer group
- Mazur–Rubin, Theorem 5.3.3: κ_1 of the Λ-adic Kolyvagin system attached to c is {c_{Q_n}}
- EulerSystemsCyclotomicMainConjecture L2: Λ{c_{Q_n}} ⊂ H¹_∞(Q, T*) is identified with the χ-part of the cyclotomic units
- KatoEulerSystems L4: Kato's module Z generated by (z_{p^n})_n is Λ·c_{Q,∞} for his Euler system

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.iwasawaClass` | constructor | The map ES(T, 𝒦, N) → H¹_∞(K, T), c ↦ c_{K,∞} = (c_F)_F. |
| `TauCeti.EulerSystem.iwasawaClassAt` | constructor | For K ⊂_f L ⊂ 𝒦, c ↦ c_{L,∞} = (c_{LF})_F ∈ H¹_∞(L, T). |
| `TauCeti.EulerSystem.iwasawaClass_proj` | projection | The image of c_{K,∞} under the projection H¹_∞(K, T) → H¹(F, T) is c_F; for F = K it is c_K. |
| `TauCeti.EulerSystem.iwasawaClass_smul` | structure | c ↦ c_{K,∞} is linear over O[[Gal(𝒦/K)]], acting on H¹_∞(K, T) through Gal(𝒦/K) → Γ. |
| `TauCeti.EulerSystem.iwasawaClass_zero` | simp | The zero Euler system maps to 0. |
| `TauCeti.EulerSystem.iwasawaClass_mem_unramified` | other | c_{K,∞} lies in lim_F S^{Σp}(F, T). |
| `TauCeti.EulerSystem.iwasawaClass_twist` | compatibility | For ρ: Γ → O^× and the twisted Euler system c^ρ of twisting-by-characters-of-gamma, (c^ρ)_{K,∞} is the image of c_{K,∞} ⊗ ξ_ρ under H¹_∞(K, T) ⊗ ρ ≅ H¹_∞(K, T ⊗ ρ). |
| `TauCeti.EulerSystem.iwasawaClass_eq_kappaOne` | compatibility | For K = Q, K∞ = Q∞, the Euler-system-to-Kolyvagin-system map of euler-to-lambda-adic-kolyvagin sends c to κ with κ_1 = (c_{Q_n})_n = c_{Q,∞}. |

**Unit tests.**

- `TauCeti.EulerSystem.iwasawaClass_zero_index` (degenerate): For the zero Euler system c_{K,∞} = 0, and hence ind_Λ(c) = 0: Theorems II.3.2–II.3.4 say nothing (Rubin, Remark II.2.8).
- `TauCeti.EulerSystem.iwasawaClass_norm_coherent` (characterisation): For K ⊂ F ⊂ F' ⊂ K∞, Cor_{F'/F}(c_{F'}) = c_F. A family built with restriction maps (res_{F'/F}(c_F) = c_{F'}) is not an element of the corestriction limit and fails this test.
- `TauCeti.EulerSystem.iwasawaClass_proj_base` (compatibility): The projection of c_{K,∞} to H¹(K, T) is c_K, the class whose index ind_O(c) ES.4 uses.
- `TauCeti.EulerSystem.iwasawaClass_cyclotomic` (computation): For the cyclotomic-unit Euler system for T* = O_{χ^{-1}}(1) over Q∞ (EulerSystemsCyclotomicMainConjecture L0), the component of c_{Q,∞} at Q_n is the Kummer image of the χ-part of the norm of the cyclotomic p-units of L_n, so Λc_{Q,∞} corresponds to C_{∞,χ} (Rubin, Proposition III.2.6(i)).

**Acceptance.**

- Its projection to H¹(K, T) is c_K.
- The zero Euler system maps to 0.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `SelmerIwasawaCohomology:L3/iwasawa-cohomology`
- `SelmerIwasawaCohomology:L3/universal-norms-unramified`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §1, discussion after Remark 1.2, p. 22. The norm-coherence that makes c_{K,∞} an element of H¹_∞(K, T). Source excerpt: “It follows from our definition that the Euler system classes are “universal norms” in the K∞/K direction, i.e., if K ⊂f F ⊂f F′ ⊂ F′K∞, then Σ(F′/F) is empty so Cor_F′/F(c_F′) = c_F.”
- `rubin-euler-systems-1999`, Ch. II §3, Definition 3.1, p. 28. The construction verbatim. Source excerpt: “If c is an Euler system let c_K,∞ = {c_F}_K⊂f F⊂K∞ denote the corresponding element of H¹_∞(K, T)”
- `rubin-euler-systems-1999`, Ch. VI §2, p. 91. The variant c_{L,∞} used for twisting. Source excerpt: “For every extension L of K, write H¹_∞(L, T) = lim← H¹(FL, T), and if c is an Euler system let c_L,∞ = {c_LF}_K⊂f F⊂K∞ ∈ H¹_∞(L, T).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### The Λ-adic index of divisibility ind_Λ

`EulerSystemsAndKolyvaginSystems:ES.8/lambda-index` — definition

**Statement.** For x ∈ H¹_∞(K, T) let ind_Λ(x) = {φ(x) : φ ∈ Hom_Λ(H¹_∞(K, T), Λ)}, an ideal of Λ; for an Euler system c, ind_Λ(c) = ind_Λ(c_{K,∞}) (Rubin, Definition II.3.1). For an ideal 𝔞 and a finitely generated torsion Λ-module B, 'char(B) divides 𝔞' means 𝔞 ⊂ char(B); ind_Λ(c) need not be principal.

**Hypotheses.**

- H¹_∞(K, T) is a finitely generated Λ-module (SelmerIwasawaCohomology L3), so Hom_Λ(H¹_∞(K, T), Λ) is finitely generated and ind_Λ(x) is a finitely generated ideal.
- ind_Λ is the Λ-analogue of ES.4's ind_O (Rubin, Definition II.2.1); it is not Mazur–Rubin's principal ideal Ind (lambda-adic-ind), though divisibility by a principal ideal is the same for both.

**Construction.**

1. Every φ is Λ-linear, so ind_Λ(λx) = λ·ind_Λ(x) and ind_Λ(x) is an ideal.
2. Every φ kills the Λ-torsion; conversely, if x is not torsion then, Λ being a noetherian domain, H¹_∞/torsion embeds in a free module of finite rank and some coordinate of x is nonzero. Hence ind_Λ(x) = 0 iff x is Λ-torsion.
3. For d = 1, the reflexive hull of H = H¹_∞/torsion is free over the two-dimensional regular local ring Λ (PadicMeasuresIwasawaAlgebras L4, reflexive-free-over-regular-local), Hom_Λ(H, Λ) = Hom_Λ(H**, Λ), and in coordinates x ↦ (a_1, …, a_r): ind_Λ(x) = (a_1, …, a_r), so a principal ideal (f) contains ind_Λ(x) iff f divides gcd(a_i).

**Uses that determine the API.**

- Rubin, Theorems II.3.3 and II.3.4: the right-hand side of the divisibilities char(X∞) | ind_Λ(c) and char(X∞) | p^t ind_Λ(c)
- Rubin, Theorem VII.1.9: char(X∞) | a_τ^{5r} ind_Λ(c), proved by Lemma VII.1.8 applied to every functional
- Rubin, proof of Theorem II.3.8: ind_Λ(c) divides ψ ∘ loc^s(c_{K,∞}) for a functional ψ with pseudo-null cokernel
- EulerSystemsCyclotomicMainConjecture L2: computes ind_Λ(c) = char((E'∞)^χ/C_{∞,χ}) for cyclotomic units
- KatoEulerSystems L4: Kato's ideal J generated by h(Z) over h ∈ Hom_Λ(H¹(T), Λ) is ind_Λ of his Euler system

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.lambdaIndex` | data | ind_Λ(x) = Ideal.span {φ x \| φ ∈ Module.Dual Λ H¹_∞(K, T)}. |
| `TauCeti.EulerSystem.lambdaIndex_smul` | simp | ind_Λ(λx) = λ · ind_Λ(x). |
| `TauCeti.EulerSystem.lambdaIndex_eq_bot_iff` | characterisation | ind_Λ(x) = 0 iff x ∈ H¹_∞(K, T)_{Λ-tors}. |
| `TauCeti.EulerSystem.apply_mem_lambdaIndex` | constructor | For every φ ∈ Hom_Λ(H¹_∞(K, T), Λ), φ(x) ∈ ind_Λ(x). |
| `TauCeti.EulerSystem.lambdaIndex_of_rank_one` | example | If H¹_∞(K, T)/torsion ≅ Λ via ψ then ind_Λ(x) = (ψ(x)). |
| `TauCeti.EulerSystem.lambdaIndex_le_span_iff` | compatibility | For d = 1 and f ∈ Λ, ind_Λ(x) ⊂ (f) iff f divides Mazur–Rubin's Ind(x) of lambda-adic-ind computed in the same module (across the ι-semilinear Shapiro identification with H¹(Q, 𝐓), apply ι); so char(B) \| ind_Λ(x) iff char(B) \| Ind(x). |
| `TauCeti.EulerSystem.lambdaIndex_twist` | compatibility | Tw_ρ(ind_Λ(c^ρ)) = ind_Λ(c) for ρ: Γ → O^× (Rubin, proof of Theorem VI.4.1). |
| `TauCeti.EulerSystem.lambdaIndex_map_le` | functoriality | For a Λ-linear f: H¹_∞(K, T) → H′, ind_Λ(f x) ⊂ ind_Λ(x) (every functional on H′ pulls back). |

**Unit tests.**

- `TauCeti.EulerSystem.lambdaIndex_free_rank_one` (computation): If H¹_∞(K, T) ≅ Λ with c_{K,∞} ↦ f, then ind_Λ(c) = fΛ.
- `TauCeti.EulerSystem.lambdaIndex_not_principal` (non-example): If H¹_∞(K, T) ≅ Λ² (d = 1) and x ↦ (p, γ − 1), then ind_Λ(x) = (p, γ − 1), the maximal ideal of Z_p[[Γ]] when O = Z_p, which is not principal; a definition as char(H¹_∞/Λx) gives 0 (the quotient has rank one) and is wrong.
- `TauCeti.EulerSystem.lambdaIndex_torsion` (degenerate): If x is Λ-torsion, ind_Λ(x) = 0.
- `TauCeti.EulerSystem.lambdaIndex_dvd_iff_Ind` (compatibility): For d = 1 and x ↦ (a_1, …, a_r) in a free reflexive hull, (f) ⊇ ind_Λ(x) iff f | gcd(a_1, …, a_r), the generator of Mazur–Rubin's Ind(x).

**Acceptance.**

- H¹_∞ ≅ Λ with x ↦ f gives ind_Λ(x) = (f).
- H¹_∞ ≅ Λ² with x ↦ (p, γ − 1) gives the non-principal ind_Λ(x) = (p, γ − 1).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system`
- `SelmerIwasawaCohomology:L3/iwasawa-descent`
- `PadicMeasuresIwasawaAlgebras:L4/reflexive-free-over-regular-local`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`
- `mathlib:Module.Dual`
- `mathlib:Ideal.span`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §3, Definition 3.1, p. 28. The definition verbatim. Source excerpt: “define an ideal ind_Λ(c) = {φ(c_K,∞) : φ ∈ Hom_Λ(H¹_∞(K, T), Λ)} ⊂ Λ. The ideal ind_Λ(c) is the analogue for Λ of the index of divisibility ind_O(c) of Definition 2.1.”
- `rubin-euler-systems-2000`, Ch. 2 §3, proof of Theorem 2.3.8, p. 43. The divisibility convention for a non-principal ideal, in the published text. Source excerpt: “and by definition ind_Λ(c) divides ψ ∘ loc^s_Σp(c_K,∞).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### The true Iwasawa Selmer group and the singular local term at p

`EulerSystemsAndKolyvaginSystems:ES.8/true-iwasawa-selmer-and-singular-quotient` — construction

**Statement.** Suppose that for every K ⊂_f F ⊂ K∞ and every w | p there are subspaces H¹_f(F_w, V) ⊂ H¹(F_w, V) and H¹_f(F_w, V*) ⊂ H¹(F_w, V*) that are orthogonal complements under the local Tate pairing, with Cor_{F'_{w'}/F_w} H¹_f(F'_{w'}, V) ⊂ H¹_f(F_w, V) and Res_{F'_{w'}/F_w} H¹_f(F_w, V*) ⊂ H¹_f(F'_{w'}, V*) for F ⊂ F', w' | w. Propagate them to T and W* (SelmerIwasawaCohomology L2) and put H¹_s = H¹/H¹_f, H¹(F_p, ·) = ⊕_{w|p} H¹(F_w, ·). Define S(K∞, W*) = colim_F S(F, W*), H¹_{∞,s}(K_p, T) = lim_F H¹_s(F_p, T), and loc^s_{Σp}: H¹_∞(K, T) → H¹_{∞,s}(K_p, T) the localisation (Rubin, Remark II.3.6).

**Hypotheses.**

- The two compatibility inclusions are equivalent, by the local pairing and orthogonality.
- The construction depends on the chosen H¹_f at p; ordinary, Bloch–Kato and unit conditions are supplied by the consumers (SelmerIwasawaCohomology L2 and L4, KatoEulerSystems, EulerSystemsCyclotomicMainConjecture).

**Construction.**

1. The compatibilities give maps S(F, W*) → S(F', W*) and H¹_s(F'_p, T) → H¹_s(F_p, T), so the colimit and the limit are defined.
2. Each H¹_s(F_w, T) is O-torsion-free, as it injects into H¹_s(F_w, V) (Rubin, proof of Theorem II.2.10).

**Uses that determine the API.**

- Rubin, Proposition II.3.7: the exact sequence relating Hom(S(K∞, W*), D), X∞ and H¹_{∞,s}(K_p, T)/loc^s(H¹_∞)
- Rubin, Theorem II.3.8: the bound of the true Selmer group by H¹_{∞,s}(K_p, T)/Λ loc^s(c_{K,∞})
- EulerSystemsCyclotomicMainConjecture L2: H¹_{∞,s}(Q_p, T*) ≅ Y∞^χ/U∞^χ for the unit condition
- KatoEulerSystems L4: the ordinary and Bloch–Kato Selmer divisibilities

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.trueSelmerInf` | constructor | S(K∞, W*) = colim_F S(F, W*) for compatible orthogonal conditions at p. |
| `TauCeti.EulerSystem.singularLocalInf` | data | H¹_{∞,s}(K_p, T) = lim_F ⊕_{w\|p} H¹_s(F_w, T). |
| `TauCeti.EulerSystem.locSingularInf` | projection | loc^s_{Σp}: H¹_∞(K, T) → H¹_{∞,s}(K_p, T), Λ-linear. |
| `TauCeti.EulerSystem.restrictedSelmerInf_le_true` | other | S_{Σp}(K∞, W*) ⊂ S(K∞, W*). |
| `TauCeti.EulerSystem.compatible_cor_iff_res` | characterisation | Corestriction-stability of H¹_f(·, V) is equivalent to restriction-stability of H¹_f(·, V*). |
| `TauCeti.EulerSystem.singularLocal_torsionFree` | other | Each H¹_s(F_w, T) is O-torsion-free. |
| `TauCeti.EulerSystem.singularLocalInf_eq_zero_of_full` | example | If H¹_f(F_w, V) = H¹(F_w, V) for all w \| p, then H¹_{∞,s}(K_p, T) = 0 and S(K∞, W*) = S_{Σp}(K∞, W*). |

**Unit tests.**

- `TauCeti.EulerSystem.singularLocalInf_full_condition` (degenerate): With H¹_f(F_w, V) = H¹(F_w, V) at all w | p, H¹_f(F_w, V*) = 0, the propagated condition on W* is 0, so S(K∞, W*) = S_{Σp}(K∞, W*) and H¹_{∞,s}(K_p, T) = 0.
- `TauCeti.EulerSystem.singularLocal_strict_condition` (computation): With H¹_f(F_w, V) = 0 at all w | p, H¹_f(F_w, T) is the torsion of H¹(F_w, T) and H¹_s(F_w, T) = H¹(F_w, T)/H¹(F_w, T)_tors.
- `TauCeti.EulerSystem.singularLocalInf_cyclotomic` (computation): For T* = O_{χ^{-1}}(1) over Q∞ with the unit condition, H¹_{∞,s}(Q_p, T*) ≅ Y∞^χ/U∞^χ, which is O if χ(p) = 1 and 0 otherwise (Rubin, Proposition III.2.6(ii)).
- `TauCeti.EulerSystem.singularLocal_not_torsion` (non-example): H¹(F_w, T) can have nonzero O-torsion (e.g. H⁰(F_w, W) ≠ 0 gives torsion in H¹(F_w, T)), but H¹_s(F_w, T) never does: a definition of H¹_s as H¹(F_w, T) modulo the image of H¹_f(F_w, V) without saturation fails this.

**Acceptance.**

- If H¹_f(F_w, V) = H¹(F_w, V) at every w | p, then H¹_{∞,s}(K_p, T) = 0 and S(K∞, W*) = S_{Σp}(K∞, W*).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module`
- `SelmerIwasawaCohomology:L2/condition-propagation`
- `SelmerIwasawaCohomology:L2/dual-selmer-structure`
- `SelmerIwasawaCohomology:L2/selmer-kernel`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §3, Remark 3.6, pp. 28–29 (published Remark 2.3.6, p. 42). The data of the construction. Source excerpt: “Suppose that for every K ⊂f F ⊂ K∞ and every prime w dividing p we have subspaces H¹_f(F_w, V) ⊂ H¹(F_w, V) and H¹_f(F_w, V*) ⊂ H¹(F_w, V*) which are orthogonal complements under the pairing ⟨ , ⟩_F_w”
- `rubin-euler-systems-1999`, Ch. II §3, Remark 3.6, p. 29. The two modules verbatim. Source excerpt: “Define S(K∞, W*) = lim→ S(F, W*), H¹_∞,s(K_p, T) = lim← H¹_s(F_p, T).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Twisting Euler systems by characters of infinite order

`EulerSystemsAndKolyvaginSystems:ES.8/twisting-by-characters-of-gamma` — construction

**Statement.** Let c be an Euler system for (T, 𝒦, N) with K∞ ⊂ 𝒦 admissible, and ρ: Gal(𝒦/K) → O^× a continuous character factoring through a finite extension of K∞ (for instance a character of Γ, possibly of infinite order). Write T ⊗ ρ = T ⊗_O O_ρ, fix a generator ξ_ρ of O_ρ, and let Tw_ρ: Λ → Λ be the O-algebra automorphism induced by γ ↦ ρ(γ)γ. (a) For K ⊂_f L, the cocycle map induces isomorphisms H¹_∞(L, T) ⊗ ρ ≅ H¹_∞(L, T ⊗ ρ) and S_Σ(LK∞, W) ⊗ ρ ≅ S_Σ(LK∞, W ⊗ ρ) for every finite Σ ⊇ Σ_p (Rubin, Proposition VI.2.1). (b) Choose L ⊂ 𝒦 finite over K with ρ factoring through Gal(LK∞/K) and LK∞/K ramified only at N, ∞ and the conductor of ρ. For K ⊂_f F ⊂ 𝒦 let c^ρ_F be the image of c_{FL,∞} ⊗ ξ_ρ under H¹_∞(FL, T) ⊗ ρ ≅ H¹_∞(FL, T ⊗ ρ) → H¹(FL, T ⊗ ρ) → H¹(F, T ⊗ ρ), the last map being Cor_{FL/F}. Then c^ρ is an Euler system for (T ⊗ ρ, 𝒦, fN), f the finite prime-to-p part of the conductor of ρ, independent of L (Definition VI.3.1, Remark VI.3.2, Theorem VI.3.5).

**Hypotheses.**

- ρ must factor through a finite extension of K∞; if needed one enlarges K∞ to the compositum of all Z_p-extensions of K in 𝒦 (Rubin, Definition VI.3.1).
- There is in general no map H¹(L, T) → H¹(L, T ⊗ ρ) (Rubin, Remark VI.2.2): the construction must pass through H¹_∞.

**Construction.**

1. (a) Write LK∞ = ∪ L_n with ρ trivial modulo p^n on G_{L_n}; then H¹(L_n, T/p^n) ⊗ ρ ≅ H¹(L_n, (T⊗ρ)/p^n), and passing to the limit (Lemma B.3.1) gives the first isomorphism; for the Selmer groups one checks that the finite conditions at w ∤ p correspond, using that ρ is unramified at w ∤ p (Rubin, Proposition VI.2.1).
2. (b) The Euler relation for c^ρ follows from that of c and det(1 − Fr_q^{-1}x | (T⊗ρ)*) = P(Fr_q^{-1}|T*; ρ(Fr_q)x), the primes ramified in F'L but not in FL being those ramified in F' but not in F and not dividing fN (Rubin, Theorem VI.3.5).
3. Independence of L: for L ⊂ L', FL'/FL is unramified outside N, ∞ and the conductor of ρ, so Cor_{FL'/FL}(c_{FL'}) = c_{FL} (Remark VI.3.2).
4. For ρ of finite order, taking L the field cut out by ρ recovers ES.2's finite-order twist (Remark VI.3.4); and (c^ρ)^{ρ'} = c^{ρρ'} when every divisor of f_ρ f_{ρ'} divides f_{ρρ'}N (Lemma VI.3.6).

**Uses that determine the API.**

- Rubin, Theorem VI.4.1: Theorems II.3.2–II.3.4 for (T, c) are equivalent to those for (T ⊗ ρ, c^ρ)
- Rubin, Chapter VII §1, (1): twist so that X∞ ⊗ Λ_F and Λ_F/char(X∞)Λ_F are finite for every F
- Rubin, Chapter VII §3, (5): twist so that T and T* have no invariants under p-power subgroups of decomposition groups at primes dividing N
- Rubin, Chapter VI §5.3: the elliptic-unit Euler system twisted by ψε_cyc^{-1} gives an Euler system for T_p(E) of a CM elliptic curve

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.twistGamma` | constructor | c ↦ c^ρ, an Euler system for (T ⊗ ρ, 𝒦, fN). |
| `TauCeti.EulerSystem.twistGamma_eulerRelation` | characterisation | The Euler factors of c^ρ are P(Fr_q^{-1}\|(T⊗ρ)*; x) = P(Fr_q^{-1}\|T*; ρ(Fr_q)x). |
| `TauCeti.EulerSystem.twistGamma_twistGamma` | relation | (c^ρ)^{ρ'} = c^{ρρ'} when every divisor of f_ρ f_{ρ'} divides f_{ρρ'}N; in particular (c^ρ)^{ρ^{-1}} = c when f_ρ \| N. |
| `TauCeti.EulerSystem.twistGamma_of_finiteOrder` | compatibility | For ρ of finite order, c^ρ is ES.2's finite-order twist (Rubin, Definition II.4.1). |
| `TauCeti.EulerSystem.iwasawaCohomologyTwistEquiv` | equivalence | H¹_∞(L, T) ⊗ ρ ≅ H¹_∞(L, T ⊗ ρ), semilinear for Tw_ρ. |
| `TauCeti.EulerSystem.selmerTwistEquiv` | equivalence | S_Σ(LK∞, W) ⊗ ρ ≅ S_Σ(LK∞, W ⊗ ρ) for finite Σ ⊇ Σ_p, and the same for W*. |
| `TauCeti.EulerSystem.exists_good_twist` | other | (Rubin, Lemma VI.1.3) (i) For B free of finite rank over O and subgroups J_1, …, J_k of G_K with infinite image in Γ, the ρ ∈ Hom(Γ, O^×) with (B ⊗ ρ)^{J_i^{p^n}} = 0 for all i, n contain an open dense subset; (ii) for B a finitely generated torsion Λ-module, the ρ with (B ⊗ ρ) ⊗_Λ Λ_F finite for every F are dense. |
| `TauCeti.EulerSystem.twistGamma_tate` | compatibility | For K∞ the cyclotomic Z_p-extension, twisting by ω^{-n}ε_cyc^n agrees with SelmerIwasawaCohomology L3's twist of Iwasawa cohomology by Tate twists (Rubin, Chapter VI §5.1). |

**Unit tests.**

- `TauCeti.EulerSystem.twistGamma_one` (degenerate): For ρ = 1, c^ρ = c.
- `TauCeti.EulerSystem.twistGamma_eulerFactor_rank_one` (computation): For T = O(1), T* = O and P(Fr_q^{-1}|T*; x) = 1 − x; for T ⊗ ρ the Euler factor is 1 − ρ(Fr_q)x.
- `TauCeti.EulerSystem.twistGamma_not_pointwise` (non-example): For ρ nontrivial on G_F, c^ρ_F is not obtained from c_F alone: H¹(F, T) has no natural map to H¹(F, T ⊗ ρ) (Rubin, Remark VI.2.2); the definition through c_{FL,∞} is needed.
- `TauCeti.EulerSystem.twistGamma_finiteOrder_agrees` (compatibility): For ρ of finite order with L the field cut out by ρ, c^ρ equals the twist of Rubin's Definition II.4.1 owned by ES.2.

**Acceptance.**

- ρ = 1 gives c^1 = c.
- For rank-one T = O(1) the Euler factor of c^ρ at q is 1 − ρ(Fr_q)x.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.2/twisting`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `SelmerIwasawaCohomology:L3/iwasawa-cohomology`
- `PadicMeasuresIwasawaAlgebras:L1`

**Sources.**

- `rubin-euler-systems-1999`, Ch. VI, introduction, p. 89. The purpose of the construction. Source excerpt: “In this chapter we extend the methods of Chapter II §4 and show how to twist Euler systems by characters of infinite order. This will be used in Chapter VII when we prove Theorems II.3.2, II.3.3, and II.3.4”
- `rubin-euler-systems-1999`, Ch. VI §3, Theorem 3.5, p. 93. Part (b) verbatim (Rubin's K is the field 𝒦 here). Source excerpt: “Then the collection of classes {c^ρ_F ∈ H¹(F, T ⊗ ρ)} defined above is an Euler system for (T ⊗ ρ, K, fN) where f is the non-archimedean, non-p part of the conductor of ρ.”
- `rubin-euler-systems-1999`, Ch. VI §2, Proposition 2.1, p. 91. Part (a). Source excerpt: “The natural map on cocycles induces G_K-isomorphisms (i) H¹_∞(L, T) ⊗ ρ ≅ H¹_∞(L, T ⊗ ρ) (ii) S_Σ(LK∞, W) ⊗ ρ ≅ S_Σ(LK∞, W ⊗ ρ) if Σ is a finite set of primes of K containing all primes above p.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Invariance of the Iwasawa-theoretic statements under twisting

`EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems` — theorem

**Statement.** Let c be an Euler system for (T, K∞) and ρ: Γ → O^× a character, with c^ρ the twisted Euler system of twisting-by-characters-of-gamma. Then X∞(T ⊗ ρ) ≅ X∞(T) ⊗ ρ, Tw_ρ(char X∞(T ⊗ ρ)) = char X∞(T), Tw_ρ(ind_Λ(c^ρ)) = ind_Λ(c), and Hyp(K∞, T), Hyp(K∞, V), Hyp(K∞/K) hold for T iff they hold for T ⊗ ρ. Consequently Theorems II.3.2, II.3.3 and II.3.4 for (T, c) are equivalent to the same theorems for (T ⊗ ρ, c^ρ).

**Hypotheses.**

- ρ is a character of Γ = Gal(K∞/K), so G_{K∞} acts on T ⊗ ρ as on T.
- The equalities of characteristic ideals use that Tw_ρ preserves heights of ideals of Λ.

**Proof outline.**

1. The hypotheses depend only on the action of G_{K∞} (Rubin, proof of Theorem VI.4.1).
2. (W ⊗ ρ)* = W* ⊗ ρ^{-1}, so Proposition VI.2.1(ii) gives S_{Σp}(K∞, (W⊗ρ)*) ≅ S_{Σp}(K∞, W*) ⊗ ρ^{-1} and X∞(T ⊗ ρ) ≅ X∞(T) ⊗ ρ.
3. For a finitely generated torsion Λ-module B, f·(b ⊗ ξ_ρ) = (Tw_ρ(f)b) ⊗ ξ_ρ, so Tw_ρ(char(B ⊗ ρ)) = char(B) and Tw_ρ(Ann_Λ(B ⊗ ρ)) = Ann_Λ(B) (Rubin, Lemma VI.1.2; twisting of characteristic ideals is requested from PadicMeasuresIwasawaAlgebras L4).
4. The same identity applied to H¹_∞(K, T) ⊗ ρ ≅ H¹_∞(K, T ⊗ ρ) and c^ρ_{K,∞} = c_{K,∞} ⊗ ξ_ρ gives Tw_ρ(ind_Λ(c^ρ)) = ind_Λ(c).

**Acceptance.**

- Twisting by ρ and then by ρ^{-1} returns the original statements (for f_ρ | N).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/twisting-by-characters-of-gamma`
- `EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-index`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis`
- `PadicMeasuresIwasawaAlgebras:L4`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`

**Sources.**

- `rubin-euler-systems-1999`, Ch. VI §4, Theorem 4.1, p. 94. The statement verbatim. Source excerpt: “If ρ : Γ → O× is a character then Theorems II.3.2, II.3.3, and II.3.4 for T and c are equivalent to Theorems II.3.2, II.3.3, and II.3.4, respectively, for T ⊗ ρ and c^ρ”
- `rubin-euler-systems-1999`, Ch. VI §4, proof of Theorem 4.1, p. 94. The invariance of the hypotheses. Source excerpt: “The hypotheses Hyp(K∞, T), Hyp(K∞, V), and Hyp(K∞/K) depend only on the action of G_K∞ on T, so they are not affected by twisting by characters of Γ.”
- `rubin-euler-systems-1999`, Ch. VI §1, Lemma 1.2, p. 89. The twisting rule for characteristic ideals. Source excerpt: “If B is a finitely-generated torsion Λ-module and ρ : Γ → O× is a character, then B ⊗ ρ is a finitely-generated torsion Λ-module and (i) Tw_ρ(char(B ⊗ ρ)) = char(B), (ii) Tw_ρ(Ann_Λ(B ⊗ ρ)) = Ann_Λ(B).”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Kernels and cokernels of restriction along the tower

`EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower` — theorem

**Statement.** Let N be the ideal of an Euler system for (T, K∞) and assume, after twisting by a character of Γ (twisting-invariance-of-iwasawa-theorems), that for every prime λ | N the decomposition group of λ in G_K contains γ_λ with T^{γ_λ^{p^n}=1} = (T*)^{γ_λ^{p^n}=1} = 0 for all n ≥ 0. Define the ideals A_glob = Ann_Λ(W^{G_{K∞}}) if rank Γ > 1 and Ann_Λ(W^{G_{K∞}}/(W^{G_{K∞}})_div) if Γ ≅ Z_p, the local A_v (v | p, using K_{∞,w}; v ∤ p, using inertia), A_N = ∏_{v|N} A_vΛ, and A*_glob, A*_N with W* in place of W (Rubin, Definition VII.3.1); these ideals have height at least two. Then for K ⊂_f F ⊂ K∞ and M a power of p: (i) ker(H¹(F, W) → H¹(K∞, W)^{G_F}) is finite and killed by A_glob; (ii) ker(H¹(F, W_M) → H¹(F, W)_M) is finite, bounded independently of M, and killed by Ann_Λ(W^{G_{K∞}}); (iii) coker(S_{Σp}(F, W*) → S_{Σp}(K∞, W*)^{G_F}) is finite and killed by A*_glob A*_N; (iv) if S_{Σp}(K∞, W*)^{G_F} is finite, then for every power M ≥ M_F of p, A*_glob A*_N kills coker(S_{Σp}(F, W*_M) → S_{Σp}(K∞, W*)^{G_F}); (v) coker(S_{Σp}(F, W*_M) → S_{Σp}(F, W*)_M) is finite and bounded independently of M (Rubin, Proposition VII.3.4). Moreover H^i(K∞/F, W^{G_{K∞}}), H^i(K∞/F, (W*)^{G_{K∞}}) and the local H^i(K_{∞,w}/F_w, (W*)^{G_{K_{∞,w}}}) (w | p) are finite and killed by A_glob, A*_glob, A*_v respectively, for i ≥ 1 (Lemma VII.3.3).

**Hypotheses.**

- The twist assumption (5) is available by Lemma VI.1.3(i) applied to T ⊕ T*; Lemma VII.3.7 is proved without it.
- Pseudo-nullity here means annihilated by an ideal of height at least two; for d ≥ 2 a pseudo-null module need not be finite, but every error term in this theorem is moreover finite.

**Proof outline.**

1. Lemma VII.3.3: Γ is abelian, so the annihilator of W' kills H^i(G, W'); with f(x) = det(1 − γx | T ⊕ T*), f(γ̄^{-1}) kills W' and G acts trivially on H^i(G, W'), so f(1) ≠ 0 kills it and finiteness follows; for Γ ≅ Z_p, H^i(G, W'_div) = 0 for i ≥ 1 and the annihilator of W'/W'_div suffices.
2. (i) is inflation–restriction (ArithmeticGaloisDuality R02.2) with Lemma VII.3.3(i); (ii) is Lemma I.2.2(i): the kernel is W^{G_F}/MW^{G_F}, a quotient of W^{G_F}/(W^{G_F})_div.
3. (iii): the cokernel of restriction is killed by A*_glob (Lemma VII.3.3(ii)); since K∞/F is unramified outside p, the preimage of S_{Σp}(K∞, W*)^{G_F} lies in S^{Σ_pN}(F, W*), and the defect is controlled by ⊕_{w|p} H¹(F_{∞,w}/F_w, (W*)^{G_{F∞,w}}) ⊕ ⊕_{w|N, w∤p} H¹_ur(F_w, W*)/H¹_f(F_w, W*), killed by A*_v and finite by Lemma I.3.5(iii).
4. (iv) follows from (iii) since S_{Σp}(F, W*) = colim_M S_{Σp}(F, W*_M); (v): by Lemma I.5.4 the defect is a subquotient of ⊕_{w|p} (W*)^{G_{F_w}}/M(W*)^{G_{F_w}}, bounded by the finite group (W*)^{G_{F_w}}/((W*)^{G_{F_w}})_div.

**Acceptance.**

- Every error ideal has height ≥ 2, so the errors never affect characteristic ideals.
- For T = Z_p, so W* = μ_{p^∞}, the cokernel in (iii) for F = K is finite even though the twist assumption (5) fails for W, because it holds for W* (the case used in the proof of Lemma VII.3.7).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module`
- `EulerSystemsAndKolyvaginSystems:ES.8/twisting-by-characters-of-gamma`
- `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`
- `SelmerIwasawaCohomology:L2/lattice-passage`
- `SelmerIwasawaCohomology:L2/finite-unramified-comparison`
- `SelmerIwasawaCohomology:L2/selmer-limits`
- `mathlib:Ideal.height`

**Sources.**

- `rubin-euler-systems-1999`, Ch. VII §3, Proposition 3.4(iii), p. 107. Part (iii) verbatim. Source excerpt: “The cokernel of the restriction map S_Σp(F, W*) −→ S_Σp(K∞, W*)^G_F is finite and is annihilated by A*_glob A*_N.”
- `rubin-euler-systems-1999`, Ch. VII §3, Lemma 3.2, p. 106. The height statement. Source excerpt: “The ideals A_glob, A_N, A*_glob, and A*_N defined above have height at least two in Λ.”
- `rubin-euler-systems-1999`, Ch. VII §3, opening, pp. 105–106. The twist assumption (5). Source excerpt: “By Lemma VI.1.3(i) applied to T ⊕ T*, we may twist T by a character of Γ if necessary to assume that, in addition to (1), for every prime λ of K dividing N, the decomposition group of λ in G_K contains an element γ_λ”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### X∞ is finitely generated over Λ

`EulerSystemsAndKolyvaginSystems:ES.8/x-infinity-finitely-generated` — lemma

**Statement.** For every admissible K∞/K and every T, the Λ-module X∞ = Hom_O(S_{Σp}(K∞, W*), D) is finitely generated (Rubin, Lemma VII.4.1).

**Hypotheses.**

- No large-image hypothesis is needed.
- Rubin's proof uses Proposition VII.3.4(iii), stated after the twist (5); the twist does not change finite generation, since X∞(T⊗ρ) ≅ X∞(T) ⊗ ρ.

**Proof outline.**

1. X∞/JX∞ = Hom(S_{Σp}(K∞, W*)^{G_K}, D) for the augmentation ideal J (restricted-iwasawa-selmer-module).
2. By restriction-control-over-the-tower (iii) with F = K, S_{Σp}(K, W*) → S_{Σp}(K∞, W*)^{G_K} has finite cokernel, and Hom(S_{Σp}(K, W*), D) is finitely generated over O (Rubin, Lemma I.5.7(iii); SelmerIwasawaCohomology L2, selmer-limits), so X∞/JX∞ is finitely generated over O.
3. X∞ is compact, so topological Nakayama's lemma over Λ (requested from PadicMeasuresIwasawaAlgebras L5) gives finite generation.

**Acceptance.**

- For X∞ = 0 (T = Z_p(1) over Q∞) the statement is trivial; for T = O_{χ^{-1}}(1) over Q∞, X∞ is the χ-part of the Iwasawa module of the p-split unramified extension, a finitely generated torsion Λ-module.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module`
- `EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower`
- `EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems`
- `SelmerIwasawaCohomology:L2/selmer-limits`
- `PadicMeasuresIwasawaAlgebras:L5`

**Sources.**

- `rubin-euler-systems-1999`, Ch. VII §4, Lemma 4.1 and proof, p. 110. Statement and the Nakayama reduction. Source excerpt: “Lemma 4.1. X∞ is a finitely generated Λ module. Proof. Let J denote the augmentation ideal in Λ. Then X∞/JX∞ = Hom(S_Σp(K∞, W*)^G_K, D). Thus by Nakayama's Lemma, to prove the lemma we need only show”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Rubin's evaluation maps and the constant a_τ

`EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-evaluation-maps` — construction

**Statement.** Assume Hyp(K∞, V) and fix τ ∈ G_K as in Hyp(K∞, V)(i), fixing K(1), K∞, μ_{p^∞} and (O_K^×)^{1/p^∞}. Fix θ*: W*/(τ−1)W* ≅ D. Let Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞}), Ω∞ = K∞Ω and Ω∞^{⟨τ⟩} the fixed field of τ. The evaluation map Ev*: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W*), D) is Ev*(σ)([c]) = θ*(c(σ)). With q_τ(x) = det(1 − τx | T)/(x − 1) ∈ O[x], the dual θ: (W^{τ=1})_div ≅ D of θ* (extended to W^{τ=1}) and θ̄ = θ ∘ q_τ(τ^{-1}): W/(τ−1)W ↠ D, the map Ev: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W), D) is Ev(σ)([c]) = θ̄(c(σ)); for q ∈ R_{F,M,τ} (primes whose Frobenius is conjugate to τ in Gal(FΩ_M/K)), Ev_q(c) = θ(c(σ_q)). Their Λ_{F,M}-valued forms Ev~ are the images under the O-isomorphism Hom_O(B, O/M) ≅ Hom_Λ(B, Λ_{F,M}), ψ ↦ Σ_η ψ(ηb)η^{-1}. Finally a_τ = [W^{τ=1} : (W^{τ=1})_div] · max{|Z|, |Z*|}, where Z (resp. Z*) is the largest G_{K∞}-stable submodule of (τ−1)W (resp. (τ−1)W*) (Rubin, Definitions VII.1.1, 1.2, 2.1–2.5).

**Hypotheses.**

- The extension of θ to W^{τ=1} is not unique; two choices differ by an element of Hom(W^{τ=1}/(W^{τ=1})_div, D), which a_τ kills.
- Ev and Ev* are not Λ-module maps: G_{Ω∞} is not a Λ-module. They are equivariant only for an action of Z_p[[Γ_0]] on Gal(L/Ω∞), Γ_0 ⊂ Γ of finite index, twisted by characters χ, χ* (Rubin, Proposition VII.5.1).

**Construction.**

1. Ev* is well defined: σ ∈ G_{Ω∞^{⟨τ⟩}} acts on W* through Gal(Ω∞/Ω∞^{⟨τ⟩}), topologically generated by τ, so (σ−1)W* ⊂ (τ−1)W* = ker θ*; the cocycle relation makes it a homomorphism.
2. a_τ is finite: an infinite Z (resp. Z*) would give a proper G_{K∞}-stable subspace of V (resp. V*), against Hyp(K∞, V)(ii), and [W^{τ=1} : (W^{τ=1})_div] is finite since W has finite corank (Lemma VII.1.3(i)).
3. Under Hyp(K∞, T), irreducibility of T/ϖT forces Z = Z* = 0 and W^{τ=1} is divisible (Proposition A.2.5), so a_τ = 1 (Lemma VII.1.3(ii)).
4. Lemma VII.2.4: composition with Σ a_η η ↦ a_1 inverts ψ ↦ ψ~, and (σψ)~ = σ^{-1}ψ~, so the bijection is not Λ_{F,M}-linear.
5. Relations used in Propositions VII.1.4–1.6 and Theorem II.3.2 (proved from ES.3's Theorems IV.5.1 and IV.5.4 and SelmerIwasawaCohomology L2's Theorem I.7.3): Ev~(Fr_q)(κ_{F,r,M}) = Ev~_q(κ_{F,rq,M}) (Theorem VII.2.6) and a_τ Ev~_q(S^{Σ_prq}(F, W_M)) Ev*(Fr_q) = 0 on S_{Σ_pr}(F, W*_M) (Theorem VII.2.7), whence a_τ Ev~(γ)(κ_{F,r,M}) Ev*(γ) = 0 for γ ∈ τG_{Ω∞} (Corollary VII.2.8).

**Uses that determine the API.**

- Rubin, Chapter VII §4 (proof of Theorem II.3.2): elements γ with Ev*(γ) non-torsion produce a nonzero annihilator, through Corollary VII.2.8
- Rubin, Proposition VII.1.4: the generators z_k of X∞ are chosen in Ev*(τG_{Ω∞})
- Rubin, Proposition VII.1.6 and Theorem VII.1.9: the induction loses a_τ^5 at each step, giving char(X∞) | a_τ^{5r} ind_Λ(c)

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.evalStar` | constructor | Ev*: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W*), D), σ ↦ ([c] ↦ θ*(c(σ))). |
| `TauCeti.EulerSystem.eval` | constructor | Ev: G_{Ω∞^{⟨τ⟩}} → Hom(H¹(K∞, W), D), σ ↦ ([c] ↦ θ̄(c(σ))). |
| `TauCeti.EulerSystem.evalAt` | constructor | Ev_q: H¹(F, W)_M → D for q ∈ R_{F,M,τ}, c ↦ θ(c(σ_q)). |
| `TauCeti.EulerSystem.aTau` | data | a_τ = [W^{τ=1} : (W^{τ=1})_div] · max{\|Z\|, \|Z*\|} ∈ Z_{>0}. |
| `TauCeti.EulerSystem.aTau_eq_one` | simp | Under Hyp(K∞, T), a_τ = 1. |
| `TauCeti.EulerSystem.groupRingDualEquiv` | equivalence | Hom_O(B, O/MO) ≅ Hom_Λ(B, Λ_{F,M}) as O-modules, ψ ↦ (b ↦ Σ_η ψ(ηb)η^{-1}), with (σψ)~ = σ^{-1}ψ~. |
| `TauCeti.EulerSystem.eval_frobenius_derivative` | relation | Ev~(Fr_q)(κ_{F,r,M}) = Ev~_q(κ_{F,rq,M}) for r ∈ R_{F,M} and q ∈ R_{F,M,τ} prime to r (Rubin, Theorem VII.2.6). |
| `TauCeti.EulerSystem.eval_pairing` | relation | a_τ Ev~_q(S^{Σ_prq}(F, W_M)) · Ev*_{S_{Σ_pr}(F, W*_M)}(Fr_q) = 0, and a_τ Ev~(γ)(κ_{F,r,M}) Ev*(γ) = 0 for γ ∈ τG_{Ω∞} (Rubin, Theorem VII.2.7, Corollary VII.2.8). |
| `TauCeti.EulerSystem.eval_semilinear` | other | There are Γ_0 ⊂ Γ of finite index, characters χ, χ*: Γ_0 → O^× and an abelian L ⊃ Ω∞ such that Ev, Ev* factor through Gal(L/Ω∞) and Ev(γ^η) = χ(η)η(Ev(γ)), Ev*(γ^η) = χ*(η)η(Ev*(γ)) (Rubin, Proposition VII.5.1). |

**Unit tests.**

- `TauCeti.EulerSystem.aTau_rank_one` (degenerate): For rank_O T = 1 and τ = 1: W^{τ=1} = W is divisible and (τ−1)W = 0, so a_τ = 1.
- `TauCeti.EulerSystem.aTau_unipotent_lower_bound` (computation): For T = O² with τ acting by the matrix (1 ϖ^m; 0 1), m ≥ 1: W^{τ=1} = D ⊕ D[ϖ^m], (W^{τ=1})_div = D ⊕ 0, so [W^{τ=1} : (W^{τ=1})_div] = |k|^m divides a_τ; here T/(τ−1)T ≅ O ⊕ O/ϖ^m is not free, so Hyp(K∞, T)(i) fails although dim V/(τ−1)V = 1.
- `TauCeti.EulerSystem.evalStar_wellDefined` (characterisation): Ev*(σ) does not depend on the cocycle representing [c]: changing c by a coboundary changes c(σ) by (σ−1)w ∈ (τ−1)W* = ker θ*.
- `TauCeti.EulerSystem.eval_not_Lambda_linear` (non-example): Ev is not Λ-linear for the naive action: for η ∈ Γ_0, Ev(γ^η) = χ(η)η(Ev(γ)) with the character χ of Proposition VII.5.1, which is nontrivial when the centre of Gal(K(W)/K) acts on W by a nontrivial scalar.

**Acceptance.**

- Rank one with τ = 1: a_τ = 1.
- For T = O² with τ acting by (1 ϖ^m; 0 1), m ≥ 1, |k|^m divides a_τ.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.3/congruence`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`

**Sources.**

- `rubin-euler-systems-1999`, Ch. VII §1, Definition 1.2, p. 98. The constant a_τ verbatim. Source excerpt: “Define a positive integer a_τ by a_τ = [W^{τ=1} : (W^{τ=1})_div] · max{|Z|, |Z*|} where (W^{τ=1})_div is the maximal divisible subgroup of W^{τ=1}, and Z (resp. Z*) is the unique maximal G_K∞-stable submodule of (τ − 1)W (resp. (τ − 1)W*).”
- `rubin-euler-systems-1999`, Ch. VII §1, Lemma 1.3, p. 98. Finiteness and the integral case. Source excerpt: “(i) a_τ is finite. (ii) If T and τ satisfy hypotheses Hyp(K∞, T) then a_τ = 1.”
- `rubin-euler-systems-1999`, Ch. VII §1, Definition 1.1, p. 97. The map Ev*. Source excerpt: “There is a natural evaluation homomorphism Ev* : G_Ω∞^⟨τ⟩ → Hom(H¹(K∞, W*), D), defined by Ev*(σ)([c]) = θ*(c(σ))”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2)

`EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system` — theorem

**Planet:** Weak Leopoldt from an Euler system.

**Statement.** Let K∞/K be admissible, c an Euler system for (T, K∞), and suppose V satisfies Hyp(K∞, V). If c_{K,∞} does not belong to the Λ-torsion submodule of H¹_∞(K, T), then X∞ is a torsion Λ-module.

**Hypotheses.**

- No hypothesis on p (p = 2 allowed) and no Hyp(K∞/K) are needed.
- The conclusion is the weak Leopoldt conjecture for T (Rubin, Remark II.3.5).
- Non-torsion of c_{K,∞} is a hypothesis to be proved by each application (for instance Kato's Proposition 13.7 in KatoEulerSystems L4); this roadmap does not supply it.

**Proof outline.**

1. X∞ is finitely generated (x-infinity-finitely-generated). Suppose it is not torsion. H¹(Ω∞/K∞, W*) is Λ-torsion (Rubin, Corollary C.2.2 with F = K∞; finiteness and character-type of H¹(Ω/F, W) for p-adic analytic Galois groups, the Appendix C input of ES.4), so by Lemma VII.3.6(iii) some γ_0 ∈ G_{Ω∞} has Ev*(γ_0) ∉ (X∞)_tors; the set J = {γ ∈ τG_{Ω∞} : Ev*(γ) ∉ (X∞)_tors} is nonempty and open, and generates a group containing an open subgroup of G_{Ω∞} (Lemma VII.4.2).
2. For γ ∈ J, every F and M, Corollary VII.2.8 gives a_τ Ev~(γ)(κ_{F,M}) Ev*(γ) = 0 with κ_{F,M} = κ_{F,1,M} the image of c_F (ES.3, Lemma IV.4.13). The Ev~(γ)(κ_{F,M}) are compatible under restriction and form an element λ_γ of lim Λ_{F,M} = Λ with a_τ λ_γ Ev*(γ) = 0; since Ev*(γ) is not torsion and a_τ ≠ 0, λ_γ = 0. As J generates a group containing an open subgroup of G_{Ω∞}, which has finite index, and Λ is torsion-free, Ev(γ)(κ_{F,M}) = 0 for every γ ∈ G_{Ω∞}, every F and every M.
3. By Lemma VII.3.6(i), a_τ Ann_Λ(H¹(Ω∞/K∞, W)) kills the image of κ_{F,M} in H¹(K∞, W); by restriction-control-over-the-tower (i), (ii) a fixed integer m kills m·Ann_Λ(H¹(Ω∞/K∞, W))κ_{F,M} for all M, so m·Ann(H¹(Ω∞/K∞, W))c_F is divisible in H¹(F, T), hence 0 (Proposition B.2.4: H¹(F, T) has no nonzero divisible elements).
4. Controlling H¹(F, T)_tors by Lemma I.2.2(ii), the nonzero ideal Ann_Λ(W^{G_{K∞}})Ann_Λ(H¹(Ω∞/K∞, W)) kills c_{K,∞}, contradicting non-torsion.

**Acceptance.**

- For the cyclotomic-unit Euler system for O_{χ^{-1}}(1) over Q∞, χ even, nontrivial and of finite order prime to p (Rubin, Chapter III §2.2), the hypothesis holds and X∞ is torsion.
- The zero Euler system does not satisfy the hypothesis, and the theorem says nothing about it.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/x-infinity-finitely-generated`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-evaluation-maps`
- `EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`
- `ArithmeticGaloisDuality:R02.1/rationalization`
- `mathlib:Module.IsTorsion`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §3, Theorem 3.2, p. 28 (published Theorem 2.3.2, p. 41). The statement verbatim. Source excerpt: “Theorem 3.2. Suppose c is an Euler system for (T, K∞), and V satisfies Hyp(K∞, V). If c_K,∞ does not belong to the Λ-torsion submodule of H¹_∞(K, T) then X∞ is a torsion Λ-module.”
- `rubin-euler-systems-1999`, Ch. VII §4, opening, p. 110. The structure of the proof. Source excerpt: “The general idea is that if c ∉ H¹_∞(K, T)_tors, then we can use Corollary 2.8 to construct a nonzero annihilator of X∞, and hence X∞ is Λ-torsion.”
- `rubin-euler-systems-1999`, Ch. II §3, Remark 3.5, p. 28. Its name. Source excerpt: “The assertion that X∞ is a torsion Λ-module is called the weak Leopoldt conjecture for T.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### The rank-one exceptional actions (Rubin, Lemma VII.3.7)

`EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case` — lemma

**Statement.** Suppose Γ ≅ Z_p and either K is imaginary quadratic or K is totally real and Leopoldt's conjecture holds for K, and that Hyp(K∞, V) holds. (i) If G_{K∞} acts trivially on T, then X∞/Ann_Λ(T)X∞ is finite. (ii) If G_{K∞} acts trivially on T(−1) = T ⊗ O(ε_cyc^{-1}), then X∞/Ann_Λ(T(−1))X∞ is finite.

**Hypotheses.**

- These are exactly the cases singled out by Hyp(K∞/K).
- Hyp(K∞, V)(ii) forces rank_O T = 1 in both cases, with T a twist of O or O(1) by a character of Γ.
- The lemma is proved without the twist assumption (5) of restriction-control-over-the-tower, which may fail for W = Q_p/Z_p; it holds for W* and Proposition VII.3.4(iii) is still available.

**Proof outline.**

1. Both statements are invariant under twisting by characters of Γ (X∞ ↦ X∞ ⊗ ρ and Ann_Λ ↦ Tw_{ρ^{-1}}(Ann_Λ), Lemma VI.1.2), so one may take T = O, resp. O(1), and O = Z_p; then the claim is that X∞/JX∞ is finite, J the augmentation ideal.
2. T = Z_p(1): W* = Q_p/Z_p and X∞ = Gal(L∞/K∞), L∞ the maximal abelian p-extension of K∞ unramified everywhere and split completely above p; X∞/JX∞ = Gal(L/K∞) with L the maximal subextension abelian over K, finitely generated. If K is totally real with Leopoldt, K has no Z_p²-extension; if K is imaginary quadratic, no prime above p is infinitely split in its Z_p²-extension; either way L/K∞ is finite.
3. T = Z_p: W* = μ_{p^∞}; by restriction-control-over-the-tower (iii) the map S_{Σp}(K, μ_{p^∞}) → S_{Σp}(K∞, μ_{p^∞})^{G_K} = Hom(X∞/JX∞, Q_p/Z_p) has finite cokernel, and S_{Σp}(K, μ_{p^∞}) is finite by Leopoldt's conjecture (Rubin, Corollary I.6.4, planned in SelmerIwasawaCohomology L4).

**Acceptance.**

- K = Q, K∞ = Q∞, T = Z_p(1): X∞ = 0, so the quotient is 0.
- Without Hyp(K∞/K) (a field with r_2 ≥ 1 not imaginary quadratic, T = Z_p(1)) the quotient X∞/JX∞ can be infinite, since K has a Z_p²-extension in which the primes above p are not infinitely split.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis`
- `EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module`
- `EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower`
- `EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems`
- `SelmerIwasawaCohomology:L4`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`

**Sources.**

- `rubin-euler-systems-1999`, Ch. VII §3, Lemma 3.7, p. 109. Statement (i) verbatim; (ii) is the same for T(−1). Source excerpt: “Suppose Γ ≅ Zp, and either K is imaginary quadratic or K is totally real and Leopoldt's conjecture holds for K. (i) If G_K∞ acts trivially on T then X∞/Ann_Λ(T)X∞ is finite.”
- `rubin-euler-systems-1999`, Ch. VII §3, proof of Lemma 3.7, p. 109. The Leopoldt step. Source excerpt: “If K is totally real and Leopoldt's conjecture holds for K, then K has no extension with Galois group Z_p², so L/K∞ is finite.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Selmer sequences, Kolyvagin sequences and the inductive step (Rubin, Propositions VII.1.4 and VII.1.6)

`EulerSystemsAndKolyvaginSystems:ES.8/kolyvagin-sequence-induction` — theorem

**Statement.** Assume Hyp(K∞, V) and Hyp(K∞/K), c an Euler system for (T, K∞) with c_{K,∞} not Λ-torsion, so X∞ is torsion (weak-leopoldt-from-an-euler-system), and assume after twisting (twisting-invariance-of-iwasawa-theorems) that X∞ ⊗ Λ_F and Λ_F/char(X∞)Λ_F are finite for every F (Rubin's (1)) and that the twist assumption (5) of restriction-control-over-the-tower holds. Fix an injective pseudo-isomorphism ⊕_{i=1}^{r} Λ/f_iΛ → X∞ with f_{i+1} | f_i, so char(X∞) = ∏ f_iΛ. (a) There are z_1, …, z_r ∈ X∞ and ideals g_1 ⊂ … ⊂ g_r of Λ with z_k ∈ Ev*(τG_{Ω∞}), a_τ g_k ⊂ f_kΛ, split exact sequences 0 → Σ_{i<k} Λz_i → Σ_{i≤k} Λz_i → Λ/g_k → 0, and a_τ(X∞/Σ_i Λz_i) pseudo-null (Proposition VII.1.4). (b) With Z∞ = Σ Λz_i, a Selmer sequence of length k is (σ_1, …, σ_k) in τG_{Ω∞} with Ev*(σ_i) − z_i ∈ 𝔐Z∞; for M a power of p, L_{F,M} is the fixed field of the common kernel of S_{Σp}(F, W*_M) restricted to FΩ_M, and a Kolyvagin sequence for F, M is (Q_1, …, Q_k) with Q_i over q_i ∈ R and Fr_{Q_i} = σ_i on L_{F,M}; Ψ(k, F, M) ⊂ Λ_{F,M} is the ideal generated by all ψ(κ_{F,r(π),M}), π of length k, ψ ∈ Hom_Λ(Λ_{F,M}κ_{F,r(π),M}, Λ_{F,M}) (Definition VII.1.5). (c) There is h ∈ Λ prime to char(X∞) and, for every F, a power N_F of p such that h a_τ^5 Ψ(k, F, MN_F)Λ_{F,M} ⊂ f_{k+1}Ψ(k+1, F, M) for every power M ≥ N_F of p and 0 ≤ k < r (Proposition VII.1.6).

**Hypotheses.**

- Kolyvagin sequences exist by the Chebotarev density theorem applied to the finite extensions L_{F,M}/K (EulerSystemsAndKolyvaginSystems ES.1); r(π) ∈ R_{F,M} (Lemma IV.1.3).
- In the common special case Hyp(K∞, T), O = Z_p and H¹(Ω∞/K∞, W*) = 0, (a) holds with g_i = f_iΛ and any z_i realising the pseudo-isomorphism (Rubin, §6, first paragraph).
- Pseudo-null means annihilated by an ideal of height at least two; for d ≥ 2 such modules need not be finite.

**Proof outline.**

1. (a), Proposition VII.5.1: there are Γ_0 ⊂ Γ of finite index, characters χ, χ*: Γ_0 → O^× and an abelian L ⊃ Ω∞ with an action of Z_p[[Γ_0]] on Gal(L/Ω∞) for which Ev and Ev* are Tw_χ-, Tw_{χ*}-semilinear.
2. Proposition VII.5.2: for X' ⊂ X∞ with pseudo-null quotient there is an ideal A' of height ≥ 2 with A' a_τ Ann_Λ(W^{G_{K∞}})^ι Ann_Λ(H¹(Ω∞/K∞, W))^ι Hom(H¹(F, W_M), D) ⊂ O·Ev((Ev*)^{-1}(X') ∩ G_{Ω∞}); for Γ ≅ Z_p the quotient is finite and the proof is short.
3. §6: char(X∞) is relatively prime (the sum of the two ideals has height at least two) to Ann_Λ(W^{G_{K∞}}), Ann_Λ(H¹(Ω∞/K∞, W)) and Ann_Λ(H¹(Ω∞/K∞, W*))^ι (Lemma 6.1, using rank-one-leopoldt-case); Lemma 6.3, applied to X_0 = ΛEv*(τ) + ΛEv*(G_{Ω∞}) with t = Ev*(τ) and B_0 = Ev*(G_{Ω∞}), gives x_1 ∈ t + B_0 and x_2, …, x_r ∈ B_0, and z_1 = x_1, z_i = x_1 + x_i (i ≥ 2) lie in Ev*(τG_{Ω∞}) with the stated divisibilities.
4. (c), §7: for a Selmer sequence σ, Z_σ = Σ ΛEv*(σ_i) ≅ ⊕ Λ/g_iΛ is a direct summand of Z∞ (Lemma 7.1, by Nakayama); Ann_Λ(X∞/Z∞) kills ker(Z_σ ⊗ Λ_{F,M} → X∞ ⊗ Λ_{F,M}) (Proposition 7.2); Theorems VII.2.6–2.7 compare Ev~_q(κ_{F,rq,M}) with Ev~(Fr_q)(κ_{F,r,M}) (Corollary 7.3, Lemma 7.4, Proposition 7.5, Corollary 7.6); a two-prime Chebotarev choice through Proposition 5.2 gives the divisibility by f_{k+1} up to h a_τ^5 (Proposition 7.7).

**Acceptance.**

- Rank one, Hyp(K∞, T), O = Z_p and H¹(Ω∞/K∞, W*) = 0: g_i = f_iΛ and a_τ = 1.
- r = 0 (X∞ pseudo-null): nothing to induct; char(X∞) = Λ.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-evaluation-maps`
- `EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower`
- `EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems`
- `EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case`
- `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.3/congruence`
- `PadicMeasuresIwasawaAlgebras:L4/pseudo-null`
- `PadicMeasuresIwasawaAlgebras:L4/torsion-structure-normal-domain`
- `PadicMeasuresIwasawaAlgebras:L4`

**Sources.**

- `rubin-euler-systems-1999`, Ch. VII §1, Proposition 1.6, p. 100. Part (c) verbatim. Source excerpt: “There is an element h ∈ Λ relatively prime to char(X∞), and for every K ⊂f F ⊂ K∞ there is a power N_F of p, such that if K ⊂f F ⊂ K∞, M ≥ N_F is a power of p, and 0 ≤ k < r, then h a_τ^5 Ψ(k, F, MN_F)Λ_F,M ⊂ f_k+1 Ψ(k + 1, F, M).”
- `rubin-euler-systems-1999`, Ch. VII §1, Proposition 1.4, pp. 98–99. Part (a). Source excerpt: “There are elements z1, . . . , zr ∈ X∞ and ideals g1, . . . , gr ⊂ Λ such that for 1 ≤ k ≤ r (i) z_k ∈ Ev*(τG_Ω∞), (ii) a_τ g_k ⊂ f_kΛ and, if k < r, g_k ⊂ g_k+1”
- `rubin-euler-systems-1999`, Ch. VII §1, after Proposition 1.6, p. 100. Its role. Source excerpt: “Proposition 1.6 is the key to the proofs of Theorems II.3.3 and II.3.4; it will be proved in §7.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### The error-tolerant Iwasawa bound char(X∞) | a_τ^{5r} ind_Λ(c) (Rubin, Theorem VII.1.9)

`EulerSystemsAndKolyvaginSystems:ES.8/characteristic-ideal-bound-with-error` — theorem

**Statement.** Let K∞/K be admissible, c an Euler system for (T, K∞), and assume Hyp(K∞, V) and Hyp(K∞/K). Let r be the number of elementary divisors of X∞ (with r = 0 if X∞ is pseudo-null) and a_τ the constant of iwasawa-evaluation-maps. Then char(X∞) divides a_τ^{5r} ind_Λ(c), that is, a_τ^{5r} ind_Λ(c) ⊂ char(X∞).

**Hypotheses.**

- If c_{K,∞} is Λ-torsion then ind_Λ(c) = 0 and there is nothing to prove; otherwise X∞ is torsion by weak-leopoldt-from-an-euler-system and r is finite.
- The error a_τ^{5r} is an explicit integer: this is the Iwasawa-theoretic counterpart of ES.4's error-tolerant interface, and it disappears exactly when a_τ = 1, e.g. under Hyp(K∞, T).

**Proof outline.**

1. Reduction: by twisting-invariance-of-iwasawa-theorems one may twist by a character of Γ so that Rubin's assumptions (1) and (5) hold; this changes neither a_τ (τ ∈ G_{K∞} acts on W ⊗ ρ as on W, and G_{K∞}-stable submodules are unchanged) nor r (Tw_ρ is a ring automorphism of Λ preserving elementary divisors), and Tw_ρ fixes the integer a_τ^{5r}, so the bound for (T ⊗ ρ, c^ρ) gives it for (T, c).
2. Corollary VII.1.7: for Σ ⊇ Σ_p ∪ {primes where T ramifies} ∪ {∞} and ψ ∈ Hom_Λ(H¹(K_Σ/F, T), Λ_F), h^r a_τ^{5r} ψ(c_F) ∈ char(X∞)Λ_F: iterate Proposition VII.1.6 r times from Ψ(0, F, M') ∋ ψ̄(κ_{F,1,M'}) (κ_{F,1,M'} is the image of c_F, Lemma IV.4.13) to Ψ(r, F, M) ⊂ (∏ f_i)Λ_{F,M}, and let M grow.
3. Lemma VII.1.8: for G finite abelian, R a principal ideal domain, B a finitely generated R[G]-module without R-torsion and f ∈ R[G] not a zero-divisor, if every ψ(b), ψ ∈ Hom_{R[G]}(B, R[G]), lies in fR[G], then b ∈ fB.
4. Apply it with B = H¹(K_Σ/F, T)/torsion (finitely generated over Z_p, Proposition B.2.7) and b = h^r a_τ^{5r} c_F; pass to the limit over F, the torsion being killed by Ann_Λ(W^{G_{K∞}}) (Lemma I.2.2(ii)), to get h^r a_τ^{5r} c_{K,∞} ∈ char(X∞)(H¹_∞(K, T)/H¹_∞(K, T)_tors), hence h^r a_τ^{5r} φ(c_{K,∞}) ∈ char(X∞) for every φ.
5. Since h is prime to the principal ideal char(X∞), a_τ^{5r} φ(c_{K,∞}) ∈ char(X∞).

**Acceptance.**

- Under Hyp(K∞, T), a_τ = 1 and the bound is char(X∞) | ind_Λ(c) (rubin-iwasawa-divisibility).
- In the example of iwasawa-evaluation-maps with τ = (1 ϖ^m; 0 1), a_τ is divisible by |k|^m, so the bound char(X∞) | a_τ^{5r} ind_Λ(c) is a divisibility only up to a power of p that is at least |k|^{5mr}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/kolyvagin-sequence-induction`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-index`
- `EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`
- `SelmerIwasawaCohomology:L3/universal-norms-unramified`

**Sources.**

- `rubin-euler-systems-1999`, Ch. VII §1, Theorem 1.9, p. 101. The statement verbatim. Source excerpt: “Theorem 1.9. With notation and assumptions as above, char(X∞) divides a_τ^{5r} ind_Λ(c).”
- `rubin-euler-systems-1999`, Ch. VII §1, Lemma 1.8, p. 101. The divisibility lemma of the proof. Source excerpt: “Suppose G is a finite abelian group, R is a principal ideal domain, and B is finitely generated R[G]-module with no R-torsion. If f ∈ R[G] is not a zero-divisor, b ∈ B, and {ψ(b) : ψ ∈ Hom_R[G](B, R[G])} ⊂ fR[G], then b ∈ fB.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Rubin's Iwasawa divisibility char(X∞) | ind_Λ(c) (Theorem II.3.3)

`EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility` — theorem

**Planet:** Rubin's Iwasawa divisibility.

**Statement.** Let K∞/K be admissible and c an Euler system for (T, K∞). If T satisfies Hyp(K∞, T) and Hyp(K∞/K), then char(X∞) divides ind_Λ(c), i.e. ind_Λ(c) ⊂ char(X∞).

**Hypotheses.**

- Rubin's convention: char(X∞) = 0 when X∞ is not torsion; if c_{K,∞} is torsion both sides are 0.
- Integral divisibility needs Hyp(K∞, T); under only Hyp(K∞, V) one gets rubin-rational-iwasawa-divisibility.
- Valid for every d ≥ 1 and also for p = 2 (Rubin, after Corollary III.2.4, as used in EulerSystemsCyclotomicMainConjecture); for d ≥ 2 divisibility of characteristic ideals ignores pseudo-null modules, which need not be finite.
- This is a divisibility only; equality needs the separately sourced primitivity or main-conjecture arguments of the consumers.

**Proof outline.**

1. By Lemma VII.1.3(ii), a_τ = 1 under Hyp(K∞, T); apply characteristic-ideal-bound-with-error (Rubin, proof of Theorems II.3.3 and II.3.4 at the end of VII §1).

**Acceptance.**

- Cyclotomic units (EulerSystemsCyclotomicMainConjecture L2): T* = O_{χ^{-1}}(1) satisfies Hyp(Q∞, T*) with τ = 1 and Hyp(Q∞/Q) since K = Q.
- Scaling c by λ ∈ Λ multiplies ind_Λ(c) by λ, so the divisibility for λc is weaker; it cannot certify more than for c.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/characteristic-ideal-bound-with-error`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-index`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §3, Theorem 3.3, p. 28 (published Theorem 2.3.3, p. 42). The statement verbatim. Source excerpt: “Theorem 3.3. Suppose c is an Euler system for (T, K∞), and T satisfies hypotheses Hyp(K∞, T) and Hyp(K∞/K). Then char(X∞) divides ind_Λ(c).”
- `rubin-euler-systems-1999`, Ch. VII §1, end, pp. 101–102. The deduction from Theorem VII.1.9. Source excerpt: “If in addition hypotheses Hyp(K∞, T) are satisfied then a_τ = 1 by Lemma 1.3(ii), and Theorem II.3.3 follows as well.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Divisibility up to a power of p (Rubin, Theorem II.3.4)

`EulerSystemsAndKolyvaginSystems:ES.8/rubin-rational-iwasawa-divisibility` — theorem

**Statement.** Let K∞/K be admissible and c an Euler system for (T, K∞). If V satisfies Hyp(K∞, V) and Hyp(K∞/K), then there is an integer t ≥ 0 such that char(X∞) divides p^t ind_Λ(c).

**Hypotheses.**

- t is effective: t can be taken with p^t = a_τ^{5r} up to a unit (Theorem VII.1.9).
- At height-one primes 𝔓 ≠ ϖΛ (the only height-one prime containing p) this gives length_{Λ_𝔓}((X∞)_𝔓) ≤ ord_𝔓(ind_Λ(c)), the form in which KatoEulerSystems L4 states its imported bound.

**Proof outline.**

1. a_τ is a finite positive integer by Lemma VII.1.3(i); apply characteristic-ideal-bound-with-error and take p^t the p-part of a_τ^{5r} (the prime-to-p part is a unit of Λ).

**Acceptance.**

- With Hyp(K∞, T), t = 0 recovers Theorem II.3.3.
- For T = O² with τ = (1 ϖ^m; 0 1), V irreducible over G_{K∞} and Hyp(K∞/K), the theorem applies although Hyp(K∞, T) fails.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/characteristic-ideal-bound-with-error`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §3, Theorem 3.4, p. 28 (published Theorem 2.3.4, p. 42). The statement verbatim. Source excerpt: “Theorem 3.4. Suppose c is an Euler system for (T, K∞), and V satisfies hypotheses Hyp(K∞, V) and Hyp(K∞/K). Then there is a nonnegative integer t such that char(X∞) divides p^t ind_Λ(c).”
- `rubin-euler-systems-1999`, Ch. VII §1, end, p. 102. The deduction. Source excerpt: “Lemma 1.3(i) shows that a_τ is a (finite) positive integer, so Theorem II.3.4 is immediate from Theorem 1.9.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### The Iwasawa Poitou–Tate sequence (Rubin, Proposition II.3.7)

`EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-poitou-tate-sequence` — theorem

**Statement.** With the data of true-iwasawa-selmer-and-singular-quotient there is an exact sequence of Λ-modules 0 → H¹_{∞,s}(K_p, T)/loc^s_{Σp}(H¹_∞(K, T)) → Hom_O(S(K∞, W*), D) → X∞ → 0.

**Hypotheses.**

- No hypothesis on T or on an Euler system is needed.
- It uses that H¹_∞(K, T) = lim_F S^{Σp}(F, T), which needs admissibility (every v ∤ p has infinite decomposition group).

**Proof outline.**

1. H¹_∞(K, T) = lim_F S^{Σp}(F, T) (Rubin, Corollary B.3.5; SelmerIwasawaCohomology L3, universal-norms-unramified (ii)–(iii)).
2. For each F and M, Corollary I.7.5 (SelmerIwasawaCohomology L2, selmer-structure-poitou-tate) gives S(F, W*)/S_{Σp}(F, W*) ≅ Hom_O(coker(loc^s_{Σp}: S^{Σp}(F, T) → H¹_s(F_p, T)), D).
3. Pass to the direct limit over F and apply Hom_O(·, D); exactness of Pontryagin duality turns the colimit of the Selmer sequences into the limit of the local cokernels.

**Acceptance.**

- If H¹_f = H¹ at p, the left term vanishes and Hom(S(K∞, W*), D) = X∞.
- For T* = O_{χ^{-1}}(1) over Q∞ with the unit condition, the left term is a quotient of Y∞^χ/U∞^χ, which is O if χ(p) = 1 and 0 otherwise.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/true-iwasawa-selmer-and-singular-quotient`
- `EulerSystemsAndKolyvaginSystems:ES.8/restricted-iwasawa-selmer-module`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`
- `SelmerIwasawaCohomology:L3/universal-norms-unramified`
- `mathlib:PontryaginDual`

**Sources.**

- `rubin-euler-systems-2000`, Ch. 2 §3, Proposition 2.3.7 and proof, pp. 42–43. The proof in the published text (the 1999 draft cites Corollary B.3.4 here). Source excerpt: “Proof. By Corollary B.3.5, H¹_∞(K, T) = lim← S^Σp(F, T). Thus the proposition follows from Corollary 1.7.5 by passing to the (direct) limit and applying Hom_O( · , D).”
- `rubin-euler-systems-1999`, Ch. II §3, Proposition 3.7, p. 29. The statement verbatim. Source excerpt: “There is an exact sequence 0 −→ H¹_∞,s(K_p, T)/loc^s_Σp(H¹_∞(K, T)) −→ Hom_O(S(K∞, W*), D) −→ X∞ −→ 0.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Divisibility for the true Selmer group (Rubin, Theorem II.3.8)

`EulerSystemsAndKolyvaginSystems:ES.8/true-selmer-iwasawa-divisibility` — theorem

**Statement.** Let K∞/K be admissible, c an Euler system for (T, K∞), and suppose V satisfies Hyp(K∞, V) and Hyp(K∞/K), with local conditions at p as in true-iwasawa-selmer-and-singular-quotient. If loc^s_{Σp}(c_{K,∞}) ∉ H¹_{∞,s}(K_p, T)_{Λ-tors} and H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞}) is a torsion Λ-module, then Hom_O(S(K∞, W*), D) is a torsion Λ-module and (i) for some t ≥ 0, char(Hom_O(S(K∞, W*), D)) divides p^t char(H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞})); (ii) if T satisfies Hyp(K∞, T), char(Hom_O(S(K∞, W*), D)) divides char(H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞})).

**Hypotheses.**

- The right-hand side is principal, so the divisibility is between principal ideals.
- The torsion hypothesis on H¹_{∞,s}(K_p, T)/Λ loc^s(c_{K,∞}) is the rank-one condition at p; it is verified by each application (Coleman maps and explicit reciprocity in KatoEulerSystems and PadicHodgeRegulators).

**Proof outline.**

1. loc^s(c_{K,∞}) not torsion ⇒ c_{K,∞} not torsion, so X∞ is torsion (weak-leopoldt-from-an-euler-system) and, by iwasawa-poitou-tate-sequence, Hom(S(K∞, W*), D) is torsion with char = char(X∞)·char(H¹_{∞,s}(K_p, T)/loc^s(H¹_∞(K, T))).
2. loc^s(H¹_∞(K, T)) contains the non-torsion loc^s(c_{K,∞}) and sits in a module of rank one, so it has rank one and there is ψ: loc^s(H¹_∞(K, T)) → Λ with pseudo-null cokernel; then ψ(loc^s(c_{K,∞}))Λ = char(ψ(loc^s H¹_∞)/ψ(loc^s c_{K,∞})Λ) ⊃ char(loc^s(H¹_∞)/Λ loc^s(c_{K,∞})).
3. ψ ∘ loc^s is a functional on H¹_∞(K, T), so ind_Λ(c) divides ψ(loc^s(c_{K,∞})); combine with rubin-rational-iwasawa-divisibility (resp. rubin-iwasawa-divisibility) and multiplicativity of characteristic ideals.

**Acceptance.**

- Cyclotomic units with the unit condition at p do not satisfy the hypotheses: H¹_{∞,s}(Q_p, T*) ≅ Y∞^χ/U∞^χ is O or 0, hence Λ-torsion, so loc^s(c_{Q,∞}) is torsion. EulerSystemsCyclotomicMainConjecture L2 therefore derives char(A∞^χ) | J² char(E∞^χ/C_{∞,χ}) from rubin-iwasawa-divisibility and iwasawa-poitou-tate-sequence directly (Rubin, proof of Theorem III.2.7), not from this theorem.
- If H¹_f = H¹ at p the hypotheses fail (H¹_{∞,s} = 0 makes loc^s(c_{K,∞}) torsion), so the theorem does not apply; Theorems II.3.3–II.3.4 must be used instead.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-poitou-tate-sequence`
- `EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility`
- `EulerSystemsAndKolyvaginSystems:ES.8/rubin-rational-iwasawa-divisibility`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-index`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-3`

**Sources.**

- `rubin-euler-systems-2000`, Ch. 2 §3, Theorem 2.3.8, p. 43. The hypotheses and first conclusion, in the published text. Source excerpt: “Suppose further that loc^s_Σp(c_K,∞) ∉ H¹_∞,s(K_p, T)_Λ−tors and H¹_∞,s(K_p, T)/Λloc^s_Σp(c_K,∞) is a torsion Λ-module. Then Hom_O(S(K∞, W*), D) is a torsion Λ-module”
- `rubin-euler-systems-2000`, Ch. 2 §3, proof of Theorem 2.3.8, p. 43. The key step of the proof. Source excerpt: “Our assumptions ensure that loc^s_Σp(H¹_∞(K, T)) is a rank-one Λ-module, so there is a map ψ : loc^s_Σp(H¹_∞(K, T)) → Λ with pseudo-null cokernel.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

#### Rubin's condition (*) at completely split primes

`EulerSystemsAndKolyvaginSystems:ES.8/unramified-at-split-primes-condition` — definition

**Statement.** Let K∞/K be a Z_p^d-extension, not necessarily admissible, and c a collection satisfying all conditions of an Euler system for (T, 𝒦, N) except possibly the no-complete-splitting clause of Definition II.1.1(ii). Condition (*): for every prime q of K that splits completely in K∞/K and every finite extension F of K in 𝒦, (c_F)_q ∈ H¹_ur(F_q, T). Under (*), Theorems II.3.2, II.3.3 and II.3.4 hold without the assumption that no finite prime splits completely in K∞/K.

**Hypotheses.**

- Rubin gives the replacement argument as a remark (Chapter IX §2): (*) replaces the use of non-splitting in Proposition IV.6.1 and Corollary B.3.4, and the completely split primes, a set of density zero, are removed from the set R of auxiliary primes.
- Proposition II.3.7 is not claimed under (*): at a completely split prime the local Iwasawa cohomology is not unramified, so H¹_∞(K, T) ≠ lim S^{Σp}(F, T) in general.

**Construction.**

1. (i) For every q, unramifiedness of (c_F)_q at primes with infinite decomposition group is SelmerIwasawaCohomology L3 (universal-norms-unramified (ii)); at completely split q it is (*).
2. (ii) For auxiliary primes the Chebotarev arguments of ES.1 and Chapter VII only need a set of primes of positive density with prescribed Frobenius; deleting the density-zero set of completely split primes from R does not affect them.
3. The proofs of weak-leopoldt-from-an-euler-system and characteristic-ideal-bound-with-error then go through unchanged.

**Uses that determine the API.**

- Rubin, Chapter IX §2: replaces the no-complete-splitting hypothesis of Definition II.1.1
- Rubin, Chapter IX §4, Remark 4.2: relevant to anticyclotomic towers, where inert primes split completely, as for Heegner points
- HeegnerPointEulerSystems HE.8: an anticyclotomic consumer may verify (*) for its classes instead of admissibility

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystem.UnramifiedAtSplitPrimes` | data | The predicate (*) on a collection c and a Z_p^d-extension K∞/K. |
| `TauCeti.EulerSystem.unramifiedAtSplitPrimes_of_noSplitPrimes` | example | If K∞/K is admissible, (*) holds for every collection. |
| `TauCeti.EulerSystem.unramifiedAtSplitPrimes_mem` | projection | Under (*), (c_F)_q ∈ H¹_ur(F_q, T) for every prime q of K and every F (combining with SelmerIwasawaCohomology L3 at primes with infinite decomposition group). |
| `TauCeti.EulerSystem.splitPrimes_density_zero` | other | The set of primes of K splitting completely in K∞/K has Dirichlet density zero. |
| `TauCeti.EulerSystem.weakLeopoldt_of_unramifiedAtSplitPrimes` | other | Under (*) in place of admissibility, the conclusions of weak-leopoldt-from-an-euler-system, rubin-iwasawa-divisibility and rubin-rational-iwasawa-divisibility hold. |
| `TauCeti.EulerSystem.unramifiedAtSplitPrimes_kummer` | example | Kummer images of points of an abelian variety with good reduction at q ∤ p satisfy (*) at q. |

**Unit tests.**

- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_vacuous` (degenerate): For the cyclotomic Z_p-extension of Q no prime splits completely, so (*) holds for every collection.
- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_anticyclotomic` (computation): For K = Q(√−7), p = 3 and the anticyclotomic Z_3-extension, (*) is a genuine condition at the prime 5O_K, which splits completely.
- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_kummer_example` (example): For an elliptic curve E/K with good reduction at q ∤ p and points P_F ∈ E(F), the Kummer classes c_F = δ(P_F) ∈ H¹(F, T_pE) satisfy (*) at q.
- `TauCeti.EulerSystem.unramifiedAtSplitPrimes_not_selmer_limit` (non-example): At a completely split prime q ∤ p with T ramified at q, lim_F H¹(F_q, T) contains ramified classes, so (*) is not automatic for norm-coherent families and Proposition II.3.7's identity H¹_∞(K, T) = lim S^{Σp}(F, T) can fail.

**Acceptance.**

- If K∞/K is admissible, (*) is vacuous.
- Kummer classes of points of an abelian variety with good reduction at q ∤ p are unramified at q, so (*) holds at such completely split q.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system`
- `SelmerIwasawaCohomology:L3/universal-norms-unramified`
- `SelmerIwasawaCohomology:L2/unramified-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`

**Sources.**

- `rubin-euler-systems-1999`, Ch. IX §2, p. 136. The condition verbatim. Source excerpt: “In fact, the assumption that no prime splits completely is unnecessarily strong. We can remove this hypothesis if we assume instead that (*) for every prime q of K which splits completely in K∞/K, and for every finite extension F of K in K, we have (c_F)_q ∈ H¹_ur(F_q, T).”
- `rubin-euler-systems-1999`, Ch. IX §2, p. 136. The replacement argument. Source excerpt: “This condition (*) takes care of (i), and for (ii) we only need observe that the set of primes splitting completely in K∞/K has density zero, so we can remove from R all ideals divisible by those primes without interfering with our Tchebotarev arguments.”

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.

### ES.8b. Λ-adic Kolyvagin systems and specialization

Here d = 1. The canonical structure over Q∞ and the ordinary structure over the anticyclotomic
tower remain distinct. Kolyvagin systems for 𝐓 and their generalized inverse limits specialize
at height-one primes to DVR systems of ES.3–ES.5. Uniform control and length asymptotics along
perturbed primes turn the DVR inequalities into characteristic-ideal divisibilities.
Mazur–Rubin's equality criterion also requires generic core rank one, a nonzero bottom class
and Λ-primitivity. Howard's self-dual theorem retains conditions (A)–(D), including the functional
equation, for the consumer to verify. The error branch retains (C′), bounded errors and the
explicit set of primes to invert; its augmentation-prime control is a separate supplier request.

#### The Λ-adic representation 𝐓 = T ⊗ Λ and its Selmer structures

`EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure` — construction

**Statement.** Let K∞/K be a Z_p-extension (d = 1) with Γ = Gal(K∞/K), Λ = O[[Γ]], Ψ: G_K ↠ Γ ⊂ Λ^× the tautological character, and T a free O-module of finite rank with a continuous G_K-action unramified outside a finite set. Put 𝐓 = T ⊗_O Λ with G_K acting on both factors (on Λ through Ψ), so that Shapiro's lemma gives H^i(K, 𝐓) ≅ lim_n H^i(K_n, T) along corestriction (SelmerIwasawaCohomology L3, iwasawa-shapiro, which pins the twist), and 𝐓* = Hom(𝐓, μ_{p^∞}). A Λ-adic Selmer structure F_Λ on 𝐓 is a Selmer structure over R = Λ (SelmerIwasawaCohomology L2, dual-selmer-structure): a finite set Σ(F_Λ) of places containing ∞, the primes above p and the primes where T ramifies, and Λ-submodules H¹_{F_Λ}(K_v, 𝐓) ⊂ H¹(K_v, 𝐓), v ∈ Σ(F_Λ); F_Λ* is its dual on 𝐓* and X = Hom(H¹_{F_Λ*}(K, 𝐓*), Q_p/Z_p). Two instances: (a) the canonical structure (Mazur–Rubin, Definition 5.3.2, K = Q, K∞ = Q∞): H¹_{F_Λ}(K_v, 𝐓) = H¹(K_v, 𝐓) for all v ∈ Σ, so H¹_{F_Λ}(K, 𝐓) = H¹(K, 𝐓); (b) the ordinary structure (Howard, Definition 2.2.6; Castella–Grossi–Lee–Skinner §3.4): given Fil_v T ⊂ T at v | p, H¹_{F_Λ}(K_v, 𝐓) = image of H¹(K_v, Fil_v T ⊗ Λ), and the unramified (Howard) or full (Castella et al.) condition at v ∤ p. F_Λ induces Selmer structures on the quotients 𝐓/I𝐓 by propagation.

**Hypotheses.**

- For the canonical structure, every v ∤ p must have infinite decomposition group in K∞/K (true for the cyclotomic Z_p-extension), so that H¹(K_v, 𝐓) = H¹_ur(K_v, 𝐓) and the structure does not depend on Σ (Mazur–Rubin, Lemma 5.3.1(ii)).
- The induced structure on a quotient 𝐓/I𝐓 is in general smaller than the full local cohomology: at v = p its defect is H²(K_p, 𝐓)[I].
- Conventions for the character through which G_K acts on Λ vary between sources (Castella et al. print α_𝔓 = Ψ^{-1} mod 𝔓, corrected to Ψ mod 𝔓 in PAPER-CASTELLA-ETAL-22/E29); this node pins the action through Ψ and the Shapiro isomorphism, and each source is read through it.
- With G_K acting on Λ through Ψ, the Shapiro isomorphism H¹(K, 𝐓) ≅ lim_n H¹(K_n, T) is semilinear for the involution ι: multiplication by γ ∈ Γ on 𝐓 corresponds to the conjugation action of γ^{-1} on lim_n H¹(K_n, T) (SelmerIwasawaCohomology L3, iwasawa-shapiro: 𝓕_Γ(M)^ι ≅ (M ⊗ R̄)⟨1⟩). Comparisons with Rubin's H¹_∞(K, T), ind_Λ and X∞ in the first part of this layer therefore pass through ι; both sides of every divisibility are transported together, so the theorems agree.

**Construction.**

1. The local and global Shapiro identifications are SelmerIwasawaCohomology L3 (iwasawa-shapiro, iwasawa-cohomology); for v ∤ p with infinite decomposition group every norm-coherent family is unramified (universal-norms-unramified), which gives Mazur–Rubin's Lemma 5.3.1(ii) and makes (a) independent of Σ.
2. For (b), Fil_v T ⊗ Λ ⊂ 𝐓 is G_{K_v}-stable; when Fil_v T is its own exact orthogonal complement under a pairing T × T → O(1), the conditions on 𝐓 and 𝐀 are exact orthogonal complements under Howard's pairing e_Λ (Howard, Proposition 2.2.4 and the comment after Definition 2.2.5).
3. Propagation to quotients is SelmerIwasawaCohomology L2 (condition-propagation); the defect at p comes from the cohomology sequence of 0 → 𝐓 → 𝐓 → 𝐓/I𝐓 → 0 for principal I.

**Uses that determine the API.**

- Mazur–Rubin, §5.3: the canonical Λ-adic structure on T ⊗ Λ underlies Theorems 5.3.3, 5.3.6 and 5.3.10
- Howard, §2.2: the ordinary structure on T_pE ⊗ Λ over the anticyclotomic tower underlies Theorem 2.2.10
- Castella–Grossi–Lee–Skinner, §3.4: the ordinary structure, relaxed away from p on 𝐓, underlies Theorem 3.4.1
- HeegnerPointEulerSystems HE.8: Howard's Λ-adic Heegner classes lie in H¹_{F_Λ}(K, 𝐓) for the ordinary structure

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystem.lambdaRep` | constructor | 𝐓 = T ⊗_O Λ with the diagonal G_K-action through Ψ. |
| `TauCeti.KolyvaginSystem.lambdaRep_cohomologyEquiv` | equivalence | H^i(K, 𝐓) ≅ lim_n H^i(K_n, T) and H^i(K_v, 𝐓) ≅ lim_n ⊕_{w\|v} H^i(K_{n,w}, T), semilinear for ι: λ ∈ Λ acting on 𝐓 corresponds to ι(λ) acting through the conjugation action of Γ on the limits. |
| `TauCeti.KolyvaginSystem.LambdaSelmerStructure` | structure | A Selmer structure over R = Λ on 𝐓: Σ(F_Λ) and Λ-submodules of local cohomology. |
| `TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical` | constructor | The canonical structure: full local cohomology at every v ∈ Σ. |
| `TauCeti.KolyvaginSystem.LambdaSelmerStructure.ordinary` | constructor | The ordinary structure attached to filtrations Fil_v T at v \| p. |
| `TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical_selmer_eq` | simp | For the canonical structure, H¹_{F_Λ}(K, 𝐓) = H¹(K, 𝐓) = H¹(K_Σ/K, 𝐓). |
| `TauCeti.KolyvaginSystem.LambdaSelmerStructure.quotient` | functoriality | The induced structure on 𝐓/I𝐓 for an ideal I ⊂ Λ, by propagation. |
| `TauCeti.KolyvaginSystem.LambdaSelmerStructure.dualX` | data | X = Hom(H¹_{F_Λ*}(K, 𝐓*), Q_p/Z_p), a finitely generated Λ-module. |
| `TauCeti.KolyvaginSystem.LambdaSelmerStructure.canonical_X_eq` | compatibility | For K = Q, K∞ = Q∞ and the canonical structure, X is Rubin's X∞ of restricted-iwasawa-selmer-module with Λ acting through ι (the duals carrying (λφ)(x) = φ(λx)), so char X = ι(char X∞). |

**Unit tests.**

- `TauCeti.KolyvaginSystem.canonical_rat_selmer` (computation): For K = Q, K∞ = Q∞ and the canonical structure, H¹_{F_Λ}(Q, 𝐓) = lim_n H¹(Q_n, T) = lim_n H¹(Q_Σ/Q_n, T).
- `TauCeti.KolyvaginSystem.canonical_unramified_away_from_p` (characterisation): For ℓ ≠ p, H¹(Q_ℓ, 𝐓) = H¹_ur(Q_ℓ, 𝐓) (Mazur–Rubin, Lemma 5.3.1(ii)); a definition requiring the unramified condition at ℓ ∈ Σ therefore gives the same structure.
- `TauCeti.KolyvaginSystem.quotient_not_full` (non-example): For T = Z_p(1) over Q∞ and I = J the augmentation ideal, H²(Q_p, 𝐓) ≅ Z_p with trivial Γ-action, so the induced condition H¹_{F_Λ}(Q_p, Z_p(1)) has cokernel H²(Q_p, 𝐓)[J] ≅ Z_p in H¹(Q_p, Z_p(1)); the induced structure on 𝐓/J𝐓 = Z_p(1) is not the full local cohomology.
- `TauCeti.KolyvaginSystem.ordinary_selfOrthogonal` (compatibility): For T = T_pE with E ordinary at v | p and Fil_v T = ker(T_pE → T_pẼ), the ordinary conditions on 𝐓 and 𝐀 are exact orthogonal complements under e_Λ (Howard, §2.2).

**Acceptance.**

- For the canonical structure over Q∞, H¹_{F_Λ}(Q, 𝐓) = lim_n H¹(Q_n, T).
- For T = Z_p(1) and I = J the augmentation ideal, H¹_{F_Λ}(Q_p, Z_p(1)) ⊊ H¹(Q_p, Z_p(1)).

**Prerequisites.**

- `SelmerIwasawaCohomology:L3/iwasawa-shapiro`
- `SelmerIwasawaCohomology:L3/iwasawa-cohomology`
- `SelmerIwasawaCohomology:L3/universal-norms-unramified`
- `SelmerIwasawaCohomology:L2/dual-selmer-structure`
- `SelmerIwasawaCohomology:L2/condition-propagation`
- `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.2, p. 60. The canonical structure (a). Source excerpt: “We define a Selmer structure FΛ on T by setting Σ(FΛ) = Σ and H¹_F(Q_v, T) = H¹(Q_v, T) for v ∈ Σ. By Lemma 5.3.1(ii) we also have H¹_f(Q_v, T) = H¹(Q_v, T) for v ∉ Σ.”
- `mazur-rubin-kolyvagin-systems`, §5.3, after Definition 5.3.2, p. 60. The propagation caveat. Source excerpt: “Note that the induced Selmer structure FΛ on quotients T/IT (such as T and T̄) will not usually satisfy H¹_FΛ(Q_v, T/IT) = H¹(Q_v, T/IT).”
- `howard-heegner-point-kolyvagin-system`, §2.2, Definition 2.2.6, p. 25. The ordinary structure (b). Source excerpt: “Define a Selmer structure FΛ on T by taking the unramified condition at primes of K not dividing p, and taking the image of H¹(Kv, Filv T) → H¹(Kv, T) at primes above p.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### Λ-adic Kolyvagin systems

`EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems` — construction

**Planet:** Λ-adic Kolyvagin system.

**Statement.** For a Λ-adic Selmer structure F_Λ on 𝐓 and a set P of auxiliary primes disjoint from Σ(F_Λ) (with the finite–singular comparison maps φ^fs_ℓ and ideals I_ℓ of EulerSystemsAndKolyvaginSystems ES.1), KS(𝐓, F_Λ, P) is the Λ-module of Kolyvagin systems of ES.4 over R = Λ: collections κ = {κ_n ∈ H¹_{F_Λ(n)}(K, 𝐓/I_n𝐓) ⊗ G_n : n ∈ N(P)} with (κ_{nℓ})_{ℓ,s} = φ^fs_ℓ(κ_n) in H¹_s(K_ℓ, 𝐓/I_{nℓ}𝐓) ⊗ G_{nℓ} (Mazur–Rubin, Definition 3.1.3). The generalized module is KS‾(𝐓, F_Λ, P) = lim_k colim_j KS(𝐓/𝔐^k𝐓, F_Λ, P ∩ P_j), P_j the primes with 𝐓/(𝔐^j𝐓 + (Fr_ℓ − 1)𝐓) free of rank one over Λ/𝔐^j and I_ℓ ⊂ 𝔐^j (Definition 3.1.6), with the natural map KS → KS‾. Elements of either are Λ-adic Kolyvagin systems; the bottom class is κ_1 ∈ H¹_{F_Λ}(K, 𝐓) (for KS‾, κ̄_1 ∈ lim_k H¹_{F_Λ}(K, 𝐓/𝔐^k𝐓) = H¹_{F_Λ}(K, 𝐓)).

**Hypotheses.**

- KS → KS‾ need be neither injective nor surjective (Mazur–Rubin, Definition 3.1.6); the statements of this layer hold for both modules (Remark 5.3.11), and Euler systems land in KS‾ (euler-to-lambda-adic-kolyvagin).
- Over Λ the ideals I_n are generally of finite index, so each κ_n is a class with coefficients in a finite quotient of 𝐓 (Mazur–Rubin, proof of Theorem 5.3.3).

**Construction.**

1. The module structure, the functoriality in the ring (KS(T, F) ⊗_R R' → KS(T ⊗_R R', F ⊗ R') for R → R'), in P (restriction to P' ⊂ P) and in F (inclusion for F' ≤ F) are Mazur–Rubin's Remark 3.1.4, owned for general R by ES.3/kolyvagin-system-module; here they are applied to R = Λ and its quotients Λ/I, Λ/𝔐^k and S_𝔓.
2. The bottom class of κ̄ ∈ KS‾ is well defined because κ̄_1 is compatible in k and lim_k H¹_{F_Λ}(K, 𝐓/𝔐^k𝐓) = H¹_{F_Λ}(K, 𝐓) for the finitely generated, 𝔐-adically complete module H¹_{F_Λ}(K, 𝐓).

**Uses that determine the API.**

- Mazur–Rubin, Theorems 5.3.6 and 5.3.10: the hypotheses are a Λ-adic Kolyvagin system with κ_1 ≠ 0
- Howard, Theorem 2.2.10: the Λ-adic Heegner Kolyvagin system bounds the anticyclotomic Selmer group
- Castella–Grossi–Lee–Skinner, Theorem 3.4.1: a Λ-adic Kolyvagin system with κ_1 ≠ 0 gives the residually reducible Λ-adic divisibility
- Büyükboduk, Theorem 3.23: under his hypotheses the module KS‾(T ⊗ Λ, F_can, P) is free of rank one
- HeegnerPointEulerSystems HE.8 and RankZeroOneBSD BSD.7a: consume the Λ-adic Heegner Kolyvagin system

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystem.lambdaKS` | constructor | KS(𝐓, F_Λ, P), the Λ-module of Kolyvagin systems over R = Λ. |
| `TauCeti.KolyvaginSystem.lambdaKSBar` | constructor | KS‾(𝐓, F_Λ, P) = lim_k colim_j KS(𝐓/𝔐^k𝐓, F_Λ, P ∩ P_j). |
| `TauCeti.KolyvaginSystem.lambdaKS_toBar` | projection | The natural map KS(𝐓) → KS‾(𝐓). |
| `TauCeti.KolyvaginSystem.bottomClass` | projection | κ ↦ κ_1 ∈ H¹_{F_Λ}(K, 𝐓), Λ-linear, compatible with KS → KS‾. |
| `TauCeti.KolyvaginSystem.lambdaKS_baseChange` | functoriality | For a ring map Λ → R', KS(𝐓, F_Λ) ⊗_Λ R' → KS(𝐓 ⊗_Λ R', F_Λ ⊗ R'), compatible with composition; in particular reductions to 𝐓/I𝐓. |
| `TauCeti.KolyvaginSystem.lambdaKS_restrictPrimes` | functoriality | For P' ⊂ P, the restriction KS(𝐓, P) → KS(𝐓, P'). |
| `TauCeti.KolyvaginSystem.lambdaKS_ext` | extensionality | Two Λ-adic Kolyvagin systems are equal iff all their components κ_n agree. |
| `TauCeti.KolyvaginSystem.bottomClass_zero` | simp | The zero system has κ_1 = 0. |

**Unit tests.**

- `TauCeti.KolyvaginSystem.zero_mem` (degenerate): The zero collection is a Λ-adic Kolyvagin system, with κ_1 = 0; it satisfies every relation and certifies nothing.
- `TauCeti.KolyvaginSystem.relation_required` (characterisation): A family of raw Kolyvagin derivative classes satisfying only the weak relation of Rubin's Chapter IV is not an element of KS(𝐓) until corrected as in Mazur–Rubin's Appendix A; a definition omitting the finite–singular relation (κ_{nℓ})_{ℓ,s} = φ^fs_ℓ(κ_n) accepts it and is wrong.
- `TauCeti.KolyvaginSystem.cyclotomic_free_rank_one` (computation): For T = O(1) ⊗ ρ^{-1}, ρ an even character of prime-to-p order with ρ(p) ≠ 1 and ρ unramified at p, the cyclotomic-unit Λ-adic Kolyvagin system generates the free rank-one module KS‾(T ⊗ Λ, F_can, P) (Büyükboduk, Proposition 4.1).
- `TauCeti.KolyvaginSystem.bottomClass_specialize` (compatibility): The image of κ_1 under H¹(Q, 𝐓) → H¹(Q, 𝐓/J𝐓) = H¹(Q, T) is the bottom class of the reduction of κ to KS(T); for κ coming from an Euler system c it is c_Q.

**Acceptance.**

- The zero system is allowed and has κ_1 = 0.
- For T = O(1) ⊗ ρ^{-1}, ρ even of prime-to-p order, unramified at p, with ρ(p) ≠ 1, KS‾(T ⊗ Λ, F_can, P) is free of rank one, generated by the cyclotomic-unit system (Büyükboduk, Theorem 3.23 and Proposition 4.1).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `PadicMeasuresIwasawaAlgebras:L1`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §3.1, Definition 3.1.3, p. 20. The definition, applied to R = Λ. Source excerpt: “Concretely, a Kolyvagin system for (T, F, P) is a collection of cohomology classes {κn ∈ H¹_F(n)(Q, T/InT) ⊗ Gn : n ∈ N} such that if ℓ is prime and nℓ ∈ N, (κnℓ)ℓ,s = φfs_ℓ(κn) in H¹_s(Qℓ, T/InℓT) ⊗ Gnℓ.”
- `mazur-rubin-kolyvagin-systems`, §3.1, Definition 3.1.6, p. 21. The generalized module and the comparison map (the overline is lost in the text layer of the author copy). Source excerpt: “There is a natural map KS(T) → KS‾(T), which in general need not be either injective or surjective.”
- `buyukboduk-lambda-adic-kolyvagin-systems`, §3.2, Remark 3.24, p. 27. The terminology. Source excerpt: “when we say κ is a Λ-adic Kolyvagin system, we mean (by slight abuse) that κ is an element of one of the three modules of Kolyvagin systems discussed above.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### From Euler systems to Λ-adic Kolyvagin systems (Mazur–Rubin, Theorem 5.3.3)

`EulerSystemsAndKolyvaginSystems:ES.8/euler-to-lambda-adic-kolyvagin` — theorem

**Statement.** Let K = Q, K∞ = Q∞, 𝐓 = T ⊗ Λ with the canonical structure F_Λ, P a set of primes ℓ ≠ p at which T is unramified, and 𝒦 an abelian extension of Q containing the maximal abelian p-extension of Q unramified outside p and P. Suppose (a) T/(Fr_ℓ − 1)T is a cyclic O-module for every ℓ ∈ P, and (b) Fr_ℓ^{p^k} − 1 is injective on T for every ℓ ∈ P and every k ≥ 0. Then there is a canonical homomorphism ES(T, 𝒦, P) → KS‾(𝐓, F_Λ, P) sending c to κ with κ_1 = {c_{Q_n}}_n ∈ lim_n H¹(Q_n, T) = H¹(Q, 𝐓).

**Hypotheses.**

- Mazur–Rubin's Euler systems use the factors P_ℓ(Fr_ℓ^{-1}) with P_ℓ(x) = det(1 − Fr_ℓ x | T) (their Definition 3.2.2), not Rubin's P(Fr_q^{-1}|T*; Fr_q^{-1}); ES.2's normalization dictionary transports between them (Mazur–Rubin, Remark 3.2.3; Rubin §IX.6).
- This is the rank-one map over the cyclotomic tower of Q; over other bases and for the anticyclotomic tower the Λ-adic Kolyvagin systems of the applications are constructed by their owners (HeegnerPointEulerSystems HE.8 for Heegner points).
- Mazur–Rubin state the theorem inside §5.3, whose standing assumptions are (H.0)–(H.4) and P = P_1; their proof (Appendix A, as for Theorem 3.2.4) uses only (a), (b) and the containment of the ray-class tower in 𝒦, so the statement here carries only those.

**Proof outline.**

1. For n ∈ N let I'_n ⊂ Λ be the ideal generated by ℓ − 1, P_ℓ(1) and Fr_ℓ − 1 for ℓ | n; then I_n ⊂ I'_n, both have finite index for n > 1, Λ/I'_n ≅ (Z/M_n)[Gal(F_n/Q)] with F_n ⊂ Q∞ fixed by the Fr_ℓ (ℓ | n), and Rubin's derivative class κ_{[F_n,n,M_n]} ∈ H¹(F_n, T/M_n) = H¹(Q, 𝐓/I'_n𝐓) is denoted κ_n (ES.3).
2. For each k let A_k = (γ^{p^k} − 1, p^k) ⊂ 𝔐^k and choose j ≥ k such that the image of H¹(Q_p, 𝐓/A_j𝐓) in H¹(Q_p, 𝐓/𝔐^k𝐓) is H¹_{F_Λ}(Q_p, 𝐓/𝔐^k𝐓); then I'_n ⊂ A_j for n ∈ N_j and the images κ_n^{(k)} form a weak Kolyvagin system for (𝐓/𝔐^k, P_j) (Rubin, Theorems IV.5.1 and IV.5.4).
3. Mazur–Rubin's Theorem A.4 computes the finite parts (κ_n)_{ℓ,f}; the correction κ'_n = Σ_{π∈S(n)} sign(π) κ_{d_π} ⊗ ∏_{ℓ|n/d_π} ρ_ℓ(P_ℓ(Fr^{-1}_{π(ℓ)})) (their (33)) satisfies the finite–singular relation; this is the correction of ES.3 (Theorem 3.2.4) carried out over Λ/𝔐^k.
4. The resulting systems are compatible as k grows, defining an element of KS‾(𝐓); its bottom class is the image of (c_{Q_n})_n.

**Acceptance.**

- The cyclotomic-unit Euler system for O(1) ⊗ ρ^{-1}, modified as in Rubin §IX.6, gives κ^{ρ,∞} (Büyükboduk, §4.1.1).
- The zero Euler system maps to the zero Kolyvagin system.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-class-of-an-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula`
- `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.3, p. 61. The hypotheses verbatim. Source excerpt: “Suppose that K contains the maximal abelian p-extension of Q which is unramified outside of p and P, and (a) T/(Fr_ℓ − 1)T is a cyclic R-module for every ℓ ∈ P, (b) Fr_ℓ^{p^k} − 1 is injective on T for every ℓ ∈ P and every k ≥ 0.”
- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.3, p. 61. The conclusion (the target is the generalized module KS‾(𝐓); the overline and boldface are lost in the text layer). Source excerpt: “Then there is a canonical homomorphism ES(T, K, P) → KS(T, FΛ, P) with the property that if c maps to κ, then κ1 = {cQn} ∈ lim← H¹(Qn, T) = H¹(Q, T).”
- `mazur-rubin-kolyvagin-systems`, Appendix A, proof of Theorem 5.3.3, pp. 81–82. The proof route. Source excerpt: “The proof of Theorem 5.3.3 is essentially the same as that of Theorem 3.2.4. We sketch the argument again here.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### The exceptional set Σ_Λ of height-one primes

`EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes` — definition

**Statement.** For K = Q, K∞ = Q∞, 𝐓 = T ⊗ Λ and Σ ⊇ {p, ∞, primes where T ramifies}: Σ_Λ = {𝔓 : H²(Q_Σ/Q, 𝐓)[𝔓] is infinite} ∪ {𝔓 : H²(Q_p, 𝐓)[𝔓] is infinite} ∪ {pΛ}, a set of height-one primes of Λ (Mazur–Rubin, Definition 5.3.12, with Λ = Z_p[[Γ]]; for Λ = O[[Γ]] with O ramified over Z_p, pΛ is replaced by the prime ϖΛ). It is finite. For a number field K and a Z_p-extension the same definition with H²(K_Σ/K, 𝐓) and H²(K_v, 𝐓), v | p, is used; for the ordinary structure of Howard the exceptional set is the finite set of his Proposition 2.2.8, defined by the failure of the control bounds.

**Hypotheses.**

- Σ_Λ depends only on T and the tower, not on any Kolyvagin system; the blind spot (blind-spot-and-lambda-primitivity) depends on κ.
- Finiteness needs H²(Q_Σ/Q, 𝐓) and H²(Q_p, 𝐓) finitely generated over Λ (Mazur–Rubin, Lemma 5.3.4; requested from SelmerIwasawaCohomology L3).

**Construction.**

1. For a finitely generated Λ-module M and a height-one prime 𝔓 ≠ pΛ, M[𝔓] is infinite iff 𝔓 divides char(M_tors) (structure theorem, PadicMeasuresIwasawaAlgebras L4); a finitely generated module has finitely many such 𝔓.

**Uses that determine the API.**

- Mazur–Rubin, Lemma 5.3.13 and Proposition 5.3.14: outside Σ_Λ the specialization maps have kernels and cokernels bounded in terms of [S_𝔓 : Λ/𝔓]
- Mazur–Rubin, Lemma 5.3.16: outside Σ_Λ the core rank of T ⊗ S_𝔓 is rank T^-
- Mazur–Rubin, proof of Theorem 5.3.10: the perturbations 𝔓_N are chosen outside Σ_Λ
- Howard, Proposition 2.2.8 and Theorem 2.2.10: the finite exceptional set of the ordinary structure

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystem.exceptionalSet` | data | Σ_Λ as a set of height-one primes of Λ. |
| `TauCeti.KolyvaginSystem.exceptionalSet_finite` | other | Σ_Λ is finite. |
| `TauCeti.KolyvaginSystem.p_mem_exceptionalSet` | simp | pΛ ∈ Σ_Λ. |
| `TauCeti.KolyvaginSystem.mem_exceptionalSet_iff` | characterisation | For 𝔓 ≠ pΛ, 𝔓 ∈ Σ_Λ iff 𝔓 divides char(H²(Q_Σ/Q, 𝐓)_tors) · char(H²(Q_p, 𝐓)). |
| `TauCeti.KolyvaginSystem.exceptionalSet_twist` | compatibility | For ρ: Γ → O^×, Σ_Λ(T ⊗ ρ) = Tw_ρ^{-1}(Σ_Λ(T)), since 𝐓 ⊗ ρ ≅ 𝐓 with Λ acting through Tw_ρ. |

**Unit tests.**

- `TauCeti.KolyvaginSystem.exceptionalSet_Zp1` (computation): For T = Z_p(1) over Q∞, H²(Q_p, 𝐓) ≅ lim_n H²(Q_{n,p}, Z_p(1)) ≅ Z_p with trivial Γ-action, so H²(Q_p, 𝐓)[J] = Z_p is infinite and J ∈ Σ_Λ.
- `TauCeti.KolyvaginSystem.p_mem_exceptionalSet_test` (degenerate): pΛ ∈ Σ_Λ for every T, by definition, whatever the cohomology.
- `TauCeti.KolyvaginSystem.exceptionalSet_not_blindSpot` (non-example): Σ_Λ is not the blind spot: for the cyclotomic-unit system κ^{ρ,∞} of Büyükboduk's Proposition 4.1 (ρ(p) ≠ 1) the blind spot contains no height-one prime, while pΛ ∈ Σ_Λ.
- `TauCeti.KolyvaginSystem.exceptionalSet_free_H2` (example): If H²(Q_Σ/Q, 𝐓) and H²(Q_p, 𝐓) are finite, then Σ_Λ = {pΛ}.

**Acceptance.**

- pΛ ∈ Σ_Λ always.
- For T = Z_p(1), H²(Q_p, 𝐓) ≅ Z_p with trivial action, so the augmentation ideal J lies in Σ_Λ.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure`
- `SelmerIwasawaCohomology:L3`
- `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`
- `PadicMeasuresIwasawaAlgebras:L4/height-one-primes`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.12, p. 62. The definition verbatim. Source excerpt: “Define an exceptional set of height-one primes of Λ by ΣΛ = {P : H²(QΣ/Q, T)[P] is infinite} ∪ {P : H²(Qp, T)[P] is infinite} ∪ {pΛ}. It follows from Lemma 5.3.4 that ΣΛ is finite.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### Specialization of Λ-adic Kolyvagin systems at height-one primes

`EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization` — construction

**Statement.** For a height-one prime 𝔓 of Λ let S_𝔓 be the integral closure of Λ/𝔓; it is a discrete valuation ring, [S_𝔓 : Λ/𝔓] is finite, and 𝐓 ⊗_Λ S_𝔓 = T ⊗_O S_𝔓 with G_K acting on S_𝔓 through Ψ mod 𝔓. Give T ⊗ S_𝔓 the canonical Selmer structure F_can of Mazur–Rubin's Definition 3.2.1 (or, in the ordinary setting, Howard's F_𝔓 of his Definition 2.1.2). The inclusion 𝐓/𝔓𝐓 ↪ T ⊗ S_𝔓 induces maps H¹_{F_Λ}(K_v, 𝐓/𝔓𝐓) → H¹_{F_can}(K_v, T ⊗ S_𝔓) for every v, hence a specialization map KS(𝐓, F_Λ) → KS(𝐓/𝔓𝐓, F_Λ) → KS(T ⊗ S_𝔓, F_can), κ ↦ κ^{(𝔓)} (Mazur–Rubin, Corollary 5.3.15), and similarly on KS‾. For 𝔓 = (g) ≠ pΛ with g a distinguished polynomial, the perturbations 𝔓_N = (g + p^N)Λ satisfy Λ/𝔓 ≅ Λ/𝔓_N as rings for N large (Hensel's lemma).

**Hypotheses.**

- The ring isomorphism Λ/𝔓 ≅ Λ/𝔓_N is not Λ-linear, and the Galois actions on T ⊗ S_𝔓 and T ⊗ S_{𝔓_N} differ.
- The bounds of specialization-control depend on [S_𝔓 : Λ/𝔓], which is why S_𝔓 rather than Λ/𝔓 carries the DVR theory of ES.4–ES.5.

**Construction.**

1. Λ/𝔓 is a one-dimensional complete local domain, finite over Z_p or (for 𝔓 = pΛ) over k[[X]]; its normalization S_𝔓 is a finite DVR extension (PadicMeasuresIwasawaAlgebras L4, height-one-primes).
2. Local maps: for ℓ ∤ p the image of H¹_{F_Λ}(K_ℓ, 𝐓/𝔓𝐓) consists of unramified classes, which lie in H¹_{F_can}(K_ℓ, T ⊗ S_𝔓); at p and ∞ the canonical condition is everything (Mazur–Rubin, proof of Lemma 5.3.13).
3. The Kolyvagin-system maps are the functoriality of lambda-adic-kolyvagin-systems for Λ → Λ/𝔓 followed by the change of Selmer structure F_Λ ⊗ Λ/𝔓 ≤ F_can (Mazur–Rubin, Remark 3.1.4).
4. Hensel's lemma: for N ≫ 0 the polynomial g + p^N is distinguished, irreducible and has a root in S_𝔓 congruent to that of g, giving Λ/𝔓_N ≅ Λ/𝔓 (Mazur–Rubin, proof of Theorem 5.3.10).

**Uses that determine the API.**

- Mazur–Rubin, Theorems 5.3.6 and 5.3.10: the Λ-adic statements are deduced from the DVR theorems of §5.2 applied to κ^{(𝔓)} and κ^{(𝔓_N)}
- Howard, Theorem 2.2.10: the self-dual DVR theorem at each specialization
- Castella–Grossi–Lee–Skinner, Theorem 3.4.1: their error-tolerant bound at the specializations 𝔔 = (g + p^m)

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystem.specRing` | data | S_𝔓 = integral closure of Λ/𝔓, a DVR with [S_𝔓 : Λ/𝔓] < ∞. |
| `TauCeti.KolyvaginSystem.specRep` | constructor | T ⊗ S_𝔓 = 𝐓 ⊗_Λ S_𝔓 with its canonical (or ordinary) Selmer structure. |
| `TauCeti.KolyvaginSystem.specialize` | constructor | κ ↦ κ^{(𝔓)}: KS(𝐓, F_Λ) → KS(T ⊗ S_𝔓, F_can), and the same on KS‾. |
| `TauCeti.KolyvaginSystem.specialize_bottomClass` | simp | κ^{(𝔓)}_1 is the image of κ_1 under H¹(K, 𝐓) → H¹(K, 𝐓/𝔓𝐓) → H¹(K, T ⊗ S_𝔓). |
| `TauCeti.KolyvaginSystem.specialize_augmentation` | example | For 𝔓 = J, S_J = O, T ⊗ S_J = T and κ^{(J)} is the reduction of κ to KS(T). |
| `TauCeti.KolyvaginSystem.specialize_twist` | compatibility | For 𝔓 = (γ − u), u ∈ 1 + pO, Λ/𝔓 = O and T ⊗ S_𝔓 = T ⊗ ρ_u with ρ_u(γ) = u. |
| `TauCeti.KolyvaginSystem.perturb` | constructor | For 𝔓 = (g) ≠ pΛ with g distinguished, 𝔓_N = (g + p^N); for N ≫ 0, 𝔓_N is a height-one prime and Λ/𝔓 ≅ Λ/𝔓_N as rings. |

**Unit tests.**

- `TauCeti.KolyvaginSystem.specRing_augmentation` (computation): For 𝔓 = J = (γ − 1), Λ/J = O = S_J and T ⊗ S_J = T.
- `TauCeti.KolyvaginSystem.specRing_twist` (computation): For O = Z_p and 𝔓 = (γ − (1 + p)), Λ/𝔓 = Z_p and T ⊗ S_𝔓 is the twist of T by the character γ ↦ 1 + p of Γ.
- `TauCeti.KolyvaginSystem.specRing_not_quotient` (non-example): For O = Z_p and 𝔓 = (X² − p³), X = γ − 1: X² − p³ is distinguished and irreducible, Λ/𝔓 ≅ Z_p[p^{3/2}] is not integrally closed, and S_𝔓 = Z_p[p^{1/2}] with [S_𝔓 : Λ/𝔓] = p; using Λ/𝔓 instead of S_𝔓 loses the DVR theory.
- `TauCeti.KolyvaginSystem.perturb_height_one` (characterisation): For 𝔓 = (X − p) in Z_p[[X]], 𝔓_N = (X − p + p^N) is prime with Λ/𝔓_N ≅ Z_p, and the 𝔓_N are pairwise distinct and distinct from 𝔓.

**Acceptance.**

- 𝔓 = J, the augmentation ideal: S_J = O and 𝐓 ⊗ S_J = T.
- 𝔓 = (X² − p³) in Z_p[[X]] (O = Z_p, X = γ − 1): Λ/𝔓 ≅ Z_p[p^{3/2}] ⊊ S_𝔓 = Z_p[p^{1/2}], of index p.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure`
- `PadicMeasuresIwasawaAlgebras:L4/height-one-primes`
- `PadicMeasuresIwasawaAlgebras:L4/iwasawa-algebra-regular-local`
- `mathlib:IsIntegralClosure`
- `mathlib:IsDiscreteValuationRing`
- `mathlib:Polynomial.IsDistinguishedAt`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, p. 62. The ring S_𝔓 and the specialized representation. Source excerpt: “Suppose P is a height-one prime ideal of Λ. Let SP denote the integral closure of Λ/P. Then SP is a discrete valuation ring, [SP : Λ/P] is finite, and T ⊗Λ SP = T ⊗Zp SP.”
- `mazur-rubin-kolyvagin-systems`, §5.3, Corollary 5.3.15, p. 64. The specialization map. Source excerpt: “For every height-one prime P of Λ, there is a natural map KS(T, FΛ) → KS(T ⊗ SP, Fcan).”
- `mazur-rubin-kolyvagin-systems`, §5.3, proof of Theorem 5.3.10, p. 66. The perturbations. Source excerpt: “For every N let PN = (ρ(U) + p^N)Λ. Since P ≠ pΛ, the PN are distinct ideals of Λ, and different from P.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### Control of Selmer groups at height-one specializations

`EulerSystemsAndKolyvaginSystems:ES.8/specialization-control` — theorem

**Statement.** (Mazur–Rubin, canonical structure, K = Q, K∞ = Q∞, T satisfying (H.0)–(H.4).) For every height-one prime 𝔓 of Λ and every place v, the inclusion 𝐓/𝔓𝐓 ↪ T ⊗ S_𝔓 induces H¹_{F_Λ}(Q_v, 𝐓/𝔓𝐓) → H¹_{F_can}(Q_v, T ⊗ S_𝔓) and H¹_{F_can*}(Q_v, (T ⊗ S_𝔓)*) → H¹_{F_Λ*}(Q_v, (𝐓/𝔓𝐓)*), whose kernels and cokernels, for 𝔓 ∉ Σ_Λ, are finite of order bounded by a constant depending only on T and [S_𝔓 : Λ/𝔓] (Lemma 5.3.13). Globally, π_𝔓: H¹(Q, 𝐓)/𝔓H¹(Q, 𝐓) ↪ H¹_{F_can}(Q, T ⊗ S_𝔓) is injective for every 𝔓, and π*_𝔓: H¹_{F_can*}(Q, (T ⊗ S_𝔓)*) → H¹_{F_Λ*}(Q, 𝐓*)[𝔓] is defined; for 𝔓 ∉ Σ_Λ, coker π_𝔓, ker π*_𝔓 and coker π*_𝔓 are finite of order bounded by a constant depending only on T and [S_𝔓 : Λ/𝔓] (Proposition 5.3.14). (Howard, ordinary structure, T = T_pE over the anticyclotomic tower.) The same holds for every height-one 𝔓 ≠ pΛ locally (Lemma 2.2.7, bounds depending only on [S_𝔓 : Λ/𝔓]) and, outside a finite set Σ_Λ, globally for H¹_{F_Λ}(K, 𝐓)/𝔓 → H¹_{F_𝔓}(K, 𝐓_𝔓) and H¹_{F_𝔓}(K, 𝐀_𝔓) → H¹_{F_Λ}(K, 𝐀)[𝔓] (Proposition 2.2.8).

**Hypotheses.**

- (H.3) of Mazur–Rubin §3.5 (ES.0) gives H⁰(Q_Σ/Q, T ⊗ (S_𝔓/(Λ/𝔓))) = 0 (their Lemma 3.5.2), used for injectivity.
- The uniformity of the bounds in [S_𝔓 : Λ/𝔓] is essential: along the perturbations 𝔓_N of height-one-specialization this index is constant, so the error is O(1) as N grows.
- Howard's local proof at v | p uses that the residue field points Ẽ(F_v)[p^∞] are finite and that K∞,v/K_v is totally ramified; the generic statement for another ordinary representation must re-verify these inputs.

**Proof outline.**

1. Local, ℓ ≠ p: the map factors through H¹(Q_ℓ^ur/Q_ℓ, T^I) → H¹(Q_ℓ^ur/Q_ℓ, (T/𝔓T)^I), surjective because Gal(Q_ℓ^ur/Q_ℓ) has cohomological dimension one; the kernel is a quotient of H⁰(Q_ℓ, T ⊗ (S_𝔓/(Λ/𝔓))), of order ≤ [S_𝔓 : Λ/𝔓]^{rank T}; the cokernel is bounded by |T ⊗ (S_𝔓/(Λ/𝔓))| and by H¹(I, T)_tors ⊗ Λ/(Fr_ℓ − 1)Λ, using 𝔓 ≠ pΛ.
2. Local, v = p: the cokernel of H¹(Q_p, 𝐓) → H¹(Q_p, 𝐓/𝔓𝐓) is H²(Q_p, 𝐓)[𝔓], finite for 𝔓 ∉ Σ_Λ and bounded by the maximal finite submodule of H²(Q_p, 𝐓); the passage to T ⊗ S_𝔓 is controlled by H^i(Q_p, T ⊗ (S_𝔓/(Λ/𝔓))), i = 0, 1. Archimedean places likewise.
3. Global: G_{Q,Σ}-cohomology of 0 → 𝐓 → 𝐓 → 𝐓/𝔓𝐓 → 0 gives H¹(Q, 𝐓)/𝔓 ↪ H¹(Q_Σ/Q, 𝐓/𝔓𝐓) with cokernel H²(Q_Σ/Q, 𝐓)[𝔓]; then H¹(Q_Σ/Q, 𝐓/𝔓𝐓) → H¹(Q_Σ/Q, T ⊗ S_𝔓) is injective by Lemma 3.5.2 with cokernel bounded by H¹(Q_Σ/Q, T ⊗ (S_𝔓/(Λ/𝔓))); the local bounds restrict this to the Selmer modules. The dual statements follow by local duality and Mazur–Rubin's Lemma 3.5.3 (H¹_{F*}(Q, 𝐓*[𝔓]) = H¹_{F*}(Q, 𝐓*)[𝔓]).
4. Howard's ordinary case: the same argument, with Mazur–Rubin's Lemma 5.3.13 at v ∤ p and, at v | p, the composition H¹(K_v, Fil_v 𝐓) → H¹(K_v, Fil_v T ⊗ Λ/𝔓) → H¹(K_v, Fil_v T_𝔓) → H¹_{F_𝔓}(K_v, T_𝔓), controlled by H²(K_v, Fil_v 𝐓)[𝔓] (dual to H⁰(K_v, gr_v A), finite), by H¹(K_v, T ⊗ S_𝔓/(Λ/𝔓)) and by H⁰(K_v, gr_v A_𝔓).

**Acceptance.**

- For 𝔓 = J and T with H²(Q_p, 𝐓)[J] finite, H¹(Q, 𝐓)/JH¹(Q, 𝐓) ↪ H¹(Q, T) with finite cokernel.
- The bounds are uniform along 𝔓_N = (g + p^N), N ≫ 0.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`
- `EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `SelmerIwasawaCohomology:L3`
- `SelmerIwasawaCohomology:L2/finite-condition-lattice-duality`
- `ArithmeticGaloisDuality:R02.4/poitou-tate`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, Proposition 5.3.14, p. 64. The global control statement. Source excerpt: “For every P the map πP is injective. If P ∉ ΣΛ then coker(πP), ker(π*P), and coker(π*P) are all finite with order bounded by a constant depending only on T and [SP : Λ/P].”
- `mazur-rubin-kolyvagin-systems`, §5.3, Lemma 5.3.13, p. 62. The local control statement. Source excerpt: “If P ∉ ΣΛ, then the kernels and cokernels of these maps are finite with order bounded by a constant depending only on T and [SP : Λ/P].”
- `howard-heegner-point-kolyvagin-system`, §2.2, Proposition 2.2.8, p. 26. Howard's ordinary version. Source excerpt: “There is a finite set of primes ΣΛ of Λ such that for P ∉ ΣΛ the kernels and cokernels of these maps are finite and bounded by a constant depending only on [SP : Λ/P].”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### The generic core rank χ(𝐓) (Mazur–Rubin, Lemma 5.3.16)

`EulerSystemsAndKolyvaginSystems:ES.8/generic-core-rank` — theorem

**Statement.** For K = Q, K∞ = Q∞ and every height-one prime 𝔓 ∉ Σ_Λ, the core Selmer rank of (T ⊗ S_𝔓, F_can) is χ(T ⊗ S_𝔓, F_can) = rank_{Z_p} T^-, where T^- is the (−1)-eigenspace of a complex conjugation. The common value χ(𝐓) := rank_{Z_p} T^- is the generic core rank of 𝐓.

**Hypotheses.**

- Core rank is ES.0's notion (Mazur–Rubin, Definition 4.1.11), with the formula χ(T ⊗ S) = rank (T ⊗ S)^- + corank H⁰(Q_p, (T ⊗ S)*) of their Theorem 5.2.15 for the canonical structure.
- By Perrin-Riou's Proposition 1.3.2, if the weak Leopoldt conjecture holds for T then rank_Λ H¹(Q, 𝐓) = χ(𝐓) (Mazur–Rubin, Remark 5.3.18).

**Proof outline.**

1. (T ⊗ S_𝔓)^- = T^- ⊗ S_𝔓, so its S_𝔓-rank is rank_{Z_p} T^-.
2. H⁰(Q_p, (𝐓/𝔓𝐓)*) is dual to H²(Q_p, 𝐓/𝔓𝐓) ≅ H²(Q_p, 𝐓)/𝔓H²(Q_p, 𝐓) (G_{Q_p} has cohomological dimension 2), which is finite for 𝔓 ∉ Σ_Λ because H²(Q_p, 𝐓) is a finitely generated torsion Λ-module; so H⁰(Q_p, (T ⊗ S_𝔓)*) is finite and contributes 0.

**Acceptance.**

- T = T_pE: rank T^- = 1, so χ(𝐓) = 1.
- T = O(1) ⊗ ρ^{-1}, ρ even: complex conjugation acts by −1 on O(1) and trivially through ρ^{-1}, so χ(𝐓) = 1.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes`
- `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`
- `SelmerIwasawaCohomology:L3`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, Lemma 5.3.16, p. 65. The statement verbatim. Source excerpt: “If P is a height-one prime of Λ, and P ∉ ΣΛ, then χ(T ⊗ SP, Fcan) = rankZp T− where T− is the minus part of T for complex conjugation.”
- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.17, p. 65. The definition of the generic core rank. Source excerpt: “We define χ(T) to be the common value (by Lemma 5.3.16) of χ(T ⊗ SP, Fcan) for P ∉ ΣΛ. Equivalently, χ(T) = rankZp T−.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### The blind spot and Λ-primitive Kolyvagin systems

`EulerSystemsAndKolyvaginSystems:ES.8/blind-spot-and-lambda-primitivity` — definition

**Planet:** Λ-primitivity.

**Statement.** Let κ ∈ KS‾(𝐓, F_Λ, P). The blind spot of κ is the set of ideals I ⊂ Λ such that the image of κ under KS‾(𝐓) → KS(𝐓/I𝐓) → KS‾(𝐓/I𝐓) is zero; equivalently, I is not in the blind spot iff for some k ≥ 1 the image of κ in KS(𝐓/(I, 𝔐^k)𝐓, P ∩ P_j) is nonzero for every j (Mazur–Rubin, Definition 3.1.6). The blind spot of KS‾(𝐓) is the intersection of the blind spots of its elements. κ is Λ-primitive if its blind spot contains no height-one prime of Λ (Definition 5.3.9). It is residually primitive (primitive, Definition 4.5.5, owned by ES.5) if its image in KS‾(T̄) = KS‾(𝐓/𝔐𝐓) is nonzero, i.e. 𝔐 is not in its blind spot; when χ(T̄) = 1 the map KS(T̄) → KS‾(T̄) is an isomorphism (Mazur–Rubin, Corollary 4.5.3) and this is nonvanishing in KS(T̄).

**Hypotheses.**

- Residual primitivity implies Λ-primitivity (residual-primitivity-implies-lambda-primitivity); the two are different conditions and Theorem 5.3.10(iii) needs only Λ-primitivity.
- A nonzero κ, even with κ_1 ≠ 0, need not be Λ-primitive.

**Construction.**

1. If 𝔓 is not in the blind spot of κ then κ^{(𝔓)} ≠ 0 (Mazur–Rubin, Lemma 5.3.20): choose α, β ∈ Λ/𝔓 with αS_𝔓 ⊂ Λ/𝔓 and κ nonzero modulo β; multiplication by α injects H¹(𝐓_𝔓/β) into H¹(𝐓_𝔓/αβ) (Lemma 3.5.2), and the composition through T ⊗ S_𝔓 is multiplication by α.
2. Scaling: the image of λκ in KS‾(𝐓/I𝐓) is λ times that of κ, so if λ ∈ 𝔓 then 𝔓 is in the blind spot of λκ.

**Uses that determine the API.**

- Mazur–Rubin, Theorem 5.3.10(ii)–(iii): ord_𝔓 char(X∞) = ord_𝔓 Ind(κ) at 𝔓 outside the blind spot, and equality of ideals for Λ-primitive κ
- Mazur–Rubin, Lemma 5.3.20: outside the blind spot the specialization is nonzero
- Büyükboduk, Propositions 4.1 and 4.2: the cyclotomic-unit and Kato Λ-adic systems are Λ-primitive under stated hypotheses
- EulerSystemsAndKolyvaginSystems ES.5 (roadmap description of ES.8): residual primitivity and Λ-primitivity have different reduction maps

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystem.blindSpot` | data | The set of ideals I ⊂ Λ with κ ↦ 0 in KS‾(𝐓/I𝐓). |
| `TauCeti.KolyvaginSystem.mem_blindSpot_iff` | characterisation | I ∉ blindSpot κ iff ∃ k, ∀ j, the image of κ in KS(𝐓/(I, 𝔐^k)𝐓, P ∩ P_j) is nonzero. |
| `TauCeti.KolyvaginSystem.IsLambdaPrimitive` | data | κ is Λ-primitive iff no height-one prime of Λ lies in blindSpot κ. |
| `TauCeti.KolyvaginSystem.IsLambdaPrimitive.of_isPrimitive` | relation | A residually primitive κ is Λ-primitive (residual-primitivity-implies-lambda-primitivity). |
| `TauCeti.KolyvaginSystem.specialize_ne_zero_of_not_mem_blindSpot` | other | If 𝔓 ∉ blindSpot κ then κ^{(𝔓)} ≠ 0 in KS‾(T ⊗ S_𝔓) (Mazur–Rubin, Lemma 5.3.20). |
| `TauCeti.KolyvaginSystem.blindSpot_smul` | simp | blindSpot κ ⊂ blindSpot (λκ), and every ideal containing λ lies in blindSpot (λκ). |
| `TauCeti.KolyvaginSystem.not_isLambdaPrimitive_smul` | other | If λ ∈ Λ is not a unit then λκ is not Λ-primitive (λ lies in a height-one prime, Λ being factorial). |
| `TauCeti.KolyvaginSystem.blindSpot_zero` | simp | The blind spot of 0 is every ideal. |

**Unit tests.**

- `TauCeti.KolyvaginSystem.cyclotomic_isLambdaPrimitive` (computation): For T = O(1) ⊗ ρ^{-1}, ρ even of prime-to-p order, unramified at p, with ρ(p) ≠ 1, the cyclotomic-unit system κ^{ρ,∞} is Λ-primitive (Büyükboduk, Proposition 4.1).
- `TauCeti.KolyvaginSystem.augmentation_mul_not_primitive` (non-example): For any κ, (γ − 1)κ has κ_1 possibly nonzero but J = (γ − 1) in its blind spot, so it is not Λ-primitive: a definition of Λ-primitivity as 'κ_1 ≠ 0' fails this.
- `TauCeti.KolyvaginSystem.free_rank_one_primitive_iff` (characterisation): If KS‾(𝐓) is free of rank one on a residually primitive κ_0, then λκ_0 is Λ-primitive iff λ ∈ Λ^× iff λκ_0 is residually primitive.
- `TauCeti.KolyvaginSystem.zero_not_primitive` (degenerate): The zero system has every ideal in its blind spot and is not Λ-primitive.

**Acceptance.**

- The cyclotomic-unit Λ-adic system for O(1) ⊗ ρ^{-1}, ρ even of prime-to-p order, unramified at p, with ρ(p) ≠ 1, is Λ-primitive (Büyükboduk, Proposition 4.1).
- (γ − 1)κ is never Λ-primitive.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems`
- `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`
- `EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `PadicMeasuresIwasawaAlgebras:L4/height-one-primes`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.9, p. 61. Λ-primitivity and its distinction from primitivity. Source excerpt: “If κ ∈ KS(T), we will say that κ is Λ-primitive if the blind spot of κ (see Definition 3.1.6) contains no height-one primes of Λ. This is not in general the same as being primitive (Definition 4.5.5), which requires that the image of κ be nonzero in KS(T̄).”
- `mazur-rubin-kolyvagin-systems`, §3.1, Definition 3.1.6, p. 21. The blind spot. Source excerpt: “In other words, I is not in the blind spot if for some k ∈ Z+, the image of κ in KS(T/(I, m^k)T, P ∩ Pj) is nonzero for every j ∈ Z+.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### Residual primitivity implies Λ-primitivity

`EulerSystemsAndKolyvaginSystems:ES.8/residual-primitivity-implies-lambda-primitivity` — lemma

**Statement.** If κ ∈ KS‾(𝐓) has nonzero image in KS‾(𝐓/𝔐𝐓) = KS‾(T̄) (equivalently, when χ(T̄) = 1, in KS(T̄)), then κ is Λ-primitive.

**Hypotheses.**

- The converse fails in general: Λ-primitivity concerns only height-one primes, primitivity the maximal ideal (Mazur–Rubin, Definition 5.3.9).

**Proof outline.**

1. For every height-one 𝔓 ⊂ 𝔐 the reduction KS‾(𝐓) → KS‾(𝐓/𝔐𝐓) factors as KS‾(𝐓) → KS‾(𝐓/𝔓𝐓) → KS‾(𝐓/𝔐𝐓) (functoriality, lambda-adic-kolyvagin-systems); a nonzero image at the end forces a nonzero image at 𝔓, so 𝔓 is not in the blind spot (Büyükboduk, proof of Proposition 4.1).

**Acceptance.**

- Applied to the cyclotomic-unit system for O(1) ⊗ ρ^{-1}, ρ even of prime-to-p order, unramified at p, with ρ(p) ≠ 1, which is primitive by Mazur–Rubin's Remark 6.1.8, it gives Λ-primitivity.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/blind-spot-and-lambda-primitivity`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`

**Sources.**

- `buyukboduk-lambda-adic-kolyvagin-systems`, §4.1.1, proof of Proposition 4.1, pp. 28–29. The argument, in the cyclotomic-unit case. Source excerpt: “the Kolyvagin system κρ is primitive, i.e., its image κρ under the map KS(T) −→ KS(T/mT) is non-zero. This proves that the image of κρ,∞ under the map KS(T ⊗ Λ) → KS(T ⊗ Λ/p) is non-zero for any height-one prime p ⊂ Λ”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### Mazur–Rubin's principal index Ind(c)

`EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-ind` — definition

**Statement.** For K = Q, K∞ = Q∞ and c ∈ H¹(Q, 𝐓), which is finitely generated and Λ-torsion-free, fix a pseudo-isomorphism ψ: H¹(Q, 𝐓) → Λ^r and write ψ(c) = (a_1, …, a_r); Ind(c) is the principal ideal generated by gcd(a_1, …, a_r), so Ind(0) = 0. For c ≠ 0 this equals char((H¹(Q, 𝐓)/Λc)_tors) (Mazur–Rubin, Definition 5.3.8, with the convention of this packet's source issue E801 at c = 0). For κ ∈ KS‾(𝐓), Ind(κ) = Ind(κ_1).

**Hypotheses.**

- Ind(c) is principal; Rubin's ind_Λ (lambda-index) need not be, but a principal ideal contains ind_Λ(c) iff it contains Ind(c), both computed in the same Λ-module H¹(Q, 𝐓). Transported along the Shapiro identification H¹(Q, 𝐓) ≅ H¹_∞(Q, T), which is ι-semilinear (lambda-adic-selmer-structure), Ind(c_{Q,∞}) is the image under ι of the smallest principal ideal containing Rubin's ind_Λ(c).
- There is an ideal B of finite index in Λ with Bc ⊂ Ind(c)H¹(Q, 𝐓) (Mazur–Rubin, after Definition 5.3.8).

**Construction.**

1. Independence of ψ: two pseudo-isomorphisms to free modules differ by an automorphism of Λ^r up to pseudo-null error, preserving the gcd.
2. For c ≠ 0 write (a_i) = g(b_i) with g = gcd(a_i) and gcd(b_i) = 1; the torsion of Λ^r/Λ(b_i) is pseudo-null, so (Λ^r/Λ(a_i))_tors is an extension of a pseudo-null module by Λ(b_i)/Λ(a_i) ≅ Λ/g, and its characteristic ideal is (g).
3. Over a free reflexive hull, every functional is a Λ-combination of coordinates, so ind_Λ(c) = (a_1, …, a_r) ⊂ (g) with (g) the smallest principal ideal containing it.

**Uses that determine the API.**

- Mazur–Rubin, Theorem 5.3.10: char(X∞) divides Ind(κ), with equality under Λ-primitivity
- Mazur–Rubin, proof of Theorem 5.3.10: ord_𝔓 Ind(κ) is computed through the specializations at 𝔓_N
- Büyükboduk, §4: Ind of the cyclotomic-unit and Kato Λ-adic systems in the main-conjecture applications

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystem.ind` | data | Ind(c), the principal ideal generated by the gcd of the coordinates of c in a free pseudo-isomorphic module. |
| `TauCeti.KolyvaginSystem.ind_zero` | simp | Ind(0) = 0. |
| `TauCeti.KolyvaginSystem.ind_eq_char` | characterisation | For c ≠ 0, Ind(c) = char((H¹(Q, 𝐓)/Λc)_tors). |
| `TauCeti.KolyvaginSystem.ind_smul` | simp | Ind(λc) = λ Ind(c). |
| `TauCeti.KolyvaginSystem.exists_finiteIndex_mul_mem` | other | There is an ideal B of finite index in Λ with Bc ⊂ Ind(c)H¹(Q, 𝐓). |
| `TauCeti.KolyvaginSystem.lambdaIndex_le_ind` | compatibility | ind_Λ(c) ⊂ Ind(c), and for f ∈ Λ, ind_Λ(c) ⊂ (f) iff Ind(c) ⊂ (f). |
| `TauCeti.KolyvaginSystem.indKS` | data | Ind(κ) = Ind(κ_1) for κ ∈ KS‾(𝐓). |

**Unit tests.**

- `TauCeti.KolyvaginSystem.ind_free_rank_one` (computation): If H¹(Q, 𝐓) ≅ Λ and c ↦ f ≠ 0, then Ind(c) = fΛ = char(Λ/fΛ).
- `TauCeti.KolyvaginSystem.ind_rank_two` (non-example): If H¹(Q, 𝐓) ≅ Λ² and c ↦ (p, γ − 1), then Ind(c) = Λ, while Rubin's ind_Λ(c) = (p, γ − 1) is not principal: the two definitions differ as ideals but give the same divisibility by principal ideals.
- `TauCeti.KolyvaginSystem.ind_zero_convention` (degenerate): Ind(0) = 0; the literal formula char((H¹/Λ·0)_tors) = char(0) = Λ would give Λ and make Theorem 5.3.10(i) false for κ_1 = 0 (source issue E801).
- `TauCeti.KolyvaginSystem.ind_pseudoIso_invariant` (compatibility): Ind(c) does not change if H¹(Q, 𝐓) is replaced by a module pseudo-isomorphic to it carrying c to the image of c.

**Acceptance.**

- H¹ ≅ Λ, c ↦ f: Ind(c) = (f).
- H¹ ≅ Λ², c ↦ (p, γ − 1): Ind(c) = Λ while ind_Λ(c) = 𝔐.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-index`
- `SelmerIwasawaCohomology:L3`
- `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`
- `mathlib:UniqueFactorizationMonoid`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.8, p. 61. The definition as printed. Source excerpt: “If c ∈ H¹(Q, T), we let Ind(c) denote the principal ideal of Λ Ind(c) = char((H¹(Q, T)/Λc)tors).”
- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.8, p. 61. The gcd description adopted here. Source excerpt: “If we fix a pseudo-isomorphism ψ : H¹(Q, T) → Λ^r and write ψ(c) = (a1, . . . , ar), then Ind(c) is the greatest common divisor of the ai.”
- `mazur-rubin-kolyvagin-systems`, §5.3, proof of Theorem 5.3.10, p. 66. The convention Ind(0) = 0 used by the authors. Source excerpt: “If κ1 = 0 then Ind(κ) = 0 and there is nothing to prove.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### Weak Leopoldt from a Λ-adic Kolyvagin system (Mazur–Rubin, Theorem 5.3.6)

`EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-lambda-adic-kolyvagin` — theorem

**Statement.** Let K = Q, K∞ = Q∞, T satisfy (H.0)–(H.4) of Mazur–Rubin §3.5, and κ ∈ KS‾(𝐓, F_Λ, P) with κ_1 ≠ 0 (F_Λ canonical). Then for all but finitely many height-one primes 𝔓 the class κ^{(𝔓)}_1 ∈ H¹(Q, T ⊗ S_𝔓) is nonzero (Corollary 5.3.19), and H¹_{F_Λ*}(Q, 𝐓*) is a co-torsion Λ-module, i.e. X∞ is Λ-torsion (Theorem 5.3.6).

**Hypotheses.**

- Theorem 5.3.6 is stated for KS(𝐓) and holds with the same proof for KS‾(𝐓) (Remark 5.3.11).
- This is the Kolyvagin-system counterpart of weak-leopoldt-from-an-euler-system; for κ from an Euler system c, κ_1 = c_{Q,∞}.

**Proof outline.**

1. κ_1 is a nonzero element of the finitely generated torsion-free Λ-module H¹(Q, 𝐓) (Mazur–Rubin, Lemma 5.3.5, requested from SelmerIwasawaCohomology L3), so κ_1 ∈ 𝔓H¹(Q, 𝐓) for only finitely many height-one 𝔓; injectivity of π_𝔓 (specialization-control) gives Corollary 5.3.19.
2. Choose 𝔓 ∉ Σ_Λ with κ^{(𝔓)}_1 ≠ 0. Mazur–Rubin's Theorem 5.2.2 over the DVR S_𝔓 (ES.4) shows H¹_{F_can*}(Q, (T ⊗ S_𝔓)*) finite; by specialization-control, H¹_{F_Λ*}(Q, 𝐓*)[𝔓] is finite.
3. Since (Λ^∨)[𝔓] = (Λ/𝔓)^∨ is infinite, H¹_{F_Λ*}(Q, 𝐓*) is co-torsion.

**Acceptance.**

- For the cyclotomic-unit system κ^{ρ,∞}, X∞ is torsion.
- For κ = 0 nothing is asserted.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`
- `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`
- `EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems`
- `EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `SelmerIwasawaCohomology:L3`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.6, p. 61. Theorem 5.3.6 verbatim. Source excerpt: “Suppose κ ∈ KS(T), and κ1 ≠ 0. Then H¹_F*Λ(Q, T*) is a co-torsion Λ-module.”
- `mazur-rubin-kolyvagin-systems`, §5.3, Corollary 5.3.19, p. 65. Corollary 5.3.19 verbatim. Source excerpt: “Suppose κ ∈ KS(T) and κ1 ≠ 0. Then for all but finitely many height-one primes P of Λ, the class κ(P)1 ∈ H¹(Q, T ⊗ SP) is nonzero.”
- `mazur-rubin-kolyvagin-systems`, §5.3, proof of Theorem 5.3.6, pp. 65–66. The proof. Source excerpt: “Applying Theorem 5.2.2 to κ(P) shows that H¹_F*can(Q, (T ⊗ SP)*) is finite, and then Proposition 5.3.14 shows that H¹_F*Λ(Q, T*)[P] is finite.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### The Λ-adic Kolyvagin-system bound and its equality criterion (Mazur–Rubin, Theorem 5.3.10)

`EulerSystemsAndKolyvaginSystems:ES.8/mazur-rubin-lambda-adic-main-theorem` — theorem

**Planet:** Mazur–Rubin Λ-adic Kolyvagin bound.

**Statement.** Let K = Q, K∞ = Q∞, T satisfy (H.0)–(H.4), F_Λ canonical, X∞ = Hom(H¹_{F_Λ*}(Q, 𝐓*), Q_p/Z_p), and κ ∈ KS‾(𝐓, F_Λ, P). (i) char(X∞) divides Ind(κ). (ii) If χ(𝐓) = 1, κ_1 ≠ 0 and 𝔓 is a height-one prime not in the blind spot of κ, then ord_𝔓 char(X∞) = ord_𝔓 Ind(κ). (iii) If χ(𝐓) = 1, κ_1 ≠ 0 and κ is Λ-primitive, then char(X∞) = Ind(κ).

**Hypotheses.**

- (i) is a divisibility only; equality needs all three conditions of (iii): generic core rank one, nonvanishing bottom class and Λ-primitivity. Nonvanishing alone does not give equality.
- With Ind(0) = 0 (lambda-adic-ind), (i) is trivial when κ_1 = 0.
- For κ coming from an Euler system c via euler-to-lambda-adic-kolyvagin, Ind(κ) = Ind(c_{Q,∞}) and (i) is consistent with rubin-iwasawa-divisibility.

**Proof outline.**

1. Assume κ_1 ≠ 0, so X∞ is torsion (weak-leopoldt-from-lambda-adic-kolyvagin). Fix 𝔓 ≠ pΛ, a distinguished generator ρ(U) of 𝔓, 𝔓_N = (ρ(U) + p^N), and a pseudo-isomorphism X∞ → ⊕_i Λ/𝔓^{m_i} ⊕ ⊕_j Λ/f_j with f_j prime to 𝔓.
2. For N large: 𝔓_N is prime with Λ/𝔓 ≅ Λ/𝔓_N, κ_1 has nonzero image in H¹(Q, T ⊗ S_{𝔓_N}), coker(H¹(Q, 𝐓)/𝔓_N ↪ H¹_{F_can}(Q, T ⊗ S_{𝔓_N})) is bounded independently of N, and 𝔓_N ∉ Σ_Λ is prime to every f_j (height-one-specialization, specialization-control).
3. With d = ord_𝔓 Ind(κ) and e the ramification index of S_{𝔓_N}/Z_p, |∂^{(0)}(κ^{(𝔓_N)}) − Nde| = O(1); Mazur–Rubin's Theorem 5.2.2 (ES.4) gives length H¹_{F_can*}(Q, (T ⊗ S_{𝔓_N})*) ≤ Ne·d + O(1), hence length_{Z_p} H¹_{F_Λ*}(Q, 𝐓*)[𝔓_N] ≤ Nr·d + O(1), r = rank_{Z_p} S_{𝔓_N}; on the other side length_{Z_p}(X∞/𝔓_N X∞) = Nr Σ m_i + O(1) = Nr ord_𝔓 char(X∞) + O(1) (requested from PadicMeasuresIwasawaAlgebras L4). Letting N → ∞ gives (i) at 𝔓; for 𝔓 = pΛ use 𝔓_N = (U^N + p).
4. (ii): by Lemma 5.3.20 some κ_n has nonzero image modulo 𝔪_𝔓^k; for N > k the same holds at 𝔓_N, so ∂^{(∞)}(κ^{(𝔓_N)}) < k; χ(T ⊗ S_{𝔓_N}) = 1 (generic-core-rank) and Mazur–Rubin's Theorem 5.2.12(vii) (ES.5) give equality in the length bound, hence equality of orders.
5. (iii) is (ii) at every height-one prime.

**Acceptance.**

- Cyclotomic units with ρ(p) ≠ 1: κ^{ρ,∞} is Λ-primitive and χ = 1, so char(X∞) = Ind(κ^{ρ,∞}) (Büyükboduk, Proposition 4.1, citing this theorem).
- Replacing κ by (γ − 1)κ keeps (i) but makes Ind larger by (γ − 1) and destroys Λ-primitivity, so (iii) cannot be applied: a false sharpness claim is excluded.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-lambda-adic-kolyvagin`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-ind`
- `EulerSystemsAndKolyvaginSystems:ES.8/blind-spot-and-lambda-primitivity`
- `EulerSystemsAndKolyvaginSystems:ES.8/generic-core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`
- `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`
- `EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem`
- `PadicMeasuresIwasawaAlgebras:L4`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`

**Sources.**

- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.10, p. 62. Parts (i)–(ii) verbatim, including the printed repetition 'is is'. Source excerpt: “Theorem 5.3.10. Suppose κ ∈ KS(T). (i) char(X∞) divides Ind(κ). (ii) If χ(T) = 1, κ1 ≠ 0, and P is is a height-one prime of Λ not in the blind spot of κ, then ordP(char(X∞)) = ordP(Ind(κ)).”
- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.10(iii), p. 62. Part (iii) verbatim. Source excerpt: “(iii) If χ(T) = 1, κ1 ≠ 0, and κ is Λ-primitive then char(X∞) = Ind(κ).”
- `mazur-rubin-kolyvagin-systems`, §5.3, proof of Theorem 5.3.10, p. 67. The length comparison along the perturbations. Source excerpt: “so taking N sufficiently large shows that ordP(char(X∞)) ≤ ordP(Ind(κ)). Since P was arbitrary, this proves (i).”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### The self-dual Λ-adic Kolyvagin bound (Howard, Theorem 2.2.10)

`EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound` — theorem

**Planet:** Howard's self-dual Λ-adic bound.

**Statement.** Let K be imaginary quadratic, K∞/K its anticyclotomic Z_p-extension, Λ = O[[Γ]] with the involution ι, 𝐓 = T ⊗ Λ, 𝐀 = Hom(𝐓, μ_{p^∞}) with the perfect pairing e_Λ: 𝐓 × 𝐀 → μ_{p^∞}, e_Λ(λt, a) = e_Λ(t, λ^ι a), and F_Λ a Λ-adic Selmer structure whose local conditions on 𝐓 and 𝐀 are exact orthogonal complements; X = Hom(H¹_{F_Λ}(K, 𝐀), Q_p/Z_p). Assume: (A) H¹_{F_Λ}(K, 𝐓) is Λ-torsion-free; (B) specialization-control holds for (𝐓, F_Λ) with a finite exceptional set Σ_Λ; (C) for every height-one 𝔓 ≠ pΛ (and the perturbed 𝔔 = (g + p^m)) outside Σ_Λ, the specialized Selmer triple (T_𝔓, F_𝔓, L_s) satisfies Howard's hypotheses H.0–H.5, so that ES.5's self-dual DVR theorem (Howard, Theorem 1.6.1, Proposition 2.1.3) applies; (D) char(X_tors) = char(X_tors)^ι. If for some s there is κ ∈ KS(𝐓, F_Λ, L_s) with κ_1 ≠ 0, then (a) H¹_{F_Λ}(K, 𝐓) is torsion-free of rank one; (b) there is a torsion Λ-module M with char(M) = char(M)^ι and a pseudo-isomorphism X ∼ Λ ⊕ M ⊕ M; (c) char(M) divides char(H¹_{F_Λ}(K, 𝐓)/Λκ_1). For T = T_pE, E/Q ordinary at p with surjective ρ̄_{E,p} and Howard's standing hypotheses on (E, K, p), with the ordinary structure, (A)–(D) are verified by the consumer HeegnerPointEulerSystems HE.8 (Howard, Proposition 2.1.3, Lemma 2.2.7, Proposition 2.2.8, Lemma 2.2.9, and Nekovář's functional equation char(X_tors) = char(X_tors)^ι), and the theorem then is Howard's Theorem 2.2.10.

**Hypotheses.**

- The anticyclotomic tower is not admissible (inert primes split completely), so Rubin's Theorem II.3.3 does not apply; this theorem works directly with Kolyvagin systems.
- (c) is a divisibility, with the factor two of the self-dual structure built into X ∼ Λ ⊕ M ⊕ M; it is not a universal formula for every T.
- The nonvanishing κ_1 ≠ 0 is an input; for Heegner points it is the Cornut–Vatsal nonvanishing proved in HeegnerPointEulerSystems HE.8, never derived here.
- Howard writes the theorem for T_pE; the abstraction (A)–(D) lists exactly the inputs his proof uses.

**Proof outline.**

1. At every height-one 𝔓 ≠ pΛ the specialization map KS(𝐓, F_Λ, L_s) → KS(T_𝔓, F_𝔓, L_s(T_𝔓)) is defined (Howard, Remark 1.2.4 and Lemma 2.2.7); by (B) and (A), κ^{(𝔓)}_1 generates an infinite S_𝔓-submodule for all but finitely many 𝔓.
2. Enlarge Σ_Λ by those 𝔓, the primes dividing char(X_tors), and pΛ. For 𝔓 ∉ Σ_Λ, (C) gives H¹_{F_𝔓}(K, T_𝔓) free of rank one and corank H¹_{F_𝔓}(K, A_𝔓) = 1, so by (B) H¹_{F_Λ}(K, 𝐓) has rank one and H¹_{F_Λ}(K, 𝐀) corank one: this is (a).
3. For 𝔓 | f_Λ = char(H¹_{F_Λ}(K, 𝐓)/Λκ_1), 𝔓 ≠ pΛ, with Weierstrass degree d and 𝔔 = (g + p^m): length_{Z_p}(H¹_{F_𝔔}(K, T_𝔔)/S_𝔔κ^{(𝔔)}_1) = m·d·ord_𝔓(f_Λ) + O(1) and 2·length_{Z_p} M_𝔔 = m·d·ord_𝔓 char(X_tors) + O(1); the finite-level bound length M_𝔔 ≤ length(H¹/S_𝔔κ_1) then gives ord_𝔓 char(X_tors) ≤ 2 ord_𝔓(f_Λ); 𝔓 = pΛ with 𝔔 = (T^m + p). The length asymptotics along 𝔔 are requested from PadicMeasuresIwasawaAlgebras L4.
4. (b): with X_tors ∼ N ⊕ N_𝔓, N_𝔓 ≅ ⊕ Λ/𝔓^{e_i}, the maps N_𝔓 ⊗ S_𝔔 → M_𝔔 ⊕ M_𝔔 have bounded kernels and cokernels as m varies, and an elementary argument shows each exponent e occurs an even number of times; (D) gives char(M) = char(M)^ι. Then (c) follows from (b) and the inequality of the previous step.

**Acceptance.**

- For E/Q ordinary at p with surjective ρ̄ and the Heegner Kolyvagin system (HE.8), this is Howard's Theorem B.
- Scaling κ by λ multiplies char(H¹/Λκ_1) by λ and weakens (c) accordingly.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems`
- `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`
- `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `PadicMeasuresIwasawaAlgebras:L4`
- `PadicMeasuresIwasawaAlgebras:L4/structure-theorem-regular-dimension-two`
- `PadicMeasuresIwasawaAlgebras:L4/pseudo-isomorphism`

**Sources.**

- `howard-heegner-point-kolyvagin-system`, §2.2, Theorem 2.2.10, p. 26. The hypotheses and conclusion (a). Source excerpt: “Let X = Hom(H¹_FΛ(K, A), Qp/Zp) and suppose that for some s the Selmer triple (T, FΛ, Ls) admits a Kolyvagin system κ with κ1 ≠ 0. Then (a) H¹_FΛ(K, T) is a torsion free, rank one Λ-module,”
- `howard-heegner-point-kolyvagin-system`, §2.2, Theorem 2.2.10(b)–(c), p. 26. Conclusions (b)–(c). Source excerpt: “(b) there is a torsion Λ-module M such that char(M) = char(M)ι and a pseudo-isomorphism X ∼ Λ ⊕ M ⊕ M, (c) char(M) divides char(H¹_FΛ(K, T)/Λκ1).”
- `howard-heegner-point-kolyvagin-system`, §2.2, proof of Theorem 2.2.10, p. 27. The method: Mazur–Rubin's perturbation argument (their Theorem 5.3.10). Source excerpt: “We now argue as in the proof of [MR04] Proposition 5.3.10.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

#### The error-tolerant self-dual Λ-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1)

`EulerSystemsAndKolyvaginSystems:ES.8/error-tolerant-self-dual-lambda-adic-bound` — theorem

**Statement.** Generic form: in the setting of self-dual-lambda-adic-kolyvagin-bound, replace (C) and (D) by (C'): at the height-one primes 𝔔 ∉ Σ_Λ the finite-level error-tolerant theorem of ES.4 holds, H¹_{F_𝔔}(K, T_𝔔) free of rank one, H¹_{F_𝔔}(K, A_𝔔) ≅ D_𝔔 ⊕ M_𝔔 ⊕ M_𝔔 with M_𝔔 finite and length M_𝔔 ≤ length(H¹_{F_𝔔}(K, T_𝔔)/S_𝔔κ^{(𝔔)}_1) + E_𝔔, where for every height-one 𝔓 outside a finite set Σ' the errors E_𝔔 at 𝔔 = (g + p^m) are bounded as m varies. Then H¹_{F_Λ}(K, 𝐓) has rank one, X ∼ Λ ⊕ M ⊕ M with M torsion, and char(M) divides char(H¹_{F_Λ}(K, 𝐓)/Λκ_1) after inverting the primes of Σ', i.e. ord_𝔓 char(M) ≤ ord_𝔓 char(H¹_{F_Λ}(K, 𝐓)/Λκ_1) for every height-one 𝔓 ∉ Σ'. Instance (Castella–Grossi–Lee–Skinner): E/Q of conductor N, p ∤ 2N good ordinary, K imaginary quadratic with D_K prime to Np and E(K)[p] = 0 (residual irreducibility not assumed), 𝐓 = T_pE ⊗ Λ with the ordinary structure (relaxed away from p on 𝐓), L = L_E, 𝔓_0 = (γ − 1): if κ ∈ KS(𝐓, F_Λ, L_E) has κ_1 ≠ 0, then H¹_{F_Λ}(K, 𝐓) has Λ-rank one and X ∼ Λ ⊕ M ⊕ M with char_Λ(M) | char_Λ(H¹_{F_Λ}(K, 𝐓)/Λκ_1) in Λ[1/p, 1/(γ − 1)] (Theorem 3.4.1); if moreover H¹_F(K, E[p^∞]) has Z_p-corank one, the divisibility holds in Λ[1/p] (Corollary 3.4.2).

**Hypotheses.**

- The finite-level error-tolerant theorem (Castella et al., Theorem 3.2.1, with error E_α depending on C_α, T_pE and rank R) is owned by ES.4; this node owns only its Iwasawa variation.
- Near 𝔓_0 the constant C_α of the specializations is unbounded, hence the localization at γ − 1; Corollary 3.4.2 removes it using control at 𝔓_0, which the source does not prove: the node uses the control statement rank_{Z_p} X/𝔓_0X = corank_{Z_p} H¹_F(K, E[p^∞]) recorded as PAPER-CASTELLA-ETAL-22/E32 (from E(K∞)[p] = 0 and finiteness of the local terms); this control theorem is requested from SelmerIwasawaCohomology L3, which owns Iwasawa control.
- In Z_p-lengths the error at 𝔔 is f_𝔔·E_{α_𝔔}, f_𝔔 the residue degree of S_𝔔 (PAPER-CASTELLA-ETAL-22/E29); the character α_𝔓 is Ψ mod 𝔓 in the convention of lambda-adic-selmer-structure.
- Consumers: RankZeroOneBSD BSD.7a uses the instance for the Eisenstein branch with HE.8's Heegner classes; the divisibility away from p is all it provides.

**Proof outline.**

1. Specialize at 𝔔 = (g + p^m) for 𝔓 = (g) ≠ (p), 𝔓_0 and apply (C') with E_{α_𝔔} = E_{α_𝔓} for m ≫ 0, since rank_{Z_p} S_𝔔 = rank_{Z_p} S_𝔓 and C_{α_𝔔} = C_{α_𝔓} (Castella et al., proof of Theorem 3.4.1).
2. As in self-dual-lambda-adic-kolyvagin-bound, length_{Z_p}(H¹_{F_𝔔}/S_𝔔κ^{(𝔔)}_1) = md·ord_𝔓(f_Λ) + O(1) and 2·length_{Z_p}(M_𝔔) = md·ord_𝔓 char(X_tors) + O(1); the bounded error disappears as m → ∞, giving ord_𝔓 char(X_tors) ≤ 2 ord_𝔓(f_Λ) for 𝔓 ≠ (p), 𝔓_0; (i) is shown exactly as in Howard's Theorem 2.2.10.
3. Corollary 3.4.2: with control at 𝔓_0, corank one of H¹_F(K, E[p^∞]) makes X_tors/𝔓_0X_tors torsion over Z_p, so ord_{𝔓_0} char(X_tors) = 0.

**Acceptance.**

- When ρ_E|G_K is surjective, Theorem 3.2.1 holds with E_α = 0 and the statement reduces to Howard's.
- At 𝔓_0 the method gives nothing without the corank-one hypothesis.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems`
- `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`
- `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`
- `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`
- `PadicMeasuresIwasawaAlgebras:L4`
- `PadicMeasuresIwasawaAlgebras:L4/structure-theorem-regular-dimension-two`
- `SelmerIwasawaCohomology:L3`

**Sources.**

- `castella-grossi-lee-skinner-eisenstein`, §3.4, Theorem 3.4.1, p. 26. Theorem 3.4.1 verbatim. Source excerpt: “Suppose there is a Kolyvagin system κ ∈ KS(T, FΛ, LE) with κ1 ≠ 0. Then H¹FΛ(K, T) has Λ-rank one, and there is a finitely generated torsion Λ-module M such that (i) X ∼ Λ ⊕ M ⊕ M, (ii) charΛ(M) divides charΛ(H¹FΛ(K, T)/Λκ1) in Λ[1/p, 1/(γ − 1)].”
- `castella-grossi-lee-skinner-eisenstein`, §3.4, Corollary 3.4.2, p. 27. Corollary 3.4.2. Source excerpt: “Assume also that H¹F(K, E[p∞]) has Zp-corank one (equivalently, H¹F(K, TpE) has Zp-rank one). Then charΛ(M) divides charΛ(H¹FΛ(K, T)/Λκ1) in Λ[1/p].”
- `castella-grossi-lee-skinner-eisenstein`, §3.4, proof of Theorem 3.4.1, p. 27. The uniformity of the error, which is hypothesis (C'). Source excerpt: “If P ≠ P0, then the error term EαQ is bounded independently of m, since rankZp(SQ) = rankZp(SP) and the term CαQ in (3.3) satisfies CαQ = CαP for m ≫ 0.”

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.

## Application handoffs

| Consumer | Exact input from this roadmap | Obligation retained by the consumer |
| --- | --- | --- |
| `EulerSystemsCyclotomicMainConjecture:L0/L2` | ES.2/euler-system-module, euler-polynomial, conductor-presentation, twisting; ES.8/rubin-iwasawa-divisibility and iwasawa-poitou-tate-sequence | Construct cyclotomic units and norm/smoothing relations, check hypotheses, identify the local term and prove the reverse divisibility by the analytic input. Rubin II.3.8 does not apply to this cyclotomic example: its singular localization is torsion. Use II.3.3 plus II.3.7. |
| `KatoEulerSystems:L2/L4` | ES.2 carriers and ES.3/euler-to-kolyvagin; ES.4/rubin-bound; ES.8/rubin-rational-iwasawa-divisibility or rubin-iwasawa-divisibility under integral large image | Construct Kato's system, decompose the cyclotomic finite group by characters and check large image over G_Q∞. Identify Kato's H²(T)_0 with the module controlled by the chosen theorem, or retain Rubin's restricted-Selmer package. The comparison is an open gap. |
| `HeegnerPointEulerSystems:HE.6/HE.8` | ES.1 local/prime-selection results, ES.3 derivatives, ES.5/howard-hypotheses and howard-dvr-theorem; ES.8/self-dual-lambda-adic-kolyvagin-bound | Build the Heegner system, verify finite-level H.0–H.5 and tower (A)–(D), prove nonvanishing and retain Howard's involution. The anticyclotomic tower is not Rubin-admissible. |
| `GeneralizedHeegnerCycles:GH.5` | ES.5/howard-dvr-theorem and ES.8/self-dual-lambda-adic-kolyvagin-bound, under their stated hypotheses | Verify the self-duality, local structure, specialization and functional equation for the actual cycle representation. An application edge alone supplies none of these hypotheses. |
| `RankZeroOneBSD:BSD.7a` | ES.4/howard-descent-with-errors and ES.8/error-tolerant-self-dual-lambda-adic-bound | Construct the system and prove the corank-one/analytic inputs. Initially invert p and γ−1; removing γ−1 uses augmentation control and the stated corank-one hypothesis. The weak Cassels-pairing supplier remains open. |

## Coverage, requests and gaps

The following records retain the two packets' scope and qualifications. A planned target-level
node may still have a lemma-level refinement outstanding. `partial` denotes stronger unresolved
closure or ownership/signature work. The full request and restructuring records, including all
consumer IDs, are also collected in the [assembly handoff](../handoff/ASM-EulerSystemsAndKolyvaginSystems.md).

### Layer coverage

**`EulerSystemsAndKolyvaginSystems:ES.0` — partial.**

- Lemma level: the proof of Mazur–Rubin 2004 Lemma 3.7.1 (torsion-free quotient implies cartesian, with the bounded cokernel in (ii)) and of Theorem 5.2.15 at the prime p.
- State the Selmer-structure carrier over a general complete noetherian local ring once SelmerIwasawaCohomology L2 provides it (request recorded).
- Provide the actual general-R Selmer/Cartier-dual carrier signatures, including the signed core-rank dictionary; the generic module prototype is not this carrier.

**`EulerSystemsAndKolyvaginSystems:ES.1` — planned.**

- Lemma level: Mazur–Rubin 2004 Lemma 3.6.3 and the two-step proof of Propositions 3.6.1–3.6.2; Rubin Lemma V.2.1.
- The consumer requests of HeegnerPointEulerSystems (Zhang's two-class detection over a finite field k₀, Gross's eigenspace pairings) are special cases of chebotarev-nonvanishing and transverse-duality for self-dual T; state them in Howard's setting as corollaries once HE.6 fixes its exact forms.
- The remaining items of the Liu–Tian–Xiao–Zhang–Zhu route (S23-closure, S23-norm, S23-paired, S23-obstruction, S23-defect, S23-error, S24-rows, S24-bounded) refine abundant-tuples and ES.4/abundant-localization to the paired-evaluation obstruction; they are lemma-level statements of linear algebra over a discrete valuation ring.

**`EulerSystemsAndKolyvaginSystems:ES.2` — planned.**

- Lemma level: Rubin Lemma IX.6.3 and Corollary 6.4 (units and shifts of the variable) in full, and Proposition IV.3.1(iv)–(v), Lemmas IV.2.5, IV.4.6 and Proposition IV.4.7 as separate statements.
- Smoothing (removing the dependence on an auxiliary prime, as for cyclotomic units) is stated by the cyclotomic owner; a generic smoothing operation was not found in the sources read.

**`EulerSystemsAndKolyvaginSystems:ES.3` — planned.**

- Lemma level: Rubin IV §6 (Proposition 6.1 is planned in SelmerIwasawaCohomology L3; Corollaries 6.2, 6.5, Lemma 6.3, Definition 6.6, Lemma 6.7, Proposition 6.8), IV §7 (Lemmas 7.1, 7.3, the lifted telescoping identity), and Mazur–Rubin Appendix A (Lemma A.6 to Proposition A.15).
- The derivative descent statement with explicit kernel and cokernel when W^{G_{F(r)}} ≠ 0 is contained in lifting-to-induced-module; an explicit bound for the non-canonical descent used by HeegnerPointEulerSystems HE.7 (bounded denominators) is a follow-up.

**`EulerSystemsAndKolyvaginSystems:ES.4` — partial.**

- Lemma level: Mazur–Rubin 2004 Lemmas 4.3.8–4.3.9, Propositions 4.3.10–4.3.11, Theorem 4.3.12, Theorem 4.4.3 (sufficiently liftable systems) and Appendix B (Howard's proof of Theorem 4.3.3).
- Rubin Theorem II.2.10 is included in rubin-bound(c); Rubin Chapter V §2 general case of Lemma 2.5 at lemma level.
- Requests of HeegnerPointEulerSystems HE.7 not planned here because their sources are not sources of this roadmap and were not read: Nekovář's error-tolerant two-prime descent ('The Euler system method for CM points on Shimura curves', §§6.4, 7.5) and Kolyvagin's Theorem A (cardinality/square-index form). They need their own nodes under ES.4 after those texts are read.
- Castella–Grossi–Lee–Skinner Lemmas 3.3.10 and Proposition 3.3.11 are cited inside howard-descent-with-errors; they become nodes at lemma level.
- The generic CGLS residual-reducible error route needs its weak-hypothesis Cassels pairing; source-qualified Nekovář/Kolyvagin classical all-prime descent targets remain to be stated, with uniform error hypotheses.

**`EulerSystemsAndKolyvaginSystems:ES.5` — planned.**

- Lemma level: Mazur–Rubin 2004 Lemmas 4.5.13–4.5.14, Proposition 4.5.15, Lemmas 5.2.7–5.2.8; Howard Lemmas 1.5.6–1.5.8 and 1.6.2–1.6.4.
- Howard's Λ-adic theorem (Theorem 2.2.10) belongs to ES.8 and is planned with that layer (red-team finding RT-AREA-iwasawa-1/10).

**`EulerSystemsAndKolyvaginSystems:ES.6` — partial.**

- The comparison of Mazur–Rubin's and Burns–Sakamoto–Sano's Stark systems (recorded as a gap).
- Lemma level: Mazur–Rubin 2016 Appendix A (exterior algebra: Propositions A.1, A.3), §14; Burns–Sakamoto–Sano II Lemmas 2.5, 3.5–3.10, 4.4, 4.10 and §5.4.
- Burns–Sano's basic (determinantal) Euler and Stark systems (arXiv:1612.06187) are a further supplier of systems; that paper was downloaded and not read, so no node is planned for it.
- Resolve exterior-bidual ownership with PadicMeasuresIwasawaAlgebras L6 and import its exact scalar/group-ring change contracts.
- Supply a same-exterior-rank discriminating test for the stub systems.

**`EulerSystemsAndKolyvaginSystems:ES.7` — partial.**

- Corollaries 6.17 and 6.18 (the ideals I′_i and the Λ-adic consequences) and Theorem 7.1 parts (i)–(ii) are applications to be planned with ES.8 and with the class-group application.
- The modified (Σ-modified) cohomology variant that avoids Hypothesis 6.1(i) needs its own comparison (Remark 6.3 of the source).
- State the conditional Rubin–Stark class-group/Fitting application as a node with its exact hypotheses and its comparison with the specialized DK minus-unit construction.
- Discharge the bidual reduction, norm/transfer and invariant-descent supplier contract.

**`EulerSystemsAndKolyvaginSystems:ES.8` — planned.**

- Lemma-level refinement of Rubin's Chapter VII §§5–7 (Propositions 5.1–5.2, Lemmas 6.1–6.3, Lemma 7.1–Proposition 7.7): read in statement and partly in proof; kolyvagin-sequence-induction carries them as one target-level node and its proof sketch.
- The comparison of Kato's H²(T)_0 (KatoEulerSystems L4, Kato's Theorem 13.4) with X∞: no public source was found for X∞ ≅ Ш²_Iw(K∞, T); the Kato adapter must prove it or work directly with Rubin's package recorded in rubin-rational-iwasawa-divisibility (see gaps).
- Freeness of the module of Λ-adic Kolyvagin systems (Büyükboduk, Theorem 3.23) is cited as a test value only; it is not planned, since no stated target of ES.8 needs it.

### Supplier requests

**ES.0-R1: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.** Existence of the ray class field of K modulo a prime q, with Gal(K[q]/K) ≅ the ray class group Cl_q(K), and the description of its ramification; used to define K(q), K(1) and Γ_q.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`, `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`.

**ES.0-R2: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.** The absolute local Artin map, normalized by arithmetic Frobenius, and its restriction to finite tame extensions, identifying the p-primary tame inertia quotient with residue-field units (or the relative residue-unit quotient at Howard’s inert primes). Local Tate duality is supplied separately by Layer 5.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`.

**ES.0-R3: `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.** The Chebotarev density theorem for a finite Galois extension of number fields in Dirichlet-density form: the primes with a given Frobenius class have density |C|/|G|; in particular infinitely many, also after removing a finite set.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`, `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`, `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`.

**ES.0-R4: `PadicMeasuresIwasawaAlgebras:L6`.** For a Gorenstein order R over a complete discrete valuation ring and its quotients R/(p^m): self-injectivity of R/(p^m); exactness of Hom(−, R/(p^m)) and reflexivity of finitely generated modules; Fitting ideals Fitt^i_R with their determinantal description from a presentation and their behaviour under base change; and the identification X^∨ ≅ X^* for R/(p^m)-modules. Also the general exterior-bidual scalar/group-ring change maps and transfer/norm comparison, in particular BSS II §6.3 map (9), invariants descent and Lemma 6.9’s corestriction-versus-group-norm identity. Pure exterior-bidual algebra is owned by L6 and must be imported here; ES.6 keeps its Selmer/Stark specialization.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`, `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`, `EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds`, `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`.

**ES.0-R5: `SelmerIwasawaCohomology:L2`.** Selmer structures over a number field with coefficients in a complete noetherian local ring R (not only the integers of a p-adic field): the nodes L2/dual-selmer-structure and L2/selmer-structure-poitou-tate are stated for O; the artinian and Gorenstein cases of Mazur–Rubin Theorem 2.3.4 and Burns–Sakamoto–Sano Theorem 3.1 (the five-term global duality sequence for F₁ ≤ F₂ over a self-injective ring) are needed in the same form. Supply the actual Selmer/cohomology carrier and Cartier-dual coefficient dictionaries at that generality, propagation and orthogonal-complement compatibility, global and local duality with the signed length convention. For the CGLS error route provide the Cassels pairing under vanishing residual invariants, cartesian local conditions and Howard’s symmetric self-duality, without assuming residual absolute irreducibility; see CGLS Proposition 3.3.2.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`, `EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`, `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`, `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`.

**ES.0-R6: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.** Perfect local Tate pairings for finite p-primary unramified coefficients at places of residue characteristic different from p, with the cup/invariant normalization, restriction-corestriction adjointness and the exact-annihilator statement used for the transverse condition. Mixed-characteristic p-adic lattice/discrete extensions are requested from SelmerIwasawaCohomology L1/L2.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`.

**ES.8-R1: `PadicMeasuresIwasawaAlgebras:L4`.** Multivariable Iwasawa algebras Λ = O[[Γ]] ≅ O⟦T_1, …, T_d⟧ for Γ ≅ Z_p^d: noetherian, regular local of dimension d + 1, hence factorial; pseudo-null modules (annihilated by an ideal of height ≥ 2, not finite when d ≥ 2), pseudo-isomorphisms and characteristic ideals over them, with multiplicativity in exact sequences and pseudo-isomorphism invariance. Rubin's Theorems II.3.2–II.3.4 and II.3.8 are stated for every d ≥ 1 (the stage's own remaining item 'Multivariable algebras O⟦T₁, …, T_d⟧').

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower`, `EulerSystemsAndKolyvaginSystems:ES.8/kolyvagin-sequence-induction`, `EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility`, `EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems`.

**ES.8-R2: `PadicMeasuresIwasawaAlgebras:L4`.** Twisting of characteristic ideals and annihilators: for a character ρ: Γ → O^×, Tw_ρ: Λ → Λ the O-algebra automorphism γ ↦ ρ(γ)γ, and a finitely generated torsion Λ-module B, Tw_ρ(char(B ⊗ ρ)) = char(B) and Tw_ρ(Ann_Λ(B ⊗ ρ)) = Ann_Λ(B) (Rubin, Euler systems, Lemma VI.1.2); Tw_ρ preserves heights of ideals.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems`, `EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case`.

**ES.8-R3: `PadicMeasuresIwasawaAlgebras:L4`.** Length asymptotics along Hensel perturbations: for Λ = O⟦X⟧, a height-one prime 𝔓 = (g) ≠ ϖΛ with g distinguished, 𝔓_N = (g + p^N) and a finitely generated torsion Λ-module X, length_{Z_p}(X/𝔓_N X) = N · rank_{Z_p}(Λ/𝔓) · ord_𝔓 char(X) + O(1) as N → ∞ (and the analogue for 𝔓 = ϖΛ with 𝔓_N = (X^N + p)); also, for N ≫ 0, 𝔓_N is a height-one prime with Λ/𝔓_N ≅ Λ/𝔓 as rings. This is the module-theoretic step of Mazur–Rubin's proof of Theorem 5.3.10, used again by Howard (Theorem 2.2.10) and Castella–Grossi–Lee–Skinner (Theorem 3.4.1).

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/mazur-rubin-lambda-adic-main-theorem`, `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound`, `EulerSystemsAndKolyvaginSystems:ES.8/error-tolerant-self-dual-lambda-adic-bound`, `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`.

**ES.8-R4: `PadicMeasuresIwasawaAlgebras:L5`.** Topological Nakayama's lemma over Λ = O[[Γ]]: a compact Λ-module X with X/𝔐X (or X/JX, J the augmentation ideal) finitely generated over O is finitely generated over Λ. Used for the finite generation of X∞ (Rubin, Lemma VII.4.1).

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/x-infinity-finitely-generated`.

**ES.8-R5: `PadicMeasuresIwasawaAlgebras:L1`.** The O-algebra automorphisms Tw_ρ of Λ = O[[Γ]] induced by γ ↦ ρ(γ)γ for continuous characters ρ: Γ → O^×, with Tw_ρ ∘ Tw_ρ' = Tw_{ρρ'}, and the involution ι (γ ↦ γ^{-1}); compatibility with the projections Λ → O[Gal(F/K)].

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/twisting-by-characters-of-gamma`, `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`.

**ES.8-R6: `SelmerIwasawaCohomology:L3`.** For a Z_p-extension K∞/K, 𝐓 = T ⊗ Λ and Σ finite containing p, ∞ and the ramified primes: H^i(K_Σ/K, 𝐓) and H^i(K_v, 𝐓) (v | p) are finitely generated Λ-modules, H²(K_v, 𝐓) is Λ-torsion, and H¹(K_Σ/K, 𝐓) is Λ-torsion-free when T̄^{G_K} = 0 (Mazur–Rubin, Lemmas 5.3.4–5.3.5, after Greenberg and Perrin-Riou); and H²(K_v, 𝐓)/𝔓 ≅ H²(K_v, 𝐓/𝔓𝐓) (cohomological dimension two).

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes`, `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`, `EulerSystemsAndKolyvaginSystems:ES.8/generic-core-rank`, `EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-lambda-adic-kolyvagin`, `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-ind`.

**ES.8-R7: `SelmerIwasawaCohomology:L4`.** Rubin's Corollary I.6.4 in the direction used here: if Leopoldt's conjecture holds for K then S_{Σp}(K, μ_{p^∞}) is finite (already routed to this layer by the review of PAPER-KOLYVAGIN-90, route 6).

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case`.

**ES.8-R8: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.** Global class field theory in the form: the inertia subgroup at a finite prime v of the Galois group of an abelian pro-p extension of a number field is the image of the pro-p completion of O_v^×; hence Z_p^d-extensions are unramified outside p; and the maximal abelian p-extension unramified everywhere and split at the primes above p of a field corresponds to the p-part of its class group modulo those primes.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`, `EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case`.

**ES.8-R9: `SelmerIwasawaCohomology:L3`.** Control at the augmentation ideal for the anticyclotomic ordinary Selmer structure: for E/Q with good ordinary reduction at p ∤ 2N, K imaginary quadratic with D_K prime to Np, E(K)[p] = 0, K∞/K the anticyclotomic Z_p-extension, 𝐓 = T_pE ⊗ Λ with the ordinary condition at p (relaxed away from p on 𝐓, strict on M_E = T_pE ⊗ Λ^∨) and X = H¹_{F_Λ}(K, M_E)^∨: X/(γ − 1)X and the dual of H¹_{F_ord}(K, E[p^∞]) have the same Z_p-rank (kernel and cokernel of the restriction map finite, from E(K∞)[p] = 0 and the local terms). This is the input missing from Castella–Grossi–Lee–Skinner's proof of Corollary 3.4.2 (PAPER-CASTELLA-ETAL-22/E32).

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/error-tolerant-self-dual-lambda-adic-bound`.

### Open gaps

**ES.0-G1: Comparison of the two definitions of Stark systems over principal artinian rings.** Mazur–Rubin define Y_n with exterior powers of H¹_{F^n}(K, T), Burns–Sakamoto–Sano with exterior biduals. The two agree where H¹_{F^n} is free (in particular at the cofinal set of vertices with vanishing strict dual Selmer module), which is enough to identify the inverse limits under (H.1)–(H.7); a statement of this identification was not located in the parts of the sources read (Burns–Sano I, arXiv:1612.06187, §3–§4 and Sakamoto's 'Stark systems over Gorenstein local rings' are the places to look). Next action: read those sections and add the comparison node.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`.

**ES.0-G2: Proofs of Rubin's local theorems and of the induction of Chapter V were read at the level of statements.** Rubin IV §§6–7 (Propositions 6.1, 6.8, Lemmas 6.7, 7.1, 7.3) and V §2 (the proof of Lemma 2.5, including the general case without W^{G_K} = 0 and H¹(Ω/K, W) = 0) are cited in the proof sketches from their statements and from the reviewed extraction PAPER-KOLYVAGIN-90; their interiors must be decomposed when the roadmap moves to lemma level.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`.

**ES.0-G3: Proofs of the higher-rank derivative theorem and of the core-graph connectivity over Gorenstein rings were not read.** The exact correction formula in BSS II §6.4 p.41 has now been read and displayed, with one- and two-prime tests. The complete arguments of §5.4 (core-graph connectivity) and §6.5 (local compatibility) remain statement-level source citations in this target-level pass, not a lemma-level decomposition. The separate bidual-transfer gap names the non-routine supplier input. The inaccessible 2025 accepted version was not collated with arXiv v1.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`, `EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism`.

**ES.0-G4: Kolyvagin's article was not read.** V. A. Kolyvagin, 'Euler systems', The Grothendieck Festschrift II (1990), is not publicly available. As in the reviewed extraction PAPER-KOLYVAGIN-90, Rubin's book is used as the public statement of the method; no claim is made about the wording of Kolyvagin's article.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.3/congruence`, `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`.

**ES.0-G5: Actual arithmetic Lean signatures and adapters are missing.** The suggested file lists most arithmetic definitions, API items, tests and all named arithmetic theorems only in block comments. The typed SelmerTriple, Tower and InverseSystem are generic module presentations, not instantiated Galois/Selmer constructions. Give signatures/examples against the supplier carriers and explicit specialization/transport maps; do not fill the missing hypotheses with arbitrary Prop fields. Preserve the pinned discrete corestriction and add its R-linearity, field-subgroup and compact-coefficient adapters from ArithmeticGaloisDuality R02.1/R02.2 and SelmerIwasawaCohomology L1. Compilation of the algebraic portion alone does not meet PROTOCOL §13.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-length-linearity`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-implications`, `EulerSystemsAndKolyvaginSystems:ES.0/example-cyclotomic-twist`, `EulerSystemsAndKolyvaginSystems:ES.0/example-elliptic`, `EulerSystemsAndKolyvaginSystems:ES.0/non-example-inadmissible`, `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`, `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`, `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels`, `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`, `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`, `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`, `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`, `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`, `EulerSystemsAndKolyvaginSystems:ES.2/twisting`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change`, `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`, `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`, `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`, `EulerSystemsAndKolyvaginSystems:ES.3/derivative-invariance`, `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`, `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`, `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`, `EulerSystemsAndKolyvaginSystems:ES.3/congruence`, `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula`, `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`, `EulerSystemsAndKolyvaginSystems:ES.3/two-prime-test`, `EulerSystemsAndKolyvaginSystems:ES.3/anticyclotomic-derivative`, `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`, `EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy`, `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`, `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`, `EulerSystemsAndKolyvaginSystems:ES.4/leading-vertices`, `EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf`, `EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.4/variant-bounds`, `EulerSystemsAndKolyvaginSystems:ES.4/abundant-localization`, `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`, `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`, `EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem`, `EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem`, `EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer`, `EulerSystemsAndKolyvaginSystems:ES.5/sharpness-examples`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-stub`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`, `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`, `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`, `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r`, `EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism`, `EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`, `EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds`, `EulerSystemsAndKolyvaginSystems:ES.7/rubin-brumer-stark`, `EulerSystemsAndKolyvaginSystems:ES.7/rank-one-comparison`.

**ES.0-G6: General coefficient Selmer duality is still only an open supplier request.** The cited SelmerIwasawaCohomology L1/L2 duality and Cartier-dual nodes use O-adic lattices/discrete modules. The abstract L2/selmer-data carrier alone does not prove MR04 artinian/global-length identities or BSS self-injective-ring duality. Fulfil the enlarged L2 request and link each generalized coefficient consumer to it; no O-only theorem may discharge a general-R hypothesis.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`, `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`, `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer`, `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`.

**ES.0-G7: Single ownership of exterior-bidual algebra.** PadicMeasuresIwasawaAlgebras L6 owns the general exterior-bidual, integral-lattice and scalar-change algebra. ES.6/exterior-bidual and bidual-functoriality currently repeat that general theory. Reconcile with the L6 owner, replace generic ES nodes by exact supplier node IDs/request contracts and retain only the arithmetic contraction/Selmer transition specialization. The split proposal must respect this owner. No supplier packet is edited by this review.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`, `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`.

**ES.0-G8: Bidual norm, transfer and invariant descent have no direct supplier contract.** BSS II Lemma 6.9, p.40 explicitly omits the delicate comparison of bidual corestriction with the group norm and points to [21, Remark 2.12]. Ordinary covariant bidual functoriality does not supply change from R[Gal(E(n)/K)] to R[Gal(E/K)] or map (9). The precise L6 request now names these maps; add its exact supplier nodes and verify the identities before claiming this proof sketch closes.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`.

**ES.0-G9: Cassels pairing for the residual-reducible error route.** ES.4/howard-descent-with-errors claims to use ES.5/cassels-structure without irreducibility, but the latter currently assumes Howard H.1 (absolute residual irreducibility). CGLS Proposition 3.3.2 is the intended weaker statement. Add its precise weak-hypothesis pairing/structure statement, including the residual-invariant and cartesian/self-duality requirements; then route the error proof through it. Until then the advertised direct prerequisite does not suffice.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`, `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`.

**ES.0-G10: Same-rank non-example for stub Kolyvagin systems.** The corrected stub_ne_all test compares KS_1 at core rank χ>1 with KS′_χ and cannot witness strict inclusion at the same exterior rank. Produce an admissible same-rank example or replace this test by another discriminating non-example. The regulator theorem uses rank r=χ, not the higher-core-rank KS_1 module.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r`.

**ES.0-G11: Rubin–Stark application and Rubin–Brumer–Stark comparison.** ES.7 gives the DK minus-unit construction and a conditional reference to BSS Theorem 7.1, but does not provide a node stating that theorem’s class-group conclusions or a comparison identifying its Rubin–Stark elements with the DK minus-part construction. Read and state the application with all character, tower, coefficient and norm/integrality hypotheses; distinguish general Rubin–Stark systems from the specialized Rubin–Brumer–Stark theorem owned by IntegralIwasawaTheory I.7.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.7/rubin-brumer-stark`, `EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds`, `EulerSystemsAndKolyvaginSystems:ES.7/rank-one-comparison`.

**ES.8-G1: No public source identifies X∞ with the Iwasawa Ш² used by Kato's Theorem 13.4.** Kato states his imported bound for H²(T)_0 = ker(H²(T) → H²_loc(T)) with H^q(T) = lim H^q(Z[ζ_{p^n}, 1/p], T). ES.8 supplies Rubin's package: X∞ torsion (Theorem II.3.2 under Hyp(K∞, V) and c_{K,∞} non-torsion) and char(X∞) | p^t ind_Λ(c) (Theorem II.3.4), or char(X∞) | ind_Λ(c) under Hyp(K∞, T) (Theorem II.3.3), for X∞ built from restricted Selmer groups, Λ = O[[Gal(Q∞/Q)]] after decomposing Gal(Q(μ_{p^∞})/Q) = Δ × Γ by characters of Δ (twisting, Rubin II.4). The identification of X∞ with lim Ш²(O_{F,Σ}, T) by Poitou–Tate in the tower (local terms at v ∤ p vanish because H¹_ur(K_{∞,w}, W*) = 0 for infinitely decomposed v) and the comparison of Kato's étale H² with Galois H² over O_{F,Σ} were not found in a public text (Rubin's Remark II.3.5 and Mazur–Rubin's Theorem 5.3.6 only name the weak Leopoldt conjecture). Kato's hypotheses (iv)–(v) are irreducibility over G_Q and an element σ ∈ G_{Q(μ_{p^∞})} with dim ker(1 − σ) = 1; Rubin's Hyp(Q∞, V) needs irreducibility over G_{Q∞}. The KatoEulerSystems L4 adapter must prove the comparison and verify Rubin's hypotheses (Rubin's Proposition III.5.8 does so for elliptic curves).

Consumers: `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`.

**ES.8-G2: Mazur–Rubin's Λ-adic theory is written over Q and the cyclotomic Z_p-extension only.** Mazur–Rubin §5.3 fixes K = Q and K∞ = Q∞. The nodes state their results in that setting; the definitions (lambda-adic-selmer-structure, lambda-adic-kolyvagin-systems, height-one-specialization, blind-spot-and-lambda-primitivity) are written for a Z_p-extension of a number field because Howard and Castella et al. use them over imaginary quadratic fields. A version of Theorems 5.3.3 and 5.3.10 over a general number field, which Büyükboduk §4.3 sketches for totally real fields under Rubin–Stark hypotheses, has no read source and is not planned here.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.8/euler-to-lambda-adic-kolyvagin`, `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`, `EulerSystemsAndKolyvaginSystems:ES.8/mazur-rubin-lambda-adic-main-theorem`.

## Source versions and corrections

Corrections are version-scoped observations inherited from the reviewed packets. They do not
assert that every published edition has the same error. Where the published book corrects the
1999 draft, the node follows the corrected statement. Imported errata retain their paper-job IDs.

### ES.0 source-version records

**sourceVersions.**

- **sourceId:** mr-ks
- **kind:** author copy
- **url:** https://web.archive.org/web/2020id_/https://www.math.uci.edu/~krubin/preprints/kolysys.pdf
- **read:** 2026-10-06
- **sha256:** 4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f
- **notes:** Archived author copy only. AMS version-of-record download https://www.ams.org/memo/0799/memo0799.pdf returned HTTP 403; Proposition 3.4.4 finding is scoped to this copy.

- **sourceId:** rubin-es
- **kind:** author copy
- **url:** https://swc-math.github.io/notes/files/99RubinES.pdf
- **read:** 2026-10-06
- **sha256:** de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50

- **sourceId:** mr-higher
- **kind:** preprint
- **url:** https://arxiv.org/pdf/1312.4052v1
- **read:** 2026-10-06
- **sha256:** 15ec72e48fab1790e5b96e7172b4af88c974b0d487a515cdbd9dd0ced3ea4ee8

- **sourceId:** bss2
- **kind:** preprint
- **url:** https://arxiv.org/pdf/1805.08448v1
- **read:** 2026-10-06
- **sha256:** 2f6da843d3dcedde65a2b04b80c711863306f9fd9ab20580d245d2c4d2f06429
- **notes:** arXiv lists only v1. The KCL accepted manuscript PDF https://kclpure.kcl.ac.uk/portal/files/345599305/bss-acceptedversion.pdf returned HTTP 403; accepted/published collation remains open.

- **sourceId:** howard
- **kind:** published
- **url:** https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf
- **read:** 2026-10-06
- **sha256:** 89082beb9117b111558f1c62356a0610602781ec2a2b3487ce561920cf4d78d7

- **sourceId:** dk
- **kind:** preprint
- **url:** https://arxiv.org/pdf/2010.00657v3
- **read:** 2026-10-06
- **sha256:** c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099

- **sourceId:** ltxzz
- **kind:** preprint
- **url:** https://arxiv.org/pdf/1912.11942
- **read:** 2026-10-06
- **sha256:** 84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86

- **sourceId:** cgls
- **kind:** preprint
- **url:** https://arxiv.org/pdf/2008.02571v2
- **read:** 2026-10-06
- **sha256:** 7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59

- **sourceId:** rubin-es-book-copy
- **kind:** author copy
- **url:** https://www.wstein.org/people/rubin/book/hEulerSystems.pdf
- **read:** 2026-10-06
- **sha256:** 1b0229731e38bfaaa55b38a219c055019d1c7db1f0ecec3c083125da87b6e8e4
- **notes:** 233-page book-format author copy mirrored by William Stein, inspected visually at title, contents and §9.1 p.175 (PDF p.181); same outside-N wording as the course draft. It has no publisher imprint, so is not certified as the version of record. Other numbered nodes still use the 1999 draft.

**sourceIssues.**

- **id:** EulerSystemsAndKolyvaginSystems/E1
- **source:** bss2
- **kind:** misprint
- **locator:** Hypothesis 4.7(ii), p. 22 of arXiv:1805.08448v1
- **printed:** (ii) there exists τ ∈ G_{K(T)_{p^∞}} such that T/(τ − 1)T ≃ R as R-modules;
- **correction:** τ should be taken in G_{K_{p^∞}}, where K_{p^∞} = ⋃_m K_{p^m} and K_{p^m} = K(μ_{p^m}, (O_K^×)^{1/p^m})K(1): 'there exists τ ∈ G_{K_{p^∞}} such that T/(τ − 1)T ≃ R'.
- **reason:** K(T) is by definition the minimal Galois extension of K such that G_{K(T)} acts trivially on T, so every τ ∈ G_{K(T)_{p^∞}} ⊆ G_{K(T)} acts trivially on T and T/(τ − 1)T = T, which is isomorphic to R only when T has rank one. The finite-level Hypothesis 3.2(ii) takes τ ∈ G_{K_M}, and Remark 4.9 says that Hypothesis 4.7 'clearly' gives Hypotheses 3.2(i) and (ii) for T/p^mT, which is true for τ ∈ G_{K_{p^∞}} ⊆ G_{K_{p^m}} and false in rank at least two for the printed group.
- **affects:** nothing
- **known:** new
- **searched:** ["arXiv listing of 1805.08448 (only v1 exists, checked 2026-10-06)", "the accepted journal version was not available to the worker and was not compared", "https://arxiv.org/abs/1805.08448 submission history (v1 only)", "https://davidburnsmaths.github.io/newdbpublist.html and KCL accepted-manuscript record; no accessible correction located", "Web search for BSS II Hypothesis 4.7 errata, 2026-10-06; no explicit correction located"]
- **review:** {"verdict": "confirmed", "reason": "In arXiv v1, K(T) is the trivializing field. Every element of the printed subgroup acts trivially on T, so its coinvariants have the rank of T. Hypothesis 3.2(ii) and Remark 4.9 instead require the cyclotomic/unit field subgroup. Confirmation is scoped to v1; the accepted version was inaccessible.", "by": "REV-EulerSystemsAndKolyvaginSystems--ES.0"}

- **id:** EulerSystemsAndKolyvaginSystems/E2
- **source:** rubin-es
- **kind:** misprint
- **locator:** 1999 course draft Chapter IX §1, p.133; also book-format author copy §9.1 p.175 (PDF p.181)
- **printed:** the maximal abelian extension of K unramified outside N
- **correction:** For the isolated-initial-class example take the maximal abelian extension unramified at every prime dividing N.
- **reason:** The printed extension contains the cyclotomic Z_p-extension because p divides N, contrary to the following parenthesis. For a nontrivial extension ramified only at N, the Euler-factor product is empty, hence is 1, and the family c_F=0 for F≠K requires c_K=0. With no ramification at N and class number one, every nontrivial finite abelian extension ramifies at a prime outside N, where the stipulated factor vanishes; the claimed arbitrary c_K family then works.
- **affects:** a stated result
- **known:** new
- **searched:** ["Web search for Rubin Euler systems errata Chapter IX rigidity, 2026-10-06; no explicit correction located", "1999 SWC draft and https://www.wstein.org/people/rubin/book/hEulerSystems.pdf §9.1: wording persists in both author copies; publisher version not certified"]
- **review:** {"verdict": "confirmed", "reason": "Checked both public author copies. The empty Euler-factor product for extensions ramified only at N contradicts the stated family. Reversing the ramification restriction restores the example; no conclusion about a certified publisher copy is made.", "by": "REV-EulerSystemsAndKolyvaginSystems--ES.0"}

- **id:** EulerSystemsAndKolyvaginSystems/E3
- **source:** mr-ks
- **kind:** error
- **locator:** Archived author copy, Proposition 3.4.4(ii), p.27 (PDF p.33)
- **printed:** Γ(S) is (noncanonically) isomorphic to an ideal of R.
- **correction:** Evaluation identifies Γ(S) with a submodule of the cyclic hub stalk. It is isomorphic to an ideal if the hub stalk is free of rank one, or if R is principal artinian. The unrestricted complete noetherian local assertion needs such additional hypotheses.
- **reason:** Let R=Z_p and take the graph with one vertex and no edges, with S(v)=R/pR. The sheaf is locally cyclic, its vertex is a hub and monodromy is trivial. Γ(S)=R/pR is nonzero torsion, whereas every ideal of the domain R is torsion-free. The proof’s injection into a cyclic module does not imply injection into R.
- **affects:** a stated result
- **known:** new
- **searched:** ["Web search for Mazur Rubin Kolyvagin systems errata Proposition 3.4.4, 2026-10-06; no explicit correction located", "https://sites.harvard.edu/barry-mazur/projects/ search result; direct fetch failed (502)", "https://www.ams.org/memo/0799/memo0799.pdf version-of-record download attempted; HTTP 403, not collated"]
- **review:** {"verdict": "confirmed", "reason": "The one-vertex Z_p/p stalk satisfies Definition 3.4.2 and contradicts (ii) at the coefficient scope fixed in Chapter 2. The later principal-artinian application remains valid. This finding is scoped to the archived author copy.", "by": "REV-EulerSystemsAndKolyvaginSystems--ES.0"}

**upstreamNotes.**

- **roadmaps:** ["tauceti:TauCetiRoadmap/ClassFieldTheory"]
- **note:** The atlas alias UPSTREAM:ClassFieldTheory needs native Layer 13 for Hilbert/ray/ring class fields (applications of Layer 12’s global existence), Layer 7 for the absolute local Artin map and Layer 5 for finite local Tate duality. Chebotarev’s alias resolves to native Layer 10. These are upstream observations; the upstream documents and edges were not edited.

### ES.8 source-version records

**sourceVersions.**

- **kind:** author copy
- **url:** https://swc-math.github.io/notes/files/99RubinES.pdf
- **read:** 2026-10-06
- **sha256:** de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50

- **kind:** published
- **url:** https://www.wstein.org/people/rubin/book/hEulerSystems.pdf
- **read:** 2026-10-06
- **sha256:** 1b0229731e38bfaaa55b38a219c055019d1c7db1f0ecec3c083125da87b6e8e4

- **kind:** author copy
- **url:** https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf
- **read:** 2026-10-06
- **sha256:** 4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f

- **kind:** preprint
- **url:** https://arxiv.org/pdf/1202.6340v1
- **read:** 2026-10-06
- **sha256:** d2d06e851d6aa1fdc33a932b69b5c06a8c56dc2d9e05fb10d97c0358d6d6ea9a

- **kind:** preprint
- **url:** https://arxiv.org/pdf/0706.0377v2
- **read:** 2026-10-06
- **sha256:** 645d299256ae61e1bfd63564c68510785a39e52684cbaa720d7d6017fe1f5bf2

- **kind:** preprint
- **url:** https://arxiv.org/pdf/2008.02571v2
- **read:** 2026-10-06
- **sha256:** 7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59

**sourceIssues.**

- **id:** EulerSystemsAndKolyvaginSystems/E801
- **source:** mazur-rubin-kolyvagin-systems
- **kind:** misprint
- **locator:** §5.3, Definition 5.3.8, p. 61, in the authors' version of 20 October 2003 (the published Memoir was not available)
- **printed:** "If c ∈ H¹(Q, T), we let Ind(c) denote the principal ideal of Λ Ind(c) = char((H¹(Q, T)/Λc)tors)."
- **correction:** Ind(c) is the principal ideal generated by gcd(a_1, …, a_r) for ψ(c) = (a_1, …, a_r) under a pseudo-isomorphism ψ: H¹(Q, T) → Λ^r, as the next sentence says; in particular Ind(0) = 0. The char formula agrees with this only for c ≠ 0.
- **reason:** For c = 0, (H¹(Q, T)/Λ·0)_tors = H¹(Q, T)_tors = 0 because H¹(Q, T) is torsion-free (Lemma 5.3.5), so the printed formula gives Ind(0) = char(0) = Λ, while the gcd description gives gcd(0, …, 0) = 0 and the proof of Theorem 5.3.10 states 'If κ1 = 0 then Ind(κ) = 0 and there is nothing to prove.' With the printed formula, Theorem 5.3.10(i) for κ_1 = 0 would assert char(X∞) = Λ, which is false in general (X∞ need not be torsion).
- **affects:** nothing
- **known:** new
- **searched:** ["Mazur–Rubin's 2003 authors' version (the text read) for remarks or corrections after the definition", "arXiv and the AMS Memoir page for the publisher's text (not accessible; the AMS site returned HTTP 403)", "Büyükboduk, arXiv:0706.0377v2, which uses Theorem 5.3.10 only for κ_1 ≠ 0"]
- **review:** {"verdict": "confirmed", "by": "REV-EulerSystemsAndKolyvaginSystems--ES.8", "reason": "Checked at Definition 5.3.8, p. 61 of the authors' version (sha256 4cc432d0…): the printed formula Ind(c) = char((H¹(Q, T)/Λc)_tors) is followed by the gcd description, and the proof of Theorem 5.3.10 (p. 66) states 'If κ1 = 0 then Ind(κ) = 0'. Since H¹(Q, T) is Λ-torsion-free (Lemma 5.3.5), the printed formula gives char(0) = Λ at c = 0, so it disagrees with both; for c ≠ 0 the two descriptions agree (the torsion of Λ^r/Λ(b_i) vanishes when gcd(b_i) = 1). The intended meaning is clear from the context, so 'misprint' with no effect on the results is right. The publisher's text was not available to this review either."}

- **id:** EulerSystemsAndKolyvaginSystems/E802
- **source:** rubin-euler-systems-1999
- **kind:** misprint
- **locator:** Ch. II §3, proof of Theorem 3.8, p. 29, in the 1999 draft
- **printed:** "so there is a map ψ : loc^s_Σp(H¹_∞(K, T)) → Λ with pseudo-null cokernel. … and by definition ind_Λ(c) divides φ ◦ loc^s_Σp(c_K,∞)."
- **correction:** "ind_Λ(c) divides ψ ◦ loc^s_Σp(c_K,∞)": the functional is the ψ just chosen; φ is not defined in the proof.
- **reason:** The proof needs a functional on H¹_∞(K, T) whose value at c_{K,∞} lies in ind_Λ(c); ψ ∘ loc^s is one. The published version (Theorem 2.3.8, p. 43) prints ψ.
- **affects:** nothing
- **known:** Corrected in the published version, Annals of Mathematics Studies 147 (2000), proof of Theorem 2.3.8, p. 43 (read on the page image).
- **searched:** ["The published text of Rubin's book (wstein.org copy), proof of Theorem 2.3.8, page image read"]
- **review:** {"verdict": "confirmed", "by": "REV-EulerSystemsAndKolyvaginSystems--ES.8", "reason": "The 1999 draft (p. 29) prints 'by definition ind_Λ(c) divides φ ◦ loc^s_Σp(c_K,∞)' with φ undefined in the proof; the page image of the published Theorem 2.3.8 (p. 43, PDF page 49 of the wstein.org copy) prints 'ψ ∘ loc^s_Σp(c_K,∞)'. Correctly recorded as a misprint already corrected in print."}

- **id:** EulerSystemsAndKolyvaginSystems/E803
- **source:** rubin-euler-systems-1999
- **kind:** misprint
- **locator:** Ch. VI §2, proof of Proposition 2.1(ii), p. 91, in the 1999 draft (published: Proposition 6.2.1, p. 122)
- **printed:** "Fix a place w of LK∞ not dividing p, and let I denote an decomposition group of w in G_L. Since K∞/K is unramified outside p, ρ(I) = 1, and I is also an inertia group of w in G_{L_n} for every n."
- **correction:** "let I denote an inertia group of w in G_L": the argument needs ρ(I) = 1, which holds for the inertia group because K∞/K is unramified outside p, but fails for a decomposition group, on which ρ is in general nontrivial.
- **reason:** The next sentence uses only that ρ is trivial on I and calls I 'also an inertia group' of w in G_{L_n}; the article 'an' also points to the intended word. A decomposition group of w ∤ p in G_L surjects onto the infinite decomposition group of w in Gal(LK∞/L), on which a character ρ of infinite order is nontrivial.
- **affects:** nothing
- **known:** Corrected in the published version, Annals of Mathematics Studies 147 (2000), proof of Proposition 6.2.1, p. 122 (read on the page image, PDF page 128 of the wstein.org copy): the passage is replaced by an argument through Lemmas B.3.3 and 1.3.5(i) showing that the colimits of the H¹_f(L_{n,w}, ·) at w ∤ p vanish.
- **searched:** ["The published text of Rubin's book (wstein.org copy), Chapter 6 §2, page image read"]
- **review:** {"verdict": "confirmed", "by": "REV-EulerSystemsAndKolyvaginSystems--ES.8", "reason": "Found and checked by this review on the draft page image (p. 91) and the published page image (p. 122)."}

**upstreamNotes.**

## Suggested Lean file

The [assembled suggested file](../suggested/EulerSystemsAndKolyvaginSystems.lean) has one
standard note and import block. It preserves the corrected finite-level and Iwasawa prototypes
in separate sections, with the packets' proposed names. The older plural namespaces
`TauCeti.EulerSystems` and `TauCeti.KolyvaginSystems` and the Iwasawa singular namespaces
`TauCeti.EulerSystem` and `TauCeti.KolyvaginSystem` refer to distinct prototype inventories;
their names are not asserted to be a completed common arithmetic API. The eventual supplier
adapters must reconcile them without silently identifying abstract modules with Galois cohomology.
All proposed arithmetic signatures still written in comments are explicitly unfinished. No
declaration in this plan is claimed as formalized.
