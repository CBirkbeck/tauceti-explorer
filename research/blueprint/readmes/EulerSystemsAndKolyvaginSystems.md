# Euler systems, Kolyvagin systems and higher-rank descent

**Summary.** This roadmap builds the general descent machine of Euler and Kolyvagin systems. A
norm-compatible family of Galois cohomology classes over abelian extensions of a number field (an
Euler system) produces, through Kolyvagin's derivative operators, a family of classes indexed by
squarefree products of auxiliary primes (a Kolyvagin system). A nonzero Kolyvagin system bounds a
dual Selmer group; a primitive one determines its structure exactly; over Iwasawa algebras the same
machine gives divisibilities and equalities of characteristic ideals. The roadmap works over number
fields and for finite free p-adic representations, with coefficients in principal artinian rings,
discrete valuation rings, Iwasawa algebras and, for higher rank, Gorenstein orders. It keeps the
clean large-image theorems of Mazur–Rubin and Howard separate from the error-tolerant theorems of
Rubin, Nekovář and Castella–Grossi–Lee–Skinner that applications at small or Eisenstein primes need.
It does not construct arithmetic classes: cyclotomic units, Kato's classes, Heegner points,
generalised Heegner cycles and Beilinson–Flach classes are built and verified by the roadmaps that
consume this one.

Three inputs are kept apart throughout. A nonzero initial class gives an upper bound under the
stated hypotheses. Primitivity of the system gives equality. Identifying the initial class with an
L-value needs an explicit reciprocity law that an application supplies. The definitions all allow
the zero system, and none of these inputs follows from the existence of the carrier.

## How the plan is organised

The plan of layers ES.0–ES.7 and the plan of ES.8 were written as two parts; this whole-roadmap pass
adds 21 targets and states the complete roadmap in one document. Every target is named by its node
id, which is also its anchor in the atlas. The 145 targets are: 41 definitions, 19 constructions,
65 theorems, 10 lemmas, 3 comparisons and 7 worked applications, with 424 API items, 216 unit tests
and 45 planets.

The 21 targets added in this pass are marked *(added in the whole-roadmap pass)* in their headings.
They cover:

- Rubin's steps behind the local behaviour of derivative classes: unramifiedness away from pr up to a
  bounded factor, the local lifts at primes where T ramifies, the lifted telescoping identity and the
  key norm relation for lifts, the multiplicative-group example of Kolyvagin's congruence, and the
  derivative classes under Rubin's alternative rigidity conditions (ES.3).
- The existence of abundant tuples of Liu–Tian–Xiao–Zhang–Zhu under the corrected span hypothesis
  (ES.1).
- Castella–Grossi–Lee–Skinner's error constants, Chebotarev selection with error terms, module
  lemmas for the self-dual induction, and the rank-one theorem (ES.1, ES.4).
- The requests that consuming roadmaps addressed to this one:
  - Zhang's residual detection of two classes and of classes with prescribed ramification (ES.1).
  - Nekovář–Castella–Hsieh anticyclotomic Euler systems over ring class fields, their derivative
    classes and rational descent (ES.2–ES.4).
  - The uniform Kolyvagin bound for characters close to the trivial character
    (Castella–Grossi–Skinner, Burungale–Castella–Grossi–Skinner; ES.4).
  - Zanarella's rigidity at core vertices, divisibility profile and exact structure theorem for
    self-dual Kolyvagin systems, with the 2(M₀ − M_∞) form of Burungale–Castella–Grossi–Skinner
    (ES.5).
  - Equality in Howard's Λ-adic bound for Λ-primitive systems, and the Λ-adic divisibility at the
    augmentation prime (ES.8).

## Scope and boundaries

ES.0–ES.5 are the rank-one finite-level theory: coefficient data and Selmer structures (ES.0),
auxiliary primes and the local comparison at them (ES.1), Euler systems and their variants (ES.2),
derivative classes and the passage to Kolyvagin systems (ES.3), descent bounds clean and with errors
(ES.4), and primitivity and exact structure (ES.5). ES.6–ES.7 are the higher-rank finite-level
theory: exterior biduals, Stark systems and higher-rank Kolyvagin systems, and higher-rank Euler
systems with Fitting-ideal control. ES.8 is rank-one Iwasawa theory: Rubin's bounds over
ℤ_p^d-extensions and Λ-adic Kolyvagin systems over ℤ_p-extensions. No target of ES.8 requires ES.6
or ES.7; the proposal to make ES.5 → ES.8 the stage edge and to add a higher-rank Iwasawa stage ES.8h
is recorded under Proposed restructuring.

The roadmap imports, and does not replan:

- From Mathlib: modules over PIDs and DVRs and their structure theorem, lengths, characteristic
  polynomials and polynomial division, exterior powers and duals, group algebras and the norm
  element of a representation, and group cohomology of discrete groups.
- From Tau Ceti: continuous cochain cohomology in low degrees (`TauCeti.ContCohomology`) with
  restriction, inflation, corestriction and long exact sequences for discrete modules; the
  coinduced module `TauCeti.coind` of a closed subgroup and Shapiro's lemma in degrees zero and one
  (`TauCeti.ContCohomology.explicitShapiro0/1`); ray class groups, Frobenius prime sets and Artin
  symbols. Rubin's induced module 𝕎_M is the coinduced module from the trivial subgroup, and his
  Ind_D is the coinduced module from a decomposition group.
- From the Tau Ceti roadmaps:
  - ClassFieldTheory: ray and ring class fields (Layer 13), the local Artin map (Layer 7) and local
    duality (Layer 5).
  - Chebotarev: the density theorem in Dirichlet-density form (Layer 10).
  - ProfiniteCohomology: coinduced modules and Shapiro (Layer 7) and cohomological dimension
    (Layer 11), the latter for cd(Ẑ) = 1.
  - EllipticCurves: Selmer structures on discrete modules, à la Rubin Chapter I, with the elliptic
    instances (Layer 7). This roadmap's Selmer structures on compact and artinian coefficients refine
    that discrete notion.
- From proposed roadmaps of the atlas:
  - SelmerIwasawaCohomology L1–L4: actual local conditions, Selmer kernels, propagation, duals and
    the Poitou–Tate sequence of Selmer structures, semilocal and Iwasawa cohomology, the universal-norm
    lemmas and control.
  - ArithmeticGaloisDuality R02.1–R02.5: continuous cochains of profinite groups, Hochschild–Serre,
    global finiteness, Poitou–Tate.
  - PadicMeasuresIwasawaAlgebras L1, L4–L6: completed group rings, twisting, characteristic ideals
    and pseudo-isomorphisms, topological Nakayama, and the generic exterior-bidual, Gorenstein and
    Fitting-ideal algebra (L6).

The roadmaps that consume this one supply arithmetic and verify hypotheses:

- EulerSystemsCyclotomicMainConjecture: cyclotomic units and the main conjecture over ℚ.
- KatoEulerSystems: Kato's zeta elements and the modular divisibility.
- HeegnerPointEulerSystems and GeneralizedHeegnerCycles: Heegner points and generalised Heegner
  cycles, with Gross–Zagier and explicit reciprocity.
- RankZeroOneBSD: the Birch–Swinnerton-Dyer applications.
- ModularIwasawaMainConjectures.

IntegralIwasawaTheory I.7 owns the Dasgupta–Kakde theorem on Rubin's conjecture away from 2. This
roadmap states Rubin's lattice and conjecture and the conditional higher-rank class-group bounds.

## Conventions

- K is a number field, p a prime, R a complete noetherian local ring with maximal ideal m and finite
  residue field k of characteristic p. Each theorem specifies whether R is principal artinian, a DVR,
  an Iwasawa algebra or a Gorenstein order. In Rubin's theory O is the ring of integers of a finite
  extension Φ/ℚ_p with uniformiser ϖ (π in Castella–Grossi–Lee–Skinner), D = Φ/O, V = T ⊗_O Φ,
  W = V/T and W_M = M^{-1}T/T.
- Two duals occur and are named apart: the lattice dual Hom_O(T, O(1)) and the discrete Cartier dual
  Hom(T, μ_{p^∞}). Rubin's T* and W* are respectively these. Self-dual settings (Howard, Zanarella,
  Castella–Hsieh) fix a perfect G-equivariant pairing T × T → R(1) compatible with complex
  conjugation τ.
- Frobenius elements are arithmetic. Rubin's Euler polynomial is P(Fr_q^{-1} | T*; x) =
  det(1 − Fr_q^{-1}x | Hom_O(T, O(1))); Mazur–Rubin use det(1 − Fr_q x | T); Burns–Sakamoto–Sano use
  Rubin's. Norm relations use corestriction. Ring-class anticyclotomic Euler systems use the Hecke
  eigenvalue a_ℓ(f) of an inert prime in place of an Euler factor.
- N(P) is the set of squarefree products of primes of a set P, including 1, and ν(n) is the number
  of prime factors. Kolyvagin primes carry the conductor ideal I_ℓ; a restricted prime set need not be
  infinite, and every Chebotarev argument states the containment hypothesis it uses.
- M̄ is the smallest power of p divisible by M (Rubin, Definition I.4.6); μ_M̄ appears in the
  splitting criterion for auxiliary primes.
- Kolyvagin derivative: for a cyclic group with generator σ of order m, N = Σ σ^i and D = Σ iσ^i, with
  (σ − 1)D = m − N; inside a decomposition group the lift of σ need not have order m and the identity
  becomes (σ − 1)D = mσ^m − N (ES.3/key-relation).
- Core rank follows Mazur–Rubin 2016 (signed) and Mazur–Rubin 2004 (its positive part); ES.0/core-rank
  states the dictionary. In the self-dual setting a core vertex is n with residual Selmer rank
  ρ(n) = 1, equivalently H¹_{F(n)}(K, T) ≅ R.
- Indices and lengths: ind(c, M) is the largest j with c ∈ m^j M (∞ for c = 0); exp(X) is the least n
  with π^n X = 0; lengths are over the stated coefficient ring. Bounds distinguish the whole dual
  Selmer group, its cotorsion quotient and the Pontryagin dual's torsion.
- Hypothesis records stay separate and source-qualified:
  - Mazur–Rubin 2004 (H.0)–(H.6) and Mazur–Rubin 2016 (H.1)–(H.7).
  - Rubin's Hyp(K, T), Hyp(K, V) and their tower versions.
  - Howard's H.0–H.5.
  - Burns–Sakamoto–Sano's Hypotheses 3.2, 3.3, 4.2, 4.7, 6.1, 6.7 and 6.11.
  - Castella–Hsieh's Hypothesis (H).
  - The error constants C₁, C₂, C_α of ES.1/twist-error-constants.

  Residual irreducibility, absolute irreducibility and residual surjectivity are distinct.
- Γ = Gal(K∞/K) ≅ ℤ_p^d, Λ = O[[Γ]] with maximal ideal 𝔐 and augmentation ideal J; ι is γ ↦ γ^{-1}.
  "char(B) divides 𝔞" means 𝔞 ⊆ char(B). Pseudo-null means annihilated by an ideal of height at
  least two.
- Primitivity: a Kolyvagin system is primitive if its reduction modulo m is nonzero, Λ-primitive if
  no height-one prime lies in its blind spot. Neither is equivalent to κ₁ ≠ 0.

## Sources

Each target cites its source by theorem, section and page in the version listed here. Nothing is quoted. Where an identifier differs between the parts for the same file (rubin-es and rubin-euler-systems-1999; cgls and castella-grossi-lee-skinner-eisenstein; mr-ks and mazur-rubin-kolyvagin-systems), the files have the same fingerprint.

- `mr-ks`: Barry Mazur and Karl Rubin, *Kolyvagin systems*. Memoirs of the American Mathematical Society 168 (2004), no. 799; authors' copy, 96 pp., read 2026-10-06. <https://web.archive.org/web/2020id_/https://www.math.uci.edu/~krubin/preprints/kolysys.pdf> SHA-256 `4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f`.
- `rubin-es`: Karl Rubin, *Euler systems*. Author's 1999 draft of Annals of Mathematics Studies 147 (Princeton University Press, 2000), 187 pp., read 2026-10-06; chapter-relative numbering as in the draft. <https://swc-math.github.io/notes/files/99RubinES.pdf> SHA-256 `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`.
- `mr-higher`: Barry Mazur and Karl Rubin, *Controlling Selmer groups in the higher core rank case*. arXiv:1312.4052v1 (14 December 2013), 32 pp., read 2026-10-06; published in Journal de Théorie des Nombres de Bordeaux 28 (2016). <https://arxiv.org/abs/1312.4052v1> SHA-256 `15ec72e48fab1790e5b96e7172b4af88c974b0d487a515cdbd9dd0ced3ea4ee8`.
- `bss2`: David Burns, Ryotaro Sakamoto and Takamichi Sano, *On the theory of higher rank Euler, Kolyvagin and Stark systems, II*. arXiv:1805.08448v1 (22 May 2018), 51 pp., read 2026-10-06; the only version on arXiv. <https://arxiv.org/abs/1805.08448v1> SHA-256 `2f6da843d3dcedde65a2b04b80c711863306f9fd9ab20580d245d2c4d2f06429`.
- `howard`: Benjamin Howard, *The Heegner point Kolyvagin system*. Compositio Mathematica 140 (2004), 1439–1472, published version, read 2026-10-06. <https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf> SHA-256 `89082beb9117b111558f1c62356a0610602781ec2a2b3487ce561920cf4d78d7`.
- `dk`: Samit Dasgupta and Mahesh Kakde, *On the Brumer–Stark conjecture*. arXiv:2010.00657v3, 99 pp., read 2026-10-06; published in Annals of Mathematics 197 (2023), 289–388. <https://arxiv.org/abs/2010.00657v3> SHA-256 `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`.
- `ltxzz`: Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*. arXiv:1912.11942 (latest version, 179 pp.), read 2026-10-06; published in Inventiones mathematicae 228 (2022), 107–375. <https://arxiv.org/abs/1912.11942> SHA-256 `84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86`.
- `cgls`: Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*. arXiv:2008.02571v2 (authors' final version), 34 pp., read 2026-10-06; published in Inventiones mathematicae 227 (2022), 517–580. <https://arxiv.org/abs/2008.02571v2> SHA-256 `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59`.
- `nekovar`: Jan Nekovář, *The Euler system method for CM points on Shimura curves*. Archived author manuscript, 51 pp.; author-page numbering, read 2026-10-10. <https://web.archive.org/web/20240000000000id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf> SHA-256 `05c8debf4783f4604afe71a0b4367554ac62d52a6a462daa5e2e8c2ed6bfd26a`.
- `sakamoto`: Ryotaro Sakamoto, *Stark systems over Gorenstein local rings*. Algebra & Number Theory 12 (2018), 2295–2326; publisher issue PDF, read 2026-10-10. <https://msp.org/ant/2018/12-10/ant-v12-n10-p.pdf> SHA-256 `ea04b2b3cafe1b990ab32c461f8aea0563baf75fa11b0e93eaea06b1cb325ee0`.
- `sano14`: Takamichi Sano, *Refined abelian Stark conjectures and the equivariant leading term conjecture of Burns*. arXiv:1406.4623v1; read 2026-10-10. <https://arxiv.org/abs/1406.4623v1> SHA-256 `83ca6e59cefdb60833f418aa57617a451101977de1b767ddf6138661758ccea4`.
- `mr-higher-published`: Barry Mazur and Karl Rubin, *Controlling Selmer groups in the higher core rank case*. Journal de Théorie des Nombres de Bordeaux 28 (2016), 145–183; Numdam version of record, read 2026-10-10. <https://www.numdam.org/article/JTNB_2016__28_1_145_0.pdf> SHA-256 `00725ad7afc9d7f3d69dac9eb8f872319974bf846be850dc3c0b56ba3b49d926`.
- `rubin-euler-systems-1999`: Karl Rubin, *Euler systems*. Author's 1999 draft of Annals of Mathematics Studies 147 (Princeton University Press, 2000); 187 pp., TeX output of 4 August 1999. Numbering II.3.x etc.; the published text numbers the same results 2.3.x.. <https://swc-math.github.io/notes/files/99RubinES.pdf> SHA-256 `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`.
- `rubin-euler-systems-2000`: Karl Rubin, *Euler systems*. Published version, Annals of Mathematics Studies 147 (Princeton University Press, 2000), xi + 227 pp.; the author's file hosted by W. Stein. Its text layer is unreadable, so only page images were read.. <https://www.wstein.org/people/rubin/book/hEulerSystems.pdf> SHA-256 `1b0229731e38bfaaa55b38a219c055019d1c7db1f0ecec3c083125da87b6e8e4`.
- `mazur-rubin-kolyvagin-systems`: Barry Mazur, Karl Rubin, *Kolyvagin systems*. Authors' version dated 20 October 2003 (102 pp.) of Memoirs of the American Mathematical Society 168 (2004), no. 799; the publisher's text (doi:10.1090/memo/0799) was not available.. <https://webusers.imj-prg.fr/~christophe.cornut/ES/Ref/KolySys.pdf> SHA-256 `4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f`.
- `howard-heegner-point-kolyvagin-system`: Benjamin Howard, *The Heegner point Kolyvagin system*. arXiv:1202.6340v1 (28 February 2012); published in Compositio Mathematica (2004), no. 6, 1439–1472. <https://arxiv.org/pdf/1202.6340v1> SHA-256 `d2d06e851d6aa1fdc33a932b69b5c06a8c56dc2d9e05fb10d97c0358d6d6ea9a`.
- `buyukboduk-lambda-adic-kolyvagin-systems`: Kâzım Büyükboduk, *Λ-adic Kolyvagin systems*. arXiv:0706.0377v2 (30 March 2011); published in International Mathematics Research Notices (2011), doi:10.1093/imrn/rnq186. <https://arxiv.org/pdf/0706.0377v2> SHA-256 `645d299256ae61e1bfd63564c68510785a39e52684cbaa720d7d6017fe1f5bf2`.
- `castella-grossi-lee-skinner-eisenstein`: Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*. arXiv:2008.02571v2 (14 September 2021, final version); published in Inventiones Mathematicae 227 (2022), 517–580. <https://arxiv.org/pdf/2008.02571v2> SHA-256 `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59`.
- `rubin-es-2000`: Karl Rubin, *Euler Systems*. Published version, Annals of Mathematics Studies 147 (Princeton University Press, 2000), xi + 227 pp.; the author's file hosted by W. Stein; read 2026-10-14 from page images. <https://www.wstein.org/people/rubin/book/hEulerSystems.pdf> SHA-256 `1b0229731e38bfaaa55b38a219c055019d1c7db1f0ecec3c083125da87b6e8e4`.
- `cgs`: Francesc Castella, Giada Grossi, Christopher Skinner, *Mazur's main conjecture at Eisenstein primes*. arXiv:2303.04373v2, 33 pp.; read 2026-10-14. <https://arxiv.org/abs/2303.04373v2> SHA-256 `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90`.
- `bcgs`: Ashay Burungale, Francesc Castella, Giada Grossi, Christopher Skinner, *Non-vanishing of Kolyvagin systems and Iwasawa theory*. arXiv:2312.09301v2 (18 January 2026), 33 pp.; read 2026-10-14 (p. 17 checked from the page image). <https://arxiv.org/abs/2312.09301v2> SHA-256 `e575367ab8dd9ffdb1850959dde93f205c4007b0e56af4ed30e120079660aee3`.
- `ky`: Timo Keller, Mulun Yin, *On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction*. arXiv:2402.12781v2, 61 pp.; read 2026-10-14. <https://arxiv.org/abs/2402.12781v2> SHA-256 `bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a`.
- `ch`: Francesc Castella, Ming-Lun Hsieh, *Heegner cycles and p-adic L-functions*. Author's version (dated 2 July 2022) of Mathematische Annalen 370 (2018), 567–628, from the second author's page; read 2026-10-14 (p. 30 checked from the page image). <https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf> SHA-256 `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba`.
- `zanarella`: Murilo Zanarella, *On Howard's main conjecture and the Heegner point Kolyvagin system*. arXiv:1908.09197v1, 50 pp.; read 2026-10-14. <https://arxiv.org/abs/1908.09197v1> SHA-256 `00d91f8d73880174f410ac4be2a43f89867421c0ab7bfafdba1b837111df312f`.
- `zhang`: Wei Zhang, *Selmer groups and the indivisibility of Heegner points*. Cambridge Journal of Mathematics 2 (2014), 191–253; free from International Press; read 2026-10-14 from the copy the maintainer cleared. <https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf>
- `ltxzz-published`: Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*. Inventiones mathematicae 228 (2022), 107–375; the NSF Public Access Repository copy, published pagination; read 2026-10-14. <https://par.nsf.gov/servlets/purl/10323568> SHA-256 `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit reports every layer as not built; the algebraic and cochain-level inputs it identifies are cited as baseline declarations below and in each target.

### Library declarations cited

| Declaration | Module | Provides |
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
| `mathlib:IsAdic` | `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean` | IsAdic J: the topology of the ring is the J-adic topology; used for the maximal-ideal topology of a coefficient ring. |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | IsAdicComplete I M: M is I-adically Hausdorff and complete; used for completeness of a coefficient ring. |
| `mathlib:IsModuleTopology` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | IsModuleTopology R A: A carries the module topology induced from R; for a finitely generated module over a coefficient ring this is the m-adic topology. |
| `tauceti:TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` | An object of TopRep R G whose module is discrete with open point stabilisers; the discrete G-modules with continuous action. |
| `mathlib:Submodule.torsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | The submodule of elements killed by a non-zero-divisor; the saturation of N in M is the preimage of the torsion of M/N. |
| `mathlib:cyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` | The p-adic cyclotomic character (L ≃+* L) →* ℤ_pˣ; used to type the Tate twist ℤ_p(1) in the universal-norm unit test. |
| `mathlib:PontryaginDual` | `Mathlib/Topology/Algebra/PontryaginDual.lean` | The Pontryagin dual A →ₜ* Circle of a topological group; Hom(·, Q_p/Z_p) of a discrete p-primary module is its p-part, as SelmerIwasawaCohomology L2 records. |
| `mathlib:Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean` | The ideal generated by a set, used to define ind_Λ(x) as the span of {φ(x)}. |
| `mathlib:Module.IsTorsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | A torsion module: every element is killed by a non-zero-divisor; for the domain Λ this is 'torsion Λ-module' in Rubin and Mazur–Rubin. |
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
| `tauceti:TauCeti.ContCohomology.H1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` | First continuous cochain cohomology H¹(G, M): continuous 1-cocycles modulo coboundaries, as a bare additive group |
| `tauceti:TauCeti.coind` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced.lean` | The coinduced module of a subgroup U ≤ G: locally constant maps f : G → A with f(u·g) = u·f(g), with the right-translation action; for U trivial this is Rubin's 𝕎_M = Maps_cont(G_K, W_M), for U = D it is Ind_D(W_M) |
| `tauceti:TauCeti.ContCohomology.explicitShapiro1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean` | Shapiro's lemma in degree one: for profinite G and a closed subgroup U, H¹(G, Coind_U^G A) ≅ H¹(U, A) for discrete A |
| `mathlib:Module.equiv_directSum_of_isTorsion` | `Mathlib/Algebra/Module/PID.lean` | A finitely generated torsion module over a PID is a finite direct sum of cyclic modules R/(p_i^{e_i}) with p_i irreducible |
| `mathlib:Polynomial.X_sub_C_dvd_sub_C_eval` | `Mathlib/Algebra/Polynomial/Div.lean` | X − C a divides p − C(p.eval a), giving the quotient Q with (x − 1)Q(x) = P(x) − P(1) |
| `mathlib:Polynomial.divByMonic` | `Mathlib/Algebra/Polynomial/Div.lean` | Division by a monic polynomial, used to write Q_q = (P − P(1)) /ₘ (X − 1) |

## Layer overview

| Layer | Title | Targets | Added in this pass | Planets |
| --- | --- | --- | --- | --- |
| ES.0 | Coefficient data, quotient propagation and Selmer interfaces | 17 | 0 | 6 |
| ES.1 | Auxiliary primes and local comparison maps | 18 | 4 | 4 |
| ES.2 | Euler-system modules and norm relations | 9 | 1 | 4 |
| ES.3 | Derivative operators and corrected Kolyvagin classes | 17 | 6 | 5 |
| ES.4 | Core vertices, descent and error-tolerant bounds | 18 | 4 | 6 |
| ES.5 | Primitivity and sharpness over DVRs | 13 | 4 | 6 |
| ES.6 | Exterior biduals, Stark systems and Gorenstein coefficients | 9 | 0 | 4 |
| ES.7 | Higher-rank derivatives and Fitting-ideal control | 7 | 0 | 4 |
| ES.8 | Iwasawa variation and application handoffs | 37 | 2 | 6 |

Stage dependencies inside the roadmap run ES.0 → ES.1 → ⋯ → ES.7 → ES.8 in the atlas; the targets of ES.8 use only ES.0–ES.5 (see Proposed restructuring).

## ES.0. Coefficient data, quotient propagation and Selmer interfaces

Selmer triples and data over actual continuous cohomology, the category of quotients of T with propagated local conditions, cartesian conditions and their linear length growth, the compatibility of propagation with local duality, the identification of Selmer modules of quotients with torsion submodules, the Euler-characteristic formula, the core rank and its independence of the modulus, the canonical and unramified Selmer structures with their core-rank formulas, and the source-qualified hypothesis records of Mazur–Rubin 2004 and 2016 with their implications. Worked examples are twists of ℤ_p(1), the Tate module of an elliptic curve, and the inadmissible trivial and Teichmüller twists.

**Layer acceptance.** Compute the core rank and the propagated conditions for a permitted finite-order twist of ℤ_p(1), for the Tate module of an elliptic curve with surjective mod-p image, and for the trivial character, where the hypothesis that fails is named rather than an instance produced.

### Selmer triples and squarefree conductors

`EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple` — definition

**Planet:** Selmer triple.

**Statement.** Fix a number field K, a prime p and a coefficient ring R: a complete noetherian local ring with maximal ideal m and finite residue field k = R/m of characteristic p. A Selmer triple (T, F, P) consists of a free R-module T of finite rank with a continuous R-linear action of G_K unramified outside finitely many primes, a Selmer structure F on T (a finite set Σ(F) of places containing the archimedean places, the places above p and the primes where T is ramified, with an R-submodule H¹_F(K_v, T) ⊆ H¹(K_v, T) for v ∈ Σ(F), and the unramified condition elsewhere), and a set P of primes of K disjoint from Σ(F). N(P) is the set of squarefree products of primes of P, with 1 ∈ N(P), and ν(n) is the number of prime factors of n. Selmer data (T, F, P, r) add an integer r ≥ 1. The dual is T^* = Hom(T, μ_{p^∞}) with the dual structure F^*. The coefficients form the category of Mazur–Rubin 2004 §1 and Chapter 2: R carries its m-adic topology; compact coefficients are finitely generated R-modules with the m-adic topology and a continuous G_K-action (lattices and finite modules), and discrete coefficients are m-power-torsion modules of cofinite type with the discrete topology and a continuous action (such as T^* for a lattice T). Cartier duality exchanges the two, and finite modules belong to both. Every Selmer structure lives on a module of this category and has Σ(F) ⊇ S_p ∪ S_∞; this is what makes Σ(F^*) = Σ(F) legitimate, because μ_{p^∞} is unramified away from p.

**Hypotheses.**

- R is complete noetherian local with finite residue field of characteristic p, in its m-adic topology
- T is free of finite rank over R, with the m-adic topology and a continuous G_K-action; T^* is discrete of cofinite type
- Σ(F) contains S_p ∪ S_∞ and every prime where T is ramified
- P ∩ Σ(F) = ∅

**Construction.**

1. The Selmer structure, its Selmer module H¹_F(K, T) and the dual structure F^* are those of SelmerIwasawaCohomology L2 (dual-selmer-structure); this node only adds the prime set P and the index set N(P).
2. N(P) is the set of finite subsets of P, written multiplicatively; divisibility is inclusion and ν is cardinality.
3. Mazur–Rubin 2004 take K = ℚ (Chapter 2 and the first lines of Chapter 3); Mazur–Rubin 2016 Definition 4.1 states the same data over a number field K, and Howard Definition 1.2.1 over an imaginary quadratic field with P ⊆ the rational primes inert in K.
4. The coefficient category and the support condition are part of the data, so every constructor must supply them: propagation to T/IT keeps Σ (Mazur–Rubin 2004 Example 2.1.7), modification adds the modified primes (Mazur–Rubin 2016 Definition 2.3), restriction of P keeps F, and duality keeps Σ (Mazur–Rubin 2004 Definition 2.3.1) because T^* is unramified at every prime q ∤ p where T is. Without p ∈ Σ this fails: over ℚ with p odd, the trivial 𝔽_p-module with Σ = ∅ satisfies the unramifiedness conditions, but its dual μ_p is ramified at p.

**Uses that determine the API.**

- Mazur–Rubin 2004, Definitions 3.1.2–3.1.3: the vertices of the graph X(P) are the elements of N(P), and a Kolyvagin system has one class for each of them
- Mazur–Rubin 2016, Definition 6.8: Stark systems are an inverse limit over N(P) ordered by divisibility
- Howard, Definition 1.2.3: Kolyvagin systems over an imaginary quadratic field are indexed by N(L) for a set L of inert rational primes

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.SelmerTriple` | structure | The triple (T, F, P): a Selmer structure F on T together with a set P of primes disjoint from Σ(F). |
| `TauCeti.KolyvaginSystems.IsCoefficientRing` | structure | R is a complete noetherian local ring with finite residue field of prime characteristic, and its topology is the m-adic one (Mazur–Rubin 2004 §1; Mazur–Rubin 2016 §1 for the principal case). |
| `TauCeti.KolyvaginSystems.residueChar` | data | The residue characteristic p = char(R/m) of a coefficient ring. |
| `TauCeti.KolyvaginSystems.IsCompactCoefficient` | structure | Over a coefficient ring: T finitely generated, with the R-module (m-adic) topology and a jointly continuous G_K-action. |
| `TauCeti.KolyvaginSystems.IsDiscreteCoefficient` | structure | Over a coefficient ring: A discrete with open point stabilisers (Tau Ceti IsSmoothDiscrete), m-power torsion, with finite m-torsion. |
| `TauCeti.KolyvaginSystems.IsArithmeticCoefficient` | other | Compact of finite type or discrete of cofinite type; the two agree on finite modules. |
| `TauCeti.KolyvaginSystems.SelmerStructure` | structure | The L2 Selmer carrier on canonical H¹: Σ(F), local conditions equal to the unramified condition off Σ(F), T unramified off Σ(F), T in the arithmetic coefficient category, and S_p ∪ S_∞ ⊆ Σ(F). |
| `TauCeti.KolyvaginSystems.SelmerTriple.conductors` | data | N(P): the squarefree products of primes of P, as finite subsets of P. |
| `TauCeti.KolyvaginSystems.SelmerTriple.one_mem_conductors` | simp | 1 ∈ N(P). |
| `TauCeti.KolyvaginSystems.SelmerTriple.conductors_dvd_closed` | characterisation | If n ∈ N(P) and m \| n then m ∈ N(P). |
| `TauCeti.KolyvaginSystems.SelmerTriple.restrictPrimes` | functoriality | For P′ ⊆ P, (T, F, P′) is a Selmer triple and N(P′) ⊆ N(P). |
| `TauCeti.KolyvaginSystems.SelmerTriple.isCompactCoefficient` | characterisation | A free module of finite rank in the coefficient category is compact. |
| `TauCeti.KolyvaginSystems.SelmerTriple.restrictPrimes_F` | functoriality | Restricting P keeps the Selmer structure, hence its support and coefficients. |
| `TauCeti.KolyvaginSystems.SelmerTriple.dual` | constructor | The Cartier dual data (T^*, F^*, P) use the imported discrete Selmer carrier, with Σ(F^*) = Σ(F) ⊇ S_p ∪ S_∞. For a DVR lattice T, T^* = Hom(T, μ_{p^∞}) is discrete torsion of cofinite type, not a finite free lattice and hence not an object of the same lattice-triple type. Over a principal artinian ring, the finite Cartier dual is free of the same rank after the coefficient duality identification. |
| `TauCeti.KolyvaginSystems.dualRep` | constructor | T^* = Hom_cts(T, μ_{p^∞}) for the residue characteristic p, with ℚ/ℤ discrete, R acting through T and G_K through the cyclotomic twist. |
| `TauCeti.KolyvaginSystems.dualRep_isDiscreteCoefficient` | compatibility | The Cartier dual of a compact coefficient module is discrete of cofinite type. |
| `TauCeti.KolyvaginSystems.dualRep_isCompactCoefficient` | compatibility | The Cartier dual of a discrete coefficient module of cofinite type is compact. |
| `TauCeti.KolyvaginSystems.dualRep_isUnramified` | compatibility | At a prime q ∤ p where T is unramified, T^* is unramified. |
| `TauCeti.KolyvaginSystems.localPairing_nondegenerate` | characterisation | On arithmetic coefficients the local Tate pairing H¹(K_v,T) × H¹(K_v,T^*) → ℚ_p/ℤ_p is nondegenerate; no such claim is made outside the coefficient category. |
| `TauCeti.KolyvaginSystems.dualStructure_sigma` | compatibility | Σ(F^*) = Σ(F) (Mazur–Rubin 2004 Definition 2.3.1). |
| `TauCeti.KolyvaginSystems.propagatedStructure_sigma` | compatibility | Propagation of F to T/IT keeps Σ(F) (Mazur–Rubin 2004 Example 2.1.7). |

**Unit tests.**

- `SelmerTriple.conductors_empty` (degenerate): For an empty prime set, the sole squarefree conductor is the empty product 1.
- `SelmerTriple.card_conductors_of_finite` (computation): For two distinct primes q₁,q₂, conductors are exactly 1,q₁,q₂,q₁q₂.
- `SelmerTriple.disjoint_sigma` (non-example): A prime in Σ(F) divides no allowed conductor.
- `SelmerTriple.not_mem_conductors_of_sq` (non-example): No squarefree conductor product is the square of a prime ideal.
- `SelmerStructure.sigma_nonempty` (non-example): No Selmer structure has empty support: S_∞ ⊆ Σ(F). In particular the trivial 𝔽_p-module over ℚ with Σ = ∅ is not one.
- `SelmerStructure.pInfinity_mem_sigma` (characterisation): Every archimedean place and every prime above the residue characteristic lies in Σ(F).
- `SelmerTriple.dual_contains_pInfinity` (compatibility): The dual data keep S_p ∪ S_∞ ⊆ Σ(F^*), and T^* is discrete of cofinite type.
- `dualRep.trivial_mod_p_ramified` (non-example): For p odd, the dual of the trivial 𝔽_p-module over ℚ is μ_p, which is ramified at p; so an empty support cannot be kept by duality.
- `IsCoefficientRing.padicInt` (computation): ℤ_p with its p-adic topology is a coefficient ring.
- `IsCoefficientRing.finiteField` (degenerate): 𝔽_p with the discrete topology is a coefficient ring of residue characteristic p.
- `IsCoefficientRing.not_rat_discrete` (non-example): ℚ with the discrete topology is not a coefficient ring (its residue field is infinite), so finite evaluation and duality make no claim for it.
- `IsArithmeticCoefficient.finite_both` (compatibility): A finite discrete module with continuous action over a coefficient ring is both a compact and a discrete coefficient.
- `IsArithmeticCoefficient.not_fraction_field` (non-example): Over a DVR, Frac(R) with the discrete topology is neither finitely generated nor torsion, so it is not an arithmetic coefficient.

**Acceptance.**

- For P = ∅ one has N(P) = {1} and a Selmer triple is a Selmer structure.
- N(P) is closed under taking divisors, and n, nq ∈ N(P) with q prime implies q ∈ P and q ∤ n.

**Prerequisites.**

- `SelmerIwasawaCohomology:L2`
- `SelmerIwasawaCohomology:L2/selmer-kernel`
- `mathlib:Squarefree`
- `mathlib:IsAdic`
- `mathlib:IsAdicComplete`
- `mathlib:IsModuleTopology`
- `tauceti:TauCeti.IsSmoothDiscrete`

**Sources.**

- `mr-ks`, Chapter 3, first paragraph, p. 19: Definition of a Selmer triple over ℚ.
- `mr-higher`, Definition 4.1, p. 8: The same data over a number field K, with the rank r.
- `mr-ks`, Chapter 1 opening and §1.1, p. 7; Chapter 2 opening, p. 13: Coefficient conventions: R complete noetherian local with finite residue field of characteristic p; T an R-module with continuous Galois action, finitely generated in Chapter 2.
- `mr-ks`, Definition 2.1.1, p. 13; Definition 2.3.1, pp. 16–17: The support of a Selmer structure contains ∞, p and the ramified primes; the dual structure has the same support.
- `mr-higher`, Definition 2.1, p. 6: Over a number field the support contains all infinite places, all primes above p and the ramified primes.

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

- `QuotCat.quotient_zero` (degenerate): The coefficient quotient comparison takes the zero class to zero.
- `QuotCat.zmod_sq_mul_p_injective` (computation): Over ℤ/p², the kernel of multiplication by p is the ideal (p), giving the injective scalar map R/(p)→R.
- `QuotCat.not_hom_of_not_le` (non-example): Over ℤ/p², scalar 1 does not carry the source ideal (p) into the target ideal 0, so it defines no such quotient morphism.

**Acceptance.**

- Over a field R = k the category has the two objects 0 and T.
- For R = ℤ/p², the map p : T/pT → T is a morphism and is injective when T is free.
- Additional arithmetic check: If R is a field, the objects of Quot_R(T) are T/0 = T and T/R·T = 0.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `SelmerIwasawaCohomology:L2/condition-propagation`

**Sources.**

- `mr-ks`, Example 1.1.3, p. 8: Definition of the category of quotients.

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

- `isCartesian_strict_and_relaxed_field` (degenerate): Over a field, both strict and relaxed local conditions are cartesian.
- `isCartesian_unramified` (compatibility): For an unramified coefficient representation, the unramified local condition is cartesian.
- `not_isCartesian_torsion_condition` (non-example): For the rank-one trivial ℤ/p² representation at a place with nonzero reduced H¹, the p-torsion local condition is not cartesian.

**Acceptance.**

- The unramified condition on unramified modules is cartesian; over a field every condition is cartesian.
- A condition defined by an extension L/K_v need not be cartesian (Mazur–Rubin 2004, Remark 1.1.8); the non-example test below exhibits a failure.
- Additional arithmetic check: For K_v = ℚ_ℓ, ℓ ≠ p, R = ℤ/p^k and T = R with trivial action, the unramified condition Hom(G_{𝔽_ℓ}, T/p^iT) is cartesian: a homomorphism to ℤ/p^i whose composite with p^{j−i} : ℤ/p^i → ℤ/p^j is unramified is unramified.
- Additional arithmetic check: For R = ℤ_p and T = ℤ_p(1) over ℚ_ℓ, ℓ ≠ p, the condition ker(H¹(ℚ_ℓ, T) → H¹(ℚ_ℓ^{ur}, T ⊗ ℚ_p)) has torsion-free quotient, and its propagation to T/p^k is cartesian.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`
- `SelmerIwasawaCohomology:L2/condition-propagation`
- `SelmerIwasawaCohomology:L2/unramified-condition`
- `SelmerIwasawaCohomology:L2/lattice-passage`

**Sources.**

- `mr-ks`, Definition 1.1.4, p. 8: The definition, in its equivalent form.
- `mr-higher`, Definition 3.1 and Remark 3.2, p. 7: Cartesian Selmer structures and the two standard sufficient conditions.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Lengths of cartesian conditions grow linearly

`EulerSystemsAndKolyvaginSystems:ES.0/cartesian-length-linearity` — lemma

**Statement.** Let R be principal artinian of length k and F a local condition on T at v, cartesian on Quot_R(T). Then there is an integer r such that length H⁰(K_v, T/m^iT) − length H¹_F(K_v, T/m^iT) = r·i for 0 < i ≤ k.

**Hypotheses.**

- R principal artinian of length k
- F cartesian on Quot_R(T)
- T free of finite rank

**Proof sketch.**

1. For i + j ≤ k the sequence 0 → T/m^i → T/m^{i+j} → T/m^j → 0 gives a six-term exact sequence of H⁰ and H¹_F: exactness in the middle of the H¹_F terms is the cartesian condition for π^j, and surjectivity on the right is the definition of propagation to a quotient.
2. Hence λ(i) + λ(j) = λ(i + j) for λ(i) = length H⁰ − length H¹_F, so λ(i) = i·λ(1).

**Acceptance.**

- For the unramified condition on an unramified T one gets r = 0, since H¹_f(K_v, T) ≅ T/(Fr − 1)T has the length of T^{Fr=1}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `mathlib:Module.length`

**Sources.**

- `mr-ks`, Lemma 1.1.5, p. 8: Statement and proof of the linearity.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Propagation commutes with local duality

`EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation` — lemma

**Statement.** Let F be a local condition on T at v and I an ideal of R. The two local conditions induced on T^*[I] = (T/IT)^* agree: the orthogonal complement of the condition propagated to the quotient T/IT, and the condition propagated to the submodule T^*[I] from the orthogonal complement F^* on T^*. Consequently, for a Selmer structure F, (F on T/IT)^* = (F^* on T^*[I]), and the same holds for the passages T → V and V → V/T of a lattice in its rational representation.

**Hypotheses.**

- T a compact coefficient module over a coefficient ring (finite type, m-adic topology, continuous action), so that local Tate duality pairs H¹(K_v,T) and H¹(K_v,T^*) perfectly with T^* = Hom(T, μ_{p^∞}) discrete of cofinite type

**Proof sketch.**

1. The local pairings for T/IT × T^*[I] and T × T^* are compatible with T → T/IT and T^*[I] → T^* (SelmerIwasawaCohomology L1/lattice-pairing-compatibility).
2. Apply the image/inverse-image rule for orthogonal complements (orthogonal_map_eq_comap of L1/orthogonal-complement): (image of L)^⊥ = inverse image of L^⊥.
3. The lattice case T ⊆ V and W = V/T is L2/lattice-passage together with L2/finite-condition-lattice-duality.

**Acceptance.**

- For F strict on T both constructions give the relaxed condition on T^*[I]. For F relaxed on T they give the kernel of H¹(K_v,T^*[I]) → H¹(K_v,T^*); this is strict precisely when that map is injective, equivalently when H¹(K_v,T) → H¹(K_v,T/IT) is surjective under the perfect finite/compact-discrete pairing.
- The condition on a quotient remembers T: H¹_{F_can}(ℚ_p, T/IT) is the image of H¹(ℚ_p, T), which can be smaller than H¹(ℚ_p, T/IT) (Mazur–Rubin 2004, Definition 3.2.1 and Lemma A.1).

**Prerequisites.**

- `SelmerIwasawaCohomology:L2`
- `SelmerIwasawaCohomology:L2/condition-propagation`

**Sources.**

- `mr-ks`, Example 1.3.3, p. 12: The square relating propagation and orthogonal complements.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Selmer modules of quotients and torsion submodules

`EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification` — lemma

**Statement.** Assume T̄^{G_K} = (T̄^*)^{G_K} = 0 for T̄ = T/mT. (a) For every ideal I of R, T^*[I] → T^* induces an isomorphism H¹_{F^*}(K,T^*[I]) ≅ H¹_{F^*}(K,T^*)[I]. At the general complete noetherian coefficient scope of MR04 retain its (H.0), (H.1) and (H.3); at principal-artinian scope, or finite free coefficients over a commutative noetherian self-injective local ring with the BSS finite-dual dictionary, residual dual invariant vanishing suffices. (b) If R is principal artinian of length k and F is cartesian, then for 0 < i ≤ k the injection π^{k−i}:T/m^iT → T induces isomorphisms H¹(K,T/m^iT) ≅ H¹(K,T)[m^i] and H¹_F(K,T/m^iT) ≅ H¹_F(K,T)[m^i], and H¹_F(K,T)[m^i] is the kernel of H¹_F(K,T) → H¹_F(K,T/m^{k−i}T).

**Hypotheses.**

- (T/mT)^{G_K} = (T^*[m])^{G_K} = 0
- for (b): R principal artinian, F cartesian on Quot_R(T)
- For (a) over general complete noetherian R: MR04 (H.0), (H.1), (H.3). For the weaker finite-coefficient version: principal artinian R, or the self-injective local-ring/free-module/finite-dual scope of BSS II §3.

**Proof sketch.**

1. Use the corrected MR04 Lemma 2.1.4 only for coefficient-ideal quotients T/IT, as recorded in MR16’s Gomez erratum (arXiv v1 p.32; published p.182). Residual invariant vanishing alone does not apply to arbitrary Galois subquotients.
2. (a): retain the general MR04 hypotheses for its original dual-annihilator statement. At the weaker finite self-injective coefficient scope use BSS II Proposition 3.5, Lemmas 3.6–3.7 and Corollary 3.8: for generators r₁,…,r_d of I, compare A/A[I] with A^d by multiplication by those generators; prove vanishing of the diagonal-map cokernel invariants using the coefficient-ideal filtration, then identify the cohomological kernel with I-torsion. The Selmer conditions agree by inverse-image propagation. This replaces the defective induction through unrestricted subquotients.
3. (b): the same argument with 0 → T/m^i → T → T/m^{k−i} → 0; the local conditions match by cartesianness at Σ(F) and by Lemma 1.1.9 at the unramified places.
4. The two coefficient scopes give two separate suggested signatures: the general complete-noetherian form carries (H.0), (H.1) and (H.3) for the residue characteristic, and the finite form carries an artinian self-injective coefficient ring with residual invariant vanishing. A single signature with residual vanishing alone would assert the uncorrected Lemma 2.1.4.

**Acceptance.**

- For T = μ_{p^k} ⊗ ρ^{-1} with ρ ≠ 1, ω, both identifications hold (Mazur–Rubin 2004, Lemma 6.1.5).
- Without the invariants hypothesis the statement fails: for T = ℤ/p² with G_K acting through a nontrivial character χ ≡ 1 (mod p), the connecting map (T/pT)^{G_K} → H¹(K, T/pT) is nonzero, so H¹(K, T/pT) → H¹(K, T)[p] is not injective.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `SelmerIwasawaCohomology:L2/condition-propagation`
- `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`

**Sources.**

- `mr-ks`, Lemma 3.5.3, p. 28: Part (a).
- `mr-ks`, Lemma 3.5.4, p. 29: Part (b).
- `mr-higher`, Proposition 3.3(i)–(ii), pp. 7–8; Gomez erratum to MR04 Lemma 2.1.4, p. 32 (arXiv v1): The principal-artinian number-field statement under invariant vanishing; the erratum restricts Lemma 2.1.4 to coefficient-ideal quotients.
- `bss2`, Proposition 3.5, Lemmas 3.6–3.7 and Corollary 3.8, arXiv v1 pp. 15–17: Replacement proof for arbitrary ideals over the stated self-injective local coefficient ring.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The Euler characteristic formula for Selmer modules

`EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference` — theorem

**Statement.** Let T be a finite R[[G_K]]-module and F a Selmer structure on T. Then length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = length H⁰(K, T) − length H⁰(K, T^*) − Σ_{v ∈ Σ(F)} (length H⁰(K_v, T) − length H¹_F(K_v, T)), all lengths over R.

**Hypotheses.**

- T finite
- lengths taken over R (for R = ℤ/p^k these are p-adic valuations of orders)
- T and T^* lie in the arithmetic coefficient category over a coefficient ring; the Selmer structure records this and Σ(F) ⊇ S_p ∪ S_∞

**Proof sketch.**

1. This is the Greenberg–Wiles formula (the general-R Greenberg–Wiles formula requested from SelmerIwasawaCohomology L2) for M = T, L_v = H¹_F(K_v, T), rewritten additively.
2. To pass from orders to R-lengths apply the formula to T as an R-module: every group in it is an R-module of finite length and #B = (#k)^{length_R B}; the factors at v ∉ Σ(F) are 1 because #H¹_ur(K_v, T) = #H⁰(K_v, T).
3. Mazur–Rubin state it over ℚ and include p = 2; the archimedean term uses ordinary H⁰(K_v, T).

**Acceptance.**

- For K = ℚ, R = 𝔽_p, T = μ_p with the relaxed condition at p and strict at ∞ (p odd), the left side is dim (ℤ[1/p]^×/p) − dim H¹_{F^*}(ℚ, ℤ/p) = 1 − 0 and the right side is 0 − 1 − ((0 − 2) + (0 − 0)) = 1: the term at p is length H⁰(ℚ_p, μ_p) − length H¹(ℚ_p, μ_p) = 0 − 2 and the term at ∞ is 0 − 0.

**Prerequisites.**

- `SelmerIwasawaCohomology:L2`
- `mathlib:Module.length`

**Sources.**

- `mr-ks`, Proposition 2.3.5, p. 17: The finite-level Euler characteristic formula.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The core rank of a cartesian Selmer structure

`EulerSystemsAndKolyvaginSystems:ES.0/core-rank` — definition

**Planet:** Core rank.

**Statement.** Let R be principal artinian of length k, F a cartesian Selmer structure on T, and T^{G_K} = (T^*)^{G_K} = 0. There is a unique integer r such that H¹_F(K, T) ≅ H¹_{F^*}(K, T^*) ⊕ R^r if r ≥ 0 and H¹_F(K, T) ⊕ R^{−r} ≅ H¹_{F^*}(K, T^*) if r ≤ 0 (noncanonically). Mazur–Rubin 2016 Definition 3.4 calls the signed integer r the core rank. In the convention of Mazur–Rubin 2004 Definition 4.1.11, the nonnegative core ranks are χ(T, F) = max(r, 0) and χ(T^*, F^*) = max(−r, 0); one of these is zero. Higher-rank systems use the signed r and require r ≥ 1. For R a discrete valuation ring and F cartesian, χ(T, F) is the common value of χ(T/m^kT, F) for k ≥ 1.

**Hypotheses.**

- R principal artinian (or a discrete valuation ring)
- F cartesian
- (T/mT)^{G_K} = (T^*[m])^{G_K} = 0
- T and T^* lie in the arithmetic coefficient category over a coefficient ring; the Selmer structure records this and Σ(F) ⊇ S_p ∪ S_∞

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

- `coreRank_negative_signed` (non-example): Signed core rank −2 has MR04 positive part 0, rather than absolute value 2.
- `coreRank_positive_signed` (computation): Signed core rank 3 has positive part 3.
- `coreRank_length_quotient` (computation): With vanishing residual invariants, Selmer lengths 5 and 3 and coefficient length 2 give signed core rank 1.

**Acceptance.**

- χ(T, F) = 1 for T = μ_{p^k} ⊗ ρ^{-1} with ρ even and nontrivial and F the unit-root structure of Mazur–Rubin 2004 §6.1; χ = 0 for ρ odd, ρ ≠ ω.
- The core rank is not the R-rank of T: Under the hypotheses of example-elliptic, for T = E[p^k], a module of rank 2, χ(T, F_can) = 1 and χ(T, F) = 0 for the classical Selmer structure.
- Additional arithmetic check: For K = ℚ, R = ℤ/p^k, ρ an even nontrivial character of order prime to p and T = μ_{p^k} ⊗ ρ^{-1} with the structure F of Mazur–Rubin 2004 Definition 6.1.1, χ(T, F) = 1; for ρ odd with ρ ≠ ω, χ(T, F) = 0.
- Additional arithmetic check: For E/ℚ and p ≥ 5 with surjective mod-p representation, T = E[p^k] has rank two, χ(T,F) = 0 for the classical Kummer structure, and χ(T,F_can) = 1 for the structure propagated from T_pE.
- Additional arithmetic check: Over R = k, replacing F by the structure relaxed at one prime q ∈ P_1 (so that H¹_s(K_q, T) is one-dimensional) raises r by exactly 1.
- Additional arithmetic check: For E/ℚ and p ≥ 5 with surjective mod-p representation, T = E[p^k] has rank two, χ(T,F) = 0 for the classical Kummer structure, and χ(T,F_can) = 1 for the structure propagated from T_pE.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-length-linearity`
- `mathlib:Module.length`

**Sources.**

- `mr-higher`, Proposition 3.3(iii) and Definition 3.4, p. 8: The integer r and the definition of the core rank from it.
- `mr-ks`, Theorem 4.1.5 and Definition 4.1.11, pp. 36–38: The same statement over ℚ; the case n = 1 is used here.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The core rank is independent of the modulus

`EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus` — theorem

**Statement.** Let R be principal artinian of length k and F cartesian with the invariants hypothesis of core-rank. Then for 0 < i ≤ k the Selmer triple (T/m^iT, F, P) over R/m^i has χ(T/m^iT) = χ(T) and χ(T^*[m^i]) = χ(T^*), and H¹_F(K, T/m^iT) ≅ (R/m^i)^{χ(T)} ⊕ H¹_{F^*}(K, T^*[m^i]) when χ(T) > 0. If R is a discrete valuation ring and H¹(K_q, T)/H¹_F(K_q, T) is torsion-free for q ∈ Σ(F), then rank_R H¹_F(K, T) − corank_R H¹_{F^*}(K, T^*) = χ(T) − χ(T^*).

**Hypotheses.**

- as in core-rank
- R/m^i is again a coefficient ring, so the reduced Selmer structure on T/m^iT over R/m^i is defined

**Proof sketch.**

1. Take m^i-torsion in the isomorphism of core-rank and apply selmer-torsion-identification.
2. For a discrete valuation ring pass to the limit over k using SelmerIwasawaCohomology L2/selmer-limits and the bounded cokernel of H¹_F(K,T)/m^k → H¹_F(K, T/m^k) (Mazur–Rubin 2004, Lemma 3.7.1(ii)).

**Acceptance.**

- For T = T_pE and F_can, rank H¹_{F_can}(ℚ, T) − corank H¹_{F_can^*}(ℚ, E[p^∞]) = 1.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `SelmerIwasawaCohomology:L2/selmer-limits`

**Sources.**

- `mr-ks`, Theorem 4.1.13 and Definition 5.2.4, pp. 38, 56: Independence of the modulus.
- `mr-ks`, Corollary 5.2.6, p. 56: The rank formula over a discrete valuation ring.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The canonical and the unramified Selmer structures

`EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure` — definition

**Planet:** Canonical Selmer structure.

**Statement.** Let R be the ring of integers of a finite extension of ℚ_p (or a discrete valuation ring as in Mazur–Rubin 2016) and T a lattice in the compact coefficient category. The canonical Selmer structure F_can on T has Σ(F_can) = {q : T ramified at q} ∪ {v | p} ∪ {v | ∞}; H¹_{F_can}(K_q, T) = ker(H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p)) for q ∈ Σ(F_can), q ∤ p∞; and H¹_{F_can}(K_v, T) = H¹(K_v, T) exactly for v | p∞. On T/IT it is the structure induced from T, which depends on T and not only on T/IT. The unramified structure F_ur of Mazur–Rubin 2016 Definition 5.1 has the same support, the same rational inertia kernel at q ∤ p∞, the relaxed condition at v | ∞, and at 𝔭 | p the saturation of the universal norm subgroup H¹(K_𝔭, T)_u = ⋂_L Cor_{L/K_𝔭} H¹(L, T), the intersection over finite unramified extensions L/K_𝔭; saturation means that H¹(K_𝔭, T)/H¹_{F_ur}(K_𝔭, T) is R-torsion-free and H¹_{F_ur}(K_𝔭, T)/H¹(K_𝔭, T)_u has finite length. At 𝔭 | p, F_ur is not the rational inertia kernel. Its dual condition has the R-corank of H⁰(K_𝔭, T^*) (Mazur–Rubin 2016 Lemma 5.2), and F_ur is relaxed at 𝔭 when H⁰(K_𝔭, T^*) is finite (Corollary 5.3); if this holds at every 𝔭 | p then F_ur = F_can.

**Hypotheses.**

- R a discrete valuation ring, finite over ℤ_p for F_can
- T free of finite rank, compact (m-adic topology, continuous action), unramified outside a finite set

**Construction.**

1. The condition away from p is the inverse image of the unramified condition on V = T ⊗ ℚ_p (SelmerIwasawaCohomology L2/lattice-passage), so its quotient is torsion-free and F_can is cartesian on quotients by Mazur–Rubin 2004 Lemma 3.7.1(i).
2. Corestriction from a finite unramified L/K_𝔭 on compact coefficients is Shapiro’s isomorphism followed by the induced-module trace (ArithmeticGaloisDuality D7/compact-shapiro-projection). The universal norm subgroup is the intersection of these images, and its saturation is the preimage of the R-torsion of the quotient.
3. At 𝔭 | p, Mazur–Rubin 2016 Lemma 5.2 identifies H¹_{F_ur^*}(K_𝔭, T^*) with the maximal divisible part of the unramified inflation image, of R-corank equal to corank_R H⁰(K_𝔭, T^*). If H⁰(K_𝔭, T^*) is finite, H¹(K_𝔭, T)/H¹_{F_ur}(K_𝔭, T) is both of finite length and torsion-free, hence zero (Corollary 5.3); so F_ur = F_can when this holds at every 𝔭 | p.
4. Euler-system classes lie in H¹_{F_can}(F, T) (SelmerIwasawaCohomology L3/universal-norms-unramified; Rubin, Corollary B.3.5).

**Uses that determine the API.**

- Mazur–Rubin 2004, Theorem 3.2.4: the target of the Euler-system-to-Kolyvagin-system map is KS(T, F_can, P)
- Burns–Sakamoto–Sano II, Theorem 6.12: higher-rank Kolyvagin derivatives land in systems for F_can
- Mazur–Rubin 2004, Theorem 5.2.15; Mazur–Rubin 2016, Theorem 5.4: the core rank formulas are for F_can and F_ur

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.canonicalStructure` | constructor | F_can on a compact lattice: relaxed exactly at S_p ∪ S_∞ and the rational inertia kernel H¹(K_q,T) → H¹(K_q^{ur}, T ⊗ ℚ_p) at the other places of Σ; Σ must contain S_p ∪ S_∞. |
| `TauCeti.KolyvaginSystems.canonicalStructure_torsionFree` | characterisation | H¹(K_q, T)/H¹_{F_can}(K_q, T) is torsion-free for every q, so F_can is cartesian on quotients. |
| `TauCeti.KolyvaginSystems.canonicalStructure_dual_at_p` | compatibility | The dual structure F_can^* is strict at every v \| p and equals the dual of the unramified-saturated condition elsewhere. |
| `TauCeti.KolyvaginSystems.canonicalStructure_quotient_at_p` | relation | H¹_{F_can}(K_𝔭, T/IT) is the image of H¹(K_𝔭, T); it equals H¹(K_𝔭, T/IT) if H⁰(K_𝔭, T^*) is divisible. |
| `TauCeti.KolyvaginSystems.UnramifiedLocalLayer` | structure | Finite unramified extensions L/K_v, as open subgroups of finite index of the decomposition group that contain inertia. |
| `TauCeti.KolyvaginSystems.unramifiedCor` | data | Corestriction H¹(L, T) → H¹(K_v, T) on compact coefficients, supplied by ArithmeticGaloisDuality D7/compact-shapiro-projection. |
| `TauCeti.KolyvaginSystems.universalNormSubgroup` | data | H¹(K_v, T)_u = ⋂_L Cor_{L/K_v} H¹(L, T) over finite unramified L/K_v. |
| `TauCeti.KolyvaginSystems.saturation` | data | The saturation of N ⊆ M: the preimage of the torsion of M/N, i.e. the elements with a nonzero multiple in N. |
| `TauCeti.KolyvaginSystems.unramifiedCondition` | data | The local conditions of F_ur: relaxed at v \| ∞, the saturated universal norm subgroup at 𝔭 \| p, and the rational inertia kernel at every other prime. |
| `TauCeti.KolyvaginSystems.unramifiedStructure` | constructor | F_ur of Mazur–Rubin 2016, Definition 5.1, on a DVR lattice: its local conditions are unramifiedCondition. |
| `TauCeti.KolyvaginSystems.unramifiedStructure_condition` | characterisation | The local condition of F_ur at v is unramifiedCondition at v. |
| `TauCeti.KolyvaginSystems.unramifiedStructure_condition_away` | compatibility | At every prime q ∤ p, F_ur and F_can impose the same condition. |
| `TauCeti.KolyvaginSystems.unramifiedStructure_dual_corank_at_p` | relation | At 𝔭 \| p the dual condition H¹_{F_ur^*}(K_𝔭, T^*) has the R-corank of H⁰(K_𝔭, T^*) (Mazur–Rubin 2016, Lemma 5.2). |
| `TauCeti.KolyvaginSystems.unramifiedStructure_relaxed_at_p` | relation | If H⁰(K_𝔭, T^*) is finite, F_ur is relaxed at 𝔭 \| p (Mazur–Rubin 2016, Corollary 5.3). |
| `TauCeti.KolyvaginSystems.unramifiedStructure_eq_canonical` | compatibility | If H⁰(K_𝔭, T^*) is finite for every 𝔭 \| p then F_ur = F_can (Mazur–Rubin 2016, Corollary 5.3); mere unramifiedness of T at p does not suffice. |

**Unit tests.**

- `canonicalStructure_unramified_place` (compatibility): Outside Σ, the unramified structure equals the inertia restriction kernel.
- `canonicalStructure_relaxed_lattice` (characterisation): At every place of S_p ∪ S_∞ the lattice canonical condition is all local H¹.
- `canonicalStructure_quotient_ne_relaxed` (non-example): If the local coefficient reduction map on H¹ is not surjective, the propagated finite canonical condition at a relaxed lattice place is a proper submodule.
- `unramifiedStructure_tate_twist_units` (non-example): For T = ℤ_p(1) over ℚ with p odd, the rational inertia kernel at p is zero while F_ur at p is free of rank one, so F_ur is not the inertia-kernel structure at p.

**Acceptance.**

- For T = ℤ_p(1) ⊗ ρ^{-1} with ρ(p) ≠ 1, F_can equals the unit structure F of Mazur–Rubin 2004 §6.1 (Lemma 6.1.2).
- H¹_{F_can}(ℚ_p, T/IT) = H¹(ℚ_p, T/IT) when H⁰(ℚ_p, T^*) is divisible (Lemma A.1) and can be smaller otherwise.
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1), p odd: H¹_{F_can}(ℚ, T) is the p-adic completion of ℤ[1/p]^×, free of rank one over ℤ_p, generated by the class of p.
- Additional arithmetic check: For T=T_pE over ℚ and p odd, F_can is the classical lattice Kummer structure relaxed at p, with F_can^* ≤ F ≤ F_can under the Weil-pairing dictionary. On E[p^k] use the image of H¹(ℚ_p,T_pE); it is the full local group when E(ℚ_p)[p^∞]=0 and may be proper otherwise.
- Additional arithmetic check: For T = ℤ_p(1) ⊗ ρ^{-1} with ρ finite order prime to p, unramified at p, and ρ(p)=1, T^* is locally ℚ_p/ℤ_p. Its invariants are divisible, so the propagated canonical condition on T/p^kT is all H¹(ℚ_p,T/p^kT). The unit condition on the lattice remains proper.
- For T = ℤ_p(1) over ℚ with p odd: H¹(ℚ_p, T) is the p-adic completion of ℚ_p^×, free of rank two. T^* = ℚ_p/ℤ_p with trivial action has H⁰ of corank one, so Corollary 5.3 does not apply. F_ur at p is the image of the local units, free of rank one and saturated, and its dual condition is the unramified condition, of corank one (Lemma 5.2). The rational inertia kernel at p is zero, since ℚ_p(1) has no inertia invariants and H¹(ℚ_p, T) has no torsion. So an inertia-kernel definition of F_ur at p is wrong.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `SelmerIwasawaCohomology:L2/lattice-passage`
- `SelmerIwasawaCohomology:L2/unramified-condition`
- `SelmerIwasawaCohomology:L2`
- `ArithmeticGaloisDuality:D7/compact-shapiro-projection`
- `mathlib:Submodule.torsion`
- `mathlib:cyclotomicCharacter`

**Sources.**

- `mr-ks`, Definition 3.2.1, p. 23: Definition of F_can over ℚ.
- `mr-higher`, Definition 5.1, pp. 9–10: Definition of F_ur over a number field.
- `bss2`, §6.2, p. 38: The same structure over a number field and a Gorenstein order.
- `mr-higher`, Lemma 5.2 and Corollary 5.3, p. 10: The corank of the dual unramified condition at p, and the relaxed condition when H⁰(K_𝔭, T^*) has finite length.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerTriple`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Core rank of the canonical and unramified structures

`EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula` — theorem

**Statement.** (a) (K = ℚ) For R the ring of integers of a finite extension of ℚ_p and T satisfying (H.0)–(H.3), χ(T^*, F_can^*) = 0 and χ(T, F_can) = rank_R T^− + corank_R H⁰(ℚ_p, T^*), where T^− is the minus part for a complex conjugation. (b) (K a number field, R a discrete valuation ring) χ(T, F_ur) = Σ_{v | ∞} corank_R H⁰(K_v, T^*).

**Hypotheses.**

- the invariants hypothesis of core-rank
- for (a): K = ℚ and the hypotheses of Mazur–Rubin 2004 §5.2
- for (b): R a discrete valuation ring, T a compact lattice, and F_ur as in canonical-selmer-structure, with Σ(F_ur) ⊇ S_p ∪ S_∞

**Proof sketch.**

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

- `mr-ks`, Theorem 5.2.15, p. 59: Part (a).
- `mr-higher`, Theorem 5.4, p. 10: Part (b).

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

- `MR04Hypotheses.residual_invariants_zero` (characterisation): MR04 admissibility forces H⁰(K,T/mT)=0.
- `MR04Hypotheses.rank_one_coinvariants` (computation): For a rank-one coefficient module, τ=1 has rank-one coinvariants.
- `MR04Hypotheses.not_dual_invariants` (non-example): A representation with nonzero residual Cartier-dual H⁰ cannot satisfy MR04 hypotheses.

**Acceptance.**

- The record is satisfied by T = ℤ_p(1) ⊗ ρ^{-1}, ρ ≠ 1, ω of order prime to p, with (H.4a); and by T = T_pE with surjective mod-p representation and p ≥ 5, with (H.4b).
- It is not satisfied by T = ℤ_p(1): (H.3) fails.
- Additional arithmetic check: For p odd, ρ : G_ℚ → ℤ_p^× of finite order prime to p with ρ ≠ 1 and ρ ≠ ω, T = ℤ_p(1) ⊗ ρ^{-1} satisfies (H.0), (H.1), (H.2) with τ = 1, (H.3) and (H.4a).
- Additional arithmetic check: For E/ℚ with G_ℚ → Aut(E[p]) surjective and p ≥ 5, T = T_pE satisfies (H.0)–(H.3) and (H.4b).
- Additional arithmetic check: T = ℤ_p(1) (ρ = 1) does not satisfy (H.3): T^*[m] = Hom(μ_p, μ_p) is the trivial module 𝔽_p, so (T^*[m])^{G_ℚ} ≠ 0, contradicting the consequence S^{G_ℚ} = 0 of (H.3). Likewise ρ = ω fails because T/mT is trivial.
- Additional arithmetic check: If R is a field, (H.6) holds for every Selmer structure.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`

**Sources.**

- `mr-ks`, §3.5, pp. 27–28: The list (H.0)–(H.6).
- `mr-ks`, §3.5, p. 27: The condition on the set of primes.

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

- `MR16Hypotheses.positive_rank` (non-example): MR16 admissibility excludes core rank zero.
- `MR16Hypotheses.infinite_primes` (characterisation): The required Frobenius containment forces the selected prime set to be infinite.
- `MR16Hypotheses.not_empty_primes` (non-example): The empty selected prime set admits no MR16 hypothesis data.

**Acceptance.**

- Satisfied by T = T_pA for an abelian variety with large image and p > 3, with r = d[K : ℚ] (Mazur–Rubin 2016, §5).
- (H.6) excludes core rank zero: it is a hypothesis on (T, F), not a consequence of the others.
- Additional arithmetic check: For an abelian variety A of dimension d over K with image of G_K in Aut(A[p]) containing GSp_{2d}(𝔽_p) and p > 3, T = T_pA with the structure of Mazur–Rubin 2016 §5 satisfies (H.1)–(H.6) with r = d[K : ℚ].
- Additional arithmetic check: T = E[p^k] with the classical Selmer structure has χ = 0, so (H.6) fails for every r ≥ 1 although (H.1)–(H.5) can hold.
- Additional arithmetic check: For K = ℚ and p odd, H_M = ℚ(μ_M), so (H.2) asks for τ trivial on μ_M, as in 2004 (H.2).
- Additional arithmetic check: For p = 3 and T̄ ≅ T̄^* (for example T̄ = E[3]) hypothesis (H.4) fails; p = 3 is allowed only when T̄ is not self-dual.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`

**Sources.**

- `mr-higher`, §4, hypotheses (H.1)–(H.7), p. 9: The list of running hypotheses.
- `mr-higher`, Lemma 4.5, p. 9: How (H.7) is obtained.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Implications between the hypothesis records

`EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-implications` — lemma

**Statement.** (a) (H.0)–(H.4) of 2004 are stable under R → R′ surjective, and (H.6) under T → T/m^jT. (b) For R a discrete valuation ring, torsion-freeness of H¹(K_q, T)/H¹_F(K_q, T) for q ∈ Σ(F) implies (H.6)/(H.5) for every T/m^kT. (c) 2004 (H.3) implies T̄^{G_ℚ} = (T̄^*)^{G_ℚ} = 0, hence 2016 (H.1) given (H.1) of 2004; 2004 (H.3) implies 2016 (H.3) for K = ℚ, because ℚ(T, μ_M) ⊆ ℚ(T, μ_{p^∞}) and inflation is injective on H¹. (d) 2016 (H.1)–(H.6) for artinian R give (H.7) for the prime set P(H_M, τ). (e) Rubin's Hyp(K, T) (ES.4/rubin-hypotheses) gives residual irreducibility and a rank-one τ fixing the maximal p-Hilbert class extension K(1), cyclotomic p-power roots and p-power roots of units. It gives the τ of 2016 (H.2) only with the additional condition that this τ fixes the full Hilbert class field H (and the specified finite extension L); absolute residual irreducibility in 2016 (H.1) is also an additional condition; it does not give (H.3), whose failure is measured by Rubin's error terms n_W and n_W^*.

**Hypotheses.**

- as in the two records

**Proof sketch.**

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

- `mr-ks`, Remark 3.5.1, p. 28: Stability under quotients of the coefficient ring.
- `mr-higher`, Remark 4.3, p. 9: Passage to (H.7).

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Worked example: twists of ℤ_p(1) by characters of finite order

`EulerSystemsAndKolyvaginSystems:ES.0/example-cyclotomic-twist` — application

**Statement.** Let p be odd, ρ : G_ℚ → ℤ_p^× a character of finite order prime to p, L its field, R = ℤ/p^k (or ℤ_p) and T = μ_{p^k} ⊗ ρ^{-1} (or ℤ_p(1) ⊗ ρ^{-1}). With H¹(ℚ, T) = (L^×/(L^×)^{p^k})^ρ, let F be the structure with H¹_F(ℚ_ℓ, T) = (O_{L,ℓ}^×/(O_{L,ℓ}^×)^{p^k})^ρ for all ℓ. Then: if ρ ≠ 1, ω, T satisfies (H.0)–(H.3), (H.4a), and F, F_can satisfy (H.6); χ(T, F) = 1 if ρ is even and ρ ≠ 1, and χ(T, F) = 0 if ρ is odd and ρ ≠ ω; F = F_can if ρ(p) ≠ 1; and there are exact sequences 0 → (O_L^×/(O_L^×)^{p^k})^ρ → H¹_F(ℚ, T) → Cl(L)[p^k]^ρ → 0 with H¹_{F^*}(ℚ, T^*) ≅ Hom(Cl(L), ℤ/p^k)^{ρ^{-1}}.

**Hypotheses.**

- p odd
- ρ of order prime to p

**Proof sketch.**

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

- `mr-ks`, Lemma 6.1.5 and Proposition 6.1.6, pp. 71–72: Hypotheses and core rank for the twists of ℤ_p(1).

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Worked example: the Tate module of an elliptic curve

`EulerSystemsAndKolyvaginSystems:ES.0/example-elliptic` — application

**Statement.** Let E/ℚ be an elliptic curve and p ≥ 5 a prime with G_ℚ → Aut(E[p]) surjective, T = E[p^k] or T_pE, and F the classical Selmer structure (images of the local Kummer maps at the bad primes, p and ∞). Then F^* = F under the Weil pairing, H¹_F(ℚ, E[p^k]) is the p^k-Selmer group, T satisfies (H.0)–(H.4), F and F_can satisfy (H.6), χ(T, F) = 0 and χ(T, F_can) = 1, where on T_pE, F_can is F relaxed at p and F_can^* ≤ F ≤ F_can. On E[p^k], F_can is propagated from T_pE; its local condition at p is the image of H¹(ℚ_p,T_pE), which may be proper if E(ℚ_p)[p^∞] ≠ 0.

**Hypotheses.**

- p ≥ 5
- surjective mod-p representation

**Proof sketch.**

1. (H.1)–(H.3) follow from surjectivity onto GL₂(𝔽_p); (H.4b) holds as p > 4; (H.6) by Lemma 3.7.1 since the Kummer images on T_pE have torsion-free quotient.
2. χ(T, F) = 0 because F is self-dual (core-rank); χ(T, F_can) = rank T_pE^− = 1 by core-rank-formula.

**Acceptance.**

- Both structures on the same T have different core ranks, 0 and 1: the core rank depends on F.
- The analytic rank of E plays no role in either value.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`
- `HeegnerPointEulerSystems:HE.7`

**Sources.**

- `mr-ks`, Proposition 6.2.2 and Lemma 6.2.3, p. 74: Core ranks and hypotheses for T_pE.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Worked non-example: the trivial and Teichmüller characters

`EulerSystemsAndKolyvaginSystems:ES.0/non-example-inadmissible` — application

**Statement.** For ρ = 1 the module T = ℤ_p(1) does not satisfy (H.3) of Mazur–Rubin 2004: T^*[m] = Hom(μ_p, μ_p) = 𝔽_p with trivial action, so (T^*[m])^{G_ℚ} ≠ 0 and H¹(ℚ(μ_{p^∞})/ℚ, 𝔽_p) = Hom(Gal(ℚ(μ_{p^∞})/ℚ), 𝔽_p) ≠ 0. For ρ = ω, T/mT = μ_p ⊗ ω^{-1} is trivial and (H.3) fails for the same reason. In both cases Lemma 3.5.2 (no invariants in subquotients), on which the definition of the core rank rests, is false, and no instance of the hypothesis record exists. Rubin's error-tolerant theorem still applies to T = ℤ_p(1) through Hyp(K, V), with the finiteness of S_{Σ_p}(K, W^*) equivalent to Leopoldt's conjecture for T = O.

**Hypotheses.**

- p odd

**Proof sketch.**

1. Compute T^*[m] and T/mT as Galois modules; Gal(ℚ(μ_{p^∞})/ℚ) ≅ ℤ_p^× has a quotient of order p.
2. Rubin, Remark II.2.7 and Lemma V.3.2: for T = O or O(1) the groups H¹(Ω/K, W), H¹(Ω/K, W^*) are infinite.

**Acceptance.**

- The record MR04Hypotheses has no term for T = ℤ_p(1): the field h1Vanishing is refutable.
- The failure is of (H.3), not of (H.1) or (H.2), which both hold for rank one.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`

**Sources.**

- `mr-ks`, Lemma 6.1.5, proof, p. 71: The two excluded characters are exactly those for which (H.3) fails.
- `rubin-es`, Chapter II, Remark 2.7, p. 25: What remains true in the excluded case.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Hypotheses`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


**Open refinements of ES.0.**

- Implement the general-R duality and compact/discrete coefficient adapters of the SelmerIwasawaCohomology L2 request (carried from the ES.0 part).
- Lemma level: Mazur–Rubin 2016 Lemma 5.2 through Perrin-Riou's universal-norm lemma, and the bounded-kernel comparison in the proof of Theorem 5.4.

## ES.1. Auxiliary primes and local comparison maps

The ray-class p-extensions K(q) and their cyclic Galois groups, the conductor ideals I_q and the groups G_q, the sets of Kolyvagin primes, the finite and singular parts of local cohomology at an unramified prime, the transverse condition and the finite–singular comparison with its cyclic tensor factor, the modified Selmer structures F_a^b(c) and the self-duality of the transverse condition. Chebotarev arguments give simultaneous nonvanishing of localisations, prescribed localisation kernels, Rubin's selection of primes with large localisation, the error-tolerant selection of Castella–Grossi–Lee–Skinner with its error constants, Zhang's residual detection of two classes, and the abundant tuples of Liu–Tian–Xiao–Zhang–Zhu with reducibility depth and the saturation of θ_S.

**Layer acceptance.** Finite–singular isomorphisms commute with quotient maps; the transverse and finite conditions are exact orthogonal complements; chosen primes avoid Σ and earlier conductors; with ρ_E surjective the error constants vanish and the error-tolerant selection reduces to the large-image one.

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

- `gammaConductor_one` (degenerate): The relative Galois group of the conductor-one ray layer over K(1) is trivial.
- `gammaPrime_trivial_of_not_dvd` (computation): If p does not divide N(q)−1, the relative p-ray group Γ_q is trivial.
- `gammaConductor_product` (compatibility): The relative ray Galois group at n is the product of its one-prime relative groups.

**Acceptance.**

- [K(q) : K(1)] divides N(q) − 1.
- K(r) is contained in, and in general not equal to, the maximal p-extension of K in the ray class field modulo r.
- Additional arithmetic check: For K = ℚ and p = 3, Γ_7 is cyclic of order 3 and Γ_5 is trivial; for p = 2, Γ_7 has order 1 because 6 = 2·3 and (ℤ/7)^×/{±1} has order 3.
- Additional arithmetic check: For K = ℚ, p = 3: Γ_{7·13} ≅ ℤ/3 × ℤ/3, and the maximal 3-extension of ℚ of conductor 91 has this Galois group.
- Additional arithmetic check: For K = ℚ, p = 3, q = 13: the ray class field modulo 13 is ℚ(μ_13)^+, of degree 6, and ℚ(13) is its cubic subfield, a proper subfield.

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`
- `tauceti:TauCeti.GlobalNumberFields.RayClassGroup`

**Sources.**

- `rubin-es`, Chapter IV §1, p. 55: The fields K(q), K(r) and the groups Γ_q, Γ_r.

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
| `TauCeti.KolyvaginSystems.conductorIdeal_rat` | compatibility | For K=ℚ, odd residue characteristic p and R principal with the stated p-adic coefficient hypotheses, the 2016 ideal I_ℓ is the largest power of m containing the 2004 ideal (ℓ−1,P_ℓ(1)) for which the coinvariants are free of rank one. The finite-modulus ray class group quotients by ±1; its p-part agrees with the full tame group only after this odd-p restriction. |

**Unit tests.**

- `conductorIdeal_two_primes` (computation): I_{q₁q₂}=I_{q₁}+I_{q₂}, not their product or intersection.
- `conductorIdeal_one` (degenerate): The conductor-one coefficient ideal is zero.
- `tameGroup_one` (compatibility): The conductor-one tame tensor factor is ℤ, not the zero group.

**Acceptance.**

- For T = ℤ_p(1) over ℚ: P_ℓ(x) = 1 − ℓx and I_ℓ = (ℓ − 1).
- I_n depends on Frobenius and on |G_q|, not only on n.
- Additional arithmetic check: For K=ℚ, odd p, R=ℤ_p and T=ℤ_p(1), both conductor conventions give I_ℓ=(ℓ−1)ℤ_p, so ℓ∈P_k iff ℓ≡1 modulo p^k. At p=2, ℓ=7, the MR04 ideal is (2), whereas the finite-modulus ray class group has order 3 and its maximal 2-extension is trivial, so the MR16 ideal is the unit ideal.
- Additional arithmetic check: For T = T_pE over ℚ: P_ℓ(1) = 1 − a_ℓ + ℓ and I_ℓ = (ℓ − 1, a_ℓ − 2).
- Additional arithmetic check: Two primes ℓ, ℓ′ with ℓ ≡ ℓ′ ≡ 1 (mod p^k) can have I_ℓ ≠ I_ℓ′ for T = T_pE, since a_ℓ ≢ a_ℓ′ in general: I_ℓ is not a function of ℓ − 1 alone.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `mathlib:LinearMap.charpoly`

**Sources.**

- `mr-ks`, Definition 2.2.1, p. 16: I_ℓ, I_n and G_n over ℚ.
- `mr-higher`, Definition 2.2, p. 6: I_q over a number field.
- `howard`, Definition 1.2.1, p. 1444: The inert-prime variant.

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

- `kolyvaginPrimes_not_outside` (non-example): A prime outside the selected set is outside every level set.
- `kolyvaginPrimes_unit_ideal` (non-example): At positive level and a proper maximal-ideal power, a prime with unit conductor ideal is excluded.
- `kolyvaginPrimes_level_zero` (degenerate): At level zero, every selected prime is allowed.

**Acceptance.**

- For ℓ ∈ P_k with R principal artinian of length k: H¹_f(ℚ_ℓ, T), H¹_s(ℚ_ℓ, T) and their duals are free of rank one and φ^fs_ℓ is an isomorphism (Lemma 3.5.6(ii)).
- All chosen primes avoid Σ(F) and any prescribed finite set.
- Additional arithmetic check: For T = ℤ_p(1) over ℚ with Σ(F) = {p, ∞}: P_k = {ℓ ≠ p : ℓ ≡ 1 (mod p^k)}.
- Additional arithmetic check: For R = ℤ_p and T = ℤ_p(1), ∩_k P_k = ∅: no prime is ≡ 1 modulo every power of p.
- Additional arithmetic check: For K = ℚ, F = ℚ, T = ℤ_p(1) and M = p^k, a prime ℓ ∤ N lies in R_{ℚ,M} iff ℓ ≡ 1 (mod p^k), since P(Fr_ℓ^{-1} | T^*; 1) = 1 − Fr_ℓ^{-1} acting on T^* = ℤ_p is 0 and [ℚ(ℓ) : ℚ] is the p-part of ℓ − 1.
- Additional arithmetic check: For T = T_pE and ℓ ≡ 1 (mod p) with a_ℓ ≢ 2 (mod p), ℓ ∉ P_1: I_ℓ = R.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `tauceti:NumberField.Chebotarev.frobeniusPrimeSet`
- `tauceti:NumberField.artinSymbol`

**Sources.**

- `mr-ks`, Definition 3.1.6, p. 21: The sets P_k.
- `mr-higher`, Definition 4.2, p. 9: The sets P(L, τ).
- `rubin-es`, Chapter IV, Definition 1.1, p. 57: Rubin's sets R_{F,M}.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Finite and singular parts at an unramified prime

`EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition` — lemma

**Statement.** Let K_v be nonarchimedean of residue characteristic ≠ p with residue field 𝔽, T a finitely generated module over a coefficient ring R, with its m-adic topology and an unramified continuous G_{K_v}-action and |𝔽^×|·T = 0. There are canonical functorial isomorphisms H¹_f(K_v, T) ≅ T/(Fr − 1)T (evaluate cocycles at Frobenius), H¹_s(K_v, T) := H¹(K_v, T)/H¹_f(K_v, T) ≅ Hom(I, T^{Fr=1}), and H¹_s(K_v, T) ⊗ 𝔽^× ≅ T^{Fr=1}.

**Hypotheses.**

- T unramified, of finite type over a coefficient ring (complete noetherian local, finite residue field of characteristic p ≠ char 𝔽), with the m-adic topology and a continuous action
- |𝔽^×|·T = 0

**Proof sketch.**

1. H¹_f = H¹(G_𝔽, T) ≅ T/(Fr − 1)T is SelmerIwasawaCohomology L2/unramified-condition (unramified_equiv_coinvariants).
2. The sequence 0 → H¹(G_𝔽, T) → H¹(K_v, T) → H¹(I, T)^{G_𝔽} → 0 (vanishing of H²(G_𝔽, T)) gives H¹_s ≅ Hom(I, T)^{Fr=1}; since |𝔽^×|T = 0 and I/|𝔽^×|I ≅ 𝔽^× canonically (tame inertia), Hom(I, T)^{Fr=1} = Hom(𝔽^×, T^{Fr=1}).

**Acceptance.**

- For T = ℤ/p^k with trivial action and p^k | #𝔽^×: H¹_f ≅ ℤ/p^k and H¹_s ≅ Hom(𝔽^×, ℤ/p^k).
- The isomorphisms commute with maps T → T′ of such modules.
- Outside the coefficient category the identification fails: for ℚ with the discrete topology and trivial action, continuous H¹ of the unramified quotient Ẑ is zero while the Frobenius coinvariants are ℚ. ℚ is not a coefficient ring, and the suggested finiteEvaluation requires compact coefficients.

**Prerequisites.**

- `SelmerIwasawaCohomology:L2/unramified-condition`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `ArithmeticGaloisDuality:R02.2/compact-five-term`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

**Sources.**

- `mr-ks`, Lemma 1.2.1, p. 10: The two canonical identifications.

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

- `transverse_restriction_kernel` (characterisation): The transverse condition is exactly the kernel of restriction to the designated totally ramified tame extension.
- `transverse_trivial` (degenerate): If the Frobenius-fixed module is zero, the transverse condition is zero.
- `transverse_finite_projection` (compatibility): The finite projection of a transverse class is zero under the supplied direct-sum comparison.

**Acceptance.**

- Different choices of L give different complements; all are transverse to H¹_f.
- The transverse condition does not in general propagate to subquotients as the transverse condition (Remark 1.1.8), but F(n) stays cartesian on quotients (Lemma 3.7.4).
- Additional arithmetic check: For K_v = ℚ_ℓ, ℓ ≡ 1 (mod p^k), T = ℤ/p^k: H¹(ℚ_ℓ, T) = Hom(ℚ_ℓ^×, ℤ/p^k) ≅ (ℤ/p^k)², H¹_f is the homomorphisms trivial on ℤ_ℓ^×, and H¹_tr is the homomorphisms trivial on the norm group ⟨ℓ⟩ × (1 + ℓℤ_ℓ) of ℚ_ℓ(μ_ℓ), that is, those with f(ℓ) = 0.
- Additional arithmetic check: In the example above, {f : f(ℓu) = 0}, for a unit u ∈ ℤ_ℓ^× that is not a p-th power modulo ℓ, is another complement of H¹_f = {f : f(ℤ_ℓ^×) = 0}, and it is not H¹_tr = {f : f(ℓ) = 0}: the transverse condition is determined by L = ℚ_ℓ(μ_ℓ).
- Additional arithmetic check: H¹_tr(K_v, T) and H¹_tr(K_v, T^*) are exact orthogonal complements under the local Tate pairing.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`

**Sources.**

- `mr-ks`, Definition 1.1.6(iv) and Lemma 1.2.4, pp. 9, 11: Definition of the transverse condition and the splitting.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The finite–singular comparison map

`EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison` — construction

**Planet:** Finite–singular comparison map.

**Statement.** Let T be free of finite rank over R, unramified at v, with |𝔽^×|·T = 0 and det(1 − Fr | T) = 0. Put P(x) = det(1 − Fr x | T) and let Q(x) ∈ R[x] be the unique polynomial with (x − 1)Q(x) = P(x). By Cayley–Hamilton Q(Fr^{-1})T ⊆ T^{Fr=1}, and φ^fs : H¹_f(K_v, T) ≅ T/(Fr − 1)T → T^{Fr=1} ≅ H¹_s(K_v, T) ⊗ 𝔽^× is induced by Q(Fr^{-1}). If R is artinian, |𝔽^×|R = 0 and T/(Fr − 1)T is free of rank one, then det(1 − Fr | T) = 0 automatically and Q(Fr^{-1}) and φ^fs are isomorphisms, so H¹_f and H¹_s are free of rank one. With the tensor factor 𝔽^× (globally G_q) retained the map involves no choice. A generator σ of the tame quotient gives Rubin's map φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q : H¹_f → H¹_s (α_q evaluation at σ, β_q evaluation at Frobenius), and φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ; for another generator σ^a one has φ^fs_{q,σ^a} = a^{-1}·φ^fs_{q,σ}, so the tensor-valued map is independent of the generator.

**Hypotheses.**

- T free of finite rank over a coefficient ring, unramified, with the m-adic topology and a continuous action
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

- `finiteSingular_cyclotomic` (computation): P=1−X has quotient polynomial Q=−1.
- `finiteSingular_rank_two` (computation): P=(1−X)(1−aX) has quotient polynomial Q=−(1−aX).
- `finiteSingular_not_iso` (non-example): For P=(1−X)², Q(1)=0, so the rank-two fixed space does not have the rank-one isomorphism.
- `finiteSingular_not_natural_inclusion` (non-example): Over 𝔽₅, Q(1) for the included fixed line is −1 but for diag(1,2) it is −(1−2), so arbitrary equivariant inclusions do not preserve the comparison.

**Acceptance.**

- φ^fs commutes with the quotient maps T/I_nT → T/JT: both identifications and Q(Fr^{-1}) are functorial.
- For T = ℤ/p^k(1) and ℓ ≡ 1 (mod p^k): P(x) = 1 − ℓx ≡ 1 − x, Q = −1, and φ^fs is −1 times the tautological identification of T/(Fr − 1)T = T with T^{Fr=1} = T.
- Additional arithmetic check: For R=ℤ/p² and T=R with Fr=1, compare the finite–singular maps for T over R and T/pT over R/p: both quotient polynomials are Q=−1, and the maps on finite and singular terms commute with reduction.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `mathlib:LinearMap.aeval_self_charpoly`
- `mathlib:LinearMap.charpoly`

**Sources.**

- `mr-ks`, Definition 1.2.2, p. 10: The comparison map with its tensor factor.
- `rubin-es`, Chapter IV, Definition 5.3, pp. 67–68: Rubin's version with a chosen generator σ_q.

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
| `TauCeti.KolyvaginSystems.strict_sigma` | compatibility | Σ(F_n) = Σ(F) ∪ {q \| n} for the strict modification at n. |
| `TauCeti.KolyvaginSystems.relaxed_sigma` | compatibility | Σ(F^n) = Σ(F) ∪ {q \| n} for the relaxed modification at n. |
| `TauCeti.KolyvaginSystems.modify_sigma` | compatibility | Σ(F_a^b(c)) = Σ(F) ∪ {q \| abc} (Mazur–Rubin 2016 Definition 2.3), so the modified structure keeps S_p ∪ S_∞. |

**Unit tests.**

- `modify_one` (degenerate): Strict and relaxed modification at conductor one both give F.
- `modify_strict_one_prime` (computation): Strict modification at q sets its local condition to zero.
- `modify_relaxed_one_prime` (computation): Relaxed modification at q sets its local condition to the full local H¹.

**Acceptance.**

- H¹_{F_n}(K, T) = H¹_F(K, T) ∩ H¹_{F(n)}(K, T).
- The dual of F(n) is F^*(n): the transverse condition is not replaced by its naive complement.
- Additional arithmetic check: (F^n)^* = (F^*)_n and (F_n)^* = (F^*)^n.
- Additional arithmetic check: F_n ≤ F(n) ≤ F^n, and the quotient H¹_{F^n}/H¹_{F_n} injects into ⊕_{q | n} H¹(K_q, T).
- Additional arithmetic check: For q ∈ P_1 with H¹_s(K_q, T) ≠ 0, F(q) ≠ F and neither F(q) ≤ F nor F ≤ F(q).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `SelmerIwasawaCohomology:L2/selmer-data`
- `SelmerIwasawaCohomology:L2`
- `SelmerIwasawaCohomology:L2/change-of-conditions`

**Sources.**

- `mr-ks`, Example 2.1.8, p. 15: The modified structures.
- `mr-ks`, Example 2.3.2, p. 17: Their duals.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The transverse condition is self-dual

`EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality` — theorem

**Statement.** Let K_v be nonarchimedean of residue characteristic ≠ p, T unramified with |𝔽^×|·T = 0, and L/K_v totally ramified abelian of degree |𝔽^×|. Then H¹_tr(K_v, T) and H¹_tr(K_v, T^*) are exact orthogonal complements under the local Tate pairing H¹(K_v, T) × H¹(K_v, T^*) → ℚ_p/ℤ_p, as are H¹_f(K_v, T) and H¹_f(K_v, T^*).

**Hypotheses.**

- v ∤ p
- T unramified and a compact coefficient module over a coefficient ring
- |𝔽^×|·T = 0

**Proof sketch.**

1. The finite parts are orthogonal complements (the general-R local exact-annihilator theorem requested from SelmerIwasawaCohomology L2; SelmerIwasawaCohomology L2/finite-condition-lattice-duality).
2. By the splitting it suffices that the transverse parts are orthogonal. Reduce to T = ℤ/p^k with p^k | #𝔽^×: H¹_tr(T) = Hom(K_v^×/N L^×, ℤ/p^k) and H¹_tr(T^*) = ker(K_v^×/p^k → L^×/p^k) by class field theory and Kummer theory; if α = β^{p^k} then N_{L/K_v}β = α^{#𝔽^×/p^k}, so α is divisible by p^k in the cyclic group K_v^×/N L^× of order #𝔽^×.
3. General T: H¹_tr(K_v, T) = H¹_tr(K_v, T^{G_{K_v}}) and T^{G_{K_v}} is a sum of cyclic modules.

**Acceptance.**

- Local orthogonality for the strict, relaxed and transverse modifications: (F_a^b(c))^* = (F^*)_b^a(c).
- For T = ℤ/p^k the pairing of a transverse character with a transverse Kummer class is 0.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `SelmerIwasawaCohomology:L2`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

**Sources.**

- `mr-ks`, Proposition 1.3.2, p. 12: Self-duality of the finite and transverse conditions.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Simultaneous nonvanishing of localisations

`EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing` — theorem

**Statement.** Let R be principal artinian and (T, F, P) satisfy (H.0)–(H.5) of Mazur–Rubin 2004. If c₁, c₂ ∈ H¹(ℚ, T) and c₃, c₄ ∈ H¹(ℚ, T^*) are all nonzero, then for every k ≥ 1 there is a set S ⊆ P_k of positive density such that for every ℓ ∈ S the four localisations (c_i)_ℓ are nonzero. Over a number field with self-injective coefficients (Burns–Sakamoto–Sano II, Lemma 3.9, under Hypothesis 3.2): for nonzero c₁, …, c_s ∈ H¹(K, A) and c₁^*, …, c_t^* ∈ H¹(K, A^*(1)) with s + t < p, there is a set of primes q ∈ P of positive density with all localisations nonzero.

**Hypotheses.**

- (H.0)–(H.5); this is the only place (H.4) is used
- for the second form: Hypothesis 3.2 of Burns–Sakamoto–Sano II

**Proof sketch.**

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

- `mr-ks`, Proposition 3.6.1, p. 30: The four-class statement.
- `bss2`, Lemma 3.9, p. 17: The version over a number field with Gorenstein coefficients.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Primes with prescribed localisation kernels

`EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels` — theorem

**Statement.** In the setting of chebotarev-nonvanishing, suppose the image of R → End(T) is contained in the image of ℤ_p[[G_ℚ]] → End(T). Fix a finite R-submodule C ⊆ H¹(ℚ, T), a homomorphism φ : C → R and k ≥ 1. (i) There is a set S ⊆ P_k of positive density with ker(loc_ℓ : C → H¹(ℚ_ℓ, T)) = ker φ for all ℓ ∈ S. (ii) If also (H.4a) holds, D ⊆ H¹(ℚ, T^*) is a finite submodule and ψ : D → R a homomorphism, then S can be chosen with in addition ker(loc_ℓ on D) = ker ψ.

**Hypotheses.**

- (H.0)–(H.5)
- image of R in End(T) inside the image of ℤ_p[[G_ℚ]]
- (H.4a) for (ii)

**Proof sketch.**

1. Via C → Hom(G_F, T/(τ − 1)T) ≅ Hom(G_F, R) (after fixing a generator), find γ ∈ G_F realising φ; the hypothesis on End(T) makes the span of the image of G_F an R-module (Mazur–Rubin 2004, Lemma 3.6.3).
2. (H.4a) makes the extensions cut out by C and D linearly disjoint, so φ and ψ can be realised by one γ; apply Chebotarev as before.

**Acceptance.**

- Used with C = H¹_F(ℚ, T) and ker φ_i cutting out a submodule L to find leading vertices through L (ES.4/leading-vertices).
- Fails without the End(T) hypothesis: only 𝔽_p-rational subspaces occur when T = T₀ ⊗ k (Remark 4.1.17).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`

**Sources.**

- `mr-ks`, Proposition 3.6.2, p. 30: Prescribed kernels of localisation.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Rubin's selection of primes with large localisation

`EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection` — theorem

**Statement.** Let p > 2, let T satisfy Hyp(K, T) with its element τ, fix a power M of p, and let L/K be Galois with G_L acting trivially on W_M and W_M^*. (a) For κ ∈ H¹(K, W_M) and η ∈ H¹(K, W_M^*) there is γ ∈ G_L with order(κ(γτ), W_M/(τ − 1)W_M) ≥ order((κ)_L, H¹(L, W_M)) and the same for η. (b) For an Euler system c with derivative classes κ_{r,M} = κ_{K,r,M} and a finite subset C ⊆ H¹(K, W_M^*) with k = |C|, there are primes q₁, …, q_k of K such that, with r_i = q₁⋯q_i: q_i ∈ R_{K,M}; Fr_{q_i} is in the class of τ in Gal(K(W_M)/K); order((κ_{r_{i−1},M})_{q_i}, H¹_f(K_{q_i}, W_M)) ≥ order((κ_{r_{i−1},M})_Ω, H¹(Ω, W_M)); and every η ∈ C vanishing at all q_i lies in H¹(Ω/K, W_M^*). Under Hyp(K, V) alone the same holds with both orders lowered by a + 1 for a constant a (Lemma V.3.1).

**Hypotheses.**

- Hyp(K, T) for (a), (b); Hyp(K, V) for the weakened form
- Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞})

**Proof sketch.**

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

- `rubin-es`, Chapter V, Lemma 2.3, p. 81: The inductive choice of primes.
- `rubin-es`, Chapter V, Lemma 3.1, p. 87: The weakened form under Hyp(K, V).

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Anticyclotomic twists of a Tate module and their error constants *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.1/twist-error-constants` — definition

**Statement.** Let E/ℚ be an elliptic curve of conductor N, p ∤ 2N a prime of good ordinary reduction, K an imaginary quadratic field with discriminant prime to Np and E(K)[p] = 0, Γ the Galois group of the anticyclotomic ℤ_p-extension K_∞/K with topological generator γ, R the ring of integers of a finite extension Φ/ℚ_p with uniformiser π and r = rank_{ℤ_p} R, and α : Γ → R^× a continuous character. The twist is T_α = T_pE ⊗_{ℤ_p} R(α) with G_K acting through ρ_E ⊗ α, V_α = T_α ⊗ Φ and A_α = V_α/T_α; since α ≡ 1 modulo the maximal ideal, T_α/πT_α ≅ E[p] ⊗ R/(π), so (T_α/πT_α)^{G_K} = 0. The ordinary Selmer structure F_ord on V_α has Σ = {w | pN}, the image of H¹(K_w, Fil⁺_w V_α) at w | p (Fil⁺_w the kernel of reduction on T_pE, tensored with R(α)) and the unramified classes at w | N; it is propagated to T_α and A_α. The error constants are: C_α = v_p(α(γ) − α^{-1}(γ)) if α ≠ α^{-1} and C_α = 0 if α = α^{-1}; C₁ = min{v_p(u − 1) : u ∈ U} for the open subgroup U = ℤ_p^× ∩ ρ_E(G_{K_∞}) of ℤ_p^×; and C₂ the least m ≥ 0 with p^m End_{ℤ_p}(T_pE) ⊆ ρ_E(ℤ_p[G_ℚ]). They satisfy 0 ≤ C₁, C₂ < ∞, U lies in the image of ρ_α for every α, p^{C₂} annihilates End_R(T_α)/ρ_α(R[G_{K_∞}]), C₁ = 0 when ρ_E is surjective and C₂ = 0 when E[p] is irreducible. The combined constants are e_α = r(C₁ + C₂ + C_α) (Castella–Grossi–Lee–Skinner) and e = r(C₁ + C₂) (Castella–Grossi–Skinner, for α ≡ 1 modulo π^m). The Kolyvagin primes are 𝓛_E = {ℓ ∤ N inert in K : a_ℓ ≡ ℓ + 1 ≡ 0 mod p} and 𝓛^{(k)} = {ℓ ∈ 𝓛_E : I_ℓ ⊆ p^kℤ_p}.

**Hypotheses.**

- E/ℚ, p ∤ 2N good ordinary, K imaginary quadratic with (D_K, Np) = 1 and E(K)[p] = 0
- α : Γ → R^× continuous, residually trivial

**Construction.**

1. Finiteness of C₁: ρ_E(G_{K_∞}) = ρ_E(G_ℚ) because K ⊄ ℚ(E[p^∞]) (K is ramified at a prime not dividing Np while ℚ(E[p^∞]) is unramified outside Np; the printed justification is corrected as PAPER-CASTELLA-ETAL-22/E31 in the register of source mistakes), and ℤ_p^× ∩ ρ_E(G_ℚ) is open in ℤ_p^× (Nekovář, Proposition 6.1.1(i), cited by the source).
2. Finiteness of C₂: ρ_E is irreducible, so End(T_pE)/ρ_E(ℤ_p[G_ℚ]) is a torsion ℤ_p-module of finite type; since α is trivial on G_{K_∞}, End_R(T_α)/ρ_α(R[G_{K_∞}]) = (End(T_pE)/ρ_E(ℤ_p[G_ℚ])) ⊗ R is killed by p^{C₂}.
3. Surjective ρ_E gives C₁ = 0 (take u with v_p(u − 1) = 0) and irreducible E[p] gives C₂ = 0 (the image of ℤ_p[G_ℚ] is then all of End by Nakayama).

**Uses that determine the API.**

- Castella–Grossi–Lee–Skinner, Proposition 3.3.6 and Theorem 3.2.1: the loss e_α in the Chebotarev argument and the error term E_α of the descent bound
- Castella–Grossi–Skinner, Proposition 6.3.1 and Theorem 6.1.1: the α-independent loss e = r(C₁ + C₂) for characters close to 1
- Keller–Yin, Lemma 3.0.3: the analogue of C₁ for weight 2r newforms, through scalar matrices in the image
- ES.4/howard-descent-with-errors and ES.4/uniform-near-trivial-bound: the constants entering the length bounds

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.TwistData` | data | The datum (E, p, K, R, α) with the stated hypotheses, and the twisted module T_α with G_K acting by ρ_E ⊗ α. |
| `TauCeti.KolyvaginSystems.TwistData.ordinaryStructure` | constructor | The ordinary Selmer structure F_ord on V_α, T_α and A_α, with Σ = {w \| pN}. |
| `TauCeti.KolyvaginSystems.charError` | data | C_α = v_p(α(γ) − α^{-1}(γ)) if α ≠ α^{-1}, and 0 otherwise; independent of the topological generator γ. |
| `TauCeti.KolyvaginSystems.scalarError` | data | C₁ = min{v_p(u − 1) : u ∈ ℤ_p^× ∩ ρ_E(G_{K_∞})}. |
| `TauCeti.KolyvaginSystems.spanError` | data | C₂ = min{m : p^m End(T_pE) ⊆ ρ_E(ℤ_p[G_ℚ])}. |
| `TauCeti.KolyvaginSystems.scalarError_eq_zero_of_surjective` | simp | If ρ_E is surjective then C₁ = 0. |
| `TauCeti.KolyvaginSystems.spanError_eq_zero_of_irreducible` | simp | If E[p] is irreducible then C₂ = 0. |
| `TauCeti.KolyvaginSystems.pow_spanError_mul_end_le` | characterisation | p^{C₂}·End_R(T_α) ⊆ ρ_α(R[G_{K_∞}]) for every α. |

**Unit tests.**

- `charError_trivial` (degenerate): For α = 1, C_α = 0.
- `charError_quadratic` (computation): If α has order two (α = α^{-1}) then C_α = 0 even though α ≠ 1; the constant is not v_p(α(γ) − 1).
- `charError_close_to_one` (computation): If α(γ) = 1 + p^m u with u a unit and p odd, then α(γ) − α^{-1}(γ) = 2p^m u + O(p^{2m}), so C_α = m: the error grows as α approaches 1, which is why the near-trivial bound of ES.4 uses e = r(C₁ + C₂) instead.
- `scalarError_surjective` (compatibility): For ρ_E(G_ℚ) = GL₂(ℤ_p), U = ℤ_p^× and C₁ = 0.
- `spanError_reducible` (non-example): If E[p] is reducible (an Eisenstein prime) then ρ_E(ℤ_p[G_ℚ]) is a proper suborder of M₂(ℤ_p) and C₂ ≥ 1.

**Acceptance.**

- For ρ_E surjective and α of finite order with α² ≠ 1 (a character of the pro-p group Γ has p-power order), e_α = r·v_p(α(γ) − α^{-1}(γ)) and e = 0.
- For α = 1 (the untwisted Tate module) C_α = 0 and e_α = r(C₁ + C₂).
- The constants depend on E only through ρ_E, so isogenous curves with the same p-adic image have equal C₁, C₂.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `SelmerIwasawaCohomology:L2/greenberg-condition`

**Sources.**

- `cgls`, §3.2, (3.2)–(3.3) and Theorem 3.2.1, p. 17 (arXiv v2): defines the twist T_α, its residual identification with E[p] ⊗ R/m, the ordinary Selmer structure and the constant C_α.
- `cgls`, §3.3.1, Lemmas 3.3.3–3.3.4 and Remark 3.3.5, pp. 18–19 (arXiv v2): defines C₁ through the open scalar subgroup U and C₂ through the span of the image, and records their vanishing under surjectivity and irreducibility.
- `cgs`, §6.1 and §6.3, before Proposition 6.3.1, pp. 21–22 (arXiv v2): for α ≡ 1 modulo π^m uses the combined loss e = r(C₁ + C₂), without C_α.
- `ky`, §3, Lemma 3.0.3 and the definition of C₁ after it, p. 36 (arXiv v2): extends the definition of C₁ to the lattice of a weight 2r newform through scalar matrices in the image.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorConstants`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Chebotarev selection of Kolyvagin primes with error terms *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.1/error-tolerant-chebotarev` — theorem

**Planet:** Chebotarev argument with error terms.

**Statement.** In the setting of ES.1/twist-error-constants put T = T_α, T^{(k)} = T/π^kT, R^{(k)} = R/π^k and ord(x) = min{m : π^m x = 0}. (a) (α ≠ 1.) Let e_α = r(C₁ + C₂ + C_α). For c₁, c₂, c₃ ∈ H¹(K, T^{(k)}) such that Rc₁ + Rc₂ contains a submodule isomorphic to π^{d₁}R^{(k)} ⊕ π^{d₂}R^{(k)}, there are infinitely many ℓ ∈ 𝓛^{(k)}, outside any prescribed finite set, with ord(loc_ℓ c₃) ≥ ord(c₃) − e_α and with R·loc_ℓ c₁ + R·loc_ℓ c₂ ⊆ H¹(K_ℓ, T^{(k)}) containing a submodule isomorphic to π^{d₁+d₂+2e_α}(R^{(k)})^{⊕2}; this second conclusion is vacuous when d₁ + d₂ + 2e_α ≥ k. (b) (α ≠ 1, c₃ = c₁.) There are infinitely many ℓ ∈ 𝓛^{(k)} with ord(loc_ℓ c₁) ≥ ord(c₁) − e_α and R·loc_ℓ c₁ + R·loc_ℓ c₂ ⊇ π^{k−ord(c₁)+e_α}R^{(k)} ⊕ π^{d₁+d₂+2e_α}R^{(k)}. (c) (α ≡ 1 modulo π^m.) Let e = r(C₁ + C₂) and T^{(m)}_E = T_pE ⊗ R/π^m, on which complex conjugation acts. For classes c^± ∈ H¹(K, T^{(m)}_E)^± in the two eigenspaces and every k ≥ m there are infinitely many ℓ ∈ 𝓛^{(k)} with ord(loc_ℓ c^±) ≥ ord(c^±) − e; in particular R·loc_ℓ c⁺ + R·loc_ℓ c⁻ contains a submodule isomorphic to R/π^{max(0, ord c⁺ − e)} ⊕ R/π^{max(0, ord c⁻ − e)}. When ρ_E is surjective, C₁ = C₂ = 0 and (c) has no loss.

**Hypotheses.**

- the setting of ES.1/twist-error-constants; p odd
- for (a)–(b): α ≠ 1; for (c): α ≡ 1 modulo π^m and k ≥ m

**Proof sketch.**

1. Restriction to L = K_α(E[p^k]), where K_α trivialises α modulo π^k: by Sah's lemma for an element of G_{K_∞} acting on T^{(k)} as a scalar u with v_p(u − 1) = C₁, the kernel of H¹(K, T^{(k)}) → Hom(G_L, T^{(k)}_E) is killed by p^{C₁}. Only the centrality of that element is used; the printed claim that ρ is injective on Gal(L/K) is not needed (PAPER-CASTELLA-ETAL-22/E8 in the register of source mistakes).
2. The restricted homomorphisms f_i lie in the α^{-1}-eigenspace of Hom(G_L, T_E^{(k)}) (PAPER-CASTELLA-ETAL-22/E27); complex conjugation exchanges the α and α^{-1} eigenspaces, whose intersection is killed by π^{rC_α}, so the projections (1 ± τ)f_i lose at most rC_α in order; for (c) one works directly on the m-torsion, where τ acts, and no C_α appears.
3. By the definition of C₂ the R-span of the image of each f^±_i contains π^{k−ord(f_i)+r(C₂+C_α)} T_E^{(k)}; on Z = G_L/H (H the common kernel) Nekovář's quadratic-form lemmas produce z ∈ Z⁺ with q(z) ∉ m^{d₁+d₂+2e_α+1} and z outside the preimage Z₃ attached to c₃. The pair (ψ⁺, ψ⁻) needed for the valuation of q exists by a Smith-normal-form choice, although the printed choice is not justified (PAPER-CASTELLA-ETAL-22/E7).
4. Chebotarev (Tau Ceti's Chebotarev roadmap, Layer 10) gives infinitely many ℓ ∤ pND_K with Frobenius τz in Gal(M/ℚ), M the field cut out by H; such ℓ are inert in K with a_ℓ ≡ ℓ + 1 ≡ 0 mod p^k, so ℓ ∈ 𝓛^{(k)}. Evaluation of the unramified classes at Frob_ℓ² = z² (ES.1/finite-singular-decomposition) gives c_i(Frob_ℓ²) = (g⁺_i(z), g⁻_i(z)), whence the order and span estimates.

**Acceptance.**

- With ρ_E surjective and α of finite order with α² ≠ 1, (a) with e_α = rC_α recovers the large-image statement of McCallum, Corollary 3.2, up to the C_α loss.
- (b) applied with c₂ ∈ Rc₁ is the single-class selection used in the first step of the rank-one argument (ES.4/rank-one-from-nonzero-class).
- In (c), letting α → 1 does not increase the loss, unlike (a) where C_α → ∞; this is the input that makes ES.4/uniform-near-trivial-bound independent of m.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/twist-error-constants`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `tauceti:TauCeti.ContCohomology.H1`

**Sources.**

- `cgls`, §3.3.1, Proposition 3.3.6 and its proof, pp. 19–21 (arXiv v2): states and proves the selection of infinitely many Kolyvagin primes with localisation orders and spans controlled up to r(C₁ + C₂ + C_α).
- `cgls`, §3.3.1, Corollary 3.3.7, p. 21 (arXiv v2): the case c₃ = c₁, giving the two-term span estimate.
- `cgs`, §6.3, Proposition 6.3.1, its proof and Remark 6.3.2, pp. 22–23 (arXiv v2): the eigenspace version on the π^m-torsion for α ≡ 1 mod π^m, with loss r(C₁ + C₂) and no C_α.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorConstants`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Exponents, orders and reducibility depth

`EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth` — definition

**Statement.** Let O_λ be a discrete valuation ring with uniformiser λ. For an O_λ-module M and x ∈ M: exp_λ(x, M) = min{d ≥ 0 : λ^d x = 0} ∈ ℤ_{≥0} ∪ {∞} and ord_λ(x, M) = sup{d ≥ 0 : x ∈ λ^d M}. For a profinite group G and a torsion O_λ[G]-module R of finite type, the reducibility depth of R is the smallest integer r_R ≥ 0 such that (1) every G-stable O_λ-submodule R′ ⊆ R not contained in λR contains λ^{r_R}R, and (2) for every m ≥ 1, End_{O_λ[G]}(R̄^{(m)})/O_λ·id is annihilated by λ^{r_R}, where R̄^{(m)} = R/λ^mR. If R/λR is absolutely irreducible then d_R = 0. If R is a lattice with R ⊗ ℚ absolutely irreducible, there is r_R depending only on R bounding the reducibility depth of every R̄^{(m)}. In the abundance and localisation formulas below we write d_R for this reducibility depth (called r_R in LTXZZ), to distinguish it from ranks.

**Hypotheses.**

- O_λ a discrete valuation ring with finite residue field
- R of finite type

**Construction.**

1. Absolutely irreducible residual representation: a submodule not in λR surjects onto R/λR, so equals R by Nakayama; endomorphisms are scalars by Schur and lifting.
2. Uniform bound: for R_ℚ absolutely irreducible the lattices stable under G in R_ℚ form finitely many homothety classes and End(R) = O_λ; a compactness argument bounds both conditions uniformly in m (Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.3.3).

**Uses that determine the API.**

- Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.3.4 and Definition 2.6.5: the loss λ^{𝔣(r_S) d_R} in the saturation of θ_S and in abundant tuples
- Castella–Grossi–Lee–Skinner, §3.3.1: the constants C_1, C_2 play the role of the reducibility depth for T_pE with reducible residual representation
- HeegnerPointEulerSystems HE.7: exceptional primes need bounds uniform in the torsion exponent

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ErrorTolerant.expAt` | data | exp_λ(x, M) ∈ ℕ∞. |
| `TauCeti.ErrorTolerant.ordAt` | data | ord_λ(x, M) ∈ ℕ∞. |
| `TauCeti.ErrorTolerant.expAt_add_ordAt_le` | relation | In a free O_λ/λ^n-module, exp_λ(x) + ord_λ(x) = n for x ≠ 0. |
| `TauCeti.ErrorTolerant.reducibilityDepth` | data | r_R for a torsion O_λ[G]-module R of finite type. |
| `TauCeti.ErrorTolerant.reducibilityDepth_eq_zero` | example | If R/λR is absolutely irreducible then d_R = 0. |
| `TauCeti.ErrorTolerant.reducibilityDepth_bounded` | other | For a lattice R with R_ℚ absolutely irreducible, sup_m r_{R̄^{(m)}} < ∞. |

**Unit tests.**

- `expAt_zero` (degenerate): The annihilator exponent of zero is zero.
- `expAt_uniformizer_quotient` (computation): In O/(πⁿ), πᵈ has annihilator exponent n−d for d<n.
- `reducibilityDepth_stable_counterexample` (non-example): A primitive stable submodule missing πᵈT disproves the depth bound d.

**Acceptance.**

- r_R measures the failure of residual irreducibility that Mazur–Rubin's (H.1) excludes; with d_R = 0 the error-tolerant statements reduce to the clean ones.
- exp and ord are the 'order' functions of Rubin's Chapter V.
- Additional arithmetic check: In M = ℤ/p³, exp_p(p) = 2 and ord_p(p) = 1.
- Additional arithmetic check: For R = E[p^m] with E[p] absolutely irreducible, d_R = 0.
- Additional arithmetic check: For R = ℤ/p² ⊕ ℤ/p² with G acting through the upper unipotent matrices (1, p·b; 0, 1), b ∈ ℤ/p, the submodule generated by e₁ is G-stable and not contained in pR but does not contain R, so r_R ≥ 1: r_R ≠ 0 although R is free.
- Additional arithmetic check: ord_λ(x, M) = ∞ iff x ∈ ∩_d λ^d M; for M of finite length this means x = 0.

**Prerequisites.**

- `SelmerIwasawaCohomology:L2/selmer-data`

**Sources.**

- `ltxzz`, Definition 2.3.2, arXiv v3 p. 14: Definition of the reducibility depth.
- `ltxzz`, Lemma 2.3.3, arXiv v3 p. 14: The uniform bound.
- `ltxzz`, Definition 2.3.2, Lemmas 2.3.3–2.3.4, published pp.126–128: Published-version collation of the stated result, expressed here in our own words.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.


### The field cut out by a Selmer module and saturation of θ_S

`EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation` — theorem

**Statement.** Fix m ≥ 1 and R free of finite rank over O_λ/λ^m with ρ : Γ_F → GL(R), F_ρ the field fixed by ker ρ and G = Gal(F_ρ/F). Restriction Res_ρ : H¹(F, R) → Hom_G(Γ^{ab}_{F_ρ}, R) gives a pairing [ , ] : H¹(F, R) × Γ^{ab}_{F_ρ} → R. For a finitely generated submodule S ⊆ H¹(F, R), F_S/F_ρ is the finite abelian extension with Gal(F^{ab}_ρ/F_S) = {γ : [s, γ] = 0 ∀ s ∈ S}, and θ_S : Gal(F_S/F_ρ) → Hom_{O_λ}(S, R) is injective and G-equivariant. (a) If Res_ρ is injective and S is free of rank r_S over O_λ/λ^m, the O_λ-span of the image of θ_S contains λ^{𝔣(r_S) d_R} Hom_{O_λ}(S, R), where 𝔣(0) = 𝔣(1) = 1, 𝔣(2) = 4, 𝔣(r + 1) = 2(𝔣(r) + 1) for r ≥ 2. (b) Res_ρ is injective if the image of Γ_F in GL(R̄) contains a nontrivial scalar, or if dim R̄ ≤ min{(ℓ + 1)/2, ℓ − 3}, R̄ is semisimple and Hom_{Γ_F}(End(R̄), R̄) = 0.

**Reconciled in the whole-roadmap pass.** Two clauses of the statement are read with confirmed source corrections:

- For “S is free of rank r_S over O_λ/λ^m” read “S is free of rank r_S over O_λ/λ^{m−m′} for some integer 0 ≤ m′ < m”. The published Lemma 2.3.4 drops the shift m′ that its arXiv v1/v2 form and every application (Proposition 2.6.6 with m₀, here ES.1/abundant-tuple-existence) use; recorded as PAPER-LIU-ETAL-22/E22, confirmed by its review.
- For “Hom_{Γ_F}(End(R̄), R̄) = 0” read “Hom_{𝔽_ℓ[Γ_F]}(End(R̄), R̄) = 0, equivalently Hom_{k[Γ_F]}(End(R̄)^{(σ)}, R̄) = 0 for every σ ∈ Gal(k/𝔽_ℓ), k = O_λ/λ”. Lemma 2.3.5(b) as printed (Hom over k[Γ_F]) is false when k ≠ 𝔽_ℓ, because End(R̄) ⊗_{𝔽_ℓ} k is the sum of the Frobenius twists of End(R̄), not End(R̄)^d; recorded as PAPER-LIU-ETAL-22/E21, confirmed by its review. The two readings agree when k = 𝔽_ℓ.

**Hypotheses.**

- R free over O_λ/λ^m
- for (a): Res_ρ injective

**Proof sketch.**

1. θ_S is injective by definition of F_S; equivariance is the compatibility of the pairing with G.
2. (a) by induction on r_S using both conditions of the reducibility depth; (b) by inflation–restriction: ker Res_ρ = H¹(G, R), which vanishes by the scalar trick or by the cited H¹-vanishing for small faithful semisimple modules.

**Acceptance.**

- With d_R = 0 and r_S = 1 the image of θ_S spans Hom(S, R): the clean Chebotarev input of Mazur–Rubin's Proposition 3.6.1.
- (H.3) of Mazur–Rubin 2004 is the statement that Res is injective for the field ℚ(T, μ_{p^∞}).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `ArithmeticGaloisDuality:R02.2/compact-five-term`

**Sources.**

- `ltxzz`, Lemma 2.3.4, arXiv v3 p. 15: The saturation statement.
- `ltxzz`, Lemma 2.3.5, arXiv v3 pp. 15–16: The two criteria for injectivity of restriction.
- `ltxzz`, Lemma 2.3.5, published pp.127–128: Published-version collation of the stated result, expressed here in our own words.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.


### Residual detection of two classes and classes with prescribed ramification *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.1/residual-two-class-detection` — theorem

**Statement.** Let k₀ be a finite field of characteristic p ≥ 5, V a two-dimensional k₀-vector space with a continuous action ρ : G_ℚ → GL(V) ≅ GL₂(k₀) that is surjective, unramified outside a finite set Σ of primes, K an imaginary quadratic field, τ complex conjugation, and Λ the Kolyvagin primes for V: primes ℓ ∉ Σ, ℓ ∤ pD_K, inert in K, with ℓ + 1 ≡ 0 mod p and tr(Frob_ℓ | V) = 0, so that Frob_ℓ acts on V with characteristic polynomial x² − 1, as τ does. For ℓ ∈ Λ, H¹(K_ℓ, V) = H¹_fin(K_ℓ, V) ⊕ H¹_tr(K_ℓ, V) with both summands two-dimensional and maximal isotropic for the local Tate pairing, each τ-eigenspace H¹_fin(K_ℓ, V)^±, H¹_tr(K_ℓ, V)^± one-dimensional, and the local pairing perfect between H¹_fin(K_ℓ, V)^± and H¹_tr(K_ℓ, V)^±. (a) For k₀-linearly independent c₁, c₂ ∈ H¹(K, V) a positive density of ℓ ∈ Λ, outside any finite set, satisfy loc_ℓ(c₁) ≠ 0 and loc_ℓ(c₂) ≠ 0. (b) Let F be a Selmer structure on V whose local conditions are τ-stable, are their own exact orthogonal complements under a perfect alternating G_ℚ-equivariant pairing V × V → k₀(1), and equal H¹_fin(K_v, V) at every Kolyvagin prime v. For ℓ ∈ Λ, a finite subset S ⊆ Λ not containing ℓ and each sign ±, there is a nonzero c ∈ H¹(K, V)^± with loc_v(c) ∈ H¹_fin(K_v, V) for v ∉ S ∪ {ℓ}, loc_v(c) ∈ H¹_tr(K_v, V) for v ∈ S, and no condition at ℓ. Statement (b) does not assert that the singular part of c at ℓ is nonzero.

**Hypotheses.**

- p ≥ 5 and ρ : G_ℚ → GL₂(k₀) surjective
- for (b): self-dual, τ-stable local conditions that are finite at the Kolyvagin primes, as Zhang's Theorem 5.2 provides for Hecke-module quotients of Jacobians

**Proof sketch.**

1. (a) Restriction to L = ℚ(V) is injective on H¹(K, V) because H¹(Gal(L/K), V) = 0 for surjective ρ with p ≥ 5 (the scalar trick of ES.1/selmer-field-saturation(b)). The images of c₁, c₂ cut out an abelian extension M/L with Gal(M/L) ≅ an F_p[Gal(L/ℚ)]-module; by linear independence and irreducibility one finds σ ∈ Gal(M/L) with c_i((τσ)²) ≠ 0 for both i. Chebotarev (Tau Ceti's Chebotarev roadmap, Layer 10) applied to the class of τσ gives ℓ ∈ Λ, and loc_ℓ(c_i) is evaluation at Frob_ℓ² (ES.1/finite-singular-decomposition). This is the special case of McCallum, Proposition 3.1, that Zhang's Lemma 8.1 records.
2. (b) Compare the Selmer structures relaxed and strict at ℓ (transverse at S): by global duality (SelmerIwasawaCohomology L2/selmer-structure-poitou-tate) and self-duality of the local conditions, the relaxed-at-ℓ group exceeds the strict-at-ℓ dual group by the one-dimensional local term H¹(K_ℓ, V)^±/H¹_fin(K_ℓ, V)^± in each eigenspace, so each eigenspace of the relaxed group is nonzero (McCallum, Lemma 5.3, as invoked by Zhang).
3. The local decomposition and pairing statements are ES.1/transverse-condition and ES.1/transverse-duality specialised to Frob_ℓ = τ on V.

**Acceptance.**

- (a) with c₂ in the opposite eigenspace to c₁ detects nonzero classes in both eigenspaces simultaneously.
- (a) fails for linearly dependent classes only in the trivial way: for c₂ = λc₁ the statement reduces to single-class detection.
- In (b), with S = ∅ the class c is a Selmer class away from ℓ that may be ramified at ℓ; with ℓ replaced by the empty condition it is not claimed.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `zhang`, §8.1, discussion before Lemma 8.1, pp. 234–235: records the decomposition of the four-dimensional local cohomology at a Kolyvagin prime into finite and transverse parts, their eigenspaces and the perfect pairings between them.
- `zhang`, §8.1, Lemma 8.1, p. 235: two k₀-linearly independent classes are simultaneously nonzero at a positive density of Kolyvagin primes, under surjectivity of the residual representation.
- `zhang`, §8.1, Lemma 8.2, p. 235: existence of a nonzero class in a prescribed eigenspace that is finite outside S ∪ {ℓ}, transverse at S and unrestricted at ℓ.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AuxiliaryPrimes`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### γ-associated places and (S, γ)-abundant tuples

`EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples` — definition

**Statement.** Setting of Liu–Tian–Xiao–Zhang–Zhu §2.6: F/F⁺ of degree ≤ 2, R a polarised lattice with reductions ρ̄^{(m)} and their extensions ρ̄₊^{(m)} to Γ_{F⁺}, fields F ⊆ F^{(m)} ⊆ F₊^{(m)}, an element γ in the image of ρ̄₊^{(m)} lying in the nontrivial coset, h_γ the first component of γ^{[F:F⁺]}, and S a finitely generated submodule of the Selmer module in H¹(F, R̄^{(m)}). A place w₊ of F₊^{(m)} is γ-associated if it is not above ∞ or ℓ, is unramified over F⁺, its place of F^{(m)} is unramified in F_S, and its Frobenius in Gal(F₊^{(m)}/F⁺) is γ. G_{S,γ} ⊆ Gal(F_S/F^{(m)}) is the set of Frobenius elements Ψ_w of γ-associated places. Corrected Lemma 2.6.4: if the order of γ is prime to ℓ then G_{S,γ} ⊆ θ_S^{-1} Hom_{O_λ}(S, (R̄^{(m)})^{h_γ}), with equality when [F : F⁺] = 1; in general G_{S,γ} = q(N^α) for N the Galois group of the normal closure over F₊^{(m)}, α conjugation by a prime-to-ℓ lift of γ and q restriction to F_S. If S is free of rank r_S over O_λ/λ^{m−m₀}, an r_S-tuple (Ψ₁, …, Ψ_{r_S}) ∈ G_{S,γ}^{r_S} is (S, γ)-abundant if the image of S → ((R̄^{(m)})^{h_γ})^{⊕ r_S}, s ↦ (θ_S(Ψ_i)(s))_i, contains λ^{m₀ + 𝔣(r_S) d_R}((R̄^{(m)})^{h_γ})^{⊕ r_S}.

**Hypotheses.**

- the setting of §2.6 of the source
- order of γ prime to ℓ

**Construction.**

1. Frobenius elements of γ-associated places land in the h_γ-fixed part because Ψ_w is fixed by conjugation by the Frobenius of w₊ raised to [F : F⁺].
2. The exact image q(N^α) is computed by Chebotarev in the normal closure of F_S F₊^{(m)} over F⁺; the printed equality fails when [F : F⁺] = 2 and q(N^α) is a proper subgroup (PAPER-LIU-ETAL-22/E1 in the register of source mistakes).
3. The abundance loss uses the reducibility depth d_R, not the lattice rank. The published Lemma 2.3.4 gives the power λ^{𝔣(r_S)d_R}; Definition 2.6.5 adds m₀. This notation is also used in the diagonal-localisation bound.

**Uses that determine the API.**

- Liu–Tian–Xiao–Zhang–Zhu, Proposition 2.6.7 and §8: abundant tuples give primes at which a basis of S localises diagonally with bounded loss
- ES.4/abundant-localization: the bounded-error localisation statement used in descent

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.ErrorTolerant.gammaAssociated` | structure | The four conditions for a place of F₊^{(m)} to be γ-associated. |
| `TauCeti.ErrorTolerant.frobeniusSet` | data | G_{S,γ} ⊆ Gal(F_S/F^{(m)}). |
| `TauCeti.ErrorTolerant.frobeniusSet_subset_fixed` | characterisation | θ_S(G_{S,γ}) ⊆ Hom_{O_λ}(S, (R̄^{(m)})^{h_γ}), for γ of order prime to ℓ. |
| `TauCeti.ErrorTolerant.frobeniusSet_eq_image` | characterisation | G_{S,γ} = q(N^α); equality with the full preimage holds iff q : N^α → Gal(F_S/F^{(m)})^{h_γ} is surjective, in particular when [F : F⁺] = 1. |
| `TauCeti.ErrorTolerant.IsAbundant` | structure | The predicate on r_S-tuples of G_{S,γ}. |
| `TauCeti.ErrorTolerant.exists_isAbundant` | other | If Res is injective, R_ℚ is absolutely irreducible, (R̄^{(m)})^{h_γ} is free of rank one and q : N^α → K^{h} is surjective, an abundant r_S-tuple exists (corrected Proposition 2.6.6). |

**Unit tests.**

- `frobeniusSet_proper` (non-example): A Selmer Galois element outside q(N^α) is not realized by a γ-associated prime.
- `frobeniusSet_fixed_evaluation` (compatibility): Every realized Frobenius evaluation is fixed by h_γ.
- `isAbundant_zero_loss` (characterisation): With m₀=d=0, abundance is surjectivity onto the fixed target, with every tuple entry realized by a γ-associated prime.

**Acceptance.**

- For [F : F⁺] = 1 the printed Lemma 2.6.4 holds as stated.
- Abundance is a property of actual Frobenius elements, not of arbitrary elements of Gal(F_S/F^{(m)}).
- Additional arithmetic check: If F = F⁺ then G_{S,γ} = θ_S^{-1} Hom(S, (R̄^{(m)})^{h_γ}) with h_γ = γ: the printed lemma.
- Additional arithmetic check: For r_S = 1, d_R = 0, m₀ = 0: Ψ is abundant iff θ_S(Ψ) : S → (R̄^{(m)})^{h_γ} is surjective.
- Additional arithmetic check: If (Ψ_i) is abundant for S free over O_λ/λ^{m−m₀}, then it is abundant for λS over O_λ/λ^{m−m₀−1} with m₀ replaced by m₀ + 1.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `ltxzz`, Definition 2.6.5, arXiv v3 p. 20: Definition of abundant tuples.
- `ltxzz`, Lemma 2.6.4, arXiv v3 p. 19: The printed lemma, used here in its corrected form.
- `ltxzz`, Lemma 2.6.4 and Definition 2.6.5, published pp.133–135: Published-version collation of the stated result, expressed here in our own words.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.


### Existence of abundant tuples under the corrected span hypothesis *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuple-existence` — theorem

**Statement.** Setting of ES.1/abundant-tuples: F/F⁺ of degree at most two, R a polarised O_λ-lattice with reductions R̄^{(m)}, fields F^{(m)} ⊆ F₊^{(m)}, γ in the image of ρ̄₊^{(m)} in the nontrivial coset with h_γ the first component of γ^{[F:F⁺]}, and a finitely generated submodule S ⊆ H¹_f(F, R̄^{(m)}) that is free of rank r_S over O_λ/λ^{m−m₀}. Assume (i) R_ℚ is absolutely irreducible; (ii) Res_{ρ̄^{(m)}} is injective, for instance by one of the two criteria of ES.1/selmer-field-saturation(b); (iii) the order of γ is prime to ℓ; (iv) (R̄^{(m)})^{h_γ} is free of rank one over O_λ/λ^m; and (v) the O_λ-span of θ_S(G_{S,γ}) contains λ^c Hom_{O_λ}(S, (R̄^{(m)})^{h_γ}) for an integer c independent of m. Then there are elements Ψ₁, …, Ψ_{r_S} of G_{S,γ}, each the Frobenius of a γ-associated place, which may be taken outside any prescribed finite set of places, such that the image of s ↦ (θ_S(Ψ_i)(s))_i contains λ^{m₀+c}((R̄^{(m)})^{h_γ})^{⊕r_S}. Condition (v) holds with c = 𝔣(r_S)d_R when [F:F⁺] = 1, and the tuple is then (S, γ)-abundant; it holds with c = 𝔣(r_S)d_{Ind R} when [F:F⁺] = 2 and R_ℚ ≇ R_ℚ^𝔠; and it holds when R extends to R₊ over F⁺ and S lies in the 𝔠-eigenspace on which γ acts on (R̄^{(m)})^{h_γ} by +1. Without (v) the printed Proposition 2.6.6 fails when [F:F⁺] = 2, because G_{S,γ} can be trivial.

**Hypotheses.**

- (i)–(v) as stated; S free of rank r_S over O_λ/λ^{m−m₀}
- d_R the reducibility depth of ES.1/reducibility-depth and 𝔣 the sequence of ES.1/selmer-field-saturation

**Proof sketch.**

1. By (ii) and ES.1/selmer-field-saturation(a), the O_λ-span of θ_S(Gal(F_S/F^{(m)})) contains λ^{𝔣(r_S)d_R}Hom_{O_λ}(S, R̄^{(m)}). Since h_γ has order prime to ℓ, Hom(S, (R̄^{(m)})^{h_γ}) is a direct summand of Hom(S, R̄^{(m)}).
2. Frobenius elements of γ-associated places land in θ_S^{-1}Hom(S, (R̄^{(m)})^{h_γ}) (the correct inclusion of ES.1/abundant-tuples). When [F:F⁺] = 1 every element of that preimage is such a Frobenius, by Chebotarev in the Galois closure of F_S F₊^{(m)} over F⁺, which gives (v) with c = 𝔣(r_S)d_R; when [F:F⁺] = 2 the realised set is q(N^α), possibly a proper subset, and (v) is the extra hypothesis (PAPER-LIU-ETAL-22/E1 and E23 in the register of source mistakes; the eigenspace and Ind R criteria are recorded there).
3. Row selection: over O_λ/λ^n, if the span of a set of vectors contains λ^c(O_λ/λ^n)^r with c < n, then r of the vectors themselves already span a submodule containing λ^c(O_λ/λ^n)^r (Smith normal form over the discrete valuation ring). Applied to the vectors (θ_S(Ψ)(s_j))_j for Ψ ∈ G_{S,γ} and a basis (s_j) of S, with (iv) identifying the λ^{m−m₀}-torsion of (R̄^{(m)})^{h_γ} with O_λ/λ^{m−m₀}, this yields actual Frobenius elements, not linear combinations of them.
4. Avoiding a finite set: Chebotarev gives infinitely many γ-associated places with a prescribed Frobenius in Gal(F_S/F^{(m)}).

**Acceptance.**

- [F:F⁺] = 1, d_R = 0 and r_S = 1: there is a single γ-associated place w with loc_w : S → H¹_ns(F_w, R̄^{(m)}) injective on S/λ^{m−m₀}-torsion.
- With (v) dropped, the configuration of PAPER-LIU-ETAL-22/E1 satisfies (i)–(iv) and has G_{S,γ} = {1}, so no abundant tuple exists: (v) is necessary.
- The tuple consists of Frobenius elements of places, so ES.4/abundant-localization applies to it with the same loss c.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples`
- `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `mathlib:Module.equiv_directSum_of_isTorsion`

**Sources.**

- `ltxzz-published`, §2.6, Proposition 2.6.6 and its proof, pp. 134–135: asserts the existence of an (S, γ)-abundant r_S-tuple under (i)–(iv), deducing it from Lemmas 2.3.3–2.3.5 and the equality of Lemma 2.6.4.
- `ltxzz-published`, §2.6, Lemma 2.6.4 and Definition 2.6.5, p. 134: the claimed equality G_{S,γ} = θ_S^{-1}Hom(S, (R̄^{(m)})^{h_γ}), whose converse inclusion is the step that fails for [F:F⁺] = 2, and the definition of abundance.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/AbundantTuples`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


**Open refinements of ES.1.**

- Lemma level: Mazur–Rubin 2004 Lemma 3.6.3 and the two-step proof of Propositions 3.6.1–3.6.2; Rubin Lemma V.2.1.
- Lemma level: the paired-evaluation obstruction refinements of the Liu–Tian–Xiao–Zhang–Zhu route (S23-closure, S23-norm, S23-paired, S23-obstruction, S23-defect, S23-error, S24-bounded of PAPER-LIU-ETAL-22), which give explicit values of the constant c in hypothesis (v) of abundant-tuple-existence when [F:F⁺] = 2.
- Lemma level: McCallum's Proposition 3.1 and Lemma 5.3, which residual-two-class-detection cites through Zhang §8.

## ES.2. Euler-system modules and norm relations

Euler polynomials and the convention dictionary between Rubin, Mazur–Rubin and Burns–Sakamoto–Sano, the module of Euler systems as an equaliser of corestriction relations, unramifiedness of Euler-system classes away from p, the conductor-indexed presentations, twisting by finite-order characters, changes of Euler factors, the universal Euler system with its freeness and Ext¹-vanishing, the variants of Rubin Chapter IX (rigidity conditions, finite depth, χ-anticyclotomic systems, systems trivial at Σ), and Nekovář's anticyclotomic Euler systems over ring class fields.

**Layer acceptance.** The zero family is an Euler system and certifies nothing; the norm relation is corestriction, not restriction; Rubin's and Mazur–Rubin's Euler polynomials agree modulo N(q) − 1; the cyclotomic, Kato and Heegner adapters identify their classes with these carriers.

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

- `eulerPoly_zp_one` (computation): For rank-one Frobenius multiplication by N(q), the Rubin polynomial is 1−X and the MR polynomial is 1−N(q)X.
- `eulerPoly_elliptic` (compatibility): An MR polynomial 1−aX+N(q)X² becomes 1−aN(q)⁻¹X+N(q)⁻¹X² in the Rubin normalization.
- `eulerPoly_rank_zero` (degenerate): For the zero representation both Euler polynomials equal 1.

**Acceptance.**

- For T = ℤ_p(1): Rubin's polynomial is 1 − x (T^* = ℤ_p) and Mazur–Rubin's is 1 − N(q)x; they agree modulo N(q) − 1.
- The polynomials differ as elements of O[x]; systems for the two conventions are related by an explicit map, not equal (euler-factor-change).
- Additional arithmetic check: For T = ℤ_p(1) and N(q) ≠ 1 the two polynomials are different elements of O[X], although congruent modulo N(q) − 1.

**Prerequisites.**

- `mathlib:LinearMap.charpoly`
- `mathlib:LinearMap.aeval_self_charpoly`

**Sources.**

- `rubin-es`, Chapter IV, Lemma 1.2 and its proof, p. 57: The identity between the two determinants and the annihilation statements.
- `mr-ks`, Remark 3.2.3, p. 23: The two conventions differ and are equivalent.
- `bss2`, §6.1, pp. 36–37: The convention of Burns–Sakamoto–Sano, P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)).

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

- `EulerSystem.zero_mem` (degenerate): The zero family is an Euler system.
- `EulerSystem.universal_norm` (characterisation): When no new ramified primes occur, each component is in the image of corestriction from the larger layer.
- `EulerSystem.not_restriction` (non-example): On such a layer, a restriction-compatible family fails the norm relation when ([F′:F]−1)c_F is nonzero.

**Acceptance.**

- ES is the equaliser of two maps ∏_F H¹(F, T) ⇉ ∏_{F ⊆ F′} H¹(F, T), so a morphism into ES is a compatible family of morphisms.
- The norm relation uses corestriction: replacing it by restriction or by equality c_{F′} = c_F gives a different (wrong) object.
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1) and the Kummer images of the p-extended cyclotomic units c̃_m, the relation for ℚ(μ_m) ⊆ ℚ(μ_{mℓ}), ℓ ∤ mp, is N(c̃_{mℓ}) = c̃_m^{1 − Fr_ℓ^{-1}}: the factor is P(Fr_ℓ^{-1} | ℤ_p; Fr_ℓ^{-1}) = 1 − Fr_ℓ^{-1}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`
- `tauceti:TauCeti.ContCohomology.explicitCor1`
- `tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1`
- `ArithmeticGaloisDuality:R02.1/carrier-comparison`

**Sources.**

- `rubin-es`, Chapter II, Definition 1.1, pp. 21–22: The definition.
- `rubin-es`, Chapter II, Remark 2.8, p. 25: The zero system is an Euler system.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### Euler-system classes are unramified away from p

`EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p` — theorem

**Statement.** Let c be an Euler system for an admissible tower (so 𝒦 ⊇ K_∞ with no finite prime splitting completely). Then for every F and every place w ∤ p of F, (c_F)_w ∈ H¹_ur(F_w, T); that is, c_F ∈ S^{Σ_p}(F, T), and c_F ∈ H¹_{F_can}(F, T). Hence c_F lies in H¹(O_{F,S(F)}, T) for S(F) = S ∪ S_ram(F/K), the cohomology of the maximal extension unramified outside S(F).

**Hypotheses.**

- admissible tower
- T finitely generated over ℤ_p

**Proof sketch.**

1. c_F is a universal norm from F K_∞, in which the decomposition group of w is infinite; apply SelmerIwasawaCohomology L3/universal-norms-unramified(ii).
2. The comparison H¹_ur(F_w, T) ⊆ ker(H¹(F_w, T) → H¹(F_w^{ur}, V)) gives the statement for F_can at ramified primes.

**Acceptance.**

- Without condition (ii) the statement fails: c_K is then unconstrained (rigidity-variants).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `SelmerIwasawaCohomology:L3/universal-norms-unramified`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`

**Sources.**

- `rubin-es`, Chapter II, before Theorem 2.10, p. 25: The classes are unramified outside p.
- `bss2`, Lemma 6.6, p. 38: The same statement for the canonical Selmer structure.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### The conductor-indexed presentations

`EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation` — theorem

**Statement.** (a) For an admissible (𝒦, N), an Euler system is equivalent to a family c̃_m ∈ H¹(K[m] ∩ 𝒦, T) indexed by all generalised ideals m (K[m] the ray class field), with Cor_{K[mq]∩𝒦/K[m]∩𝒦}(c̃_{mq}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c̃_m if q ∤ mN and = c̃_m if q | mN: put c_F = Cor_{K[m]∩𝒦/F}(c̃_m) for m the conductor of F/K, and conversely c̃_m = ∏_q P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{K[m]∩𝒦}, the product over primes dividing m, not dividing N, unramified in (K[m] ∩ 𝒦)/K. (b) For 𝒦_min = K_∞·∏_{q ∤ N} K(q), an Euler system is determined by, and equivalent to, a family {c_{F(r)}} over squarefree r prime to N and K ⊂_f F ⊆ K_∞ with Cor_{F(rq)/F(r)}(c_{F(rq)}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{F(r)} when K(q) ≠ K(1), and Cor_{F′(r)/F(r)}(c_{F′(r)}) = c_{F(r)}; then c_L = Cor_{F(r)/L}(c_{F(r)}) for r, F minimal with L ⊆ F(r).

**Hypotheses.**

- admissible (𝒦, N)

**Proof sketch.**

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

- `rubin-es`, Chapter II, Remarks 1.3 and 1.4, pp. 22–23: Both presentations.

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

- `EulerSystem.twist_zero` (degenerate): Twisting takes the zero Euler system to zero.
- `EulerSystem.twist_conductor` (non-example): Every prime ramified in the character field enters the twisted bad support.
- `EulerSystem.twist_inverse_norm` (compatibility): If the character compositum introduces no new Euler factors, cor(c_{FLχ})=c_F; in general the inverse-twist norm is the Euler-factor product, as stated by the API.

**Acceptance.**

- Twisting by the trivial character is the identity.
- Twisting is O-linear after choosing compatible generators. For finite-order χ,ψ, the iterated twist is obtained by corestriction from FL_χL_ψ, while the direct χψ-twist uses FL_{χψ}. Comparing these by the Euler relation introduces the Euler factors for primes ramifying in the former and not the latter outside N. In particular (c^χ)^{χ^{-1}}_F = Cor_{FL_χ/F}(c_{FL_χ}), after cancelling generators; this equals the applicable Euler-factor product times c_F and need not equal c_F. Both families are compared in the common conductor f_χ f_ψ N.
- Additional arithmetic check: For χ = 1, L = K and c^χ_F = c_F.
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1), χ of conductor f: the image of c^χ_ℚ in H¹(L, T) is Σ_{δ ∈ Gal(L/ℚ)} χ(δ)δc_L, the χ^{-1}-component of the Kummer class of the cyclotomic unit of L.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`

**Sources.**

- `rubin-es`, Chapter II, Proposition 4.2, p. 30: The twisted family is an Euler system.
- `rubin-es`, Chapter II, Lemma 4.3, p. 31: The restriction formula.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### Changing the Euler factors

`EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change` — theorem

**Statement.** (a) Let f_q, g_q ∈ O[x] (q ∤ N) with f_q ≡ g_q modulo N(q) − 1, and c̃ a family with Cor_{F′/F}(c̃_{F′}) = (∏_{q ∈ Σ(F′/F)} f_q(Fr_q^{-1})) c̃_F. Then there is a family c with the same relations for g_q, with c_F = c̃_F for every finite abelian F/K unramified outside N, and with Σ_γ χ(γ)γc_F = Σ_γ χ(γ)γc̃_F whenever χ is a character of Gal(F/K) of conductor 𝔣 and every prime ramified in F/K divides N𝔣; the construction is an explicit O-linear map c̃ ↦ c. (b) Units u_q ∈ O^× and a shift x ↦ x^d of the variable can be absorbed similarly. (c) In particular a family satisfying the relations with P(Fr_q^{-1} | T; Fr_q) gives an Euler system in the sense of Definition II.1.1, and the modules of Euler systems for the conventions of Rubin and of Mazur–Rubin are isomorphic. The change of factors is a map of systems, not an equality.

**Hypotheses.**

- f_q ≡ g_q (mod N(q) − 1)

**Proof sketch.**

1. Since [K(q) : K(1)] divides N(q) − 1, (f_q − g_q)(Fr_q^{-1}) is divisible by the degree of the q-part; correct c̃_F by an explicit alternating sum over the primes ramified in F (Rubin, Lemma IX.6.1).
2. The Mazur–Rubin and Rubin polynomials are congruent modulo N(q) − 1 by euler-polynomial.

**Acceptance.**

- Rubin's Example IX.6.2: K = ℚ, f_q = 1 − x and g_q = 1 − q^{-1}x.
- The map is the identity on classes over fields unramified outside N.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`

**Sources.**

- `rubin-es`, Chapter IX, Lemma 6.1, p. 141: Changing congruent Euler factors.
- `mr-ks`, Remark 3.2.3, p. 23: The two conventions give isomorphic modules.

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

- `Universal.X_one` (degenerate): When F=K and K(1)=K, the conductor-one universal module is R.
- `Universal.rank_one_prime` (computation): With F=K and K(1)=K, the one-prime universal module has R-rank |Γ_q| under admissibility.
- `Universal.zero_lift` (characterisation): The universal lift of the zero Euler system takes every distinguished generator to zero.

**Acceptance.**

- For r = 1 and F = K with K(1) = K: X_K = O·x_K.
- Hom_{G_K}(X_{∞,R}, colim_r lim_F H¹(F(r), T)) recovers Euler systems for 𝒦_min (Remark IV.2.4).
- Additional arithmetic check: X_{F(r)} is not free over O[Gal(F(r)/K)] in general: only X_{F(r)} ⊗ Φ is free of rank one over Φ[Gal(F(r)/K)].

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `mathlib:MonoidAlgebra`

**Sources.**

- `rubin-es`, Chapter IV, Definitions 2.1–2.2, p. 58: Definition of X_{F(r)} and X.
- `rubin-es`, Chapter IV, Proposition 3.1, p. 59: Freeness of the universal Euler system.
- `rubin-es`, Chapter IV, Proposition 3.4, p. 61: The Ext¹ vanishing.

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

- `IsRigid.of_admissible` (compatibility): An admissible tower supplies the rigidity conditions.
- `not_isRigid_failed_unramified` (non-example): Without an infinite direction, a family failing the ray unramified condition is not rigid.
- `IsRigid.of_injective_direction` (characterisation): The ray unramified condition together with an injective γ−1 direction in H_M gives rigidity.

**Acceptance.**

- A system of infinite depth gives one of depth M for every M.
- The counterexample family (c_K arbitrary, others 0) satisfies none of (a), (b), (c) when c_K ∉ S^{Σ_p}.
- Additional arithmetic check: If K has class number one, P(Fr_q^{-1} | T^*; 1) = 0 for all q ∤ N and 𝒦 is the maximal abelian extension of K unramified at every prime dividing N, the family c_K = x, c_F = 0 for F ≠ K is an Euler system for every x ∈ H¹(K, T); for x ∉ S^{Σ_p}(K, T) it satisfies none of (a), (b), (c).
- Additional arithmetic check: For K = ℚ, χ the quadratic character of an imaginary quadratic field K′: d = 2 and the relation at a prime ℓ inert in K′ uses P(Fr_ℓ^{-1} | T^*; Fr_ℓ^{-1}) with Fr_ℓ ∈ G_ℚ, whose square is the Frobenius of the prime of K′ above ℓ.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`

**Sources.**

- `rubin-es`, Chapter IX §1, p. 133: The failure of rigidity without condition (ii) and the replacement (ii)′.
- `rubin-es`, Chapter IX, Definition 3.1, p. 136: Finite depth.
- `rubin-es`, Chapter IX, Definition 4.1, p. 138: Anticyclotomic Euler systems.
- `rubin-es`, Chapter IX, Definition 5.1, p. 140: Triviality at Σ.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/EulerSystem`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### Anticyclotomic Euler systems over ring class fields *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.2/ring-class-anticyclotomic-euler-system` — definition

**Planet:** Anticyclotomic Euler system over ring class fields.

**Statement.** Let f be a newform of weight 2r and level N, p ∤ N, K an imaginary quadratic field, T the G_ℚ-stable O-lattice in the self-dual twist V of the p-adic representation of f with its G_ℚ-equivariant perfect pairing T × T → O(1), and χ : Gal(K_{c_o p^∞}/K) → O^× an anticyclotomic character of conductor cO_K, c = c_o p^s with (c_o, pN) = 1. Let 𝒦 be the set of squarefree products of primes ℓ inert in K with ℓ ∤ 2pNc_o, K_n the ring class field of conductor n, τ complex conjugation and w_f the Atkin–Lehner sign. An anticyclotomic Euler system for (T, χ) is a family c = (c_n)_{n∈𝒦} with c_n ∈ H¹(K_{cn}, T ⊗ χ^{-1}) such that for every n = mℓ ∈ 𝒦: (E1) cor_{K_{cn}/K_{cm}}(c_n) = a_ℓ(f)·c_m; (E2) loc_ℓ(c_n) = res(loc_ℓ(c_m)^{Frob_ℓ}) along K_{cm,λ} ⊆ K_{cn,λ}; (E3) if χ² = 1, c_n^τ = w_f χ(σ_𝔑)·c_n^{σ_𝔑}. The bottom class is c_K = cor_{K_c/K}(c_1) ∈ H¹(K, T ⊗ χ^{-1}). The families form an O-submodule of ∏_{n∈𝒦} H¹(K_{cn}, T ⊗ χ^{-1}). This is Nekovář's notion, distinct from Rubin's χ-anticyclotomic Euler systems (ES.2/rigidity-variants(c)): the norm relation carries the Hecke eigenvalue a_ℓ(f) of an inert prime, and the tower is the ring class tower rather than ray class fields.

**Hypotheses.**

- f a newform of weight 2r and level N prime to p; T the Nekovář lattice with its perfect pairing
- χ anticyclotomic of conductor c_o p^s with (c_o, pN) = 1

**Construction.**

1. The conditions (E1)–(E3) are O-linear equations in the product of the cohomology groups, so the families form a submodule (an equaliser of the corestriction, localisation and conjugation maps).
2. The bottom class is the corestriction of c_1; under (E1) it agrees with cor_{K_{cn}/K}(c_n)/∏_{ℓ|n} a_ℓ(f) whenever the a_ℓ(f) are invertible, which is not assumed.

**Uses that determine the API.**

- Castella–Hsieh, §7.2, Definitions 7.1–7.2 and Theorem 7.3: the input of Kolyvagin's descent for generalised Heegner cycles
- GeneralizedHeegnerCycles GH.5–GH.6: the generalised Heegner classes are verified to form such a system and the rank-zero and rank-one Selmer bounds are imported
- ES.3/ring-class-derivative-classes: the derivative classes κ(n) are built from the c_n

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.RingClassEulerSystem` | data | The O-submodule of ∏_{n∈𝒦} H¹(K_{cn}, T ⊗ χ^{-1}) cut out by (E1)–(E3). |
| `TauCeti.EulerSystems.RingClassEulerSystem.eval` | projection | c ↦ c_n, an O-linear map to H¹(K_{cn}, T ⊗ χ^{-1}). |
| `TauCeti.EulerSystems.RingClassEulerSystem.cor_eval` | relation | (E1): cor_{K_{cn}/K_{cm}}(c_n) = a_ℓ(f)·c_m for n = mℓ. |
| `TauCeti.EulerSystems.RingClassEulerSystem.loc_eval` | relation | (E2): loc_ℓ(c_n) = res(loc_ℓ(c_m)^{Frob_ℓ}). |
| `TauCeti.EulerSystems.RingClassEulerSystem.conj_eval` | relation | (E3): for χ² = 1, c_n^τ = w_f χ(σ_𝔑) c_n^{σ_𝔑}. |
| `TauCeti.EulerSystems.RingClassEulerSystem.bottom` | projection | c_K = cor_{K_c/K}(c_1). |
| `TauCeti.EulerSystems.RingClassEulerSystem.ext` | extensionality | Two systems with the same c_n for all n ∈ 𝒦 are equal. |
| `TauCeti.EulerSystems.RingClassEulerSystem.twist` | functoriality | Multiplication by a scalar of O and restriction of the index set to the products of primes in a subset of 𝒦 preserve (E1)–(E3). |

**Unit tests.**

- `RingClassEulerSystem.zero_mem` (degenerate): The family c_n = 0 for all n satisfies (E1)–(E3) and has c_K = 0.
- `RingClassEulerSystem.bottom_def` (computation): For c_o = 1 and χ of conductor p^s, c_K = cor_{K_{p^s}/K}(c_1); for χ trivial and c = 1, c_K = cor_{K_1/K}(c_1).
- `RingClassEulerSystem.not_rubin_relation` (non-example): A family satisfying Rubin's Euler-polynomial corestriction relation of ES.2/euler-system-module along ray class fields need not satisfy (E1): at an inert ℓ the ring class extension K_{cℓ}/K_{c} is cyclic of order ℓ + 1, and (E1) multiplies by a_ℓ(f), not by an Euler factor evaluated at Frobenius.
- `RingClassEulerSystem.heegner_weight_two` (compatibility): For r = 1 and χ = 1, the Kummer images of Heegner points y_n ∈ E(K_n) satisfy (E1) with a_ℓ(f) = a_ℓ(E).

**Acceptance.**

- Generalised Heegner classes z_{f,χ^{-1},nc} satisfy (E1)–(E3) (Castella–Hsieh, Proposition 7.4), and so do their Iwasawa-theoretic specialisations (Proposition 7.8).
- For f of weight two and χ trivial, the Kummer images of Heegner points satisfy (E1)–(E3).
- The zero family is an Euler system; such a system carries no arithmetic information and every theorem using it needs c_K ≠ 0.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`

**Sources.**

- `ch`, §7.1 and §7.2, Definition 7.1, pp. 28–29 (author's version): fixes the self-dual Nekovář lattice with its pairing and defines anticyclotomic Euler systems over ring class fields by the relations (E1)–(E3).
- `ch`, §7.3, Proposition 7.4, p. 31 (author's version): verifies (E1)–(E3) for the χ^{-1}-components of the generalised Heegner classes.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RingClass`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


**Open refinements of ES.2.**

- Lemma level: Rubin Lemma IX.6.3 and Corollary IX.6.4 in full, Proposition IV.3.1(iv)–(v), Lemmas IV.2.5, IV.4.6 and Proposition IV.4.7 as separate statements.
- Smoothing is stated by the cyclotomic owner; no generic smoothing operation was found in the sources read.
- The Kings–Loeffler–Zerbes Beilinson–Flach classes requested by RankZeroOneBSD BSD.7 are a construction of arithmetic classes, outside this roadmap's scope (restructure proposal 6).

## ES.3. Derivative operators and corrected Kolyvagin classes

Kolyvagin's norm and derivative operators and their telescoping identity, invariance of the derivative of the universal class, the induced module 𝕎_M with its connecting map and the lifts of an Euler system, Kolyvagin's derivative classes κ_{F,r,M}, their unramifiedness away from pr, the local lifts and the finite-part theorem at ramified primes, the lifted telescoping identity and key norm relation giving the finite–singular relation, Kolyvagin's congruence and its multiplicative-group example, Kolyvagin systems and their generalised limits, Mazur–Rubin's Appendix A correction and the Euler-to-Kolyvagin map with its two-prime check, the derivative classes of χ-anticyclotomic systems, and the ring-class derivative classes of Nekovář with their local conditions at p.

**Layer acceptance.** The conductor-one component is the image of the initial class; the two-prime test checks the correction terms; derivative classes reduce compatibly with M; merely constructing D_q does not give the finite–singular relation, which needs the key relation.

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

- `kolyvaginDerivative_order_two` (computation): For order 2, D_σ=σ.
- `kolyvaginDerivative_order_three` (computation): For order 3, D_σ=σ+2σ².
- `kolyvaginDerivative_trivial` (degenerate): The derivative of the identity in the trivial cyclic group is zero.
- `kolyvaginDerivative_not_norm_multiple` (non-example): For a cyclic group of order at least 2, (σ−1)D_σ is nonzero in the integral group ring.

**Acceptance.**

- For n = 2: D_σ = σ and (σ − 1)σ = 1 − σ = 2 − (1 + σ).
- The identity is the only property of D_q used in the invariance of derivative classes.

**Prerequisites.**

- `mathlib:MonoidAlgebra`
- `mathlib:Representation.norm`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`

**Sources.**

- `rubin-es`, Chapter IV, Definition 4.1 and (4), p. 62: The operators D_q, D_r and the identity (σ_q − 1)D_q = |Γ_q| − N_q.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Invariance of the derivative of the universal class

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-invariance` — lemma

**Statement.** Let K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O and r ∈ R_{F,M}. If N_{F(1)/F} ∈ ℤ[Gal(F(r)/F)] restricts to Σ_{γ ∈ Gal(F(1)/F)} γ, then N_{F(1)/F}D_r x_{F(r)} ∈ (X_{F(r)}/M X_{F(r)})^{Gal(F(r)/F)}, independently of the choice of N_{F(1)/F}. Consequently for an Euler system c the image of N_{F(1)/F}D_r c_{F(r)} in H¹(F(r), W_M) is fixed by Gal(F(r)/F).

**Hypotheses.**

- r ∈ R_{F,M}

**Proof sketch.**

1. Show (σ − 1)D_r x_{F(r)} ∈ M X_{F(r)} for σ ∈ Gal(F(r)/F(1)) by induction on the number of primes of r: for r = qs, (σ_q − 1)D_r = (|Γ_q| − N_q)D_s and N_q x_{F(r)} = P(Fr_q^{-1} | T^*; Fr_q^{-1})x_{F(s)} ≡ P(Fr_q^{-1} | T^*; 1)x_{F(s)} modulo (Fr_q − 1)D_s x_{F(s)}.
2. Both M | |Γ_q| and M | P(Fr_q^{-1} | T^*; 1) hold by definition of R_{F,M}; Fr_q acts on x_{F(s)} through Gal(F(s)/K), where the induction hypothesis applies since q splits completely in F(1)/K.

**Acceptance.**

- For r = q: (σ_q − 1)D_q x_{F(q)} = |Γ_q|x_{F(q)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_F ∈ M X_{F(q)}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`
- `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`

**Sources.**

- `rubin-es`, Chapter IV, Lemma 4.2, p. 62: The invariance statement.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The induced module, the connecting map and lifts of an Euler system

`EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module` — theorem

**Statement.** Let 𝕎_M = Maps_cont(G_K, W_M) with (γf)(g) = f(gγ), containing W_M via t ↦ (g ↦ gt). (a) For K ⊂_f L ⊆ K_∞(r) there is a canonical δ_L : (𝕎_M/W_M)^{G_L} → H¹(L, W_M) with 0 → W_M^{G_L} → 𝕎_M^{G_L} → (𝕎_M/W_M)^{G_L} → H¹(L, W_M) → 0 exact; δ_L(f) is represented by γ ↦ (γ − 1)f̂ for a lift f̂ ∈ 𝕎_M; and δ commutes with restriction and with norm/corestriction. (b) For an Euler system c and r ∈ R there is a family of O[G_K]-maps d_F : X_{F(r)} → (𝕎_M/W_M)^{G_{F(r)}}, K ⊂_f F ⊆ K_∞, with δ_{F(r)} ∘ d_F equal to x_{F(s)} ↦ c_{F(s)} (mod M) and compatible with norms N_{F′(r)/F(r)}; each d_F is unique up to Hom_{O[G_K]}(X_{F(r)}, 𝕎_M).

**Hypotheses.**

- an Euler system for an admissible tower
- 0 ≠ M ∈ O

**Proof sketch.**

1. (a): 𝕎_M is induced, hence H¹(L, 𝕎_M) = 0; take G_L-cohomology of 0 → W_M → 𝕎_M → 𝕎_M/W_M → 0. The cocycle formula and the compatibility with corestriction are in Tau Ceti for discrete coefficients (the connecting map of a short exact sequence and explicitCor_delta0).
2. (b): the obstruction to lifting X_{F(r)}/M → H¹(F(r), W_M) through δ lies in Ext¹ of X_{F(r)}/M against the induced module, which vanishes by the freeness of the universal Euler system (ES.2/universal-euler-system, Proposition IV.3.4) and the structure of 𝕎_M^{G_{F(r)}} as a free (O/M)[Gal(F(r)/K)]-module (Lemma IV.4.6); pass to the limit over F using Proposition IV.4.7.

**Acceptance.**

- If W^{G_{F(r)}} = 0 the lift is unnecessary: restriction H¹(F, W_M) → H¹(F(r), W_M)^{Gal(F(r)/F)} is an isomorphism.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`
- `tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0`
- `tauceti:TauCeti.ContCohomology.explicitCor1`

**Sources.**

- `rubin-es`, Chapter IV, Proposition 4.5, pp. 63–64: The connecting map δ_L and its properties.
- `rubin-es`, Chapter IV, Proposition 4.8, p. 65: Existence and uniqueness of the lifts d_F.

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

- `derivativeClass_zero` (degenerate): Every derivative class of the zero Euler system is zero.
- `derivativeClass_delta_lift` (compatibility): The induced connecting class vanishes for an invariant element lifted from the coinduced module.
- `derivativeClass_conductor_one_nonzero` (non-example): At conductor one, a nonzero initial component remains nonzero if its coefficient reduction on H¹ is injective.

**Acceptance.**

- When W^{G_{F(r)}} = 0, κ_{F,r,M} is the unique class restricting to D_{r,F}c_{F(r)}.
- Scalar and quotient compatibility: κ(ac) = aκ(c), and (iii).
- Additional arithmetic check: For r = 1 and F = K with K(1) = K, κ_{K,1,M} = c_K mod M.
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1), M = p^k and ℓ ≡ 1 (mod p^k): κ_{ℚ,ℓ,M} ∈ ℚ^×/(ℚ^×)^{p^k} is the unique class whose image in ℚ(ℓ)^×/p^k is D_ℓ applied to the cyclotomic unit of ℚ(ℓ) (here W^{G_{ℚ(ℓ)}} = 0 for p odd).
- Additional arithmetic check: κ_{F,r,M} is not Cor_{F(r)/F}(c_{F(r)}) = N_r c: corestriction gives the Euler-factor multiple of c_F, which is 0 modulo M for r ∈ R_{F,M} with r ≠ 1, while κ_{F,r,M} is in general nonzero.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-invariance`
- `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`

**Sources.**

- `rubin-es`, Chapter IV, Definition 4.10, p. 66: Definition of the derivative class.
- `rubin-es`, Chapter IV, Lemma 4.13, p. 67: The three basic properties.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Derivative classes are unramified away from pr, finite up to a bounded factor *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-classes-unramified` — theorem

**Statement.** Let c be an Euler system for T (ES.2/euler-system-module) over an admissible tower, K ⊂_f F ⊂ K_∞, 0 ≠ M ∈ O and r ∈ R_{F,M}, with κ_{F,r,M} the derivative class of ES.3/derivative-class. (a) For every prime Q of F not dividing pr, (κ_{F,r,M})_Q ∈ H¹_ur(F_Q, W_M). (b) If T is unramified at Q, then (κ_{F,r,M})_Q ∈ H¹_f(F_Q, W_M). (c) For every archimedean place w of F, (κ_{F,r,M})_w ∈ H¹_f(F_w, W_M). (d) Let m = sup_{q ∤ p}[W^{I_q} : (W^{I_q})_div], the supremum over primes q of K of the index of the maximal divisible subgroup in the inertia invariants of W = V/T; it is a finite positive integer, independent of M. Then for every r ∈ R_{F,Mm} and every prime Q of F not dividing pr, (κ_{F,r,M})_Q ∈ H¹_f(F_Q, W_M). Part (d) is weaker than ES.3/derivative-local-properties(a) at primes where T is ramified, but suffices for the bounds of Chapter II and for Euler systems of finite depth.

**Hypotheses.**

- c an Euler system for T over an admissible tower (K_∞ ⊆ 𝒦 with no finite prime splitting completely)
- r ∈ R_{F,M} for (a)–(c); r ∈ R_{F,Mm} for (d)

**Proof sketch.**

1. (a): an inertia group I of Q in G_F lies in G_{F(r)} because F(r)/F is unramified at Q; by Lemma IV.4.13(ii) the restriction of κ_{F,r,M} to I is the image of D_{r,F}c_{F(r)}, which vanishes on I since every class γc_{F(r)} is unramified away from p (Rubin, Proposition IV.6.1, from the universal-norm lemma planned in SelmerIwasawaCohomology L3).
2. (b): if T is unramified at Q then H¹_f(F_Q, W_M) = H¹_ur(F_Q, W_M) (Rubin, Lemma I.3.8(ii)).
3. (c): F(r)/F is unramified at archimedean places, so w splits completely and (κ_{F,r,M})_w is the image of (D_{r,F}c_{F(r)})_{w̃} ∈ H¹(F_w, T) = H¹_f(F_w, T) (Rubin, Remark I.3.7, Lemma I.3.8(i)).
4. (d): m is finite because the indices are finite and almost all equal to 1; m kills H¹_ur(F_Q, W_{Mm})/H¹_f(F_Q, W_{Mm}) (Rubin, Lemma I.3.5(iii)); apply (a) to κ_{F,r,Mm} and use that m·κ_{F,r,Mm} is the image of κ_{F,r,M} (Lemma IV.4.13(iii)).

**Acceptance.**

- For T unramified outside p, (b) gives ES.3/derivative-local-properties(a) at every Q ∤ pr with no loss, and m = 1.
- For T = T_pE with E of split multiplicative reduction at q, the nondivisible part of W^{I_q} is the p-part of the component group of the Néron model at q, so m can exceed 1 and (d) loses a bounded factor.
- The bound m in (d) does not depend on M, so the losses in the Chapter II bounds stay bounded as M grows.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`
- `SelmerIwasawaCohomology:L3/semilocal-cohomology`
- `SelmerIwasawaCohomology:L2/unramified-condition`

**Sources.**

- `rubin-es`, Chapter IV §6, Proposition 6.1, Corollary 6.2 and Lemma 6.3, p. 69: Euler-system classes are unramified away from p; the derivative classes are unramified away from pr, finite where T is unramified and at archimedean places.
- `rubin-es`, Chapter IV §6, Remark 6.4 and Corollary 6.5 with proof, pp. 69–70: the finite-part statement at ramified primes up to the factor m, sufficient for the Chapter II theorems.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/DerivativeLocal`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Local lifts of an Euler system at a prime and the finite-part theorem *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.3/local-lifts` — theorem

**Statement.** Fix an Euler system c for T, 0 ≠ M ∈ O, r ∈ R and a prime q of K not dividing pr, with inertia and decomposition groups I ⊆ D ⊆ G_K. Put W^f_M = T^I/MT^I ⊆ (W_M)^I, 𝕎_M = Maps_cont(G_K, W_M) and 𝕎^f_M = Maps_cont(G_K, W^f_M) with G_K acting by right translation, and Ind_D(W_M) ⊆ 𝕎_M, Ind_D(W^f_M) ⊆ 𝕎^f_M the D-equivariant maps (f(hg) = hf(g) for h ∈ D). For a finite extension L of K unramified at q write H^i(L_q, −) = ⊕_{Q | q} H^i(L_Q, −). (a) For K ⊂_f F ⊂ K_∞ there is a commutative diagram with exact columns whose columns are the G_{F(r)}-cohomology sequences of 0 → W_M → 𝕎_M → 𝕎_M/W_M → 0, 0 → Ind_D(W_M) → 𝕎_M → 𝕎_M/Ind_D(W_M) → 0 and 0 → Ind_D(W^f_M) → 𝕎^f_M → 𝕎^f_M/Ind_D(W^f_M) → 0, ending in H¹(F(r), W_M), H¹(F(r)_q, W_M) and H¹(F(r)_q, W^f_M), with horizontal maps res_q and the maps induced by W^f_M ⊆ W_M. (b) There are norm-compatible O[G_K]-maps d_{F,q} : X_{F(r)} → (𝕎_M/Ind_D(W_M))^{G_{F(r)}} and d^f_{F,q} : X_{F(r)} → (𝕎^f_M/Ind_D(W^f_M))^{G_{F(r)}} (X_{F(r)} the universal Euler system module of ES.2/universal-euler-system) whose compositions with the connecting maps send x_{F(s)} to (c_{F(s)})_q for every s | r; each is unique up to Hom_{O[G_K]}(X_{F(r)}, 𝕎_M), respectively Hom_{O[G_K]}(X_{F(r)}, 𝕎^f_M). (c) Consequently, for r ∈ R_{F,M} and every prime Q of F above q, (κ_{F,r,M})_Q lies in the image of H¹_ur(F_Q, T) and hence in H¹_f(F_Q, W_M): this is Rubin's Theorem IV.5.1 at primes where T may be ramified.

**Hypotheses.**

- c an Euler system for T over an admissible tower; the decomposition group of q in K_∞/K is infinite (no finite prime splits completely)
- q ∤ pr

**Proof sketch.**

1. (a): 𝕎_M and Ind_D(W_M) are coinduced modules (Tau Ceti's TauCeti.coind with the trivial subgroup and with D), so Shapiro's lemma (TauCeti.ContCohomology.explicitShapiro1) and the double-coset decomposition identify the G_{F(r)}-cohomology of Ind_D(W_M) with the semilocal cohomology ⊕_{Q|q} H¹(F(r)_Q, W_M) (SelmerIwasawaCohomology L3/semilocal-cohomology); 𝕎_M has trivial higher cohomology. The left column is ES.3/lifting-to-induced-module(a).
2. (b): the classes (c_{F(s)})_Q are unramified (Rubin, Proposition IV.6.1), so the map X_{F(r)} → H¹(F(r)_q, W_M) factors through H¹(F(r)_q, W^f_M). Choose a ℤ_p-extension K′_∞ ⊆ K_∞ in which q has finitely many primes; then the inverse limit of H⁰(F(r)_q, W_M) over the tower vanishes (Rubin, Lemma B.3.2) and each H¹(F(r)_q, W_M) is finite, so the limit of the right column is short exact; the limit of (𝕎^f_M)^{G_{F(r)}} is free over (O/M)[[Gal(K_∞(r)/K)]], and the Ext¹-vanishing of ES.2/universal-euler-system lifts X_{∞,r} to the middle term; descend to finite level by the freeness of X_{∞,r}.
3. (c): compare the image of the global lift d of ES.3/lifting-to-induced-module(b) with d^f_{F,q} in the middle column; by uniqueness they differ by an element of Hom(X_{F(r)}, (𝕎_M)^{G_{F(r)}}), which on D_{r,F}x_{F(r)} lands in the kernel of the connecting map by ES.3/derivative-invariance. Hence (κ_{F,r,M})_Q comes from H¹(F_Q, T^{I_Q}/MT^{I_Q}); combined with ES.3/derivative-classes-unramified(a) it comes from H¹(F_Q^ur/F_Q, T^{I_Q}/M), and since Gal(F_Q^ur/F_Q) ≅ Ẑ has cohomological dimension one, H¹_ur(F_Q, T) surjects onto that group; Rubin's Lemmas I.3.5(ii) and I.3.8(i) place the image in H¹_f.

**Acceptance.**

- If T is unramified at q then W^f_M = W_M, Ind_D(W^f_M) = Ind_D(W_M), the right and middle columns coincide and (c) reduces to ES.3/derivative-classes-unramified(b).
- For r = 1, (c) says (c_F)_Q mod M lies in H¹_f(F_Q, W_M), as it must since c_F is a universal norm.
- The hypothesis that the decomposition group of q in K_∞/K is infinite is used to kill the inverse limit of local H⁰; for a finite decomposition group the lift need not exist.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-invariance`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-classes-unramified`
- `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`
- `SelmerIwasawaCohomology:L3/semilocal-cohomology`
- `tauceti:TauCeti.coind`
- `tauceti:TauCeti.ContCohomology.explicitShapiro1`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`

**Sources.**

- `rubin-es`, Chapter IV §6, Definition 6.6 and Lemma 6.7, pp. 70–71: semilocal cohomology at q, the modules W^f_M, 𝕎^f_M and Ind_D, and the three-column commutative diagram.
- `rubin-es`, Chapter IV §6, Proposition 6.8 with proof and Remark 6.9, pp. 71–73: existence and uniqueness of the local lifts d_{F,q} and d^f_{F,q}, by the inverse-limit argument over a ℤ_p-subextension.
- `rubin-es`, Chapter IV §6, proof of Theorem 5.1, pp. 73–74: comparison of the global and unramified lifts, and the cohomological-dimension-one step giving the finite part.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/DerivativeLocal`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The lifted telescoping identity and the key norm relation for lifts *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.3/key-relation` — theorem

**Statement.** Fix an Euler system c for T, 0 ≠ M ∈ O, r ∈ R, a prime q ∈ R_{K,M} not dividing r, K ⊂_f F ⊂ K_∞, a prime Q of K̄ above q with inertia and decomposition groups I ⊆ D, a lift σ_q ∈ I of the generator of Γ_q and a Frobenius Fr_q ∈ D. Put m = [K(q) : K(1)], N_q = Σ_{i=1}^{m} σ_q^i and D_q = Σ_{i=0}^{m−1} iσ_q^i in ℤ[I]. (a) (σ_q − 1)D_q = mσ_q^m − N_q in ℤ[I] (the lifted telescoping identity; σ_q^m ≠ 1 in I). (b) If d : X_{F(r)} → 𝕎_M/W_M lifts c as in ES.3/lifting-to-induced-module and d̂(x_{F(r)}) ∈ 𝕎_M lifts d(x_{F(r)}), then σσ′γd̂(x_{F(r)}) = σ′σγd̂(x_{F(r)}) for all γ ∈ G_K and σ, σ′ ∈ D; this can fail for σ, σ′ outside D. (c) For a lift d : X_{F(rq)} → 𝕎_M/W_M of c and lifts d̂(x_{F(rq)}), d̂(x_{F(r)}) ∈ 𝕎_M, N_q γ d̂(x_{F(rq)}) − P(Fr_q^{-1} | T*; Fr_q^{-1}) γ d̂(x_{F(r)}) ∈ W_M is independent of the choices and is zero in W_M for every γ ∈ G_K. (d) Consequently, with Q_q(x) ∈ (O/M)[x] the unique polynomial with (x − 1)Q_q(x) ≡ P(Fr_q^{-1} | T*; x) mod M, κ_{F,rq,M}(σ_q) = Q_q(Fr_q^{-1})κ_{F,r,M}(Fr_q) in W_M for cocycles representing the derivative classes: the singular part of κ_{F,rq,M} at q is φ^fs_q of the finite part of κ_{F,r,M} (ES.3/derivative-local-properties(b)).

**Hypotheses.**

- c an Euler system for T over an admissible tower; q ∈ R_{K,M}, so M | [K(q) : K(1)] and M | P(Fr_q^{-1} | T*; 1)
- T unramified at q

**Proof sketch.**

1. (a) is the telescoping computation of ES.3/derivative-operators carried out in ℤ[I] without imposing σ_q^m = 1.
2. (b): T is unramified at q, so every cocycle representing γc_{F(r)} vanishes on I ∩ G_{F(r)} (Rubin, Proposition IV.6.1), hence (σ − 1)γd̂(x_{F(r)}) = 0 for σ ∈ I ∩ G_{F(r)} by the cocycle formula of ES.3/lifting-to-induced-module; the commutator subgroup of D lies in I ∩ G_{F(r)} because D/I and Gal(F(r)/K) are abelian.
3. (c): independence of the choices uses that σ_q fixes W_M, that M | [K(q) : K(1)] and that P(Fr_q^{-1} | T*; Fr_q^{-1}) kills W_M (ES.2/euler-polynomial). For vanishing, pass to F′ ⊆ K_∞ in which the decomposition group of q in F′(rq)/F(rq) has order divisible by k_pM (possible because the decomposition group in K_∞ is infinite), write the norm as N′N″ with N′ the sum over the powers of Fr_q^k, and use (b) to commute N′ past N_q and P(Fr_q^{-1}); the difference lies in N′W_M ⊆ |H|W_M = 0.
4. (d): by the cocycle formula κ_{F,r,M}(Fr_q) = (Fr_q − 1)D_{r,F}d̂(x_{F(r)}) and κ_{F,rq,M}(σ_q) = (σ_q − 1)D_{rq,F}d̂(x_{F(rq)}); expand with (a), use (b) to commute elements of O[D], and (c) with M | m to conclude.

**Acceptance.**

- For K = ℚ, T = ℤ_p(1) and q = ℓ a prime with M | ℓ − 1, P(Fr_ℓ^{-1} | T*; x) = 1 − x and Q_ℓ = −1, so (d) says the singular part of κ_{rℓ} at ℓ is minus the image of the finite part of κ_r: Kolyvagin's relation for cyclotomic units up to sign conventions.
- Example of (b) failing outside D: for σ, σ′ ∈ G_K with non-commuting images in Gal(K(W_M)K(r)/K), σσ′d̂ and σ′σd̂ can differ because the action on d̂ does not factor through an abelian extension.
- With M replaced by M′ dividing M, the identities in (c)–(d) reduce compatibly.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`
- `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`
- `mathlib:Polynomial.X_sub_C_dvd_sub_C_eval`
- `mathlib:Polynomial.divByMonic`

**Sources.**

- `rubin-es`, Chapter IV §7, identity (9), Lemma 7.1 and Remark 7.2, p. 74: the lifted telescoping identity in ℤ[I] and the commutation of decomposition-group elements on lifts.
- `rubin-es`, Chapter IV §7, Lemma 7.3 and its proof, pp. 75–76: the key relation between the lifts at rq and r, proved by passing to a subfield of K_∞ with large local degree.
- `rubin-es`, Chapter IV §5, Lemma 5.2 and Definition 5.3, pp. 67–68; §7, proof of Theorem 5.4, p. 76: the polynomial Q_q, the finite–singular comparison φ^fs_q and the deduction of the singular-part formula.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/DerivativeLocal`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Local behaviour of derivative classes

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties` — theorem

**Planet:** Finite–singular relation for derivative classes.

**Statement.** Let c be an Euler system for T, K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O. (a) If r ∈ R_{F,M} and w is a place of F not dividing pr, then (κ_{F,r,M})_w ∈ H¹_f(F_w, W_M); equivalently κ_{F,r,M} ∈ S^{Σ_{pr}}(F, W_M). (b) If rq ∈ R_{F,M}, then the image of κ_{F,rq,M} in H¹_s(F_Q, W_M) is φ^fs_q of the localisation of κ_{F,r,M}: (κ_{F,rq,M})^s_q = φ^fs_q(κ_{F,r,M}). (c) If W_M/(Fr_q − 1)W_M is free of rank one over O/M, the order of (κ_{K,rq,M})^s_q in H¹_s(K_q, W_M) equals the order of (κ_{K,r,M})_q in H¹_f(K_q, W_M). (d) If c is trivial at a finite set Σ of primes not dividing p, then κ_{F,r,M} ∈ S_Σ^{Σ_{pr}}(F, W_M). For Euler systems of finite depth (b) holds and (a) holds after multiplying by a constant m independent of M.

**Hypotheses.**

- an Euler system for an admissible tower (so the classes are universal norms)
- r, rq ∈ R_{F,M}

**Proof sketch.**

1. (a): the Euler system classes are unramified outside p (ES.2/classes-unramified-outside-p, Proposition IV.6.1); the local lifts of Proposition IV.6.8 and the local induced modules show the derivative class is locally a coboundary of an unramified element; at archimedean places use Lemma IV.6.3.
2. (b): compute with the cocycle of derivative-class on a decomposition group at q, using the lifted telescoping identity and the key relation Lemma IV.7.3, which expresses (σ̄_q − 1) of the lift through Q_q(Fr_q^{-1}) applied to the Frobenius value of the lift for r.
3. (c): φ^fs_q is an isomorphism by ES.1/finite-singular-comparison; (d): Theorem IX.5.2, using uniqueness of local lifts.
4. Rubin IV §6: build local lifts through T^I/MT^I in Lemma 6.7 and Proposition 6.8. Infinite decomposition groups force the inverse limit of local H⁰ to vanish; compare global and local lifts using uniqueness, then procyclic cohomological dimension one lifts the unramified finite-level class to T^I. At derivative primes Lemma 7.1 gives commutation only inside the decomposition group, and Lemma 7.3 kills the lift discrepancy by passing to a tower with large local degree (pp. 69–76).

**Acceptance.**

- For r = 1 and q ∈ R_{K,M}: the singular part of κ_{K,q,M} at q is φ^fs_q(c_K mod M).
- Together (a) and (b) say that (κ_{K,r,M} ⊗ generators)_r is a weak Kolyvagin system for F_can relaxed at p.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`
- `SelmerIwasawaCohomology:L3/semilocal-cohomology`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-classes-unramified` (its own target since the whole-roadmap pass; the step was part of this proof sketch)
- `EulerSystemsAndKolyvaginSystems:ES.3/local-lifts` (its own target since the whole-roadmap pass; the step was part of this proof sketch)
- `EulerSystemsAndKolyvaginSystems:ES.3/key-relation` (its own target since the whole-roadmap pass; the step was part of this proof sketch)

**Sources.**

- `rubin-es`, Chapter IV, Theorem 5.1, p. 67: Finiteness away from pr.
- `rubin-es`, Chapter IV, Theorem 5.4, p. 68: The finite–singular relation.
- `rubin-es`, Chapter IX, Theorem 5.2, p. 140: Triviality at Σ is inherited.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Kolyvagin's congruence

`EulerSystemsAndKolyvaginSystems:ES.3/congruence` — theorem

**Statement.** Let c be an Euler system for T, K ⊂_f F ⊆ K_∞, q ∈ R prime and rq ∈ R. For every prime Q of F(rq) above q, (c_{F(rq)})_Q = ((P_q(Fr_q^{-1}) − P_q(N(q)Fr_q^{-1}))/[K(q) : K(1)]) (c_{F(r)})_Q in H¹(F(rq)_Q, T), where P_q(x) = P(Fr_q^{-1} | T^*; x) and (P_q(x) − P_q(N(q)x))/[K(q) : K(1)] ∈ O[x].

**Hypotheses.**

- an Euler system for an admissible tower

**Proof sketch.**

1. The quotient polynomial is integral because [K(q) : K(1)] divides N(q) − 1.
2. Apply the local computation behind derivative-local-properties(b) to the lift d̂ over the tower F K_∞: H¹(F(rq)_Q, T) is the limit of the finite-level groups, and P_q(N(q)Fr_q^{-1}) annihilates T.

**Acceptance.**

- For T = ℤ_p(1) this is the classical congruence between cyclotomic units modulo the primes above q (Example IV.8.2).
- The congruence is a consequence of the definition for towers extending in the p-direction; it is an extra hypothesis in rigidity condition (c).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `EulerSystemsAndKolyvaginSystems:ES.3/key-relation` (its own target since the whole-roadmap pass; the step was part of this proof sketch)

**Sources.**

- `rubin-es`, Chapter IV, Corollary 8.1, p. 77: The congruence relation.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Worked example: Kolyvagin's congruence for the multiplicative group *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.3/congruence-units-example` — application

**Statement.** Let T = ℤ_p(1), so H¹(F(r), T) is the p-adic completion of F(r)^× and, for a prime Q of F(r) not dividing p with residue field k_Q, H¹(F(r)_Q, T) ≅ k_Q^× ⊗ ℤ_p. Then P(Fr_q^{-1} | T*; x) = 1 − x and the congruence of ES.3/congruence reads: for every r ∈ R, prime q with rq ∈ R and prime Q of F(r) above q, the element c_{F(rq)} / c_{F(r)}^{((N(q) − 1)/[K(q):K(1)]) Fr_q^{-1}} has order prime to p in k_Q^×, that is, the two classes agree in the p-adic completion of k_Q^×. For the cyclotomic-unit Euler system this is the p-part of the congruence 1 − ζ_{rq} ≡ 1 − ζ_r^{Fr_q^{-1}} modulo every prime above q, which holds because ζ_q ≡ 1 there. Kolyvagin's original definition imposed this congruence as an axiom; under Rubin's definition, which requires the system to extend along a ℤ_p^d-extension, it is a theorem (ES.3/congruence), and conversely the congruence allows one to drop the ℤ_p^d-extension (rigidity condition (ii)′(c) of ES.2/rigidity-variants).

**Hypotheses.**

- T = ℤ_p(1); c an Euler system for T over an admissible tower

**Proof sketch.**

1. For T = ℤ_p(1), T* = Hom(T, ℤ_p(1)) = ℤ_p with trivial action, so det(1 − Fr_q^{-1}x | T*) = 1 − x.
2. (P_q(Fr_q^{-1}) − P_q(N(q)Fr_q^{-1}))/[K(q) : K(1)] = ((N(q) − 1)/[K(q) : K(1)])Fr_q^{-1}. The 1999 draft prints the denominator [K(q) : K] in Example IV.8.2; the published Example 4.8.2 has [K(q) : K(1)], as Corollary IV.8.1 requires (EulerSystemsAndKolyvaginSystems/E901 in sourceIssues). The two agree when K(1) = K, for instance for K = ℚ.
3. Kummer theory identifies H¹(F(r)_Q, ℤ_p(1)) with the p-adic completion of F(r)_Q^×, and the unramified quotient with k_Q^× ⊗ ℤ_p; the congruence of ES.3/congruence becomes the stated statement about orders.

**Acceptance.**

- For K = ℚ, r = 1 and the cyclotomic units c_{ℚ(q)} = N(1 − ζ_q) (suitably smoothed), the congruence says the unit is a p-th power residue up to the stated exponent modulo primes above q.
- For q ∈ R with N(q) ≡ 1 modulo a high power of p the exponent (N(q) − 1)/[K(q) : K] is a p-adic unit times a power of p, so the statement is nontrivial exactly on the p-part of k_Q^×.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/congruence`
- `EulerSystemsAndKolyvaginSystems:ES.3/key-relation`
- `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`

**Sources.**

- `rubin-es`, Chapter IV §8, Example 8.2, p. 78 (1999 draft): specialises the congruence of Corollary IV.8.1 to T = ℤ_p(1) and relates it to the congruence for cyclotomic units, with the denominator misprinted as [K(q) : K].
- `rubin-es-2000`, Chapter 4 §8, Example 4.8.2 and (4.13), p. 103 (published version): the same example with the denominator [K(q) : K(1)], the congruence read in the p-adic completion of k_Q^×.
- `rubin-es`, Chapter II §1, Remark 1.5, p. 23: Kolyvagin's method required an extra congruence condition; Rubin's universal-norm hypothesis makes it a consequence, and conversely the congruence can replace that hypothesis.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/DerivativeLocal`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Derivative classes and the key relation under the alternative rigidity conditions *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.3/rigidity-variant-derivative-classes` — theorem

**Statement.** Let c be an Euler system for (T, 𝒦, N) satisfying Rubin's condition (ii)′(b) or (ii)′(c) of ES.2/rigidity-variants in place of the existence of a ℤ_p^d-extension in 𝒦, and assume T^{G_{K(1)}} = 0. (ii)′(b): c_{K(r)} ∈ S^{Σ_p}(K(r), T) for every r, and some γ ∈ G_K is trivial on K(1)(μ_{p^∞}, (O_K^×)^{1/p^∞}) with γ − 1 injective on T. (ii)′(c): c_{K(r)} ∈ S^{Σ_p}(K(r), T) for every r, Fr_q^n − 1 is injective on T for every q ∤ N and every power n of p, and the classes c_{K(r)} satisfy the congruence of ES.3/congruence. Then there is a power m of p, independent of M, such that for r ∈ R_{K,Mm} the derivative classes κ_{K,r,M} are defined and satisfy (a) κ_{K,r,M} is finite at every place not dividing pr, and (b) the singular part of κ_{K,rq,M} at q is φ^fs_q of the finite part of κ_{K,r,M} at q. Under (ii)′(b), (b) rests on the identity P(γ | T; 1)·(N_q γ d̂(x_{F(rq)}) − P(Fr_q^{-1} | T*; Fr_q^{-1}) γ d̂(x_{F(r)})) = 0 in W_{M′} for a power M′ of p divisible by M·P(γ | T; 1), proved with auxiliary primes l in place of the ℤ_p-tower. Consequently Rubin's Theorems II.2.2, II.2.3 and II.2.10 (ES.4/rubin-bound) hold with the same conclusions.

**Hypotheses.**

- c satisfies the corestriction relations of an Euler system and (ii)′(b) or (ii)′(c); T^{G_{K(1)}} = 0
- r ∈ R_{K,Mm}, with m depending on T and c but not on M

**Proof sketch.**

1. Construction: T^{G_{K(1)}} = 0 gives T^{G_{K(r)}} = 0 for every r (Rubin, Lemma IV.2.5(i)), so with 𝕋 = Maps(G_K, T) the sequence 0 → 𝕋^{G_{F(r)}} → (𝕋/T)^{G_{F(r)}} → H¹(F(r), T) → 0 is exact and replaces the inverse limit of Proposition IV.4.7; lift c through it as in ES.3/lifting-to-induced-module(b), project to (𝕎_M/W_M)^{G_{F(r)}} and define κ_{F,r,M} as in ES.3/derivative-class.
2. (a): ES.3/derivative-classes-unramified(d) needs only that the Euler-system classes are unramified away from p, which (ii)′(b) and (ii)′(c) include as an assumption (under (ii)′(a) it came from the tower).
3. (b) under (ii)′(b): with n = |μ_{p^∞} ∩ K| choose, by Chebotarev, a prime l with Fr_l = γ on K(1)(μ_{nM′}, (O_K^×)^{1/(nM′)}, W_{M′}), Fr_l = 1 on K(rq), and Fr_l ≠ 1 on K(λ^{1/(np)}) where λO_K = q^h, h the order of q in the class group. Then nM′ | [K(l) : K] and the decomposition group of q in Gal(K(l)/K) has order at least M′. The Euler relation makes P(Fr_l^{-1} | T*; Fr_l^{-1})c_{K(r)} a norm from K(rl), and P(Fr_l^{-1} | T*; Fr_l^{-1}) ≡ P(γ | T; 1) mod M in O[Gal(K(rq)/K)]; the proof of ES.3/key-relation(c) then runs with K(l)/K in place of the tower.
4. (b) under (ii)′(c): reverse the argument of ES.3/congruence, deducing the key relation of ES.3/key-relation(c) from the congruence and the injectivity of Fr_q^n − 1.
5. The bounds of ES.4/rubin-bound use only κ_{K,r,M} for r ∈ R_{K,Mm} with these properties; the extra factor m does not affect them.

**Acceptance.**

- Cyclotomic units without a ℤ_p-tower: for χ a nontrivial even character of conductor prime to p, the twisted family of (ζ_m − 1)(ζ_m^{-1} − 1) satisfies (ii)′(b) and (ii)′(c) but not (ii)′(a), and the theorem gives |A_L^χ| = [E_L^χ : C_{L,χ}] (Rubin, Example IX.1.1 and Theorem IX.1.2; the arithmetic belongs to EulerSystemsCyclotomicMainConjecture).
- Without any rigidity condition the statement fails: the family with c_F = 0 for F ≠ K and c_K arbitrary is an Euler system (ES.2/rigidity-variants(a)).
- Under (ii)′(a) the theorem reduces to ES.3/derivative-local-properties with m = 1.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`
- `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-classes-unramified`
- `EulerSystemsAndKolyvaginSystems:ES.3/key-relation`
- `EulerSystemsAndKolyvaginSystems:ES.3/congruence`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `rubin-es`, Chapter IX §1, condition (ii)′ and the adaptation of Chapters IV–V, pp. 133–135: the alternative rigidity conditions, the construction of derivative classes when T^{G_{K(1)}} = 0, the analogue of Theorem IV.5.1 via Corollary IV.6.5, and the analogue of Lemma IV.7.3 through auxiliary primes l.
- `rubin-es`, Chapter IX §1, Example 1.1 and Theorem 1.2, pp. 135–136: cyclotomic units satisfying (ii)′(b) and (ii)′(c) without a ℤ_p-tower, and the resulting class-number equality.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/DerivativeLocal`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


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

- `KolyvaginSystem.zero_mem` (degenerate): The zero Kolyvagin system has order infinity.
- `KolyvaginSystem.empty_primes` (degenerate): For an empty prime set, evaluation gives KS≃H¹_F(K,T).
- `KolyvaginSystem.not_product` (non-example): A family with zero upper component and nonzero lower finite–singular localization at an edge is not a Kolyvagin system.

**Acceptance.**

- The zero family is a Kolyvagin system; a system may have κ_1 = 0.
- For core rank one KS → K̄S is an isomorphism (ES.5); in general it is neither injective nor surjective.
- Additional arithmetic check: κ_1 ∈ H¹_F(K, T) ⊗ ℤ = H¹_F(K, T): the stalk at 1 has I_1 = 0, G_1 = ℤ and F(1) = F.
- Additional arithmetic check: For T = ℤ_p(1), Σ(F) = {p, ∞} relaxed at p, the raw derivative classes of cyclotomic units form a weak Kolyvagin system whose finite parts (κ_n)_{ℓ,f}, ℓ | n, are not zero in general, so it is not a Kolyvagin system (Example 3.1.10).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`

**Sources.**

- `mr-ks`, Definition 3.1.3, p. 20: The concrete definition and relation (5).
- `mr-ks`, Definition 3.1.6, p. 21: The generalised module and the map to it.
- `mr-ks`, Definition 3.1.8, p. 21: Weak Kolyvagin systems.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/KolyvaginSystem`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Derivative classes form a weak Kolyvagin system; their finite parts

`EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula` — theorem

**Statement.** Let K = ℚ, R the integers of a finite extension of ℚ_p, F = F_can and P a set of primes ℓ ≠ p, unramified for T, with T/(Fr_ℓ − 1)T cyclic and Fr_ℓ^{p^k} − 1 injective on T for all k ≥ 0. For an Euler system c for (T, P, 𝒦) with 𝒦 containing the maximal abelian p-extension unramified outside p and P, let κ_n = κ_{[ℚ,n,I_n]} ⊗ (generators) ∈ H¹(ℚ, T/I_nT) ⊗ G_n, κ_1 = c_ℚ. (a) If H⁰(ℚ_p, T^*) is divisible, (κ_n) is a weak Kolyvagin system for (T, F_can, P); in general for each k and all large j the images κ_n^{(k)}, n ∈ N_j, form a weak Kolyvagin system for (T/m^kT, F_can, P_j). (b) For ℓ | n, (κ_n)_{ℓ,f} = Σ_{π ∈ S_1(n), π(ℓ) ≠ ℓ} (−1)^{ν(n/d_π)} (κ_{d_π})_{ℓ,f} ⊗ ⊗_{q | (n/d_π)} ρ_q(P_q(Fr_{π(q)}^{-1})), where S_1(n) is the set of permutations of the primes dividing n whose non-fixed primes form a single orbit, d_π = ∏_{π(ℓ)=ℓ} ℓ, and ρ_q : A_{q,I}/A_{q,I}² ≅ G_q ⊗ R/I is σ − 1 ↦ σ ⊗ 1 on the augmentation ideal A_{q,I} of (R/I)[G_q ⊗ R/I].

**Hypotheses.**

- K = ℚ
- the two conditions on the primes of P
- 𝒦 contains the maximal abelian p-extension of ℚ unramified outside p and P

**Proof sketch.**

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

- `mr-ks`, Appendix A, Proposition A.2, p. 79: The raw derivative classes form a weak system.
- `mr-ks`, Appendix A, Theorem A.4, p. 80: The formula for the finite parts.

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
| `TauCeti.KolyvaginSystems.eulerToKolyvagin_twist` | compatibility | For a twisted Euler system and the corresponding admissible twisted triple, the conductor-one evaluation of its generalized Kolyvagin system equals the twisted initial class. Full finite-level twisting compatibility uses the coefficient/polynomial/augmentation dictionary. |

**Unit tests.**

- `eulerToKolyvagin_zero` (degenerate): The zero Euler system maps to zero.
- `correctedClass_finite_vanishes` (compatibility): The corrected weak family from an admissible Euler system has vanishing finite part at every conductor prime.
- `WeakKolyvaginSystem.not_kolyvagin` (non-example): A weak family with nonzero finite part at a conductor prime is outside the image of ordinary Kolyvagin systems.

**Acceptance.**

- κ′_1 = κ_1 = c_ℚ and κ′_ℓ = κ_ℓ.
- For n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})).
- Compatibility: with twisting (Remark 3.2.5), with scalars and with T → T/m^k.
- Additional arithmetic check: For n = ℓ: Perm = {id}, κ′_ℓ = κ_ℓ and (κ_ℓ)_{ℓ,f} = 0 by the finite-part formula.
- Additional arithmetic check: For n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})); the sign of the transposition is −1 and d_π = 1.
- Additional arithmetic check: For T with H⁰(ℚ_p, T^*) not divisible, H¹_{F_can}(ℚ_p, T/IT) can be a proper submodule of H¹(ℚ_p, T/IT) (Lemma A.1), the classes κ′_n need not satisfy the condition at p, and the map is defined only into K̄S: the ordinary and the generalised outputs are different statements.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change`
- `EulerSystemsAndKolyvaginSystems:ES.2/twisting`

**Sources.**

- `mr-ks`, Theorem 3.2.4, pp. 23–24: The theorem.
- `mr-ks`, Appendix A, proof of Theorem 3.2.4, (33), p. 80: The corrected classes.
- `mr-ks`, Theorem 3.2.7, p. 24: The variant without the p-direction.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/KolyvaginSystem`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The two-prime check of the correction terms

`EulerSystemsAndKolyvaginSystems:ES.3/two-prime-test` — application

**Statement.** For distinct ℓ, q ∈ P and n = ℓq: (i) (κ_{ℓq})_{ℓ,s} = φ^fs_ℓ(κ_q) and (κ_{ℓq})_{q,s} = φ^fs_q(κ_ℓ); (ii) (κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f} ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})); (iii) the corrected class κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})) has zero finite part at ℓ and at q and the same singular parts as κ_{ℓq} at ℓ and q, because the correction term κ_1 is unramified at ℓ and q; (iv) κ′_{ℓq} is symmetric in ℓ and q. Hence κ′ satisfies both edge relations of the square 1 — ℓ — ℓq — q — 1.

**Hypotheses.**

- the setting of euler-to-kolyvagin

**Proof sketch.**

1. (i) is derivative-local-properties(b) with κ′_ℓ = κ_ℓ; (ii) is finite-part-formula for the transposition, with sign (−1)^{ν(n/d_π)} = (−1)² = 1; (iii) subtract; (iv) the correction term is symmetric.

**Acceptance.**

- The sign in (iii) is −1 = sign of the transposition, opposite to the sign +1 = (−1)^{ν(ℓq)} in (ii): the two formulas are consistent.
- Omitting the correction leaves (κ_{ℓq})_{ℓ,f} ≠ 0 in general, so κ_{ℓq} ∉ H¹_{F(ℓq)}.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`
- `EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula`

**Sources.**

- `mr-ks`, Appendix A, Theorem A.4 and (33), p. 80: The two formulas specialised to two primes.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/KolyvaginSystem`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Derivative classes of χ-anticyclotomic Euler systems

`EulerSystemsAndKolyvaginSystems:ES.3/anticyclotomic-derivative` — theorem

**Statement.** Let χ : G_K → ℤ_p^× have order d | p − 1, K′ the field cut out by χ, and c a χ-anticyclotomic Euler system for T. For a power M of p let R_{K′,M} be the squarefree ideals of K divisible only by primes q ∤ N with M | [K′(q)_χ : K′(1)_χ] and M | P(Fr_q^{-1} | T^*; 1). The construction of derivative-class gives κ_{K′,r,M} ∈ H¹(K′, W_M) for r ∈ R_{K′,M}, satisfying the analogues of derivative-local-properties (a) and (b): loc^s_q(κ_{K′,rq,M}) = φ^fs_q(κ_{K′,r,M}). The map φ^fs_q : H¹_f(K′_q, W_M) → H¹_s(K′_q, W_M) is not Gal(K′/K)-equivariant: it sends the χ^i-part into the χ^{i−1}-part.

**Hypotheses.**

- d | p − 1
- one of the rigidity conditions (a), (b), (c) of the anticyclotomic definition

**Proof sketch.**

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

- `rubin-es`, Chapter IX, Remark 4.4, p. 139: The eigenspace shift of the finite–singular map.
- `rubin-es`, Chapter IX §4, p. 138: Derivative classes exist for χ-anticyclotomic systems.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Derivative`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Derivative classes of ring-class anticyclotomic Euler systems and their local conditions at p *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.3/ring-class-derivative-classes` — construction

**Statement.** Let c be an anticyclotomic Euler system for (T, χ) in the sense of ES.2/ring-class-anticyclotomic-euler-system, π a uniformiser of O, O_M = O/π^M, T_M = T/π^M T. Fix ν ≥ 0 such that p^ν kills (i) the kernel and cokernel of res : H¹(K, T_M ⊗ χ^{-1}) → H¹(K_n, T_M ⊗ χ^{-1})^{Δ_n} for all n and M (Δ_n = Gal(K_n/K)) and (ii) H¹(K_v, T_M ⊗ χ^{-1}) for all v | c_oN; put B₁ = min{ord_π(x − 1) : x·I₂ ∈ ρ*_f ⊗ χ^{-1}(G_K), x ∈ ℤ_p^×}. A prime ℓ is M-admissible if ℓ ∤ 2cNp is inert in K, a_ℓ(f) ≡ ℓ + 1 ≡ 0 mod π^M and π^{M+B₁+1} ∤ ℓ + 1 ± a_ℓ(f)ℓ^{1−r}; 𝒦_M is the set of squarefree products of M-admissible primes. For n ∈ 𝒦_M, G_n = Gal(K_{nc}/K_c) = ∏_{ℓ|n} G_ℓ with G_ℓ cyclic of order ℓ + 1 and chosen generators σ_ℓ; D_ℓ = Σ_{i=1}^{ℓ} iσ_ℓ^i and D_n = ∏_{ℓ|n} D_ℓ. There is a unique D_M(n) ∈ H¹(K_c, T_M ⊗ χ^{-1}) with res_{K_c,K_{nc}}(D_M(n)) = p^{3ν} D_n c_n, and the derivative class is κ(n) = cor_{K_c/K}(D_M(n)) ∈ H¹(K, T_M ⊗ χ^{-1}). Given an F-subspace F ⊆ H¹(K ⊗ ℚ_p, V ⊗ χ^{-1}) with orthogonal complement F* (F* = F if χ² = 1), F_M the image of its inverse image in H¹(K ⊗ ℚ_p, T ⊗ χ^{-1}), and the n-imprimitive Selmer group Sel^{(n)}_F(K, T_M ⊗ χ^{-1}) (finite at v ∤ pn, in F_M at p when p ∤ n), the space ES(T, χ, F) consists of the systems with (E4) c_K ∈ Sel_F(K, T ⊗ χ^{-1}) and c_K^τ ∈ Sel_{F*}(K, T ⊗ χ), and (E5) κ(n) ∈ Sel^{(n)}_F(K, T_M ⊗ χ^{-1}) for all M and n ∈ 𝒦_M. The classes satisfy (K1) κ(n) ∈ Sel^{(np)}_F(K, T_M ⊗ χ^{-1}) and κ(1) ≡ p^{3ν}c_K mod π^M; (K2) for M-admissible ℓ | n, with φ_ℓ : H¹_f(K_λ, T_M ⊗ χ^{-1}) → H¹_s(K_λ, T_M ⊗ χ^{-1}) the finite-to-singular isomorphism (evaluation at Frob_ℓ, then inverse of evaluation at a generator of tame inertia), ((−1)^{r−1}ε_n a_ℓ(f)ℓ^{1−r}/π^M − (ℓ + 1)/π^M)·φ_ℓ(loc_ℓ κ(n/ℓ)) = ((ℓ + 1)/π^M·ε_n − a_ℓ(f)ℓ^{1−r}/π^M)·∂_ℓ(κ(n)), the coefficients read in O; (K3) κ(n)^τ = ε_n κ(n) if χ² = 1, where ε_n = χ(σ_𝔑)w_f(−1)^{ω(n)}.

**Hypotheses.**

- c an anticyclotomic Euler system for (T, χ) over ring class fields
- ν exists (Nekovář's Proposition 6.3, Corollary 6.4 and Lemma 10.1, cited by the source) and B₁ < ∞ (ρ*_f absolutely irreducible with open image)

**Construction.**

1. (σ_ℓ − 1)D_ℓ = ℓ + 1 − N_ℓ (ES.3/derivative-operators), and N_ℓ c_n restricts the corestriction a_ℓ(f)c_{n/ℓ} by (E1), so a_ℓ(f) ≡ ℓ + 1 ≡ 0 mod π^M makes D_n c_n fixed by G_n modulo π^M. Since p^ν kills the kernel and cokernel of restriction, the class p^{3ν}D_n c_n descends to a unique D_M(n) over K_c (Nekovář §6, as the source records it; the exponent 3ν is the source's).
2. (K1)–(K3) are Nekovář's Proposition 10.2, as the source records them: unramifiedness away from pn uses (ii) and the inert splitting of ℓ in K_c; (K2) is the finite–singular computation at λ | ℓ using (E2) and the M-admissibility of ℓ; (K3) follows from (E3).
3. Membership (E5) at p is an extra condition that must be verified for each arithmetic system; for generalised Heegner classes the source verifies it through Bloch–Kato finite parts and corestriction along unramified extensions, and its Lemma 7.5 step needs the correction recorded below.

**Uses that determine the API.**

- Castella–Hsieh, §7.5, proof of Theorem 7.3: the classes κ(n) and relations (K1)–(K3) drive Kolyvagin's descent
- ES.4/rational-anticyclotomic-descent: the descent input
- GeneralizedHeegnerCycles GH.5: derivative classes of generalised Heegner cycles

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.RingClassEulerSystem.admissiblePrimes` | data | The set of M-admissible primes and 𝒦_M of their squarefree products. |
| `TauCeti.EulerSystems.RingClassEulerSystem.derivative` | constructor | κ(n) = cor_{K_c/K}(D_M(n)) with res(D_M(n)) = p^{3ν}D_n c_n, an O-linear map of the system. |
| `TauCeti.EulerSystems.RingClassEulerSystem.derivative_one` | simp | κ(1) ≡ p^{3ν}c_K modulo π^M. |
| `TauCeti.EulerSystems.RingClassEulerSystem.derivative_mem_selmer` | characterisation | (K1): κ(n) ∈ Sel^{(np)}_F(K, T_M ⊗ χ^{-1}). |
| `TauCeti.EulerSystems.RingClassEulerSystem.finiteSingular` | relation | (K2): the finite–singular relation at every M-admissible ℓ \| n with the stated coefficients. |
| `TauCeti.EulerSystems.RingClassEulerSystem.derivative_conj` | relation | (K3): κ(n)^τ = ε_n κ(n) when χ² = 1. |
| `TauCeti.EulerSystems.RingClassEulerSystem.withLocalCondition` | data | ES(T, χ, F): the submodule of systems satisfying (E4) and (E5). |

**Unit tests.**

- `derivative_zero` (degenerate): For the zero system, κ(n) = 0 for every n ∈ 𝒦_M.
- `derivative_one_eq` (computation): For n = 1, D_1 = 1 and κ(1) = cor_{K_c/K}(p^{3ν}c_1 mod π^M) = p^{3ν}c_K mod π^M.
- `derivative_eigen` (characterisation): For χ trivial, r = 1 and n a product of two admissible primes, κ(n) lies in the w_fχ(σ_𝔑)-eigenspace of τ, the sign of n = 1 times (−1)².
- `derivative_needs_admissible` (non-example): If ℓ | n has ℓ + 1 ≢ 0 mod π^M, then D_n c_n need not be G_n-invariant modulo π^M and κ(n) is not defined; M-admissibility is part of the construction, not a convenience.

**Acceptance.**

- κ(1) ≡ p^{3ν}c_K modulo π^M, so c_K ≠ 0 in H¹(K, V ⊗ χ^{-1}) gives κ(1) ≠ 0 for M large.
- For χ² = 1 every κ(n) lies in the ε_n-eigenspace of complex conjugation.
- The coefficient of φ_ℓ in (K2) is a unit exactly when the extra admissibility condition π^{M+B₁+1} ∤ ℓ + 1 ± a_ℓ(f)ℓ^{1−r} holds for the appropriate sign; this is why admissibility includes it.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/ring-class-anticyclotomic-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `SelmerIwasawaCohomology:L2/selmer-data`
- `tauceti:TauCeti.ContCohomology.H1`

**Sources.**

- `ch`, §7.2, from the choice of ν through (K3), pp. 29–30 (author's version): defines ν, B₁, M-admissible primes, the derivative operators and the derivative classes κ(n), and records the relations (K1)–(K3) from Nekovář's Proposition 10.2.
- `ch`, §7.2, Definition 7.2, p. 30 (author's version): defines ES(T, χ, F) by the conditions (E4) and (E5) at p.
- `ch`, §7.3, Lemma 7.5 and Proposition 7.6, p. 31; §7.4, Proposition 7.8 with footnote 5, pp. 32–33 (author's version): verifies (E4)–(E5) for generalised Heegner classes; footnote 5 states that the Lemma 7.5 step applies only to absolutely unramified extensions and points to Kobayashi–Ota for a correct argument.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RingClass`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


**Open refinements of ES.3.**

- Lemma level: Mazur–Rubin 2004 Appendix A (Lemma A.6 to Proposition A.15).
- Lemma level: Nekovář 1992 Proposition 10.2 for the ring-class relations (K1)–(K3) (gap 2).

## ES.4. Core vertices, descent and error-tolerant bounds

The Selmer graph and sheaf, locally cyclic sheaves and monodromy, Selmer lengths across an edge, core and leading vertices, the stub sheaf and the Kolyvagin-system bound; Rubin's hypotheses, index and error terms and Rubin's bound, with the finite-depth and anticyclotomic variants; localisation at abundant tuples; the self-dual descent with explicit error constants, its weak Cassels structure, module lemmas and rank-one theorem; the uniform bound for characters close to 1; Nekovář's all-prime CM-point descent; and the rational descent for ring-class anticyclotomic Euler systems.

**Layer acceptance.** Bounds state whether they concern the whole dual Selmer group, its cotorsion quotient or a Pontryagin dual; error constants are proved finite and their vanishing is stated only where proved; a uniform bound in the torsion exponent precedes passage to p-primary Selmer groups.

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

- `conductorGraph_two_prime_nonedge` (non-example): For distinct q₁,q₂, the vertices 1 and q₁q₂ are not adjacent.
- `sections_one_vertex` (degenerate): On a one-vertex graph, sections equal the sole stalk.
- `sections_ne_product` (non-example): A family whose two restrictions at an edge disagree is not a section.

**Acceptance.**

- For P = {q}: X has two vertices and one edge, and Γ(ℋ) = {(κ_1, κ_q) : (κ_q)_{q,s} = φ^fs_q(κ_1)}.
- X(P) is the 1-skeleton of the cube on P; it is connected.
- Additional arithmetic check: For P = {q₁, q₂}, X(P) is the 4-cycle 1 — q₁ — q₁q₂ — q₂ — 1.
- Additional arithmetic check: ℋ(1) = H¹_F(K, T) and ℋ̂(1) = H¹_F(K, T).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `mathlib:SimpleGraph`

**Sources.**

- `mr-ks`, Definition 3.1.2, pp. 19–20: The graph and the sheaf.
- `mr-ks`, Definition 3.1.1, p. 19: Sheaves on graphs and global sections.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Locally cyclic sheaves, hubs, monodromy and primitive sections

`EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy` — definition

**Statement.** Let S be a sheaf of R-modules on a graph X. S is locally free of rank r if all S(v), S(e) are free of rank r and all ψ_v^e are isomorphisms; locally cyclic if all S(v), S(e) are cyclic and all ψ_v^e are surjective. For S locally cyclic, a surjective path from v to w is a path (v = v₁, …, v_k = w) such that each ψ_{v_{i+1}}^{e_i} is an isomorphism; it induces a surjection ψ_P : S(v) → S(w). A vertex v is a hub if every vertex is reached from v by a surjective path. S has trivial monodromy if for surjective paths P, P′ from v to w, w′ joined by an edge e, ψ_w^e ∘ ψ_P = ψ_{w′}^e ∘ ψ_{P′}. A global section κ is primitive if κ_v generates S(v) for every v. Proposition: if S is locally cyclic and v is a hub, then Γ(S) → S(v), κ ↦ κ_v, is injective, and surjective iff S has trivial monodromy; Γ(S) is isomorphic to a submodule of the cyclic hub stalk S(v). It is isomorphic to an ideal of R if the hub stalk is free of rank one, or if R is principal artinian (every cyclic module is then isomorphic to an ideal). The ideal conclusion is false for a general complete noetherian local R; and if u is a hub and κ_u generates JS(u) for an ideal J⊆R then κ_w generates JS(w) for every w. Over a general local ring, a nonzero component at an arbitrary non-hub vertex does not suffice.

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
| `TauCeti.KolyvaginSystems.GraphSheaf.generates_of_generates` | relation | If u is a hub and κ_u generates JS(u), then κ_w generates JS(w) for every w, for any ideal J of R and S locally cyclic. Generation at an arbitrary non-hub vertex is not sufficient over a general local R. |

**Unit tests.**

- `monodromy_trivial_loop` (characterisation): Trivial monodromy forces every surjective loop transport to be the identity.
- `sections_zero_hub` (characterisation): A section of a locally cyclic sheaf vanishing at a hub is zero.
- `isPrimitive_zero_module` (degenerate): If every stalk is zero, the zero section is primitive.

**Acceptance.**

- A locally free sheaf of rank one on a connected graph is locally cyclic and every vertex is a hub.
- A locally cyclic sheaf with a hub has a primitive section iff it has trivial monodromy.
- Additional arithmetic check: If S is locally free of rank one on a connected graph then every vertex is a hub.
- Additional arithmetic check: For the constant sheaf R with identity maps on a connected graph, Γ = R and every nonzero section generating at one vertex is primitive iff it is a unit.
- Additional arithmetic check: On the triangle graph with all modules R = 𝔽₃ and all maps the identity except one vertex-to-edge map equal to −1, the sheaf is locally free of rank one but has nontrivial monodromy, Γ = 0, and evaluation at a hub is not surjective.
- Additional arithmetic check: On the one-vertex graph, take R=ℤ_p and S(v)=ℤ_p/p. The vertex is a hub and monodromy is trivial, but Γ(S)=ℤ/p cannot be isomorphic to any ideal of the domain ℤ_p. Injectivity into S(v) does not identify S(v) with an ideal.
- Additional arithmetic check: Let R=𝔽₃[[x,y]], with a two-vertex graph, hub stalk R, other stalk and edge R/(y), and edge maps quotient and identity. The section (x,x mod y) generates mS(u) at the non-hub vertex u, but x does not generate mR at the hub. Thus the arbitrary-vertex assertion of MR04 Proposition 3.4.4(iii) fails at general-local-ring scope.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`

**Sources.**

- `mr-ks`, Definition 3.4.2 and Proposition 3.4.4, pp. 26–27: Hubs, monodromy and the evaluation map.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Selmer lengths across an edge

`EulerSystemsAndKolyvaginSystems:ES.4/vertex-step` — lemma

**Statement.** Let R be principal artinian of length k and (T, F, P) satisfy (H.0)–(H.6) with P ⊆ P_k. Put λ(n, T) = length H¹_{F(n)}(ℚ, T) and λ(n, T^*) = length H¹_{F(n)^*}(ℚ, T^*). (a) λ(n, T) − λ(n, T^*) is independent of n ∈ N. (b) For nℓ ∈ N the four inclusions H¹_{F_ℓ(n)} ⊆ H¹_{F(n)}, H¹_{F(nℓ)} ⊆ H¹_{F^ℓ(n)} have cyclic cokernels of lengths c, d, a, b with 0 ≤ a, b, c, d ≤ k, a + c = b + d, a ≥ d, b ≥ c, and dually a^* + a = b^* + b = c^* + c = d^* + d = k. (c) |λ(nℓ, T) − λ(n, T)| ≤ k; if H¹_{F(n)}(ℚ, T) → H¹_f(ℚ_ℓ, T) is surjective then H¹_{F(nℓ)^*}(ℚ, T^*) = H¹_{F^ℓ(n)^*}(ℚ, T^*); the images of m^{λ(n,T^*)}H¹_{F(n)} under φ^fs_ℓ ∘ loc_ℓ and of m^{λ(nℓ,T^*)}H¹_{F(nℓ)} under loc_ℓ in H¹_s(ℚ_ℓ, T) are equal; and if both localisations H¹_{F(n)}(ℚ, T)[m] → H¹_f(ℚ_ℓ, T) and H¹_{F(n)^*}(ℚ, T^*)[m] → H¹_f(ℚ_ℓ, T^*) are nonzero then λ(nℓ, T̄) = λ(n, T̄) − 1 and λ(nℓ, T̄^*) = λ(n, T̄^*) − 1.

**Hypotheses.**

- (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

**Proof sketch.**

1. (a): Corollary 2.3.6 — by ES.0/selmer-length-difference the difference only depends on the lengths of the local conditions, and H¹_f and H¹_tr at ℓ | n have the same length (ES.1/finite-singular-comparison).
2. (b): the local modules at ℓ are free of rank one, giving the bounds; the dual relations are global duality (SelmerIwasawaCohomology L2/selmer-structure-poitou-tate) for the pairs (F(n), F^ℓ(n)) etc.
3. (c): read off from the two diamonds of inclusions.

**Acceptance.**

- For n a core vertex with λ(n, T^*) = 0 and surjective localisation at ℓ, nℓ is again a core vertex.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `SelmerIwasawaCohomology:L2`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`

**Sources.**

- `mr-ks`, Lemma 4.1.7, p. 37: How the Selmer lengths change along an edge.
- `mr-ks`, Corollary 2.3.6, p. 17: Invariance of the length difference.

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

- `isCoreVertex_dual_zero` (degenerate): A vertex of zero dual Selmer length is core.
- `not_isCoreVertex_both_positive` (non-example): If both Selmer lengths are positive, the vertex is not core.
- `isCoreVertex_free_rank` (compatibility): Under finite MR admissibility, level-zero conductor ideals and core rank 1, a core vertex has free rank-one Selmer module.

**Acceptance.**

- If H¹_{F^*}(ℚ, T^*) = 0 then 1 is a core vertex and the only leading vertex.
- The core rank computed at any core vertex equals the integer of ES.0/core-rank computed at n = 1.
- Additional arithmetic check: For χ(T) > 0, 1 is a core vertex iff H¹_{F^*}(ℚ, T^*) = 0.
- Additional arithmetic check: For R = k and χ(T) = 1, n is a core vertex iff dim H¹_{F(n)}(ℚ, T) = 1 iff H¹_{F(n)^*}(ℚ, T^*) = 0.
- Additional arithmetic check: If ν(n) < min{dim H¹_F(ℚ, T̄), dim H¹_{F^*}(ℚ, T̄^*)} then n is not a core vertex.
- Additional arithmetic check: rank H¹_{F(n)}(ℚ, T) at a core vertex equals ES.0's χ(T, F), defined from n = 1.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`

**Sources.**

- `mr-ks`, Definition 4.1.8 and Corollary 4.1.9, p. 38: Core vertices and their existence.
- `mr-ks`, Theorem 4.1.10 and Definition 4.1.11, p. 38: Freeness at core vertices and the core rank.
- `mr-higher`, §11, p. 22: Core vertices over a number field.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Leading vertices through a prescribed submodule

`EulerSystemsAndKolyvaginSystems:ES.4/leading-vertices` — theorem

**Statement.** In the setting of core-vertices suppose χ(T) > 0, 1 is not a core vertex, (H.4a) holds and the image of R → End(T) is contained in the image of ℤ_p[[G_ℚ]]. If L ⊆ H¹_F(ℚ, T) satisfies dim_k L[m] = χ(T), there are infinitely many leading vertices n with L ⊆ H¹_{F(n)}(ℚ, T). For R = k and χ(T) = 1: for every line L in H¹_F(ℚ, T) there is a leading vertex n with κ_n generating L ⊗ G_n for any nonzero κ ∈ KS(T).

**Hypotheses.**

- (H.0)–(H.6), (H.4a), image of R in End(T) inside that of ℤ_p[[G_ℚ]]

**Proof sketch.**

1. Choose homomorphisms φ_i on H¹_F(ℚ, T) with common kernel L and ψ_i on H¹_{F^*}(ℚ, T^*) with common kernel 0; ES.1/chebotarev-prescribed-kernels gives primes ℓ_i realising them; n = ∏ℓ_i is a leading vertex by vertex-step(c).

**Acceptance.**

- Fails without the End(T) hypothesis: only 𝔽_p-rational subspaces occur (Remark 4.1.17).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels`

**Sources.**

- `mr-ks`, Theorem 4.1.16, p. 39: Leading vertices through L.

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

- `stubSheaf_core_vertex` (degenerate): If the dual Selmer length at n is zero, the stub stalk is the whole stalk.
- `stubSheaf_zero_of_large` (degenerate): For admissible artinian core rank one, a dual length at least the coefficient length gives the zero stub stalk.
- `stubSheaf_field` (non-example): Over a field, a vertex with positive dual length has zero stub stalk.

**Acceptance.**

- At a core vertex with λ(n, T^*) = 0, ℋ′(n) = ℋ(n).
- For χ(T) > 1 the module KS(T) is not finitely generated (Remark 5.1.2), so the rank-one theory uses ℋ′.
- Additional arithmetic check: If λ(n, T^*) > 0 and χ(T) = 1 then ℋ′(n) ≠ ℋ(n): the stalk ℋ(n) ≅ R ⊕ H¹_{F(n)^*}(ℚ, T^*) is not cyclic.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`
- `EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy`
- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels`

**Sources.**

- `mr-ks`, Definition 4.3.1, p. 41: Definition of the stub subsheaf.
- `mr-ks`, Theorem 4.3.4, p. 41: Local cyclicity and hubs.
- `mr-ks`, Theorem 4.4.1, p. 45: Kolyvagin systems are stub sections.
- `mr-ks`, Theorem 4.2.2, p. 40: Vanishing in core rank zero.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelmerSheaf`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The Kolyvagin system bound

`EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound` — theorem

**Planet:** Kolyvagin system bound.

**Statement.** (a) (R principal artinian of length k, (H.0)–(H.6), and one of the conditions of Theorem 4.4.1, or κ sufficiently liftable.) For κ ∈ KS(T): length H¹_{F^*}(ℚ, T^*) ≤ sup{i : κ_1 ∈ m^iH¹_F(ℚ, T)} ∈ ℕ∞ (∞ when κ_1=0). (b) (R a discrete valuation ring, (H.0)–(H.5), H¹(ℚ_ℓ, T)/H¹_F(ℚ_ℓ, T) torsion-free for ℓ ∈ Σ(F), P = P_1.) For κ ∈ KS(T) put ∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(ℚ, T)} ≤ ∞. Then length_R H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ); in particular if κ_1 ≠ 0 then H¹_{F^*}(ℚ, T^*) is finite. The same holds for κ̄ ∈ K̄S(T). The bound concerns the whole dual Selmer group H¹_{F^*}(ℚ, T^*) of the discrete module T^* = Hom(T, μ_{p^∞}), not a cotorsion quotient; for κ_1 = 0 it is vacuous (∂^{(0)} = ∞).

**Hypotheses.**

- as stated in (a), (b)

**Proof sketch.**

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

- `mr-ks`, Theorem 5.2.2, p. 56: The bound over a discrete valuation ring.
- `mr-ks`, Corollary 4.4.5, p. 47: The artinian bound.

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

- `indexOfDivisibility_zero_system` (degenerate): The zero Euler system has infinite initial divisibility index.
- `HypKT.p_hilbert` (characterisation): Rubin’s τ fixes the maximal p-Hilbert class field.
- `HypKT.roots_and_units` (characterisation): The same τ fixes all p-power roots of unity and all p-power roots of global units.

**Acceptance.**

- For T = ℤ_p(1) ⊗ χ^{-1} with χ even nontrivial of order prime to p: n_W = n_W^* = 0.
- The two error terms are distinct; neither is assumed zero.
- Additional arithmetic check: If rank_O T = 1 then Hyp(K, T) holds with τ = 1.
- Additional arithmetic check: For T = O with trivial action, H¹(Ω/K, W) = Hom(Gal(Ω/K), Φ/O) is infinite: the finiteness statement excludes T = O and T = O(1).
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1) ⊗ χ^{-1}, χ ≠ 1, ω of order prime to p: H¹(Ω/ℚ, W) = H¹(Ω/ℚ, W^*) = 0, so n_W = n_W^* = 0.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `SelmerIwasawaCohomology:L2/selmer-limits`
- `SelmerIwasawaCohomology:L2/galois-selmer-group`

**Sources.**

- `rubin-es`, Chapter II §2, p. 24: The two hypothesis packages.
- `rubin-es`, Chapter II, Definition 2.1, p. 24: The index of divisibility.
- `rubin-es`, Chapter V, Lemma 3.2, p. 87: Finiteness of the error groups.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinBound`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### Rubin's bound with error terms

`EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound` — theorem

**Planet:** Rubin's bound with error terms.

**Statement.** Let c be an Euler system for T (admissible tower). (a) If p > 2 and T satisfies Hyp(K, T), then ℓ_O(S_{Σ_p}(K, W^*)) ≤ ind_O(c) + n_W + n_W^*. (b) If V satisfies Hyp(K, V), T is not the one-dimensional trivial representation and c_K ∉ H¹(K, T)_tors, then S_{Σ_p}(K, W^*) is finite (any p). (c) Let H¹_f(K_v, V), H¹_f(K_v, V^*) be orthogonal complements for v | p and loc^s_{Σ_p} : S^{Σ_p}(K, T) → H¹_s(K_p, T) = ⊕_{v|p} H¹_s(K_v, T). If loc^s_{Σ_p}(c_K) ≠ 0: under the hypotheses of (b) and [H¹_s(K_p, T) : O·loc^s_{Σ_p}(c_K)] finite, S(K, W^*) is finite; under those of (a), ℓ_O(S(K, W^*)) ≤ ℓ_O(H¹_s(K_p, T)/O·loc^s_{Σ_p}(c_K)) + n_W + n_W^*. (d) If c is trivial at a finite set Σ of primes not above p, then under the hypotheses of (a), ℓ_O(S_{Σ_p}^Σ(K, W^*)) ≤ ind_O(c) + n_W + n_W^* with n_W = ℓ_O(H¹(Ω/K, W) ∩ S_Σ^{Σ_p}(K, W)) and n_W^* as before. The constants n_W, n_W^* are independent of the torsion exponent M, so the finite-level bounds are uniform in M before passing to W^* = colim W_M^*.

**Hypotheses.**

- an Euler system for an admissible tower (or rigidity (ii)′ with T^{G_{K(1)}} = 0)
- p > 2 and Hyp(K, T) for (a); Hyp(K, V) for (b)

**Proof sketch.**

1. Fix M with ord_𝔭 M ≥ n + (k + 1)n_W + ind_O(c). ES.1/rubin-prime-selection gives primes q₁, …, q_k adapted to a generating set of S_{Σ_p}(K, W_M^*) and to the derivative classes.
2. Lemma V.2.5: for such a set Σ, the cokernel of loc^s_{Σ,W_𝔪} : S^{Σ∪Σ_p}(K, W_𝔪) → ⊕_{q∈Σ} H¹_s(K_q, W_𝔪) has length ≤ ind_O(c) + n_W; the singular parts of the derivative classes κ_{r_i,M} (ES.3/derivative-local-properties) generate a submodule of bounded index, using Corollary A.2.6 to control Q_q(Fr_q^{-1}) when coinvariants are not free (the 2b term).
3. Global duality (SelmerIwasawaCohomology L2/selmer-structure-poitou-tate): the kernel of S_{Σ_p}(K, W_M^*) → ⊕_{q ∈ Σ} H¹_f(K_q, W_M^*) is dual to that cokernel; the classes dying at all q_i lie in H¹(Ω/K, W_M^*), of length ≤ n_W^*.
4. (b): the same with the losses a + 1 of Lemma V.3.1, bounding the exponent rather than the length. (c): Corollary I.7.5 compares S(K, W^*) and S_{Σ_p}(K, W^*). (d): Theorem IX.5.3.
5. Rubin V Lemma 2.5, pp. 83–86: in the general case distinguish orders d_i after restriction to Ω from d′_i after passage to W. The loss is bounded by n_W. The filtration of derivative localizations telescopes; pass to the m-torsion submodule and retain the kernel contribution from the base class to cancel the accumulated losses. This gives cokernel length ≤ind(c)+n_W without assuming W^{G_K}=0 or H¹(Ω/K,W)=0.

**Acceptance.**

- Cyclotomic units: with n_W = n_W^* = 0 the bound is the class-group divisibility of Rubin's Chapter III.
- Each of ind_O(c), n_W, n_W^* is retained; an application may drop an error term only after proving it vanishes.
- The bound is for S_{Σ_p}(K, W^*), strict at p, not for the Bloch–Kato Selmer group; (c) is the passage to S(K, W^*).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `SelmerIwasawaCohomology:L2`
- `SelmerIwasawaCohomology:L2/selmer-limits`

**Sources.**

- `rubin-es`, Chapter II, Theorem 2.2, p. 24: The bound with error terms.
- `rubin-es`, Chapter II, Theorem 2.3, p. 24: Finiteness under Hyp(K, V).
- `rubin-es`, Chapter V, Lemma 2.5, p. 82: The key estimate on the cokernel of the singular localisation.
- `rubin-es`, Appendix A, Corollary 2.6, p. 148: The kernel and cokernel of q(σ) on W_M are bounded.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinBound`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### Bounds for the variants: finite depth and anticyclotomic systems

`EulerSystemsAndKolyvaginSystems:ES.4/variant-bounds` — theorem

**Statement.** (a) (Finite depth.) Let 0 ≠ M ∈ O and c an Euler system for W_M. Suppose Hyp(K, T) holds, n_W = n_W^* = 0 and W_M^{G_K} = 0. Let m = sup_{q ∤ p} [W^{I_q} : (W^{I_q})_div] and n the order of m·c_K in H¹(K, W_M). Then n·S_{Σ_p}(K, W_M^*) = 0; in particular if m·c_K ≠ 0 then S_{Σ_p}(K, W^*) is finite for a compatible family. (b) (Anticyclotomic.) Let c be a χ-anticyclotomic Euler system for T with H¹(Ω′/K′, W) = H¹(Ω′/K′, W^*) = 0, T ⊗ k irreducible over G_{K′}, and τ ∈ G_K with ε_cyc(τ) = χ(τ), τ^d the identity on K′(1)_χ(μ_{p^∞}, (O_{K′}^×)^{1/p^∞}) and T/(τ − 1)T free of rank one. Then for every i, 𝔭^{ind_O(c, χ^i)} S_{Σ_p}(K′, W^*)^{χ^{1−i}} = 0, where ind_O(c, χ^i) is the index of divisibility of the χ^i-component of c_{K′}. This bounds exponents of eigenspaces, not lengths.

**Hypotheses.**

- as stated

**Proof sketch.**

1. (a): derivative classes exist for systems of depth M and satisfy the finite–singular relation; the finiteness away from pr holds after multiplying by m (Corollary IV.6.5); run the argument of rubin-bound for the exponent.
2. (b): ES.3/anticyclotomic-derivative with r = 1 gives classes in the χ^{i−1}-part ramified at one prime, with ramification governed by the χ^i-part of c_{K′}; they annihilate S_{Σ_p}(K′, W^*)^{χ^{1−i}} by global duality.

**Acceptance.**

- For d = 1, (b) is the exponent form of rubin-bound with zero error terms.
- For Heegner points (d = 2) the induction to a length bound uses T^* ≅ T and is carried out in ES.5/howard-dvr-theorem.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.3/anticyclotomic-derivative`
- `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-classes-unramified` (its own target since the whole-roadmap pass; the step was part of this proof sketch)

**Sources.**

- `rubin-es`, Chapter IX, Theorem 3.3, p. 137: The finite-depth bound.
- `rubin-es`, Chapter IX, Theorem 4.3, p. 139: The anticyclotomic exponent bound.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinBound`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### Module lemmas for the self-dual induction over a discrete valuation ring *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.4/self-dual-module-induction` — theorem

**Statement.** Let R be a discrete valuation ring with uniformiser π and finite residue field. For a finitely generated torsion R-module X write X ≅ ⊕_{i=1}^{s(X)} R/π^{d_i(X)} with d₁(X) ≥ ⋯ ≥ d_{s(X)}(X) > 0 and exp(X) = d₁(X) (exp(0) = 0). (a) If N ⊆ M then s(N) ≤ s(M) and d_i(N) ≤ d_i(M) for 1 ≤ i ≤ s(N). (b) Consider exact sequences 0 → X → R/π^k ⊕ M → R/π^{k−a} ⊕ R/π^b → 0 and 0 → X → R/π^k ⊕ M′ → R/π^{a′} ⊕ R/π^{k−b′} → 0 of finite R-modules, where M and M′ are each a direct sum of two isomorphic modules, 2s = dim M[π], 2s′ = dim M′[π], k > exp(M) + 2a and a′ ≤ a. Fix M = ⊕_{i=1}^{2s} M_i with M_i ≅ R/π^{d_i(M)} and d₁(M) = d₂(M) ≥ d₃(M) = d₄(M) ≥ ⋯. Then (i) s − 1 ≤ s′ ≤ s + 1; (ii) b ≤ exp(M); (iii) exp(X) ≤ exp(M) + a; (iv) if s > 0 there is an index 1 ≤ i₀ ≤ 2s with ⊕_{i ≠ i₀} M_i ↪ X, while if s = 0 only the trivial injection 0 ↪ X is asserted; (v) there is an injection X ↪ M′ ⊕ R/π^{exp(X)}; (vi) d_i(M′) ≥ d_{i+2}(M) for 1 ≤ i ≤ 2s − 2 (an empty range when s ≤ 1).

**Hypotheses.**

- R a discrete valuation ring; all modules finitely generated and torsion
- for (b): the two exact sequences, M and M′ doubled modules, k > exp(M) + 2a and a′ ≤ a

**Proof sketch.**

1. (a): s(N) = dim N[π] ≤ dim M[π]; induct on s(N) by passing to N/N[π^d] ⊆ M/M[π^d] with d = d_{s(N)}(N), and count dim N[π^d]/N[π^{d−1}] ≤ dim M[π^d]/M[π^{d−1}].
2. (i): the minimal number of generators changes by at most one across each sequence, by (a); (ii): since k − a > exp(M), the free summand R/π^k maps onto a summand of order max(k − a, b), so M surjects onto R/π^{min(k−a, b)}; (iii): X/(X ∩ R/π^k) embeds in M and X ∩ R/π^k ≅ R/π^a.
3. (iv): when s > 0, the image of the map in the first sequence is R/π^{k−a} plus the image of one summand M_{i₀}, so X surjects onto ⊕_{i≠i₀} M_i, and Pontryagin self-duality of finite R-modules turns this into an injection; when s = 0 no index is chosen (the printed statement omits this case: PAPER-CASTELLA-ETAL-22/E43 in the register of source mistakes).
4. (v): the free summand maps onto R/π^{k−b′}: the order o of the image of 1 satisfies o > a′ because k − o ≤ exp(X) < k − a′, and o ≤ max(a′, k − b′) (the printed argument names the wrong module, PAPER-CASTELLA-ETAL-22/E28); then X is an extension of a cyclic module by M″ ⊆ M′ and duality gives the injection. (vi) combines (iv), (v) and (a).

**Acceptance.**

- N = R/π ⊆ M = R/π² ⊕ R/π (N the socle of the first summand): s(N) = 1 ≤ 2 and d₁(N) = 1 ≤ 2.
- With M = 0 (s = 0) the first sequence forces b = 0 and X ≅ R/π^a, and (iv) asserts nothing beyond 0 ↪ X; there is no summand to omit.
- The doubling hypothesis makes dim M[π] even, so s is an integer; the self-dual Cassels structure of ES.4/weak-cassels-structure supplies it.

**Prerequisites.**

- `mathlib:Module.equiv_directSum_of_isTorsion`
- `mathlib:Module.length`
- `mathlib:IsDiscreteValuationRing`

**Sources.**

- `cgls`, §3.3.2, Lemma 3.3.9 and its proof, p. 22 (arXiv v2): monotonicity of the invariants of finitely generated torsion modules under inclusion.
- `cgls`, §3.3.2, (3.11)–(3.13), Lemma 3.3.10 and Proposition 3.3.11, pp. 22–23 (arXiv v2): the two exact sequences of the induction step and the comparison of the doubled modules M and M′.

**Suggested library placement:** `TauCeti/Algebra/Module/DVRInvariants`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Localisation at abundant tuples with bounded loss

`EulerSystemsAndKolyvaginSystems:ES.4/abundant-localization` — theorem

**Statement.** Setting of ES.1/abundant-tuples. (a) (Uniform annihilation.) Let R be a lattice with R_ℚ^𝔠 ≅ R_ℚ^∨(1), pure of weight −1 at every nonarchimedean place not above ℓ. For every finite set Σ of places there is m_Σ ≥ 1 such that for every saturated free submodule S of the Bloch–Kato Selmer module with images S^{(m)} modulo λ^m and every m > m_Σ, loc_w(λ^{m_Σ}S^{(m)}) = 0 for every nonarchimedean w ∈ Σ not above ℓ. (b) (Corrected Proposition 2.6.7.) Let S be free of rank r over O_λ/λ^{m−m₀} and (Ψ₁, …, Ψ_r) an (S, γ)-abundant tuple realised by γ-associated places w_i. Put c = 𝔣(r)d_R and let A be the matrix of s ↦ (θ_S(Ψ_i)(s))_i in a basis e₁, …, e_r of S, after identifying the λ^{m−m₀}-torsion of (R̄^{(m)})^{h_γ} with O_λ/λ^{m−m₀}; abundance says that the image of A contains λ^c(O_λ/λ^{m−m₀})^r. Then there is an integral matrix C with AC = CA = λ^c·I in the finite coefficient ring, and the elements s_j = Ce_j ∈ S satisfy loc_{w_i}(s_j) = 0 for i ≠ j and exp_λ(loc_{w_i}(s_i), H¹_ns(F_{w_i}, R̄^{(m)})) ≥ m − m₀ − 𝔣(r)d_R; the s_j span a submodule containing λ^{𝔣(r)d_R}S and form a basis of S when 𝔣(r)d_R = 0. For r = 2 and a primitive v ∈ S one can moreover choose a primitive t ∈ S with loc_{w₁}(t) = 0 and exp_λ(loc_{w₂}(t)) ≥ m − m₀ − 𝔣(2)d_R after possibly interchanging the two places. The printed statement (a basis for every abundant tuple) is false when the loss is positive.

**Hypotheses.**

- as in ES.1/abundant-tuples
- for (a): the purity and polarisation hypotheses

**Proof sketch.**

1. (a): local cohomology H¹_ns at w ∤ ℓ of a pure weight −1 lattice is finite, of exponent bounded independently of m; saturation makes S^{(m)} free and its localisation factor through the torsion of the local group.
2. (b): linear algebra over the discrete valuation ring: use Smith normal form over the DVR: if c < m−m₀, each nonzero diagonal exponent is at most c, giving an integral scaled inverse of a suitable lift and a reduction C with AC=CA=λ^cI; if c ≥ m−m₀ take C=0. An arbitrary matrix over the finite quotient need not be invertible there; for r = 2 take t = (−u₂, u₁) from the first row π^a(u₁, u₂) of A. The localisation statement follows because loc_{w_i} on S factors through θ_S(Ψ_i) (evaluation at Frobenius, ES.1/finite-singular-decomposition).

**Acceptance.**

- With d_R = 0: a basis of S diagonalising the localisations, with exp ≥ m − m₀: the clean statement.
- The linear-algebra step of the printed form fails when the loss is positive: for A = (λ, 1; 0, λ) over O_λ/λ^n with n ≥ 3, whose image contains λ²(O_λ/λ^n)², there is no basis s₁, s₂ with A(s_j) supported on the j-th coordinate, since that would write A = D·B with D diagonal and B invertible, and the second row (0, λ) forces det B ∈ λO_λ. The corrected statement uses the scaled inverse C = λ²A^{-1} = (λ, −1; 0, λ).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`
- `SelmerIwasawaCohomology:L2`
- `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuple-existence` (its own target since the whole-roadmap pass; the step was part of this proof sketch)

**Sources.**

- `ltxzz`, Proposition 2.4.6(2), arXiv v3 p. 17: Uniform annihilation of localisations.
- `ltxzz`, Proposition 2.6.7, arXiv v3 p. 20: The printed statement, corrected here (PAPER-LIU-ETAL-22/E2 in the register of source mistakes).
- `ltxzz`, Proposition 2.4.6(2), published pp.130–131; Proposition 2.6.7, published pp.134–135: Published-version collation of the stated result, expressed here in our own words.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.


### Cassels structure without residual irreducibility

`EulerSystemsAndKolyvaginSystems:ES.4/weak-cassels-structure` — theorem

**Statement.** In the elliptic anticyclotomic setting of ES.4/howard-descent-with-errors, assume E(K)[p]=0, cartesianness of the propagated ordinary conditions and the symmetric conjugate-self-dual local pairing of CGLS §3.3. For each k≥1 and n∈N^(k), there is a finite R/m^k-module M^(k)(n) and ε∈{0,1}, independent of k and n, such that H¹_{F_ord(n)}(K,T_α/m^kT_α) ≃ (R/m^k)^ε ⊕ M^(k)(n) ⊕ M^(k)(n). The residual representation may be reducible. This is the specialized weak-hypothesis pairing and parity input; it does not assert the full Howard rigidity theorem under these weaker hypotheses. The anticyclotomic character α is residually trivial.

**Hypotheses.**

- E/K, p, R, α and T_α are exactly the setting of CGLS §3.2; p∤2N, good ordinary reduction, disc(K) prime to Np.
- E(K)[p]=0; ordinary conditions cartesian; conjugate self-duality as in CGLS §3.3.
- α is congruent to the trivial character modulo the maximal ideal of R, as in CGLS §3.2 (arXiv v2 p.17).

**Proof sketch.**

1. The invariant/torsion identifications use CGLS Lemma 3.3.1, which uses vanishing residual invariants rather than irreducibility.
2. Apply the Cassels pairing argument of Howard Theorem 1.4.2 and the parity argument of Proposition 1.5.5 using only invariant vanishing, cartesianness and the symmetric conjugate-self-dual conditions actually used in those proofs. CGLS Proposition 3.3.2 verifies these hypotheses in the residually trivial ordinary twist setting.
3. Howard Lemma 1.5.3 gives parity invariance under the same weak hypotheses; CGLS explicitly records independence of k and n.

**Acceptance.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `SelmerIwasawaCohomology:L2`

**Sources.**

- `cgls`, Proposition 3.3.2 and Lemma 3.3.1, arXiv v2 pp. 18–19: The weaker structure and invariant hypotheses.
- `howard`, Theorem 1.4.2, pp. 1448–1450; Lemma 1.5.3 and Proposition 1.5.5, pp. 1450–1451: Pairing and parity proof used with the hypotheses specified by CGLS.


### Rank one from a nonzero Kolyvagin class, with an explicit exponent bound *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.4/rank-one-from-nonzero-class` — theorem

**Statement.** In the setting of ES.1/twist-error-constants with α ≠ 1, let (T, F, 𝓛) = (T_α, F_ord, 𝓛_E), e_α = r(C₁ + C₂ + C_α), and let ε ∈ {0, 1} and M^{(k)}(n) be as in ES.4/weak-cassels-structure. If κ ∈ KS(T, F, 𝓛) has κ₁ ≠ 0 in H¹(K, T), then ε = 1, H¹_F(K, T) ≅ R, and for k ≫ 0 every element of M^{(k)}(1) has order < k. Quantitatively, let s = ind(κ₁) be the largest j with κ₁ ∈ m^j H¹_F(K, T); for every k > s + 3e_α, writing the image of κ₁ in H¹_F(K, T^{(k)}) as π^s c₁, the quotient H¹_F(K, T^{(k)})/Rc₁ is killed by π^{s+3e_α}, so exp M^{(k)}(1) ≤ ind(κ₁) + 3e_α.

**Hypotheses.**

- the setting of ES.1/twist-error-constants, α ≠ 1, p odd
- κ a Kolyvagin system for (T_α, F_ord, 𝓛_E) with κ₁ ≠ 0

**Proof sketch.**

1. For k large the image of κ₁ in H¹_F(K, T^{(k)}) is nonzero with the same index s; write it as π^s c₁ with Rc₁ ≅ R^{(k)}. Let c₂ ∉ Rc₁ and d the order of its image modulo Rc₁, so Rc₁ + Rc₂ ⊇ R^{(k)} ⊕ π^{k−d}R^{(k)}.
2. ES.1/error-tolerant-chebotarev(b) gives ℓ ∈ 𝓛^{(k)} with ord(loc_ℓ c₁) ≥ k − e_α and R·loc_ℓ c₁ + R·loc_ℓ c₂ ⊇ π^{e_α}R^{(k)} ⊕ π^{k−d+2e_α}R^{(k)}.
3. The finite–singular relation gives ord(loc^s_ℓ κ_ℓ) = ord(loc_ℓ κ₁) ≥ k − s − e_α, with κ_ℓ ∈ H¹_{F(ℓ)}(K, T^{(k)}) (the source writes H¹_F: PAPER-CASTELLA-ETAL-22/E25). Global duality between T_α and T_{α^{-1}} (complex conjugation maps κ_ℓ to the α^{-1}-side relaxed group), with loc_ℓ of H¹_F and loc^s_ℓ of the relaxed group exact annihilators (ES.1/transverse-duality), yields k − s − e_α ≤ k − d + 2e_α, so d ≤ s + 3e_α.
4. Hence H¹_F(K, T^{(k)})/Rc₁ is killed by π^{k−1} when k > s + 3e_α, which forces ε ≤ 1; ε = 0 is excluded directly (c₁ of order k in M^{(k)}(1)^{⊕2} would give an element of order k in the quotient), replacing the source's unjustified torsion-freeness step (PAPER-CASTELLA-ETAL-22/E11). The index is the largest j with κ₁ ∈ m^j H¹ (the printed parenthetical is a misprint, PAPER-CASTELLA-ETAL-22/E26).

**Acceptance.**

- With ρ_E surjective (C₁ = C₂ = 0, so e_α = rC_α), the bound reads exp M^{(k)}(1) ≤ ind(κ₁) + 3rC_α.
- If κ₁ = 0 the theorem says nothing; the stub theory of ES.4/stub-sheaf is needed for systems with vanishing bottom class.
- The quantitative exponent bound is the base case n₀ = 1 of the induction in ES.4/howard-descent-with-errors.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.1/error-tolerant-chebotarev`
- `EulerSystemsAndKolyvaginSystems:ES.1/twist-error-constants`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.4/weak-cassels-structure`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`

**Sources.**

- `cgls`, §3.3.1, Theorem 3.3.8 and its proof, (3.8)–(3.10), pp. 21–22 (arXiv v2): a nonzero Kolyvagin class forces ε = 1 and rank one, with π^{s+3e} killing the quotient by the first class.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Self-dual descent with explicit error constants

`EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors` — theorem

**Statement.** (Castella–Grossi–Lee–Skinner, Theorem 3.2.1.) Let E/ℚ be an elliptic curve of conductor N, p ∤ 2N a prime of good ordinary reduction, K an imaginary quadratic field of discriminant prime to Np with E(K)[p] = 0, Γ the Galois group of the anticyclotomic ℤ_p-extension, R the integers of a finite extension Φ/ℚ_p, α : Γ → R^× a character with α ≠ 1, T_α = T_pE ⊗ R(α), A_α = T_α ⊗ Φ/R, and F_ord the ordinary Selmer structure. If κ_α ∈ KS(T_α, F_ord, 𝓛_E) has κ_{α,1} ≠ 0, then H¹_{F_ord}(K, T_α) has rank one and H¹_{F_ord}(K, A_α) ≅ (Φ/R) ⊕ M_α ⊕ M_α with M_α finite and length_R(M_α) ≤ length_R(H¹_{F_ord}(K, T_α)/R·κ_{α,1}) + E_α, where E_α ≥ 0 depends only on C_α, T_pE and rank_{ℤ_p}R. Here C_α = v_p(α(γ) − α^{-1}(γ)) if α ≠ α^{-1} and 0 otherwise, C_1 = min{v_p(u − 1) : u ∈ ℤ_p^× ∩ im ρ_E|_{G_{K_∞}}}, C_2 is minimal with p^{C_2}End(T_pE) ⊆ ρ_E(ℤ_p[G_ℚ]), and e = rank_{ℤ_p}(R)(C_1 + C_2 + C_α). Inputs: (i) for c₁, c₂, c₃ ∈ H¹(K, T^{(k)}) with Rc₁ + Rc₂ ⊇ 𝔪^{d₁}R^{(k)} ⊕ 𝔪^{d₂}R^{(k)} there are infinitely many ℓ ∈ 𝓛^{(k)} with ord(loc_ℓ c₃) ≥ ord(c₃) − e and R·loc_ℓc₁ + R·loc_ℓc₂ ⊇ 𝔪^{d₁+d₂+2e}(R^{(k)})²; (ii) if N ⊆ M are finitely generated torsion R-modules then their invariant factors satisfy d_i(N) ≤ d_i(M). When ρ_E|_{G_K} is surjective the error can be taken zero; the stronger Howard theorem is a comparison, not a prerequisite of the residual-reducible proof. Residual irreducibility is not assumed. The anticyclotomic character α is residually trivial.

**Hypotheses.**

- as stated; in particular α ≠ 1 and (h1) E(K)[p] = 0
- α is congruent to the trivial character modulo the maximal ideal of R, as in CGLS §3.2 (arXiv v2 p.17).

**Proof sketch.**

1. Use ES.4/weak-cassels-structure (CGLS Proposition 3.3.2): residual-invariant vanishing, cartesian ordinary conditions and conjugate self-duality suffice; no Howard absolute residual irreducibility is assumed.
2. (i) replaces ES.1/chebotarev-nonvanishing: restriction to the field cut out by T^{(k)} has kernel killed by p^{C_1}-type constants, and the O-span of the image of Galois is controlled by C_2 and C_α.
3. Induction on the number of primes as in Howard's proof, using (ii) and the module lemmas 3.3.10–3.3.11; in the branch M = 0 the canonical injection 0 ↪ X is used and no summand is omitted (PAPER-CASTELLA-ETAL-22/E43 in the register of source mistakes).
4. The length of M_α is bounded, not only its exponent.

**Acceptance.**

- E_α = 0 when ρ_E is surjective on G_K.
- The bound is uniform in k: the constants C_1, C_2, C_α do not depend on the torsion exponent.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/weak-cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `EulerSystemsAndKolyvaginSystems:ES.1/twist-error-constants` (its own target since the whole-roadmap pass; the step was part of this proof sketch)
- `EulerSystemsAndKolyvaginSystems:ES.1/error-tolerant-chebotarev` (its own target since the whole-roadmap pass; the step was part of this proof sketch)
- `EulerSystemsAndKolyvaginSystems:ES.4/self-dual-module-induction` (its own target since the whole-roadmap pass; the step was part of this proof sketch)
- `EulerSystemsAndKolyvaginSystems:ES.4/rank-one-from-nonzero-class` (its own target since the whole-roadmap pass; the step was part of this proof sketch)

**Sources.**

- `cgls`, Theorem 3.2.1, arXiv v2 p. 17: The bound with the error constant.
- `cgls`, Proposition 3.3.6, arXiv v2 p. 19: The Chebotarev statement with error terms.
- `cgls`, Lemma 3.3.9, arXiv v2 p. 22: The module lemma used in the induction.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.ErrorTolerant`. Implementation status: `unchecked`.


### Kolyvagin bounds with error independent of the twist, for characters close to 1 *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.4/uniform-near-trivial-bound` — theorem

**Planet:** Uniform Kolyvagin bound near the trivial character.

**Statement.** In the setting of ES.1/twist-error-constants: (a) there are integers M₀, E ≥ 0 depending only on T_pE and rank_{ℤ_p} R such that, for every nontrivial anticyclotomic α ≡ 1 mod π^m with m ≥ M₀ and every κ ∈ KS(T_α, F_ord, 𝓛_E) with κ₁ ≠ 0, H¹_{F_ord}(K, T_α) has R-rank one and H¹_{F_ord}(K, A_α) ≅ Φ/R ⊕ M ⊕ M with length_R(M) ≤ length_R(H¹_{F_ord}(K, T_α)/Rκ₁) + E. The error E does not depend on m, in contrast with E_α of ES.4/howard-descent-with-errors, which grows as α → 1. (b) (Rescaled systems; R = ℤ_p.) Let 𝓛 ⊆ 𝓛_E contain 𝓛_e = {ℓ : a_ℓ ≡ ℓ + 1 ≡ 0 mod p^e} for e ≫ 0. Suppose {κ̃_n ∈ H¹(K, T_α/I_nT_α)}_{n∈N(𝓛)} is a family with κ̃₁ ≠ 0 and that for some t ≥ 0, independent of n, {p^t κ̃_n} is a Kolyvagin system for (T_α, F_ord, 𝓛); the family {κ̃_n} itself need not be one. Then there are M₀, E depending only on T_pE such that for m ≥ M₀, H¹_{F_ord}(K, T_α) has ℤ_p-rank one and H¹_{F_ord}(K, A_{α^{-1}}) ≅ ℚ_p/ℤ_p ⊕ M ⊕ M with length(M) ≤ length(H¹_{F_ord}(K, T_α)/ℤ_p κ̃₁) + E; the error is independent of t, and E = 0 when ρ_E is surjective. (c) The same statement as (a) holds for the self-dual twist of the Galois lattice of a weight-2r newform at an Eisenstein prime, with C₁ defined through scalar matrices in its image.

**Hypotheses.**

- the setting of ES.1/twist-error-constants; α nontrivial with α ≡ 1 mod π^m
- for (b): R = ℤ_p, 𝓛 ⊇ 𝓛_e for e ≫ 0, and a fixed t ≥ 0 with {p^t κ̃_n} a Kolyvagin system

**Proof sketch.**

1. Rank one: ES.4/rank-one-from-nonzero-class; its proof gives M^{(k)}(1) ≅ M₀ for k > ind(κ₁) + 3r(C₁ + C₂ + m), so the CGLS error, which contains C_α ≈ m, cannot be used directly for the bound.
2. Bound: work on the π^m-torsion H¹_{F(n)}(K, T^{(m)}) ≅ H¹_{F(n)}(K, T^{(k)})[π^m], where complex conjugation acts; use ES.1/error-tolerant-chebotarev(c), whose loss e = r(C₁ + C₂) does not involve C_α, to choose primes n₀ = 1, n₁, …, inductively, with additional conditions (f)–(g) that decrease the number of summands of the π^m-torsion not bounded by multiples of e; the module lemmas of ES.4/self-dual-module-induction control each step.
3. (b): choose f ≫ 0 with κ̃₁ ≢ 0 mod p^f and 𝓛_{f+t} ⊆ 𝓛; the classes κ̃_n give a nontrivial Kolyvagin system modulo p^f for 𝓛_{f+t}, and the inductive argument needs only ord(loc_ℓ κ̃_ℓ) = ord(loc_ℓ κ̃₁) ≥ ord(κ̃₁) − e at the first prime, which follows from the relation for p^tκ̃ once k > t + f.
4. (c): the argument is axiomatic in the error constants; for weight 2r the constant C₁ comes from the existence of nontrivial scalar matrices in the open image of the Galois representation (Keller–Yin, Lemma 3.0.3).

**Acceptance.**

- For ρ_E surjective, (b) with t = 0 recovers Howard's bound for the Heegner Kolyvagin system with no error term.
- Applied at α = α_m ≡ 1 mod π^m with m → ∞ and combined with control theorems, (a) yields the divisibility at the augmentation prime of ES.8/augmentation-prime-divisibility.
- (a) is stated only for α close to 1; for α far from 1 the bound of ES.4/howard-descent-with-errors applies with error E_α.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/rank-one-from-nonzero-class`
- `EulerSystemsAndKolyvaginSystems:ES.4/self-dual-module-induction`
- `EulerSystemsAndKolyvaginSystems:ES.4/weak-cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.1/error-tolerant-chebotarev`
- `EulerSystemsAndKolyvaginSystems:ES.1/twist-error-constants`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`

**Sources.**

- `cgs`, §6.1, Theorem 6.1.1, p. 22, and §6.4, its proof, pp. 24–28 (arXiv v2): the Kolyvagin bound for characters close to 1 with error independent of m.
- `bcgs`, §1.3, Theorem 1.3.1 with proof and Remark 1.3.2, pp. 15–16 (arXiv v2): the extension to families whose fixed p^t-multiple is a Kolyvagin system, with error independent of t and zero under residual surjectivity.
- `ky`, §3, Theorem 3.0.2 and Lemma 3.0.3, pp. 35–36 (arXiv v2): the same bound for weight 2r newforms at Eisenstein primes, the only new input being the constant C₁.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/ErrorTolerant`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### All-prime CM-point descent with bounded error

`EulerSystemsAndKolyvaginSystems:ES.4/nekovar-all-prime-descent` — theorem

**Statement.** Fix the data of Nekovář §3.1: a totally real field F, a quaternion algebra B split at one real place, the smooth compactification N_H^* of its Shimura curve, an F-simple GL₂-type quotient A_j of J(N_H^*) with End_F(A_j)=O_{L_j} and the nontrivial Hecke-linear morphism specified in §3.1, a totally imaginary quadratic K/F admitting an embedding into B, a CM point x, and a finite character α of Gal(K(x)/K) valued in O_L with L⊇L_j. Let β be its faithful factor on H=K(α), and use the O_L-linear tensor variety A=A_j⊗_{O_{L_j}}O_L and trace point y of §3.5, with the polarization and Weil pairing of §5.19. Assume A_j acquires no CM over any totally imaginary quadratic extension of F contained in H, and e_β(y) is non-torsion. For each prime ideal 𝔭 of O_L above any rational prime p, choose O_𝔭 and a uniformizer ϖ. There is C(𝔭)≥0, independent of M and zero for all but finitely many 𝔭, such that ϖ^{C(𝔭)}·(S(A/H,A[ϖ^M])^(β)/O_𝔭 κ₁)=0 for all sufficiently large M. Here κ₁=ϖ^{C₁(𝔭)}δ(e_β(y)), and ϖ is the chosen uniformizer, as in §7.2.1. There is no residual irreducibility or odd-prime restriction. The statement is an annihilator/exponent bound, not an equality of lengths or a square-index formula.

**Hypotheses.**

- Exactly the CM-point and GL₂-type setting of §3.1, including the quaternion embedding and the non-CM condition (*).
- e_β(y) non-torsion; p arbitrary; M sufficiently large for the fixed arithmetic data.

**Proof sketch.**

1. Constants C₀ (point divisibility), C₁ (local component groups), C₂ (restriction kernel), C₃ (order/image conductor), C₄ (overlap of β and β⁻¹), C₅=ord_𝔭[H:K], and C₆=ord_𝔭 deg(ϕ) depend on fixed data and 𝔭, not M. Sections 6.1–6.4 bound the restriction and pairing cokernels uniformly.
2. For β²=1 the two annihilation relations of Proposition 7.2.3, detected at successive Chebotarev primes, give C=2C₀+2C₁+4C₂+4C₃+C₅+C₆+21 ord_𝔭(2) (§7.5).
3. For β²≠1, §7.6.4 chooses the second prime using the five-coordinate determinant-avoidance argument of Proposition 6.6.2. The resulting bound is C=4C₀+4C₁+7C₂+7C₃+5C₄+2C₅+2C₆+38 ord_𝔭(2).
4. Every error constant vanishes at almost all 𝔭. ES.4 supplies this finite-level annihilator bound to HeegnerPointEulerSystems HE.7; that owner passes to Mordell–Weil and Sha finiteness in Nekovář Theorem 3.2 using §7.1.2. Noncommutative maximal-order algebra in Proposition 6.4.3 is the exact CA.7 supplier request, not the commutative L6 theory.

**Acceptance.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.
- The Lean prototype uses geometric torsion points, their O_L-action, the coefficient completion and the finite Selmer kernel. Nekovář §3.1/§5.19 geometry and condition (*) are explicitly omitted from the prototype because their supplier carrier has no pinned signature; the mathematical statement retains them. The prototype parameters alone are not sufficient hypotheses for the source theorem.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`
- `SelmerIwasawaCohomology:L2`
- `ClassicalArithmeticCompletion:CA.7/existence-of-maximal-orders`
- `ClassicalArithmeticCompletion:CA.7`
- `HeegnerPointEulerSystems:HE.7`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `nekovar`, Theorem 3.2, pp. 18–19; §3.5, p. 19; §5.19, pp. 33–34; Proposition 6.4.3, pp. 38–40; Theorem 7.3 and §§7.4–7.6, pp. 45–51 (author copy): CM-point finiteness and uniform annihilator bounds including p=2.


### Rational Kolyvagin descent for ring-class anticyclotomic Euler systems *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.4/rational-anticyclotomic-descent` — theorem

**Statement.** In the setting of ES.3/ring-class-derivative-classes, assume Hypothesis (H)(a)–(c) of Castella–Hsieh §6: p ∤ 2(2r − 1)!Nφ(N); every prime dividing N splits in K, and, if r > 1, either D_K > 3 is odd or 8 | D_K (existence of a canonical CM elliptic curve); and (c_o, N) = 1. (a) If c ∈ ES(T, χ, F) has c_K ≠ 0 in H¹(K, V ⊗ χ^{-1}), then Sel_{F*}(K, V ⊗ χ) = Φ·c_K^τ, Φ = O[1/p]: the Selmer group of V ⊗ χ with local condition F* at p is the line spanned by the conjugate of the bottom class. (b) (Complementary local class.) Suppose further that p = 𝔭𝔭̄ splits in K, f is ordinary at p and χ has infinity type (j, −j) with j ≥ r, and let z^χ be the χ-specialisation of the Iwasawa class of generalised Heegner cycles. If loc_p(z^{χ^{-1}}) ≠ 0, then the Bloch–Kato Selmer group Sel(K, V ⊗ χ) vanishes. The statement is rational: it bounds the Φ-dimension, not the length of an integral Selmer module.

**Hypotheses.**

- Castella–Hsieh Hypothesis (H)(a)–(c): p ∤ 2(2r − 1)!Nφ(N); every prime dividing N splits in K, with D_K > 3 odd or 8 | D_K when r > 1; (c_o, N) = 1
- c ∈ ES(T, χ, F) with c_K non-torsion; for (b) additionally p split in K, f ordinary, j ≥ r

**Proof sketch.**

1. Image lemmas: with H♭ the maximal pro-p subextension of K_{c_o} in the ring class field cutting out χ mod π^M, ℚ^{ker ρ*_f} ∩ H♭ = ℚ (a p-ramified abelian subextension of K_{c_o p^∞} is ℚ or ℚ(√p*)), so ρ*_f(G_ℚ) = ρ*_f(G_{H♭}); B₂ = min{n : π^n M₂(O) ⊆ O[ρ*_f(G_ℚ)]} bounds the failure of R_ρ-submodules to be large, and Nekovář's lemmas give π^{(2^{s+1}−2)B₂}V_S ⊆ O[G_S] for the Galois group cut out by an s-generated submodule S.
2. Prime selection: π^{B₁} kills H¹(Gal(L/K), T_M ⊗ χ^{-1}) (a scalar in the image), and Chebotarev gives infinitely many inert ℓ with prescribed Frobenius g ∈ G_S^+ that are M-admissible.
3. Descent: with B₃ the divisibility of c_K, B₄ = 0 if χ² = 1 and min ord_π(χ²(σ) − 1) otherwise, C₁ = 6B₂ + B₁ + B₃ + B₄ and M > 2C₁ + 2B₁, choose ℓ₁ with ord_π α_{ℓ₁}(κ(1)) ≤ C₁ and then a second prime making the pair (κ(1), κ(ℓ₁)) large; the relations (K1)–(K3) and global duality bound Sel_{F*}(K, T_M ⊗ χ)/(O·κ(1)^τ) by a constant independent of M, which gives (a) after inverting p.
4. (b): apply (a) to the specialisations of the Iwasawa classes, with F the orthogonal complement of the line spanned by loc_v(z^χ) at v | p, and use the Poitou–Tate sequence; for j ≥ r the Bloch–Kato condition is relaxed at one prime above p and strict at the other. The verification that these classes satisfy (E5) uses a corestriction step that the authors correct in the footnote to Proposition 7.8.

**Acceptance.**

- For χ = 1, r = 1 and Heegner points, (a) is the rational form of Kolyvagin's theorem: a non-torsion Heegner point spans the Selmer group of V = V_pE over Φ.
- If c_K is torsion the theorem gives nothing; the integral exponent bound needs the error-tolerant theory of this layer.
- (b) concludes vanishing from the nonvanishing of a local class, not of c_K itself: it is the rank-zero companion of (a).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/ring-class-derivative-classes`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `ch`, §7.2, Theorem 7.3, p. 30 (author's version): the Selmer group with the dual local condition is the line spanned by the conjugate of the nonzero bottom class.
- `ch`, §7.5, Lemmas 7.10–7.16 and the descent argument, pp. 33–37 (author's version): the image lemmas with the constant B₂, the selection of admissible primes and the descent with constants B₁–B₄.
- `ch`, §7.4, Theorem 7.9 and its proof, p. 33 (author's version); §6, Hypothesis (H), p. 1: the vanishing of the Bloch–Kato Selmer group from a nonzero local class via Poitou–Tate, and the standing hypotheses.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RingClass`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


**Open refinements of ES.4.**

- Lemma level: Mazur–Rubin 2004 Lemmas 4.3.8–4.3.9, Propositions 4.3.10–4.3.11, Theorem 4.3.12, Theorem 4.4.3 and Appendix B; Rubin Chapter V §2 general case of Lemma 2.5.
- Lemma level: the inductive conditions (a)–(g) of the proofs of Castella–Grossi–Lee–Skinner Theorem 3.2.1 and Castella–Grossi–Skinner Theorem 6.1.1, with the recorded CGLS corrections (gap 4).
- Lemma level: Castella–Hsieh Lemmas 7.10–7.16 and the image lemmas of Nekovář 1992 §12 (gap 2).
- Fulfil CA.7's maximal-order pairing-cokernel bound and HE.7's geometric input dictionary (carried from the ES.0 part); Kolyvagin's classical square-index theorem remains open (gap 3).

## ES.5. Primitivity and sharpness over DVRs

Mazur–Rubin's divisibility indices, elementary divisors and primitivity, the rank-one module theorem, the structure theorem for the dual Selmer group, the Kolyvagin-constructed dual Selmer group and the sharpness examples; Howard's self-dual hypotheses, Cassels structure, stub modules and DVR bound; and the self-dual refinements: simultaneous localisation of eigenclasses, rigidity at core vertices, the divisibility profile with primitivity, and the exact structure theorem.

**Layer acceptance.** Scaling a system by ϖ raises its index by one and destroys primitivity without changing the Selmer group; a system with vanishing leading class is a system but certifies nothing; equality needs primitivity, not only κ₁ ≠ 0.

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

- `divIndex_zero_order` (degenerate): The zero system has infinite order.
- `divIndex_zero_artinian` (degenerate): In a length-k artinian ring, the zero system has partial invariant k at every nonempty conductor-size level.
- `divIndex_scaling` (computation): Over a DVR with torsion-free size-zero stalks, initial index 3 becomes 5 after multiplication by π².

**Acceptance.**

- Over a DVR under rank-one admissibility, ∂^{(r)}(πκ)=∂^{(r)}(κ)+1 and e_i(πκ)=e_i(κ) for their finite range. Over length-k artinian rings the values truncate at k, so elementary divisors need not remain unchanged.
- The order uses threshold ∞ over a DVR and k over an artinian ring.
- Additional arithmetic check: For κ=0 over a DVR, ∂^{(r)}=∞ for all r; over a principal artinian ring of length k, ∂^{(r)}=k. In both cases ord(κ)=∞ and κ is not primitive.
- Additional arithmetic check: For R = k a field, κ is primitive iff κ ≠ 0.
- Additional arithmetic check: Over a DVR, for primitive κ₀ with (κ₀)_1≠0, πκ₀ has nonzero initial class and is not primitive. In an artinian quotient the initial class can be killed by π, so nonvanishing must be checked separately.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf`
- `mathlib:Module.length`

**Sources.**

- `mr-ks`, Definition 5.2.11, pp. 57–58: The invariants over a discrete valuation ring.
- `mr-ks`, Definition 4.5.5, p. 49: Primitivity.
- `mr-ks`, Definition 4.5.7, p. 49: The artinian invariants.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Primitivity`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Kolyvagin systems in core rank one

`EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem` — theorem

**Planet:** Rank-one freeness of Kolyvagin systems.

**Statement.** Let (T, F, P) satisfy (H.0)–(H.6) with χ(T) = 1. (a) R principal artinian of length k: KS(T) is free of rank one over R; for a core vertex n, κ ↦ κ_n is an isomorphism KS(T) ≅ ℋ(n); if κ_m ≠ 0 generates m^jℋ′(m) then κ_n generates m^jℋ′(n) for every n; for j ≥ k restriction KS(T, P) → KS(T, P ∩ P_j) is an isomorphism; for j ≤ k reduction KS(T) → KS(T/m^jT) is surjective; and KS(T) → K̄S(T) is an isomorphism. (b) R a discrete valuation ring, (H.0)–(H.5), torsion-free local quotients, P = P_1: KS(T) ≅ lim_k KS(T/m^kT, P_k) ≅ K̄S(T), and KS(T) is free of rank one, generated by a primitive κ. If χ(T) = 0 then KS(T) = 0 in both cases; if χ(T) ≥ 2 and R is artinian, KS(T) contains free modules of every rank.

**Hypotheses.**

- (H.0)–(H.6) (artinian), or (H.0)–(H.5) with torsion-free local quotients (discrete valuation ring)
- χ(T) = 1 for the main statements

**Proof sketch.**

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

- `mr-ks`, Corollary 4.5.2, p. 48: The artinian statement.
- `mr-ks`, Theorem 5.2.10, p. 57: The statement over a discrete valuation ring.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Primitivity`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Structure of the dual Selmer group from a Kolyvagin system

`EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem` — theorem

**Planet:** Structure theorem for the dual Selmer group.

**Statement.** Let χ(T) = 1 and 0 ≠ κ ∈ KS(T). (a) R = k a field: dim KS(T) = 1, κ_n ≠ 0 iff n is a core vertex, and dim_k H¹_{F^*}(ℚ, T^*) = ord(κ). (b) R principal artinian of length k, κ_1 ≠ 0: ∂^{(0)}(κ) ≥ ∂^{(1)}(κ) ≥ ⋯, e_0(κ) ≥ e_1(κ) ≥ ⋯ ≥ 0 and H¹_{F^*}(ℚ, T^*) ≅ ⊕_{i ≥ 0} R/m^{e_i(κ)}; if κ is primitive and κ_1 ≠ 0 then length H¹_{F^*}(ℚ, T^*) = k − length(Rκ_1) = max{i : κ_1 ∈ m^iH¹_F(ℚ, T)}, and if κ_1 = 0 then length H¹_{F^*}(ℚ, T^*) ≥ k. (c) R a discrete valuation ring: ∂^{(s)}(κ) is nonincreasing and finite for s ≥ ord(κ); the e_i(κ) are nonincreasing, nonnegative and independent of κ ≠ 0, as is ord(κ); corank_R H¹_{F^*}(ℚ, T^*) = ord(κ); H¹_{F^*}(ℚ, T^*)/(H¹_{F^*}(ℚ, T^*))_div ≅ ⊕_{i ≥ ord(κ)} R/m^{e_i(κ)}; its length is ∂^{(ord κ)}(κ) − ∂^{(∞)}(κ); and κ is primitive iff ∂^{(∞)}(κ) = 0. Hence: length H¹_{F^*}(ℚ, T^*) is finite iff κ_1 ≠ 0; length H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ) with equality iff κ is primitive; and length H¹_{F^*}(ℚ, T^*) = length(H¹_F(ℚ, T)/L(T)) for the module of L-values L(T).

**Hypotheses.**

- the hypotheses of rank-one-module-theorem in each case
- χ(T) = 1

**Proof sketch.**

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

- `mr-ks`, Theorem 5.2.12, p. 58: The structure theorem over a discrete valuation ring.
- `mr-ks`, Corollary 5.2.13, p. 58: Sharpness under primitivity.
- `mr-ks`, Theorem 4.5.9, p. 50: The artinian structure theorem.

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

- `kolyvaginDualSelmer_one` (degenerate): The finite dual edge presentation at conductor one is zero.
- `kolyvaginDualSelmer_zero_system` (computation): For κ=0, the presentation is the direct sum of the designated edge modules.
- `kolyvaginDualSelmer_scaled_edge` (non-example): A free DVR edge modulo multiplication by its uniformizer is nonzero; a scaled nonprimitive system cannot force that edge quotient to vanish.

**Acceptance.**

- The construction recovers the Pontryagin dual of the whole dual Selmer group, as a module, from the classes κ_n.
- For a non-primitive κ the map need not be surjective.
- Additional arithmetic check: For κ = πκ₀ with κ₀ primitive and H¹_{F^*}(ℚ, T^*) = 0, Sel^*(κ; ℓ) = S(e_ℓ)/πS(e_ℓ) ≠ 0 at a core edge, so the map from 0 is not surjective.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `SelmerIwasawaCohomology:L2`
- `SelmerIwasawaCohomology:L2/pontryagin-dual`

**Sources.**

- `mr-ks`, Definition 3.3.1, p. 25: Definition of Sel^*(κ; n).
- `mr-ks`, Theorem 4.5.12, p. 51: The isomorphism under primitivity.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Primitivity`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Scaling, vanishing leading class and a non-primitive arithmetic system

`EulerSystemsAndKolyvaginSystems:ES.5/sharpness-examples` — application

**Statement.** (a) Scaling: for κ primitive with κ_1 ≠ 0 over a discrete valuation ring (χ(T) = 1), length H¹_{F^*}(ℚ, T^*) = ∂^{(0)}(κ); for κ′ = πκ, ∂^{(0)}(κ′) = ∂^{(0)}(κ) + 1 > length H¹_{F^*}(ℚ, T^*), the e_i are unchanged and κ′ is not primitive: the bound for κ′ is true and not sharp. (b) A nonzero Kolyvagin system with κ_1 = 0 is a valid element of KS(T); for it ∂^{(0)} = ∞, the bound is vacuous, and by the structure theorem H¹_{F^*}(ℚ, T^*) is infinite when χ(T) = 1. For κ=0 the bound remains vacuous and gives no finiteness conclusion. (c) Kato's Kolyvagin system for T_pE: if L(E, 1) ≠ 0, p satisfies the hypotheses of Mazur–Rubin 2004 Theorem 6.2.4(ii) and p divides a Tamagawa factor c_ℓ for some ℓ ≠ p, then κ^{Kato} is not primitive: it is a Kolyvagin system for the finer structure F_u with unramified conditions away from p, whose dual Selmer group is larger by the Tamagawa defect. The defect is recorded as a length.

**Hypotheses.**

- χ(T) = 1; for (c) the hypotheses of Theorem 6.2.4(ii) of the source

**Proof sketch.**

1. (a), (b): ES.5/divisibility-invariants and ES.5/structure-theorem. (c): Remark A.5 — the classes lie in H¹_{(F_u)(n)}; apply the bound for F_u and compare H¹_{F_u^*} with H¹_{F_can^*}.

**Acceptance.**

- A nonzero point or class is not automatically primitive.
- Sharpness is a property of the system, checked through reduction modulo m, not of the representation.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`
- `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`

**Sources.**

- `mr-ks`, Proposition 6.2.6, p. 75: A naturally occurring non-primitive system.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Primitivity`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Howard's self-dual Selmer triples and hypotheses H.0–H.5

`EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses` — definition

**Planet:** Howard's hypotheses H.0–H.5.

**Statement.** Let K be an imaginary quadratic field, τ a complex conjugation, R a coefficient ring (complete noetherian local, finite residue field of characteristic p; in §1.5 principal artinian, in §1.6 a discrete valuation ring) and T an R-module with continuous G_K-action. 𝓛₀ is the set of rational primes ℓ inert in K (prime to p and to the ramification of T), λ the prime of K above ℓ; I_ℓ is the smallest ideal of R containing ℓ + 1 for which Fr_λ acts trivially on T/I_ℓT; 𝓛_k = {ℓ ∈ 𝓛₀ : I_ℓ ⊆ p^kR}; G_ℓ = k_λ^×/k_ℓ^×; I_n = Σ_{ℓ | n} I_ℓ and G_n = ⊗_{ℓ | n} G_ℓ. The transverse condition at λ is defined by the maximal p-subextension of K[ℓ]_λ/K_λ, K[ℓ] the ring class field of conductor ℓ. A Selmer triple (T, F, 𝓛) has 𝓛 ⊆ 𝓛₀ disjoint from Σ(F); Kolyvagin systems κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n, n ∈ N(𝓛), satisfy the finite–singular relations at every ℓ with nℓ ∈ N(𝓛). Hypotheses: H.0 T is free of rank two. H.1 T̄ is absolutely irreducible. H.2 there is a Galois extension F/ℚ containing K with G_F acting trivially on T and H¹(F(μ_{p^∞})/K, T̄) = 0. H.3 F is cartesian on Quot(T) at every v ∈ Σ(F). H.4 there is a perfect symmetric R-bilinear pairing ( , ) : T × T → R(1) with (s^σ, t^{τστ^{-1}}) = (s, t)^σ, and F is its own exact orthogonal complement under the induced pairings H¹(K_v, T) × H¹(K_{v̄}, T) → R. H.5 (a) the action of G_K on T̄ extends to G_ℚ and τ splits T̄ into one-dimensional eigenspaces T̄^±; (b) F on T̄ is stable under G_ℚ; (c) the residual pairing satisfies (s^τ, t^τ) = (s, t)^τ.

**Hypotheses.**

- K imaginary quadratic
- p odd

**Construction.**

1. Howard Proposition 1.1.7 gives finite and transverse rank-two local conditions when the inert conductor ideal vanishes. Its ring-class restriction kernel and k_λ×/k_ℓ× reciprocity comparison are imported from HE.0 and CFT. They are distinct from the rank-one-coinvariant Mazur–Rubin polynomial construction; do not instantiate that construction at an inert rank-two prime.
2. Howard Remark 1.3.1 supplies admissible scalar changes and Lemma 1.5.1 supplies modification at primes whose conductor ideal vanishes. The prototype makes same-coefficient modification with I_n=0 and scalar quotient R/I explicit; arbitrary coefficient changes require the corresponding dictionary and retained hypotheses.
3. For R = ℤ_p, T = T_pE and (s, t) = e(s, t^τ) with e the Weil pairing, H.4 holds (Remark 1.3.2).

**Uses that determine the API.**

- Howard, Theorems 1.6.1 and 2.2.10: the standing hypotheses of the self-dual descent
- HeegnerPointEulerSystems HE.5–HE.6; GeneralizedHeegnerCycles GH.5: applications verify H.0–H.5 for their representation and import the theorem

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses` | structure | The record H.0–H.5, one field for each hypothesis, with the pairing of H.4 as data. |
| `TauCeti.KolyvaginSystems.SelfDual.inertPrimes` | data | 𝓛_k(T) for k ≥ 0 and the ideals I_ℓ ∋ ℓ + 1. |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.modify` | functoriality | For n with inert conductor ideal I_n=0, the same-coefficient modification preserves H.0–H.5. |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.baseChange` | functoriality | Admissible quotient R→R/I preserves the displayed Howard hypotheses, with explicit propagated local structures. |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.ofWeilPairing` | example | The Weil pairing combined with conjugation constructs the perfect symmetric pairing data; local exact self-orthogonality is a separate hypothesis for H.4. |

**Unit tests.**

- `SelfDual.conductorIdeal_one` (degenerate): The inert conductor-one ideal is zero.
- `SelfDual.tame_group_inert` (computation): At a rational inert prime ℓ, k_λ×/k_ℓ× has order ℓ+1, not ℓ²−1.
- `SelfDual.conductorIdeal_inert` (characterisation): For q above an inert ℓ in 𝓛_k, ℓ+1 lies in pᵏR.

**Acceptance.**

- These hypotheses differ from Mazur–Rubin's by the self-duality H.4 and by the absence of an analogue of (H.4a)/(p > 4): they are a separate record.
- With H.4, χ-type invariants are replaced by the parity ε ∈ {0, 1} of ES.5/cassels-structure.
- Additional arithmetic check: For ℓ ∈ 𝓛_k and R = ℤ/p^k, H¹_f(K_λ, T) and H¹_tr(K_λ, T) are free of rank two, in contrast with rank one at Mazur–Rubin's primes.
- Additional arithmetic check: An inert prime ℓ ∈ 𝓛_k is not in Mazur–Rubin's P_k for K: T/(Fr_λ − 1)T is free of rank two, not one.
- Additional arithmetic check: For R a field H.3 is automatic.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`

**Sources.**

- `howard`, §1.3, hypotheses H.0–H.5, p. 1446: The hypothesis list.
- `howard`, §1.3, hypothesis H.4, p. 1446: The self-duality hypothesis.
- `howard`, Definition 1.2.3, p. 1445: Kolyvagin systems over an imaginary quadratic field.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### The generalised Cassels pairing and the structure R^ε ⊕ M ⊕ M

`EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure` — theorem

**Statement.** Let K be imaginary quadratic, p odd, and R a coefficient ring that is principal artinian of length k and (T, F, 𝓛) satisfy H.1, H.3 and H.4 (with vanishing residual invariants). (a) For positive integers s, t with s + t ≤ k there is a pairing ( , )_{s,t} : H¹_F(K, T/m^sT) × H¹_{F^*}(K, T^*[m^t]) → R whose left and right kernels are the images of H¹_F(K, T/m^{s+t}T) and of π^s : H¹_{F^*}(K, T^*[m^{s+t}]) → H¹_{F^*}(K, T^*[m^t]). (b) There are an R-module M and ε ∈ {0, 1} with H¹_F(K, T) ≅ R^ε ⊕ M ⊕ M. (c) Under H.0–H.5 with 𝓛 ⊆ 𝓛_k, for n ∈ N(𝓛) write H¹_{F(n)}(K, T) ≅ R^ε ⊕ M(n) ⊕ M(n); then ε ≡ ρ(n) = ρ(n)^+ + ρ(n)^− (mod 2), where ρ(n)^± = dim H¹_{F(n)}(K, T̄)^±, and ε is independent of n: if loc_ℓ(H̄(n)^±) ≠ 0 then ρ(nℓ)^± = ρ(n)^± − 1, and otherwise ρ(nℓ)^± = ρ(n)^± + 1.

**Hypotheses.**

- K imaginary quadratic; p odd; H.1, H.3, H.4 with vanishing residual invariants; R a principal-artinian coefficient ring.
- H.0–H.5 and 𝓛 ⊆ 𝓛_k for (c)

**Proof sketch.**

1. (a): Flach's construction of the Cassels–Tate pairing by lifting cocycles; the kernels by global duality.
2. (b): with H=H¹_F(K,T), for 1≤s<k the spaces V_s=H[m^s]/mH[m^{s+1}] have alternating pairings whose radical is V_{s−1}, by Howard Theorem 1.4.2, H.4 and the torsion identifications. The quotients V_s/V_{s−1} carry nondegenerate alternating pairings and are even-dimensional; induction gives even dimension of V_s for 0≤s<k. The free length-k summands are not subject to this parity constraint; their multiplicity is absorbed into M up to its parity. The finite-module structure theorem then gives the doubled nonfree summand and ε∈{0,1}.
3. (c): Lemma 1.5.3 by global duality for F_ℓ(n) ≤ F(n), F(nℓ) ≤ F^ℓ(n) on each eigenspace.

**Acceptance.**

- For T = E[p^k] with the classical structure: Sel_{p^k} ≅ (ℤ/p^k)^ε ⊕ M ⊕ M.
- Self-duality replaces the core rank: ε is a parity, not a rank difference.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `SelmerIwasawaCohomology:L2`

**Sources.**

- `howard`, Proposition 1.4.1, p. 1448: The pairing.
- `howard`, Theorem 1.4.2 and its proof, pp. 1448–1450: Alternating successive-quotient pairings and the doubled-module structure.
- `howard`, Lemma 1.5.3, p. 1450: Parity is constant on the graph.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Stub Selmer modules in the self-dual setting

`EulerSystemsAndKolyvaginSystems:ES.5/howard-stub` — theorem

**Statement.** In the setting of cassels-structure(c) put λ(n) = length M(n) and the stub Selmer module S(n) = m^{λ(n)}H¹_{F(n)}(K, T). Then for nℓ ∈ N(𝓛): loc_ℓ(S(n)) = 0 implies loc_ℓ(S(nℓ)) = 0. Moreover, with a, b, δ ≥ 0 the lengths in Howard's Lemma 1.5.8 for the diamond of H_ℓ(n) ⊆ H(n), H(nℓ) ⊆ H^ℓ(n), one has λ(nℓ) = λ(n) + k − a − b − δ.

**Hypotheses.**

- H.0–H.5, R principal artinian of length k, 𝓛 ⊆ 𝓛_k

**Proof sketch.**

1. H^ℓ(n)/(H(n) + H(nℓ)) ≅ (R/m^δ)² (Lemma 1.5.7) and the local modules are free of rank two; compare lengths in the diamond as in ES.4/vertex-step, using the structure R^ε ⊕ M ⊕ M at both vertices.

**Acceptance.**

- This is the self-dual replacement for ES.4/vertex-step(c) and Lemma 4.2.1 of Mazur–Rubin.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`

**Sources.**

- `howard`, Definition 1.5.4, p. 1451: The self-dual stub module.
- `howard`, Proposition 1.5.9, proof, p. 1452: Vanishing of localisation propagates along an edge.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Simultaneous localisation of eigenclasses in Howard's self-dual setting *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.5/self-dual-eigenspace-localisation` — theorem

**Statement.** Let K be imaginary quadratic, R principal artinian of length k with residue characteristic p, and (T, F, 𝓛) a Selmer triple such that (T, F) and (T*, F*) satisfy H.0–H.5 of ES.5/howard-hypotheses, with 𝓛 ⊆ 𝓛_k(T). (a) Let s ≥ 1 and c₁, …, c_n ∈ H¹(K, T) nonzero classes with c_i in the ε_i-eigenspace of complex conjugation τ. If p > n, a positive proportion of primes ℓ ∈ 𝓛_s(T) satisfy loc_ℓ(c_i) ≠ 0 for every i. (b) Let p > 3, H(n) = H¹_{F(n)}(K, T), ρ(n)^± = dim_{R/m} H(n)[m]^± and r(n) = max(ρ(n)⁺, ρ(n)⁻). If n ∈ N(𝓛) has r(n) > 1 and 0 ≠ c ∈ H(n), a positive proportion of ℓ ∈ 𝓛_s(T) satisfy loc_ℓ(c) ≠ 0 and r(nℓ) < r(n).

**Hypotheses.**

- H.0–H.5 for (T, F) and (T*, F*); 𝓛 ⊆ 𝓛_k(T)
- (a): p > n; (b): p > 3

**Proof sketch.**

1. (a): with F the field of H.2 and L the Galois closure of K(T/m^s, μ_{p^s}) over ℚ, restriction H¹(K, T) → Hom(G_L, T)^{Gal(L/K)} is injective by H.2. Each c_i cuts out E_i/L with an F_p-vector space G_i = Gal(E_i/L) split into τ-eigenspaces; c_i is nonzero on G_i^+ because otherwise R·c_i(G_i) would be a proper G_K-submodule contradicting H.1 and H.5(a).
2. The bad sets H_i = {η ∈ G_L^+ : c_i(η) = 0} have Haar measure at most 1/p, so for p > n their union is not everything; write a good η as (τσ)² and use Chebotarev for Frobenius τσ in Gal(E₁⋯E_n/ℚ); such ℓ lie in 𝓛_s(T) as in Mazur–Rubin, Lemma 3.5.6(i). This is Howard's Lemma 1.6.2 argument with n classes.
3. (b): if both ρ(n)^± ≥ 1 apply (a) to classes in H(n)⁺, H(n)⁻ and a multiple of c in H(n)[m] (three classes, so p > 3), and use Howard's parity Lemma 1.5.3 to get ρ(nℓ)^± = ρ(n)^± − 1; if ρ(n)^∓ = 0 apply (a) to two classes.

**Acceptance.**

- For n = 1 and p > 1, (a) is the single-class Chebotarev selection in each eigenspace.
- For n = 4, (a) requires p > 4, which is why the connectivity of core vertices in ES.5/self-dual-core-vertex-rigidity assumes p > 4.
- Iterating (b) from any n reaches a core vertex (r = 1) in at most r(n) − 1 steps.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Sources.**

- `zanarella`, §2.2, Lemma 2.2.10 and its proof, pp. 15–16 (arXiv v1): simultaneous nonvanishing of localisations of n eigenclasses for p > n, following Howard's Lemma 1.6.2.
- `zanarella`, §2.2, Corollary 2.2.11, pp. 16–17 (arXiv v1): a prime that keeps a class nonzero and lowers r(n), for p > 3.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems.SelfDual`. Implementation status: `unchecked`.


### Rigidity of self-dual Kolyvagin systems at core vertices *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.5/self-dual-core-vertex-rigidity` — theorem

**Statement.** Let R be principal artinian of length k with p > 4, (T, F, 𝓛) as in ES.5/self-dual-eigenspace-localisation with ε = 1 in the Cassels decomposition of ES.5/cassels-structure (odd rank), and 𝓛 ⊇ 𝓛_s(T) for some s ≥ 1. A core vertex is n ∈ N with ρ(n) = 1, equivalently H¹_{F(n)}(K, T) ≅ R. (a) For a core vertex n and nℓ ∈ N the following are equivalent: nℓ is a core vertex; loc_ℓ is injective on H(n); loc_ℓ is injective on H(nℓ); loc_ℓ H(n) ≠ 0; loc_ℓ H(nℓ) ≠ 0; and then (loc^s_ℓ)^{-1} ∘ φ^fs_ℓ ∘ loc_ℓ : H(n) → H(nℓ) is an isomorphism. (b) The graph of core vertices, with edges n — nℓ, is connected. (c) For every κ ∈ KS(T, F, 𝓛) there is 0 ≤ d ≤ k with κ_nR = m^d H(n) at every core vertex n, and d = k iff κ = 0.

**Hypotheses.**

- R principal artinian, p > 4, H.0–H.5 for (T, F) and (T*, F*), odd rank, 𝓛 ⊇ 𝓛_s(T)

**Proof sketch.**

1. (a): the kernels of loc_ℓ on H(n), H(nℓ) are the strict-at-ℓ groups, which are killed by m (Howard, Lemma 1.3.3); with H(n) ≅ R cyclic and ρ(n)^± = 1, Howard's parity Lemma 1.5.3 shows nℓ is a core vertex iff loc_ℓ H(n)^± ≠ 0; φ^fs_ℓ exchanges the τ-eigenspaces. As a corollary, κ_n and κ_{nℓ} generate isomorphic modules along an edge (Kolyvagin relation).
2. (b): induct on ν(lcm(n, m)) − ν(gcd(n, m)); if nℓ is not a core vertex, ES.5/self-dual-eigenspace-localisation(a) with four classes (p > 4) gives r with nrℓ, nr and mr core vertices, joining n to m by paths.
3. (c): (a) and (b) give the common d; if d = k then every κ_n vanishes, by induction on r(n) using ES.5/self-dual-eigenspace-localisation(b) and the Kolyvagin relation.

**Acceptance.**

- For R = R/m (k = 1), (c) says κ_n ≠ 0 at one core vertex iff at all core vertices.
- (c) is the self-dual analogue of Mazur–Rubin's rigidity at core vertices (ES.4/core-vertices, ES.5/rank-one-module-theorem); it does not assume core rank one over ℚ.
- Without p > 4 the connectivity argument in (b) has no prime satisfying the four localisation conditions; the theorem is not claimed for p = 3.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/self-dual-eigenspace-localisation`
- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-stub`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`

**Sources.**

- `zanarella`, §2.2, Proposition 2.2.8 and Corollary 2.2.9, pp. 14–15 (arXiv v1): equivalent criteria for neighbouring core vertices and the isomorphism H(n) ≅ H(nℓ).
- `zanarella`, §2.2, Theorem 2.2.12, Corollary 2.2.13 and Proposition 2.2.14, pp. 17–18 (arXiv v1): connectivity of the core-vertex graph for p > 4, the common index d at core vertices, and d = k iff κ = 0.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems.SelfDual`. Implementation status: `unchecked`.


### Divisibility profile and primitivity of self-dual Kolyvagin systems *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.5/self-dual-divisibility-profile` — definition

**Statement.** Let R be a discrete valuation ring with p > 4 and (T, F, 𝓛) a Selmer triple over an imaginary quadratic K with (T, F) and (T*, F*) satisfying H.0–H.5 (ES.5/howard-hypotheses) and 𝓛 ⊇ 𝓛_s(T) for some s ≥ 1. For κ ∈ KS(T, F, 𝓛) and k ≥ 1 let κ^{(k)} be its reduction in KS(T^{(k)}, F, 𝓛^{(k)}), H^{(k)}(n) = H¹_{F(n)}(K, T^{(k)}), and ρ(n) the residual Selmer rank of ES.5/self-dual-eigenspace-localisation. Define: (i) for n ∈ N, M(n) = ind(κ_n) = max{j : κ_n ∈ m^j H¹(K, T/I_nT)} (∞ if κ_n = 0), M_r = min{M(n) : ν(n) = r} and M_∞(κ) = lim_{r→∞} M_r, which exists because M_r ≥ M_{r+1}; (ii) ∂^{(∞)}(κ) = min{max{a : κ_n^{(k)} ∈ m^a H^{(k)}(n)} : n ∈ N^{(k)}}; (iii) d(κ) = min{max{a : κ_n^{(k)} ∈ m^a H^{(k)}(n)} : ρ(n) = 1, n ∈ N^{(k)}}, independent of k. κ is primitive if ∂^{(∞)}(κ) = 0, equivalently if its reduction in KS(T/mT, F, 𝓛) is nonzero. Properties: d(κ) ≥ ∂^{(∞)}(κ); d(κ) = 0 if and only if κ is primitive; d(κ) = ∞ if and only if κ = 0; and κ_n^{(k)}R^{(k)} = m^{d(κ)+length(M^{(k)}(n))}H^{(k)}(n) for n ∈ N^{(2k−1)}. In the anticyclotomic elliptic setting with residual surjectivity, d(κ) = M_∞(κ) whenever κ₁ ≠ 0. Moreover, in the anticyclotomic elliptic setting of ES.1/twist-error-constants with residual surjectivity and p ≥ 3, the stable index can be computed on any 𝓛_e = {ℓ : a_ℓ ≡ ℓ + 1 ≡ 0 mod p^e} ⊆ 𝓛 with e ≫ 0: M_{∞,N(𝓛_e)}(κ) = M_{∞,N(𝓛)}(κ). This extends ES.5/divisibility-invariants from Mazur–Rubin's systems over ℚ to Howard's self-dual systems over K.

**Hypotheses.**

- R a discrete valuation ring, p > 4; H.0–H.5 for (T, F) and (T*, F*); 𝓛 ⊇ 𝓛_s(T)
- for the computation on 𝓛_e: the elliptic anticyclotomic setting with residual surjectivity and p ≥ 3

**Construction.**

1. Independence of k for d(κ): by ES.5/self-dual-core-vertex-rigidity there are d_k with κ_n^{(k)}R^{(k)} ≅ m^{d_k}R^{(k)} at every core vertex n ∈ N^{(k)}; d_k ≤ d_{k+1}, with equality when d_k < k; d(κ) = lim d_k.
2. The formula on N^{(2k−1)} is proved by induction on k + max(ρ(n)⁺, ρ(n)⁻) using ES.5/self-dual-eigenspace-localisation(b), the Kolyvagin relation, ES.5/howard-stub and the stub refinement loc_ℓ(m^d S(n)) = 0 ⇔ loc_ℓ(m^d S(nℓ)) = 0.
3. d(κ) = 0 ⇔ primitive: if κ^{(1)} ≠ 0 some κ_n^{(1)} ≠ 0 and the formula with k = 1 forces d = 0. d(κ) = ∞ ⇔ κ = 0 by the vanishing criterion of ES.5/self-dual-core-vertex-rigidity. The identification with M_∞ uses the core-vertex computation of the refined structure theorem (BCGS, proof of Theorem 2.2.2).
4. Computation on 𝓛_e: if the minimum M_r is attained at n with a prime ℓ₀ | n outside 𝓛_e, take the residual eigencomponent κ̄^s of κ_n^{(δ+1)} and a nonzero class c of the opposite eigenspace with no condition at ℓ₀ (global duality, as in ES.1/residual-two-class-detection(b)); ES.1/error-tolerant-chebotarev(c), with zero loss under residual surjectivity, gives ℓ ∈ 𝓛_e with loc_ℓ κ̄^s ≠ 0 and loc_ℓ c ≠ 0. The Kolyvagin relations and the sum of local pairings of c with κ̄_ℓ over ℓ and ℓ₀ show M(nℓ/ℓ₀) = M(n); repeat.

**Uses that determine the API.**

- Zanarella, Theorem 2.3.6 and Theorem 2.4.5: the error term d(κ) in the exact length formula and its boundedness under Λ-adic deformation
- Burungale–Castella–Grossi–Skinner, Theorems 2.2.2 and B: M_∞(κ) in the refined Kolyvagin conjecture length 2(M₀ − M_∞)
- HeegnerPointEulerSystems HE.6/primitivity-versus-nonzero and HE.8/heegner-divisibility-profile: primitivity and the divisibility profile of the Heegner system

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.SelfDual.index` | data | M(n) = ind(κ_n), with value ∞ when κ_n = 0. |
| `TauCeti.KolyvaginSystems.SelfDual.minIndex` | data | M_r = min{M(n) : ν(n) = r}, antitone in r. |
| `TauCeti.KolyvaginSystems.SelfDual.stableIndex` | data | M_∞(κ) = lim_r M_r(κ). |
| `TauCeti.KolyvaginSystems.SelfDual.coreDivisibility` | data | d(κ), the common index at core vertices. |
| `TauCeti.KolyvaginSystems.SelfDual.IsPrimitive` | characterisation | κ is primitive iff its reduction mod m is a nonzero Kolyvagin system iff d(κ) = 0. |
| `TauCeti.KolyvaginSystems.SelfDual.coreDivisibility_eq_top_iff` | simp | d(κ) = ∞ iff κ = 0. |
| `TauCeti.KolyvaginSystems.SelfDual.coreDivisibility_smul` | simp | d(πκ) = d(κ) + 1. |
| `TauCeti.KolyvaginSystems.SelfDual.stableIndex_eq_coreDivisibility` | compatibility | In the anticyclotomic elliptic setting with residual surjectivity, if κ₁ ≠ 0 then M_∞(κ) = d(κ). |
| `TauCeti.KolyvaginSystems.SelfDual.isPrimitive_iff_divisibilityInvariants` | compatibility | For systems that are Mazur–Rubin systems in core rank one, primitivity agrees with ES.5/divisibility-invariants. |

**Unit tests.**

- `coreDivisibility_zero` (degenerate): For κ = 0, d(κ) = M_∞(κ) = ∞.
- `coreDivisibility_scaled` (computation): If κ is primitive then d(π^aκ) = a and π^aκ is primitive only for a = 0.
- `primitive_not_nonzero_bottom` (non-example): A system with κ₁ ≠ 0 need not be primitive: π·κ for primitive κ has nonzero bottom class but d = 1. Primitivity is not equivalent to κ₁ ≠ 0.
- `primitive_residual` (characterisation): κ is primitive iff some κ_n has nonzero image in H¹(K, T/mT) ⊗ G_n.

**Acceptance.**

- Scaling: d(πκ) = d(κ) + 1 and πκ is not primitive.
- κ = 0 has d = ∞, M_∞ = ∞ and ∂^{(∞)} = ∞.
- For the Heegner Kolyvagin system of E/K of analytic rank one, d(κ) = ∂^{(∞)}(κ) follows from ES.5/self-dual-structure-theorem and Kolyvagin's Theorem D (Zanarella, Remark 2.3.5).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-stub`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`
- `EulerSystemsAndKolyvaginSystems:ES.5/self-dual-eigenspace-localisation`
- `EulerSystemsAndKolyvaginSystems:ES.5/self-dual-core-vertex-rigidity`
- `EulerSystemsAndKolyvaginSystems:ES.1/residual-two-class-detection`
- `EulerSystemsAndKolyvaginSystems:ES.1/error-tolerant-chebotarev`
- `EulerSystemsAndKolyvaginSystems:ES.1/twist-error-constants`

**Sources.**

- `zanarella`, §2.3, Lemma 2.3.1, Definition 2.3.2 and Propositions 2.3.3–2.3.4, pp. 18–20 (arXiv v1): the invariants d(κ) and ∂^{(∞)}(κ), primitivity, and the criteria d = 0 iff primitive and d = ∞ iff κ = 0.
- `bcgs`, §2.2.1, definitions of M(n), M_{r,N′} and M_∞, pp. 16–17; Lemma 2.2.4, p. 18 (arXiv v2): the divisibility profile M(n), M_r, M_∞ and the formula for κ_n^{(k)} on N^{(2k−1)}.
- `bcgs`, §2.2.2, Proposition 2.2.1, p. 17, and its proof, pp. 17–18 (arXiv v2): independence of the stable index from the choice of the subset 𝓛_e of Kolyvagin primes.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems.SelfDual`. Implementation status: `unchecked`.


### Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring

`EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem` — theorem

**Planet:** Howard's self-dual Kolyvagin bound.

**Statement.** Let R be a discrete valuation ring with fraction field Φ, D = Φ/R, (T, F, 𝓛) a Selmer triple satisfying H.0–H.5 with 𝓛_s(T) ⊆ 𝓛 for s large, and A = T ⊗ D with the propagated structure. If there is a Kolyvagin system κ ∈ KS(T, F, 𝓛) with κ_1 ≠ 0, then H¹_F(K, T) is free of rank one over R and there is a finite R-module M with H¹_F(K, A) ≅ D ⊕ M ⊕ M and length_R(M) ≤ length_R(H¹_F(K, T)/R·κ_1). The conclusion is about the discrete module A: its corank is one and its cotorsion quotient is M ⊕ M, so its length is twice that of M, bounded by twice the index of κ_1. This is the single owner of the self-dual descent used for Heegner points and for generalised Heegner cycles; the Λ-adic version (Howard, Theorem 2.2.10) belongs to layer ES.8.

**Hypotheses.**

- H.0–H.5
- 𝓛_s(T) ⊆ 𝓛 for s ≫ 0
- κ_1 ≠ 0

**Proof sketch.**

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

- `howard`, Theorem 1.6.1, p. 1453: The theorem.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems`. Implementation status: `unchecked`.


### Exact length of the Tate–Shafarevich module from a self-dual Kolyvagin system *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.5/self-dual-structure-theorem` — theorem

**Planet:** Kolyvagin's structure theorem.

**Statement.** Let R be a discrete valuation ring with fraction field Φ, D = Φ/R, (T, F, 𝓛) a Selmer triple over an imaginary quadratic K with (T, F) and (T*, F*) satisfying H.0–H.5, p > 4 and 𝓛 ⊇ 𝓛_s(T) for some s ≥ 1. If κ ∈ KS(T, F, 𝓛) has κ₁ ≠ 0, then H¹_F(K, T) is free of rank one, H¹_F(K, A) ≅ D ⊕ M ⊕ M for a finite R-module M, and length_R(M) = length_R(H¹_F(K, T)/R·κ₁) − d(κ), with d(κ) of ES.5/self-dual-divisibility-profile. In particular length_R(M) ≤ length_R(H¹_F(K, T)/R·κ₁), with equality iff κ is primitive. In the elliptic setting of Burungale–Castella–Grossi–Skinner (anticyclotomic twists T_pE ⊗ R(α) with α ≡ 1 mod m^m, p > 3 and residual surjectivity), where d(κ) = M_∞(κ), this reads length_R Ш(W_{α^{-1}}/K) = 2(M₀(κ) − M_∞(κ)) with M₀(κ) = ind(κ₁) and M_∞(κ) the stable index.

**Hypotheses.**

- R a DVR, p > 4 (p > 3 in the elliptic setting with residual surjectivity), H.0–H.5 for (T, F) and (T*, F*), 𝓛 ⊇ 𝓛_s(T)
- κ₁ ≠ 0

**Proof sketch.**

1. Freeness of H¹_F(K, T) and the decomposition H¹_F(K, A) ≅ D ⊕ M ⊕ M are ES.5/howard-dvr-theorem.
2. For k large H^{(k)}(1) ≅ R/m^k ⊕ M ⊕ M with λ = length(M) = λ^{(k)}(1); the formula of ES.5/self-dual-divisibility-profile at n = 1 gives κ₁^{(k)}R^{(k)} = m^{d(κ)+λ}H^{(k)}(1), and for k > d(κ) + λ the injectivity of H(1)/m^k → H^{(k)}(1) gives κ₁R = m^{λ+d(κ)}H(1), i.e. λ = ind(κ₁) − d(κ).
3. The equality case follows from d(κ) = 0 iff κ is primitive. In BCGS's form, the induction of Castella–Grossi–Skinner's Theorem 6.1.1 with zero error (residual surjectivity) reaches a core vertex n_ρ with ind(κ_{n_ρ}) = M_∞(κ), and Lemma 2.2.4 gives ind(κ₁) = M_∞ + length(M), so length(M ⊕ M) = 2(M₀ − M_∞).

**Acceptance.**

- Primitive κ: length(M) equals the index of κ₁, so the Kolyvagin bound of ES.5/howard-dvr-theorem is sharp.
- κ′ = π^aκ for primitive κ: index of κ′₁ grows by a and d grows by a, so length(M) is unchanged, as it must be.
- For E/ℚ of analytic rank one over K and the Heegner system, combined with Gross–Zagier this gives the exact p-part of #Ш(E/K) up to the defect 2M_∞, which vanishes exactly when the system is primitive.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.5/self-dual-divisibility-profile`
- `EulerSystemsAndKolyvaginSystems:ES.5/self-dual-core-vertex-rigidity`
- `EulerSystemsAndKolyvaginSystems:ES.4/uniform-near-trivial-bound`

**Sources.**

- `zanarella`, §2.3, Theorem 2.3.6 and its proof, p. 20 (arXiv v1): the exact formula length(M) = length(H¹_F(K,T)/Rκ₁) − d(κ), with equality iff κ is primitive.
- `bcgs`, §2.2.2, Theorem 2.2.2, p. 17, with Lemma 2.2.4 and the proof, pp. 18–20 (arXiv v2): length of the Tate–Shafarevich module equals 2(M₀(κ) − M_∞(κ)) in the anticyclotomic elliptic setting with residual surjectivity.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/SelfDual`, namespace `TauCeti.KolyvaginSystems.SelfDual`. Implementation status: `unchecked`.


**Open refinements of ES.5.**

- Lemma level: Mazur–Rubin 2004 Lemmas 4.5.13–4.5.14, Proposition 4.5.15, Lemmas 5.2.7–5.2.8; Howard Lemmas 1.5.6–1.5.8 and 1.6.2–1.6.4.
- Lemma level: Zanarella Lemma 2.2.2, Corollary 2.2.4 and Proposition 2.2.5 (stub lengths across an edge) as separate statements.

## ES.6. Exterior biduals, Stark systems and Gorenstein coefficients

Exterior biduals of Selmer modules with their determinant evaluation, contractions and coefficient change; Stark systems of Mazur–Rubin 2016 and Burns–Sakamoto–Sano with their freeness and Fitting-ideal control; the Burns–Sakamoto–Sano hypotheses; Kolyvagin systems of rank r and the regulator isomorphism; the comparison of exterior-power and bidual Stark systems; and T-modified S-units, the order map and Rubin's lattice.

**Layer acceptance.** The Stark regulator and component ideals commute with admissible coefficient reduction; an example shows the exterior bidual retains integral information an exterior power loses; p > 3 restrictions of Burns–Sakamoto–Sano remain visible.

### Exterior biduals of Selmer modules

`EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual` — definition

**Planet:** Selmer exterior bidual.

**Statement.** For a Selmer structure F on a finite free G_K-representation A over a commutative coefficient ring R, use the exterior bidual supplied by PadicMeasuresIwasawaAlgebras L6 on H¹_F(K,A): B^r_F(A) = Hom_R(⋀^r Hom_R(H¹_F(K,A),R),R). The Selmer specialization of its canonical evaluation map is ξ_F : ⋀^r H¹_F(K,A) → B^r_F(A). For a finite free Selmer module ξ_F is an isomorphism. Evaluation against a wedge of Selmer functionals is the determinant of their values. This node supplies notation and arithmetic adapters; the generic bidual, contraction, functoriality, projective comparison and integral-lattice theory belong to L6.

**Hypotheses.**

- R commutative; A a continuous finite free G_K-representation; F a Selmer structure.

**Construction.**

1. Instantiate the L6 bidual and evaluation map at the actual Selmer kernel H¹_F(K,A).
2. Use the supplied determinant formula and finite-free comparison; no new general exterior algebra is planned in ES.6.

**Uses that determine the API.**

- Burns–Sakamoto–Sano II, §4.1 and Definition 6.4: Stark systems and higher-rank Euler systems take values in exterior biduals of cohomology
- Dasgupta–Kakde, §1.2 and Conjecture 1.5: Rubin's lattice is the intersection of an exterior power with ⋂^r_{ℤ[G]} U_{S,T}
- PadicMeasuresIwasawaAlgebras L6: base-change and denominator lemmas for biduals over Gorenstein orders are owned there

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.StarkSystems.selmerBidual` | constructor | B^r_F(A) is the L6 exterior bidual of H¹_F(K,A). |
| `TauCeti.StarkSystems.selmerToBidual` | constructor | ξ_F : ⋀^r H¹_F(K,A) →ₗ[R] B^r_F(A), the supplied evaluation map. |
| `TauCeti.StarkSystems.selmerToBidual_det` | simp | ξ_F(c₁∧⋯∧c_r)(φ₁∧⋯∧φ_r)=det(φ_i(c_j)). |
| `TauCeti.StarkSystems.selmerToBidual_bijective` | characterisation | If H¹_F(K,A) is finite free, ξ_F is bijective. |

**Unit tests.**

- `TauCeti.StarkSystems.selmerBidual_free_three` (computation): Given H¹_F(K,T)≃R³, its degree-two bidual has rank 3.
- `TauCeti.StarkSystems.selmerBidual_zero_degree` (degenerate): The degree-zero Selmer bidual is R.
- `TauCeti.StarkSystems.selmerBidual_torsion` (non-example): For a Selmer module R⊕R/(a), with a nonzero and its quotient nontrivial, the degree-one determinant map is not injective.

**Acceptance.**

- ⋂^r_R R^n ≅ ⋀^r_R R^n, free of rank (n choose r).
- For R = ℤ[G], G finite, and X = ℤ^r with trivial action (r ≥ 1): ⋂^r_R X = |G|^{-(r−1)}·⋀^r_ℤ X inside ℚ ⊗ ⋀^r X; for r ≥ 2 and G ≠ 1 the exterior power is a proper sublattice of index |G|^{r−1}.

**Prerequisites.**

- `PadicMeasuresIwasawaAlgebras:L6`
- `SelmerIwasawaCohomology:L2`

**Sources.**

- `bss2`, Definition 2.1, p. 7: The definition, the map ξ and the contraction maps.
- `dk`, §1.2, p. 8: The lattice form over ℤ[G], in Rubin's original normalisation.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.


### Selmer contractions and coefficient change

`EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality` — theorem

**Statement.** Let R be a commutative noetherian self-injective local ring and A finite free, with all Selmer modules here finitely generated. If F′≤F and the change-of-condition map H¹_F(K,A) → R^s has kernel H¹_F′(K,A), contraction by its ordered s components maps B^{r+s}_F(A) to B^r_F′(A). For one component v_q, r≥1, B^r_F′(A) identifies with the kernel of v_q:B^r_F(A)→B^{r−1}_F(A). Membership in B^r_F′(A) is detected by every (r−1)-fold contraction. Given a quotient R→S of self-injective rings and the actual coefficient-reduction square into a finite free ambient cohomology module satisfying BSS II Corollary 2.7, the L6 change map induces B^r_F(A)→B^r_G(A⊗S). No assertion of unconditional base-change isomorphism is made.

**Hypotheses.**

- R noetherian and self-injective; every dualized module finitely generated.
- The ordered maps are actual localizations for F′≤F; coefficient change has the free ambient square and injective bottom map of BSS II Corollary 2.7.

**Proof sketch.**

1. Use the exact Selmer change sequence requested from L2 to identify the kernel.
2. Instantiate L6 kernel contraction, rank reduction and coefficient-change maps at this sequence. These generic algebraic results are requested from L6, not re-proved by this node.

**Acceptance.**

- For R = k a field these are standard facts about exterior powers.
- The transition maps of Stark systems are instances of (c).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `SelmerIwasawaCohomology:L2`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `bss2`, Proposition 2.3, p. 8: The map into the bidual of a kernel.
- `bss2`, Proposition 2.4, p. 8: Rank reduction.
- `bss2`, Corollary 2.7, pp. 10–11: Coefficient change.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.


### Stark systems

`EulerSystemsAndKolyvaginSystems:ES.6/stark-systems` — definition

**Planet:** Stark system.

**Statement.** (a) (Mazur–Rubin 2016; R principal artinian of length k, Selmer data (T, F, P, r) with I_q = 0 for q ∈ P.) For n ∈ N put W_n = ⊕_{q | n} Hom(H¹_tr(K_q, T), R), free of rank ν(n), and Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n. For m | n the square of H¹_{F^m} ⊆ H¹_{F^n} with the transverse localisations is cartesian and induces Ψ_{n,m} : Y_n → Y_m, with Ψ_{n′,n″} ∘ Ψ_{n,n′} = Ψ_{n,n″}. SS_r(T) = SS_r(T, F, P) = lim_{n ∈ N} Y_n. For R a discrete valuation ring, SS_r(T) = lim_k SS_r(T/m^kT, P_k). (b) (Burns–Sakamoto–Sano; R self-injective local with finite residue field, A free of finite rank.) SS_r(A, F) = lim_{n ∈ N} ⋂^{r+ν(n)}_R H¹_{F^n}(K, A) with transition maps v_{m,n} = ⋀_{q | m/n} v_q, where v_q : H¹_{F^m}(K, A) → H¹_{/f}(K_q, A) ≅ R, signs chosen so that v_{m′,n} = v_{m,n} ∘ v_{m′,m}. For ε ∈ SS_r(A, F) and i ≥ 0, I_i(ε) = Σ_{ν(n) = i} im(ε_n) ⊆ R, each ε_n being a homomorphism ⋀^{r+ν(n)}H¹_{F^n}(K, A)^* → R. For a local Gorenstein order R and T free over R, SS_r(T, F) = lim_m SS_r(T/p^mT, F) and I_i(ε) = lim_m I_i(ε^{(m)}).

**Hypotheses.**

- as in (a) or (b)

**Construction.**

1. (a): Ψ_{n,m} is contraction against h_{s+1} ∘ loc^tr_{q_{s+1}}, …, h_t ∘ loc^tr_{q_t} tensored with h₁ ∧ ⋯ ∧ h_t ↦ h₁ ∧ ⋯ ∧ h_s; it is independent of the generators h_i and of the ordering (Mazur–Rubin 2016, Proposition A.3).
2. (b): v_{m,n} lands in the bidual of the kernel H¹_{F^n} by ES.6/bidual-functoriality(c).
3. ES.6/stark-comparison identifies the two definitions over principal artinian coefficients: j_n⊗ξ commutes with transitions, and free cofinal core vertices identify the inverse limits.

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

- `TauCeti.StarkSystems.stalk_one` (degenerate): The MR conductor-one Stark stalk is the degree-r exterior power of H¹_F.
- `TauCeti.StarkSystems.rank_one_free_stalk` (computation): A relaxed Selmer module free of rank r+ν(n) makes the degree-r Stark stalk free of rank one.
- `TauCeti.StarkSystems.not_product` (non-example): A family with nonzero component at 1 and zero component at q violates the transition relation.

**Acceptance.**

- For n = 1: Y_1 = ⋀^r H¹_F(K, T), and ε_1 is the leading term of the Stark system.
- The zero family is a Stark system.
- Additional arithmetic check: If H¹_{(F^*)_n}(K, T^*) = 0 and r = χ(T), then H¹_{F^n}(K, T) is free of rank r + ν(n) and Y_n is free of rank one.
- Additional arithmetic check: For n = q, m = 1, r = 1 and H¹_{F^q} free with basis c₁, c₂: Ψ_{q,1}(c₁ ∧ c₂ ⊗ h) = h(loc^tr_q c₁)c₂ − h(loc^tr_q c₂)c₁ up to the sign convention, an element of H¹_F(K, T).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`

**Sources.**

- `mr-higher`, Definition 6.8, p. 14: Stark systems over principal artinian rings.
- `bss2`, §4.1, p. 19: Stark systems in exterior biduals.
- `bss2`, Definition 4.1, p. 20: The ideals I_i(ε).

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

- `TauCeti.StarkSystems.not_bss33_trivial` (non-example): The trivial rank-one representation has nonzero residual invariants and fails Hypothesis 3.3.
- `TauCeti.StarkSystems.bss_rank_one_coinvariants` (computation): Rank-one coefficients have rank-one coinvariants for τ=1.
- `TauCeti.StarkSystems.bss42_strict_dual_zero` (characterisation): A Hypothesis 4.2 vertex has zero strict dual Selmer module.

**Acceptance.**

- Satisfied by A = (ℤ/p^m)(1) ⊗ χ^{-1} ⊗ ℤ_p[Gal(F/K)] under the hypotheses of Theorem 7.1.
- Not implied by the ring-theoretic hypotheses: for A with trivial residual representation 3.3 fails over every R.
- Additional arithmetic check: For R principal artinian, (H.1)–(H.3) of ES.0/hypotheses-mr2016 give Hypotheses 3.2 and 3.3 with the same τ.
- Additional arithmetic check: For R = k and χ(A) = r: any core vertex n has dim H¹_{F^n}(K, A) = r + ν(n), so 4.2 holds.
- Additional arithmetic check: If rank_R T = 1 then 4.7(i) holds and 4.7(ii) holds with τ = 1.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `bss2`, Hypothesis 3.2, p. 13: The finite-level hypotheses.
- `bss2`, Hypothesis 4.2, p. 20: Existence of a relaxed core vertex.
- `bss2`, Hypothesis 4.7, p. 22: The hypotheses over a Gorenstein order.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.


### Freeness of Stark systems and control of the dual Selmer group

`EulerSystemsAndKolyvaginSystems:ES.6/stark-structure` — theorem

**Planet:** Stark systems control Fitting ideals.

**Statement.** (a) (Mazur–Rubin 2016; (H.1)–(H.7), R principal artinian.) SS_r(T) is free of rank one over R, and the image of SS_r(T) → Y_n is Y′_n = m^{length H¹_{(F^*)_n}(K, T^*)} Y_n; for R a discrete valuation ring with (H.1)–(H.6), SS_r(T, P) is free of rank one, generated by ε with nonzero image in SS_r(T/mT), and SS_r(T, P) → SS_r(T/m^k, P_k) is surjective. With φ_ε(n) = max{j : ε_n ∈ m^jY_n}, ∂φ_ε(i) = min{φ_ε(n) : ν(n) = i}, ord(ε) = min{ν(n) : ε_n ≠ 0} and d_ε(i) = ∂φ_ε(i) − ∂φ_ε(i + 1): for R a discrete valuation ring and ε ≠ 0, corank H¹_{F^*}(K, T^*) = ord(ε), H¹_{F^*}(K, T^*)/div ≅ ⊕_{i ≥ ord ε} R/m^{d_ε(i)}, ε is primitive iff ∂φ_ε(∞) = 0, and length H¹_{F^*}(K, T^*) ≤ ∂φ_ε(0) = max{s : ε_1 ∈ m^s ⋀^r H¹_F(K, T)} with equality iff ε is primitive. (b) (Burns–Sakamoto–Sano; Hypothesis 4.2.) For n with H¹_{(F^*)_n}(K, A^*(1)) = 0, SS_r(A, F) → ⋂^{r+ν(n)}H¹_{F^n}(K, A) is bijective, so SS_r(A, F) is free of rank one; for all ε and i: I_i(ε) ⊆ I_{i+1}(ε), I_∞(ε) = R iff ε is a basis, and I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, A^*(1))^*). For a local Gorenstein order under Hypothesis 4.7 and Hypothesis 4.2 of fixed rank r for (T/p^mT,F,P_m) at every m≥1, SS_r(T, F) is free of rank one with I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, T^∨(1))^∨). The regulator and the ideals commute with the admissible scalar reductions supplied by L6, under its exact coefficient-change hypotheses.

**Hypotheses.**

- (H.1)–(H.7) of ES.0/hypotheses-mr2016 for (a)
- Hypothesis 4.2 (finite level) and 4.7 plus 4.2 for every T/p^mT with the same r (orders) of ES.6/bss-hypotheses for (b)

**Proof sketch.**

1. (a): Y_n is free of rank one when H¹_{(F^*)_n} = 0 (Corollary 3.5), such n exist and are cofinal (ES.1/chebotarev-nonvanishing), and Ψ_{n,m}(Y_n) = Y′_m (Lemma 6.9); the structure theorem follows from ∂μ(t) = Σ_{i>t} e_i for H¹_{F^*} ≅ ⊕R/m^{e_i}.
2. (b): Theorem 4.6, combining Burns–Sano and Sakamoto; Fitting ideals of the dual Selmer module are generated by the images of Stark systems at vertices with i primes (Corollary 4.5) using the exact-dual contraction and image-ideal comparison imported from L6.

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

- `mr-higher`, Theorem 6.10, p. 15: Freeness over principal artinian rings.
- `mr-higher`, Theorem 8.9, p. 19: The structure theorem.
- `bss2`, Theorem 4.6, p. 21: Freeness and Fitting ideals over self-injective rings.

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
| `TauCeti.StarkSystems.KolyvaginSystemRank.rank_one_equiv` | equivalence | At a fixed finite coefficient level with I_q=0 for every selected prime and reflexive modified Selmer modules, the degree-one bidual Kolyvagin module is equivalent to the ordinary module. The exterior-power MR version needs no reflexivity in degree one. |
| `TauCeti.StarkSystems.KolyvaginSystemRank.stub` | constructor | KS′_r(T) ≤ KS_r(T), sections of the stub subsheaf. |
| `TauCeti.StarkSystems.regulator` | constructor | Reg_r : SS_r → KS_r, R-linear. |
| `TauCeti.StarkSystems.regulator_eval_one` | simp | Reg_r(ε)_1 = ε_1. |
| `TauCeti.StarkSystems.KolyvaginSystemRank.ideal` | data | I_i(κ) = Σ_{ν(n)=i} im(κ_n). |

**Unit tests.**

- `TauCeti.StarkSystems.regulator_zero` (degenerate): The rank-r regulator takes zero to zero.
- `TauCeti.StarkSystems.rank_system_not_product` (non-example): A family with zero upper localization and nonzero lower localization fails the rank-r edge equation.
- `TauCeti.StarkSystems.stub_stalk_zero_field` (non-example): At field coefficients, positive dual length and a nonzero rank-r exterior stalk give zero stub stalk strictly smaller than the full stalk.

**Acceptance.**

- For r = 1: KS_1 = KS and Reg_1(ε)_1 = ε_1.
- Reg_r commutes with R → R/(p^m) and with restriction of P.
- Additional arithmetic check: For r = 1 the edge module is H¹_tr(K_q, T/I_{nq}T) ⊗ G_{nq} ≅ H¹_s ⊗ G_{nq} and the relation is (5) of Mazur–Rubin 2004.
- Additional arithmetic check: For n = q: Reg_r(ε)_q = φ^fs_q(ε_q) ∈ ⋂^r H¹_{F(q)}(K, A) ⊗ G_q, and v_q(Reg_r(ε)_q) = φ^fs_q(ε_1).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`
- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`

**Sources.**

- `mr-higher`, Definition 10.4, p. 21: Kolyvagin systems of rank r.
- `bss2`, §5.2, p. 25: The regulator map.
- `mr-higher`, Proposition 12.3, p. 24: The map Π.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.


### The regulator isomorphism and structure of Kolyvagin systems of rank r

`EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism` — theorem

**Planet:** Regulator isomorphism.

**Statement.** (a) (Mazur–Rubin 2016; (H.1)–(H.7), R principal artinian.) There are core vertices; any two are joined by a path through core vertices along which all vertex-to-edge maps are isomorphisms; S′ is locally cyclic with every core vertex a hub and trivial monodromy; KS′_r(T) is free of rank one and κ ↦ κ_n is an isomorphism onto S′(n) at core vertices; Π : SS_r(T) → KS′_r(T) is an isomorphism. For R a discrete valuation ring ((H.1)–(H.6)), KS′_r(T, P) ≅ lim_k KS′_r(T/m^k, P_k) is free of rank one, and for 0 ≠ κ ∈ KS′_r(T) the conclusions of ES.6/stark-structure(a) hold with ε replaced by κ; in particular length H¹_{F^*}(K, T^*) ≤ max{s : κ_1 ∈ m^s ⋀^r H¹_F(K, T)}, with equality iff κ is primitive. (b) (Burns–Sakamoto–Sano; Hypotheses 3.2, 3.3, 4.2 and p > 3.) Reg_r : SS_r(A, F) → KS_r(A, F) is an isomorphism, so KS_r(A, F) is free of rank one; for κ ∈ KS_r(A, F) and n ∈ N, im(κ_n) ⊆ Fitt⁰_R(H¹_{F(n)^*}(K, A^*(1))^*), with equality if κ is a basis; and I_i(κ) ⊆ Fitt^i_R(H¹_{F^*}(K, A^*(1))^*), with equality if R is a principal ideal ring and κ is a basis. The same holds over a local Gorenstein order under Hypothesis 4.7, Hypothesis 4.2 of fixed rank r for every (T/p^mT,F,P_m), and p > 3 for KS_r(T, F) and H¹_{F^*}(K, T^∨(1))^∨. The restriction p > 3 is part of the statements for Kolyvagin systems; it is not needed for Stark systems.

**Hypotheses.**

- as stated; p > 3 in (b)

**Proof sketch.**

1. (a): Theorem 11.6 (proved in §14 by the Chebotarev lemmas) and ES.4/sheaf-monodromy; Π is surjective onto each S′(n) (Lemma 12.2) between free modules of rank one.
2. (b): Theorem 5.2 — connectivity of the core graph X⁰ (Theorem 5.18, where p > 3 is used to find a common prime for two pairs of classes via Lemma 3.9 with s + t < p) and the computation of im(κ_n) at core vertices (Theorem 5.20); pass to the limit for orders (Theorem 5.25).
3. BSS II §§5.4–5.5: Lemmas 5.14–5.17 connect minimal and nonminimal core vertices by detecting at most four classes (p>3); Lemma 5.19 makes edge contractions isomorphisms. Theorem 5.20 obtains surjectivity from Stark evaluation and proves injectivity by induction on residual dual dimension, choosing detecting primes and using rank reduction to force a nonzero edge value. Lemmas 5.22–5.23 then give higher Fitting containments, with equality requiring a faithful Selmer element; the principal-ring argument supplies it.

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

- `mr-higher`, Theorem 12.4, p. 25: Stark systems and stub Kolyvagin systems.
- `bss2`, Theorem 5.2, pp. 25–26: The regulator isomorphism and Fitting bounds.
- `bss2`, Theorem 5.25, p. 36: The statement over a Gorenstein order.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/StarkSystem`, namespace `TauCeti.StarkSystems`. Implementation status: `unchecked`.


### T-modified S-units, the order map and Rubin's lattice

`EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice` — definition

**Statement.** Let H/F be a finite abelian CM extension with F totally real, G its Galois group and c complex conjugation. Let S₀ contain the infinite and ramified places, let T be a disjoint finite smoothing set, and let V={v₁,…,v_r} be r≥1 finite primes splitting completely in H, disjoint from S₀∪T, with chosen primes w_j above v_j. Assume the T-modified unit group is torsion-free. Distinguish S₀, used in the Stickelberger element, from V, used in the unit group: U_{V,T} consists of elements congruent to 1 above T whose valuations vanish outside primes above V. On the rational minus component, the order map ord_G sends u₁∧⋯∧u_r to det(Σ_{σ∈G}[σ⁻¹]ord_{w_j}(σu_i))_{i,j} and is an isomorphism onto ℚ[G]⁻. Rubin’s lattice is the rational minus component intersected with the integral ℤ[G]-exterior bidual of the full U_{V,T}; membership means every determinant of r integral group-ring functionals has coefficients in ℤ. The integral dual is taken before the minus projection, so the definition does not use the nonintegral idempotent (1−c)/2.

**Hypotheses.**

- H/F abelian, H CM and F totally real; c is actual complex conjugation.
- r≥1; the v_j are distinct, split completely, and lie outside S₀∪T.
- The T-congruence subgroup is torsion-free.

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
| `TauCeti.RubinStark.modifiedUnits` | constructor | U_{V,T} as a ℤ[G]-module. |
| `TauCeti.RubinStark.ordG` | constructor | ord_G : ⋀^r_{ℚ[G]} ℚU_{V,T}^− → ℚ[G]^−. |
| `TauCeti.RubinStark.ordG_ιMulti` | simp | ord_G(u₁ ∧ ⋯ ∧ u_r) = det(Σ_σ [σ^{-1}]·ord_{w_j}(σ u_i)). |
| `TauCeti.RubinStark.ordG_bijective` | characterisation | ord_G is an isomorphism of ℚ[G]-modules. |
| `TauCeti.RubinStark.rubinLattice` | constructor | 𝓛 = (⋀^r ℚU^−) ⊓ ⋂^r_{ℤ[G]} U_{V,T}. |
| `TauCeti.RubinStark.rubinLattice_rank_one` | example | For r = 1, 𝓛 = U_{V,T}^−. |

**Unit tests.**

- `TauCeti.RubinStark.rubinLattice_nonintegral_functional` (non-example): A nonintegral coefficient of a determinant functional excludes a rational minus element from the Rubin lattice.
- `TauCeti.RubinStark.modifiedUnits_T_condition` (non-example): A unit failing congruence to 1 at a prime over T is not an (S,T)-unit.
- `TauCeti.RubinStark.rubinLattice_half_determinant` (computation): Over ℚ[C₂], half of (1−c)² equals 1−c; integral determinant testing therefore differs from requiring an integral minus projector.

**Acceptance.**

- For r = 1, 𝓛 = U_{S,T}^− (U_{S,T} is reflexive), and membership of the element is the Brumer–Stark statement.
- For r ≥ 2 the lattice 𝓛 is in general strictly larger than the image of ⋀^r_{ℤ[G]} U_{S,T}^−.
- Additional arithmetic check: Replacing w_j by g·w_j multiplies ord_G by [g]^{±1} ∈ G (a unit of ℚ[G]); so 𝓛-membership statements do not depend on the w_j.
- Additional arithmetic check: For G = 1: ⋂^r_ℤ U = ⋀^r_ℤ U for U free, and 𝓛 = ⋀^r_ℤ U^−.
- Additional arithmetic check: Algebraic minus-part test: let G=C₂=⟨σ⟩ act by −1 on X=ℤ². Then Hom_{ℤ[G]}(X,ℤ[G]) has values in ℤ(1−σ), and (1−σ)²=2(1−σ). Thus the determinant-integrality lattice in ⋀²_{ℚ[G]}ℚX is (1/2)⋀²_ℤX, strictly larger than the exterior-power image. This tests the minus-part normalization without claiming X is a specific arithmetic unit lattice.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`

**Sources.**

- `dk`, §1.2, (8)–(10), p. 8: The unit group and the order map.
- `dk`, §1.2, p. 8: Rubin's lattice.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinStark`, namespace `TauCeti.RubinStark`. Implementation status: `unchecked`.


### Comparison of exterior-power and bidual Stark systems

`EulerSystemsAndKolyvaginSystems:ES.6/stark-comparison` — comparison

**Statement.** Let R be principal artinian local, A finite free over R, F cartesian, signed core rank r≥0, and Q an infinite subset of the admissible Kolyvagin primes of sufficient level admitting core vertices, in the setting of Sakamoto §4.5 and Mazur–Rubin 2016. Let W′_n=⊕_{q|n}Hom_R(H¹_tr(K_q,A),R), W_n=⊕_{q|n}Hom_R(H¹(K_q,A)/H¹_f(K_q,A),R), and j_n:det W′_n≃det W_n be induced by the inverse of the transverse-to-singular restriction isomorphism. The component map C_n=j_n⊗ξ_{H¹_{F^n}} commutes with Stark transitions and induces a canonical R-linear isomorphism SS^MR_r(A,F,Q)≃SS^bidual_r(A,F,Q). Component maps need only be isomorphisms at the cofinal free core vertices; they are not claimed bijective at every vertex.

**Hypotheses.**

- Sakamoto §4.5 hypotheses: principal artinian R, cartesian F, r=χ(F)≥0, Q infinite of sufficient level with core vertices.

**Proof sketch.**

1. Lemma 4.13 proves that ξ commutes with the one-dimensional kernel contraction; its proof decomposes the finite module as Rm⊕N₀ with N=Im⊕N₀ and checks the determinant formula.
2. Apply it successively to localizations to obtain transition compatibility of j_n⊗ξ.
3. At a core vertex the relaxed Selmer module is free and ξ is bijective; cofinality and evaluation of both inverse limits at such vertices give Proposition 4.14.

**Acceptance.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.
- The comparison prototype is between arithmetic inverse systems, with explicit determinant-evaluation maps and commuting transitions; it is not an equivalence between arbitrary abstract inverse systems.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`
- `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `sakamoto`, Lemma 4.13 and Proposition 4.14, pp. 2313–2314: The compatible comparison of the two Stark definitions.


**Open refinements of ES.6.**

- Generic Gorenstein duality, contractions and transfer remain the exact PadicMeasuresIwasawaAlgebras L6 supplier contract.
- Lemma level: Mazur–Rubin 2016 Appendix A/§14 and the Burns–Sakamoto–Sano and Sakamoto auxiliary lemmas.

## ES.7. Higher-rank derivatives and Fitting-ideal control

Euler systems of rank r in exterior biduals over group rings, the higher Kolyvagin derivative, Fitting-ideal control of dual Selmer groups, the Rubin–Brumer–Stark element and Rubin's conjecture, the rank-one specialisation, and the conditional Rubin–Stark class-group bounds with the archimedean and minus-part dictionaries.

**Layer acceptance.** Over a non-domain coefficient order, ideal containment is not replaced by a valuation formula; a conjectural Rubin–Stark element is an Euler system only once its integrality and norm relations are proved.

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

- `TauCeti.EulerSystems.HigherEulerSystem.zero_mem` (degenerate): The zero higher-rank family satisfies every norm relation.
- `TauCeti.EulerSystems.HigherEulerSystem.rank_one_zero` (compatibility): The rank-one bidual-to-Rubin Euler-system comparison takes zero to zero under all stated hypotheses.
- `TauCeti.EulerSystems.not_BSSHypothesis61_torsion` (non-example): A nonzero ramified-cohomology class annihilated by a nonzero scalar contradicts the torsion-free form of Hypothesis 6.1(i).

**Acceptance.**

- For R = O = ℤ_p, T = ℤ_p(1): Hypothesis 6.1(i) says the p-completion of O_{F,S(F)}^× is torsion-free for all F.
- The zero family is an Euler system of rank r.
- Additional arithmetic check: For r = 1, R = O and Hypothesis 6.1: the relation is Rubin's, with P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) = P(Fr_q^{-1} | T^*; x) in Rubin's notation.
- Additional arithmetic check: For T = ℤ_p(1) and F ⊇ μ_p, H¹(O_{F,S(F)}, T) ⊇ μ_{p^∞}(F) has torsion, so Hypothesis 6.1(i) fails: reflexivity is not automatic.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `bss2`, Definition 6.4, p. 37: The definition.
- `bss2`, Hypothesis 6.1, p. 37: Reflexivity and vanishing of invariants.

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
2. Local properties and the correction: reduce to rank one by the rank-reduction formalism (the L6 compatible-functional-lift and contraction contract) applied to Φ ∈ ⋀^{r−1}, then use ES.3/derivative-local-properties and the correction of ES.3/euler-to-kolyvagin (Mazur–Rubin Appendix A), whose hypothesis (b) is Hypothesis 6.11.
3. Independence of generators: the class is recorded in the tensor factor ⟨∏(σ_q − 1)⟩ ≅ G_n.
4. BSS II §6.5, Lemma 6.20: lift each (r−1)-fold functional at a finite level first across E(n)/E using self-injective duality, then through coefficient reduction, then to a compatible global tower family. Rank reduction tests all these functionals. Rank-one local compatibility proves membership and the finite–singular edge relation, whose contraction sign (−1)^{r−1} occurs on both sides and cancels. The norm/functional-lift input is Sano 2014 Lemma 2.10 and Remark 2.12, generalized by the exact L6 contract.

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
| `TauCeti.EulerSystems.higherDerivative_indep` | compatibility | For fixed E, the corrected classes are independent of cyclic generators in the intrinsic tame tensor factor. Auxiliary-E independence at fixed target F is the additional Corollary 6.13 dictionary in the supplier request. |
| `TauCeti.EulerSystems.higherDerivative_rank_one` | compatibility | At conductor one in rank one, the raw descended class agrees with coefficient reduction of the Rubin initial component under Shapiro and bidual evaluation. Full corrected MR-family comparison is the exact coefficient/Euler/augmentation dictionary in the supplier request. |

**Unit tests.**

- `TauCeti.EulerSystems.higherCorrection_empty` (degenerate): The empty correction determinant Δ₁ equals 1.
- `TauCeti.EulerSystems.higherCorrection_one_prime` (computation): For one prime, the zero-diagonal correction determinant is zero.
- `TauCeti.EulerSystems.higherDerivative_two_primes` (computation): For two primes, Δ=−P_{q₂}^{q₁}P_{q₁}^{q₂}, retaining the negative cross-term in the corrected derivative.
- `TauCeti.EulerSystems.higherDerivative_zero` (degenerate): The higher derivative takes the zero Euler system to zero.
- `TauCeti.EulerSystems.higherDerivative_needs_611` (non-example): A nonzero trivial rank-one representation fails Frobenius injectivity 6.11 at every selected prime.

**Acceptance.**

- For r = 1, K = ℚ, R = O, E = ℚ: D_1 is the map of ES.3/euler-to-kolyvagin reduced modulo M, after the dictionary P_q(Fr_q^{-1}) between the conventions (ES.2/euler-factor-change).
- D_r is R[[Gal(𝒦/K)]]-semilinear through Gal(𝒦/K) → Gal(F/K).
- Additional arithmetic check: For n = 1: κ′(c_1) = c̄_E, the image of c_E.
- Additional arithmetic check: For n = q: κ(c)_q = κ′(c_q) ⊗ (σ_q − 1), with singular part φ^fs_q(c_F mod M) at q.

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

- `bss2`, Theorem 6.12, p. 41: The derivative classes form a Kolyvagin system of rank r.
- `bss2`, Corollary 6.13, p. 42: The homomorphism D_r.
- `bss2`, Proposition 6.10, p. 40: The uncorrected derivative.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/HigherRank`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### Fitting-ideal control from higher-rank Euler systems

`EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds` — theorem

**Planet:** Fitting-ideal control.

**Statement.** Let p > 3, r ≥ 1, c ∈ ES_r(T, 𝒦), F = F_can, F a subfield of E/K and A_F = Ind_{G_F}^{G_K}(T/MT). Assume Hypotheses 6.1, 6.7, 6.11 and Hypotheses 3.2, 3.3, 4.2 for A_F and F_can, and let κ(c) = D_r^F(c). Then (i) for n ∈ N, im(κ(c)_n) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F(n)^*}(K, A_F^*(1))^*); in particular im(c_F) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*); (ii) for every i ≥ 0, I_i(κ(c)) ⊆ Fitt^i_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*). In (i), equality holds whenever κ(c) is a basis of KS_r, without a principal-ring assumption. For the higher I_i in (ii), equality for a basis is asserted when R̄[𝒢_F] is a principal ideal ring. These are containments of ideals of the group ring R̄[𝒢_F], which is not a domain: they are not valuation formulas and do not reduce to orders of underlying groups.

**Hypotheses.**

- p > 3
- Hypotheses 6.1, 6.7, 6.11; 3.2, 3.3, 4.2 for A_F

**Proof sketch.**

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

- `bss2`, Corollary 6.15, p. 42: The Fitting-ideal bounds.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/HigherRank`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### The Rubin–Brumer–Stark element and Rubin's conjecture

`EulerSystemsAndKolyvaginSystems:ES.7/rubin-brumer-stark` — construction

**Planet:** Rubin–Brumer–Stark element.

**Statement.** In the setting of ES.6/rubin-lattice let Θ_{S₀,T} ∈ ℚ[G]^− be the Stickelberger element for S₀ ⊇ S_∞ ∪ S_ram and T. The Rubin–Brumer–Stark element is the unique u_RBS ∈ ⋀^r_{ℚ[G]} ℚU_{V,T}^− with ord_G(u_RBS) = Θ_{S₀,T}. It depends on the choice of the w_j only up to multiplication by an element of G. Rubin's conjecture is the proposition u_RBS ∈ 𝓛; its validity is independent of the w_j. It is stated here as a proposition and is a hypothesis of any application of the higher-rank machinery to these elements: a conjectural Rubin–Stark element is an Euler system of rank r only once its integrality (membership in the bidual lattices) and its norm relations along Ω(𝒦/K) are proved. The prime-to-2 part of the conjecture is a theorem of Dasgupta–Kakde, owned by IntegralIwasawaTheory I.7.

**Hypotheses.**

- as in ES.6/rubin-lattice
- Θ_{S,T} ∈ ℚ[G]^− defined by the partial zeta values at 0

**Construction.**

1. Existence and uniqueness: ord_G is an isomorphism (ES.6/rubin-lattice).
2. Dependence on w_j: replacing w_j by g·w_j multiplies ord_G by a group element.

**Uses that determine the API.**

- Dasgupta–Kakde, Theorem 1.6: u_RBS ∈ 𝓛 ⊗ ℤ[1/2]

**Proposed API.**

| Declaration | Role | Statement |
| --- | --- | --- |
| `TauCeti.RubinStark.rubinBrumerStark` | constructor | u_RBS = ord_G⁻¹(Θ_{S,T}). |
| `TauCeti.RubinStark.ordG_rubinBrumerStark` | simp | ord_G(u_RBS) = Θ_{S,T}. |
| `TauCeti.RubinStark.rubinBrumerStark_change_w` | relation | For another choice of the w_j, u_RBS changes by multiplication by an element of G. |
| `TauCeti.RubinStark.RubinConjecture` | structure | The proposition u_RBS ∈ 𝓛, with no instance provided. |
| `TauCeti.RubinStark.rubinConjecture_indep` | characterisation | RubinConjecture does not depend on the choice of the w_j. |

**Unit tests.**

- `TauCeti.RubinStark.rubinBrumerStark_zero` (degenerate): Zero Θ gives zero Rubin–Brumer–Stark element and satisfies the integrality conjecture.
- `TauCeti.RubinStark.rubinBrumerStark_unique` (characterisation): Any minus element with ord_G(x)=Θ equals the Rubin–Brumer–Stark element.
- `TauCeti.RubinStark.rubinConjecture_not_projector` (non-example): The minus projector (1−c)/2 over ℚ[C₂] is not the coefficientwise image of an integral group-ring element.

**Acceptance.**

- For r = 1: u_RBS is the Brumer–Stark unit and Rubin's conjecture is the Brumer–Stark conjecture.
- ES.7/rubin-stark-minus-comparison records the dictionary and the parity boundary; BSS Theorem 7.1 is a separate conditional application.
- Additional arithmetic check: For r = 1, u_RBS is the element of ℚU_{S,T}^− with Σ_σ [σ^{-1}] ord_w(σu) = Θ_{S,T}: the Brumer–Stark unit, and RubinConjecture is u ∈ U_{S,T}.
- Additional arithmetic check: RubinConjecture is not the statement u_RBS ∈ image of ⋀^r_{ℤ[G]} U_{S,T}^−: exterior-bidual integrality can be weaker when r≥2. Use the explicit minus-part lattice computation of rubin-lattice as an algebraic witness; strictness is not asserted for every arithmetic unit lattice.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`

**Sources.**

- `dk`, §1.2, p. 8: Definition of u_RBS.
- `dk`, Conjecture 1.5, p. 8: Rubin's conjecture.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/RubinStark`, namespace `TauCeti.RubinStark`. Implementation status: `unchecked`.


### Rank-one specialisation of the higher-rank theory

`EulerSystemsAndKolyvaginSystems:ES.7/rank-one-comparison` — comparison

**Statement.** On common admissible towers satisfying 6.7, under Hypothesis 6.1 and the universal-norm/unramified comparison, ES_1(T, 𝒦) is the module of ES.2/euler-system-module with coefficients R, with the dictionary P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) = Rubin's P(Fr_q^{-1} | T^*; x); KS_1(A, F) is ES.3/kolyvagin-system-module for A; D_1 is the map of ES.3/euler-to-kolyvagin modulo M (over ℚ) and supplies that map over a general number field K under Hypotheses 6.1, 6.7 and 6.11; and for R a discrete valuation ring the bound I_0(κ) ⊆ Fitt⁰ is length H¹_{F^*} ≤ ∂^{(0)}(κ) of ES.4/kolyvagin-bound. The conventions differ in two places, both explicit: the Euler factor (ES.2/euler-polynomial) and the identification G_q ≅ ⟨σ_q − 1⟩ ⊆ 𝓘/𝓘² (Mazur–Rubin's ρ_q).

**Hypotheses.**

- Hypotheses 6.1 and 6.7 on a common tower, plus the cohomology/unramified and coefficient dictionaries.
- Hypothesis 6.11 for the derivative comparison; rank-one admissibility and a DVR for the length/Fitting comparison.

**Proof sketch.**

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

- `bss2`, Remark 6.5, p. 37: Rank-one Euler systems are the classical ones.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/HigherRank`, namespace `TauCeti.EulerSystems`. Implementation status: `unchecked`.


### Euler-system and Rubin–Stark class-group bounds

`EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-class-group` — application

**Statement.** Let p be odd, χ a nontrivial finite character of G_K of order prime to p with χ≠ω, L its fixed field, O=ℤ_p[im χ], T_χ=O(1)⊗χ⁻¹, and r=|S_∞(K)|. Every archimedean place of K splits in L. Fix S⊇S_∞(K)∪S_ram(L/K), |S|>r, an ordered set of archimedean places and places above them, and the pro-p abelian tower 𝒦/K of BSS II §7 satisfying Hypothesis 6.7 for S∪S_p. No p-adic place splits completely in L/K, and p>3 or χ²≠ω. Write C_χ=(ℤ_p⊗Cl(O_L))^χ and I_i(T_χ) for the O-ideal generated by I_i(κ(c)) as c ranges over every rank-r Euler system on this tower. Then I_i(T_χ)⊆Fitt^i_O(C_χ) for every i≥0. If no finite place of S splits completely in L/K, equality holds for every i and C_χ≃⊕_{i≥0}I_{i+1}(T_χ)/I_i(T_χ). If Rubin–Stark Conjecture B′ holds for LF/K for every finite F⊆𝒦, its elements have integral χ-components in the cohomological biduals and the norm relations make a rank-r Euler system c^RS; hence im(η^χ_{L/K,S})⊆Fitt⁰_O(C_χ). Only this last conclusion assumes the conjecture. No Leopoldt hypothesis is imposed.

**Hypotheses.**

- Every displayed character, archimedean splitting, tower, S, and p hypothesis.
- The Rubin–Stark conclusion assumes the full Conjecture B′ at every finite LF/K, including rationality and integral bidual membership of the elements characterized by the ordered archimedean regulator. Integrality at L alone is insufficient.

**Proof sketch.**

1. Kummer theory identifies the canonical dual Selmer module with the χ-class group of O_L[1/p] (BSS equation (14)). The no-p-splitting condition makes its projection from C_χ an isomorphism.
2. Rank-one T_χ and χ≠1,ω verify the representation and freeness conditions; the archimedean splitting and local non-splitting give core rank r and the local hypotheses of Corollary 6.18.
3. Apply Corollary 6.18(i) for inclusion, and (iii) with no finite split S-place for equality and invariant factors.
4. Conjecture B′ at every tower level gives rational Rubin–Stark elements characterized by the ordered archimedean regulator, with integral χ-components. Their source norm relations and the unit/Kummer dictionaries give c^RS. Apply the zeroth Fitting bound at its base component. The prototype records a rational family with norm relations as input, then the integral-range predicate; it does not construct that family unconditionally from complex L-values.

**Acceptance.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`
- `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`
- `SelmerIwasawaCohomology:L2`
- `IntegralIwasawaTheory:I.7`

**Sources.**

- `bss2`, §7, equation (14) and Theorem 7.1(i)–(iii), pp. 47–50; Remarks 7.2–7.3, p. 50: Character assumptions, class-group identification, unconditional all-system ideals and conditional Rubin–Stark element.


### Archimedean and minus-unit Rubin–Stark dictionaries

`EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-minus-comparison` — comparison

**Statement.** The two constructions share the integral bidual condition but have different character and regulator data. BSS II §7 takes T_χ=O(1)χ⁻¹, r=|S_∞(K)| and χ trivial on every real decomposition group: for totally real K these are even characters and the ordered regulator uses archimedean places. DK §1.2 takes a CM abelian H/F with F totally real, projects to the minus part (characters odd on complex conjugation), and rank r counts chosen finite split primes; ord_G is the determinant of their valuations and u_RBS=ord_G⁻¹Θ_{S₀,T}. Their lattice is the rational minus component intersected with the integral ℤ[G]-bidual, followed by p-adic/character projection for odd p. Thus DK Theorem 1.6 supplies the specialized minus-unit integrality owned by IntegralIwasawaTheory I.7; it is not an instance of BSS Theorem 7.1. Applying the general higher-rank derivative/Fitting machinery to DK families requires separate integrality at every level, actual norm relations, and the appropriate Selmer/tower hypotheses. Neither an equality between the two elements nor a class-group bound from Theorem 7.1 is inferred across these incompatible parity hypotheses.

**Hypotheses.**

- The BSS §7 setting for the first dictionary; the CM minus and finite split-prime DK setting for the second.
- p odd when projecting DK integrality away from 2; no assertion at p=2.

**Proof sketch.**

1. Read the regulator-defining equations in BSS §7 and DK §1.2: archimedean splitting forces even real character parity, whereas the minus projector forces odd parity.
2. Use the L6 integral bidual lattice identification to express both integrality conditions; the chosen ranks and regulator maps remain those of their separate arithmetic inputs.
3. DK Theorem 1.6 yields membership after inverting 2. General Euler-system applications still require a norm-compatible integral family and the BSS hypotheses, not just a base-level unit.

**Acceptance.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice`
- `EulerSystemsAndKolyvaginSystems:ES.7/rubin-brumer-stark`
- `EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-class-group`
- `PadicMeasuresIwasawaAlgebras:L6`

**Sources.**

- `bss2`, §7, pp. 48–50: Archimedean splitting, χ, r and conditional tower elements.
- `dk`, §1.2, equations (8)–(10), Conjecture 1.5 and Theorem 1.6, pp. 7–9: Minus units, finite split primes, valuation regulator and away-from-2 integrality.


**Open refinements of ES.7.**

- The Σ-modified cohomology comparison avoiding Burns–Sakamoto–Sano Hypothesis 6.1(i).
- Fulfil the PadicMeasuresIwasawaAlgebras L6 modulo-M transfer and compatible-functional-lift contract; the ordered archimedean regulator input is IntegralIwasawaTheory I.7 Part II.

## ES.8. Iwasawa variation and application handoffs

Admissible ℤ_p^d-extensions, Rubin's tower hypotheses, the Iwasawa Selmer module X_∞ and the Λ-adic class of an Euler system, twisting by characters of Γ, restriction control, weak Leopoldt and Rubin's divisibilities, the Iwasawa Poitou–Tate sequence; Λ-adic Selmer structures and Kolyvagin systems, Mazur–Rubin's Euler-to-Λ-adic map, height-one specialisation and its control, generic core rank, blind spots and Λ-primitivity, the principal index and Mazur–Rubin's Λ-adic bound with its equality criterion; Howard's self-dual Λ-adic bound, its error-tolerant form, the equality for Λ-primitive systems, and the divisibility at the augmentation prime.

**Layer acceptance.** Divisibility becomes equality only under the core-rank, nonvanishing and Λ-primitivity conditions of the theorem used; several-variable statements keep Rubin's no-split-prime hypothesis and distinguish finite from pseudo-null modules.

### Z_p^d-extensions in which no finite prime splits completely

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

- `rubin-euler-systems-1999`, Ch. II §1, Definition 1.1(ii), p. 21 (published: Definition 2.1.1(ii)): The definition and the standing hypothesis this node formalises.
- `rubin-euler-systems-1999`, Ch. II §1, Remark 1.2, p. 22: The characterisation by infinite decomposition groups (the API item noSplitPrimes_iff).
- `rubin-euler-systems-1999`, Ch. II §3, opening paragraph and Notation, pp. 26–27: The setting of all Iwasawa-theoretic statements of this layer; Λ = O[[Γ]] = lim Λ_F is fixed in the same Notation paragraph.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Rubin's hypotheses Hyp(K∞, T) and Hyp(K∞, V)

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

- `rubin-euler-systems-1999`, Ch. II §3, Hypotheses Hyp(K∞, T), p. 27 (published p. 41): The definition of Hyp(K∞, T) verbatim.
- `rubin-euler-systems-1999`, Ch. II §3, p. 27: The relation to the finite-level hypotheses of ES.4.
- `rubin-euler-systems-1999`, Ch. II §2, Remark 2.4, p. 24: The rank-one example (stated for Hyp(K, T); the same argument applies over G_K∞).

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Rubin's hypothesis Hyp(K∞/K)

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

- `rubin-euler-systems-1999`, Ch. II §3, Hypothesis Hyp(K∞/K), p. 27 (published p. 41): The hypothesis verbatim.
- `rubin-euler-systems-1999`, Ch. II §3, p. 27: Its role and the case K = Q.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### The Iwasawa module X∞ of the restricted Selmer groups

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

- `rubin-euler-systems-1999`, Ch. II §3, Definition 3.1, p. 28 (published Definition 2.3.1): The construction verbatim.
- `rubin-euler-systems-1999`, Ch. VII §4, proof of Lemma 4.1, p. 110: The coinvariants identity recorded as an API item.
- `rubin-euler-systems-1999`, Ch. VII §2, proof of Lemma 2.4, p. 103: The contragredient convention for duals used throughout Chapter VII.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### The Λ-adic class c_{K,∞} of an Euler system

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

- `rubin-euler-systems-1999`, Ch. II §1, discussion after Remark 1.2, p. 22: The norm-coherence that makes c_{K,∞} an element of H¹_∞(K, T).
- `rubin-euler-systems-1999`, Ch. II §3, Definition 3.1, p. 28: The construction verbatim.
- `rubin-euler-systems-1999`, Ch. VI §2, p. 91: The variant c_{L,∞} used for twisting.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### The Λ-adic index of divisibility ind_Λ

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

- `rubin-euler-systems-1999`, Ch. II §3, Definition 3.1, p. 28: The definition verbatim.
- `rubin-euler-systems-2000`, Ch. 2 §3, proof of Theorem 2.3.8, p. 43: The divisibility convention for a non-principal ideal, in the published text.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### The true Iwasawa Selmer group and the singular local term at p

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

- `rubin-euler-systems-1999`, Ch. II §3, Remark 3.6, pp. 28–29 (published Remark 2.3.6, p. 42): The data of the construction.
- `rubin-euler-systems-1999`, Ch. II §3, Remark 3.6, p. 29: The two modules verbatim.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Twisting Euler systems by characters of infinite order

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

- `rubin-euler-systems-1999`, Ch. VI, introduction, p. 89: The purpose of the construction.
- `rubin-euler-systems-1999`, Ch. VI §3, Theorem 3.5, p. 93: Part (b) verbatim (Rubin's K is the field 𝒦 here).
- `rubin-euler-systems-1999`, Ch. VI §2, Proposition 2.1, p. 91: Part (a).

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Invariance of the Iwasawa-theoretic statements under twisting

`EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems` — theorem

**Statement.** Let c be an Euler system for (T, K∞) and ρ: Γ → O^× a character, with c^ρ the twisted Euler system of twisting-by-characters-of-gamma. Then X∞(T ⊗ ρ) ≅ X∞(T) ⊗ ρ, Tw_ρ(char X∞(T ⊗ ρ)) = char X∞(T), Tw_ρ(ind_Λ(c^ρ)) = ind_Λ(c), and Hyp(K∞, T), Hyp(K∞, V), Hyp(K∞/K) hold for T iff they hold for T ⊗ ρ. Consequently Theorems II.3.2, II.3.3 and II.3.4 for (T, c) are equivalent to the same theorems for (T ⊗ ρ, c^ρ).

**Hypotheses.**

- ρ is a character of Γ = Gal(K∞/K), so G_{K∞} acts on T ⊗ ρ as on T.
- The equalities of characteristic ideals use that Tw_ρ preserves heights of ideals of Λ.

**Proof sketch.**

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

- `rubin-euler-systems-1999`, Ch. VI §4, Theorem 4.1, p. 94: The statement verbatim.
- `rubin-euler-systems-1999`, Ch. VI §4, proof of Theorem 4.1, p. 94: The invariance of the hypotheses.
- `rubin-euler-systems-1999`, Ch. VI §1, Lemma 1.2, p. 89: The twisting rule for characteristic ideals.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Kernels and cokernels of restriction along the tower

`EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower` — theorem

**Statement.** Let N be the ideal of an Euler system for (T, K∞) and assume, after twisting by a character of Γ (twisting-invariance-of-iwasawa-theorems), that for every prime λ | N the decomposition group of λ in G_K contains γ_λ with T^{γ_λ^{p^n}=1} = (T*)^{γ_λ^{p^n}=1} = 0 for all n ≥ 0. Define the ideals A_glob = Ann_Λ(W^{G_{K∞}}) if rank Γ > 1 and Ann_Λ(W^{G_{K∞}}/(W^{G_{K∞}})_div) if Γ ≅ Z_p, the local A_v (v | p, using K_{∞,w}; v ∤ p, using inertia), A_N = ∏_{v|N} A_vΛ, and A*_glob, A*_N with W* in place of W (Rubin, Definition VII.3.1); these ideals have height at least two. Then for K ⊂_f F ⊂ K∞ and M a power of p: (i) ker(H¹(F, W) → H¹(K∞, W)^{G_F}) is finite and killed by A_glob; (ii) ker(H¹(F, W_M) → H¹(F, W)_M) is finite, bounded independently of M, and killed by Ann_Λ(W^{G_{K∞}}); (iii) coker(S_{Σp}(F, W*) → S_{Σp}(K∞, W*)^{G_F}) is finite and killed by A*_glob A*_N; (iv) if S_{Σp}(K∞, W*)^{G_F} is finite, then for every power M ≥ M_F of p, A*_glob A*_N kills coker(S_{Σp}(F, W*_M) → S_{Σp}(K∞, W*)^{G_F}); (v) coker(S_{Σp}(F, W*_M) → S_{Σp}(F, W*)_M) is finite and bounded independently of M (Rubin, Proposition VII.3.4). Moreover H^i(K∞/F, W^{G_{K∞}}), H^i(K∞/F, (W*)^{G_{K∞}}) and the local H^i(K_{∞,w}/F_w, (W*)^{G_{K_{∞,w}}}) (w | p) are finite and killed by A_glob, A*_glob, A*_v respectively, for i ≥ 1 (Lemma VII.3.3).

**Hypotheses.**

- The twist assumption (5) is available by Lemma VI.1.3(i) applied to T ⊕ T*; Lemma VII.3.7 is proved without it.
- Pseudo-nullity here means annihilated by an ideal of height at least two; for d ≥ 2 a pseudo-null module need not be finite, but every error term in this theorem is moreover finite.

**Proof sketch.**

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

- `rubin-euler-systems-1999`, Ch. VII §3, Proposition 3.4(iii), p. 107: Part (iii) verbatim.
- `rubin-euler-systems-1999`, Ch. VII §3, Lemma 3.2, p. 106: The height statement.
- `rubin-euler-systems-1999`, Ch. VII §3, opening, pp. 105–106: The twist assumption (5).

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### X∞ is finitely generated over Λ

`EulerSystemsAndKolyvaginSystems:ES.8/x-infinity-finitely-generated` — lemma

**Statement.** For every admissible K∞/K and every T, the Λ-module X∞ = Hom_O(S_{Σp}(K∞, W*), D) is finitely generated (Rubin, Lemma VII.4.1).

**Hypotheses.**

- No large-image hypothesis is needed.
- Rubin's proof uses Proposition VII.3.4(iii), stated after the twist (5); the twist does not change finite generation, since X∞(T⊗ρ) ≅ X∞(T) ⊗ ρ.

**Proof sketch.**

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

- `rubin-euler-systems-1999`, Ch. VII §4, Lemma 4.1 and proof, p. 110: Statement and the Nakayama reduction.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Rubin's evaluation maps and the constant a_τ

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

- `rubin-euler-systems-1999`, Ch. VII §1, Definition 1.2, p. 98: The constant a_τ verbatim.
- `rubin-euler-systems-1999`, Ch. VII §1, Lemma 1.3, p. 98: Finiteness and the integral case.
- `rubin-euler-systems-1999`, Ch. VII §1, Definition 1.1, p. 97: The map Ev*.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2)

`EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-an-euler-system` — theorem

**Planet:** Weak Leopoldt from an Euler system.

**Statement.** Let K∞/K be admissible, c an Euler system for (T, K∞), and suppose V satisfies Hyp(K∞, V). If c_{K,∞} does not belong to the Λ-torsion submodule of H¹_∞(K, T), then X∞ is a torsion Λ-module.

**Hypotheses.**

- No hypothesis on p (p = 2 allowed) and no Hyp(K∞/K) are needed.
- The conclusion is the weak Leopoldt conjecture for T (Rubin, Remark II.3.5).
- Non-torsion of c_{K,∞} is a hypothesis to be proved by each application (for instance Kato's Proposition 13.7 in KatoEulerSystems L4); this roadmap does not supply it.

**Proof sketch.**

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

- `rubin-euler-systems-1999`, Ch. II §3, Theorem 3.2, p. 28 (published Theorem 2.3.2, p. 41): The statement verbatim.
- `rubin-euler-systems-1999`, Ch. VII §4, opening, p. 110: The structure of the proof.
- `rubin-euler-systems-1999`, Ch. II §3, Remark 3.5, p. 28: Its name.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### The rank-one exceptional actions (Rubin, Lemma VII.3.7)

`EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case` — lemma

**Statement.** Suppose Γ ≅ Z_p and either K is imaginary quadratic or K is totally real and Leopoldt's conjecture holds for K, and that Hyp(K∞, V) holds. (i) If G_{K∞} acts trivially on T, then X∞/Ann_Λ(T)X∞ is finite. (ii) If G_{K∞} acts trivially on T(−1) = T ⊗ O(ε_cyc^{-1}), then X∞/Ann_Λ(T(−1))X∞ is finite.

**Hypotheses.**

- These are exactly the cases singled out by Hyp(K∞/K).
- Hyp(K∞, V)(ii) forces rank_O T = 1 in both cases, with T a twist of O or O(1) by a character of Γ.
- The lemma is proved without the twist assumption (5) of restriction-control-over-the-tower, which may fail for W = Q_p/Z_p; it holds for W* and Proposition VII.3.4(iii) is still available.

**Proof sketch.**

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

- `rubin-euler-systems-1999`, Ch. VII §3, Lemma 3.7, p. 109: Statement (i) verbatim; (ii) is the same for T(−1).
- `rubin-euler-systems-1999`, Ch. VII §3, proof of Lemma 3.7, p. 109: The Leopoldt step.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Selmer sequences, Kolyvagin sequences and the inductive step (Rubin, Propositions VII.1.4 and VII.1.6)

`EulerSystemsAndKolyvaginSystems:ES.8/kolyvagin-sequence-induction` — theorem

**Statement.** Assume Hyp(K∞, V) and Hyp(K∞/K), c an Euler system for (T, K∞) with c_{K,∞} not Λ-torsion, so X∞ is torsion (weak-leopoldt-from-an-euler-system), and assume after twisting (twisting-invariance-of-iwasawa-theorems) that X∞ ⊗ Λ_F and Λ_F/char(X∞)Λ_F are finite for every F (Rubin's (1)) and that the twist assumption (5) of restriction-control-over-the-tower holds. Fix an injective pseudo-isomorphism ⊕_{i=1}^{r} Λ/f_iΛ → X∞ with f_{i+1} | f_i, so char(X∞) = ∏ f_iΛ. (a) There are z_1, …, z_r ∈ X∞ and ideals g_1 ⊂ … ⊂ g_r of Λ with z_k ∈ Ev*(τG_{Ω∞}), a_τ g_k ⊂ f_kΛ, split exact sequences 0 → Σ_{i<k} Λz_i → Σ_{i≤k} Λz_i → Λ/g_k → 0, and a_τ(X∞/Σ_i Λz_i) pseudo-null (Proposition VII.1.4). (b) With Z∞ = Σ Λz_i, a Selmer sequence of length k is (σ_1, …, σ_k) in τG_{Ω∞} with Ev*(σ_i) − z_i ∈ 𝔐Z∞; for M a power of p, L_{F,M} is the fixed field of the common kernel of S_{Σp}(F, W*_M) restricted to FΩ_M, and a Kolyvagin sequence for F, M is (Q_1, …, Q_k) with Q_i over q_i ∈ R and Fr_{Q_i} = σ_i on L_{F,M}; Ψ(k, F, M) ⊂ Λ_{F,M} is the ideal generated by all ψ(κ_{F,r(π),M}), π of length k, ψ ∈ Hom_Λ(Λ_{F,M}κ_{F,r(π),M}, Λ_{F,M}) (Definition VII.1.5). (c) There is h ∈ Λ prime to char(X∞) and, for every F, a power N_F of p such that h a_τ^5 Ψ(k, F, MN_F)Λ_{F,M} ⊂ f_{k+1}Ψ(k+1, F, M) for every power M ≥ N_F of p and 0 ≤ k < r (Proposition VII.1.6).

**Hypotheses.**

- Kolyvagin sequences exist by the Chebotarev density theorem applied to the finite extensions L_{F,M}/K (EulerSystemsAndKolyvaginSystems ES.1); r(π) ∈ R_{F,M} (Lemma IV.1.3).
- In the common special case Hyp(K∞, T), O = Z_p and H¹(Ω∞/K∞, W*) = 0, (a) holds with g_i = f_iΛ and any z_i realising the pseudo-isomorphism (Rubin, §6, first paragraph).
- Pseudo-null means annihilated by an ideal of height at least two; for d ≥ 2 such modules need not be finite.

**Proof sketch.**

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

- `rubin-euler-systems-1999`, Ch. VII §1, Proposition 1.6, p. 100: Part (c) verbatim.
- `rubin-euler-systems-1999`, Ch. VII §1, Proposition 1.4, pp. 98–99: Part (a).
- `rubin-euler-systems-1999`, Ch. VII §1, after Proposition 1.6, p. 100: Its role.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### The error-tolerant Iwasawa bound char(X∞) | a_τ^{5r} ind_Λ(c) (Rubin, Theorem VII.1.9)

`EulerSystemsAndKolyvaginSystems:ES.8/characteristic-ideal-bound-with-error` — theorem

**Statement.** Let K∞/K be admissible, c an Euler system for (T, K∞), and assume Hyp(K∞, V) and Hyp(K∞/K). Let r be the number of elementary divisors of X∞ (with r = 0 if X∞ is pseudo-null) and a_τ the constant of iwasawa-evaluation-maps. Then char(X∞) divides a_τ^{5r} ind_Λ(c), that is, a_τ^{5r} ind_Λ(c) ⊂ char(X∞).

**Hypotheses.**

- If c_{K,∞} is Λ-torsion then ind_Λ(c) = 0 and there is nothing to prove; otherwise X∞ is torsion by weak-leopoldt-from-an-euler-system and r is finite.
- The error a_τ^{5r} is an explicit integer: this is the Iwasawa-theoretic counterpart of ES.4's error-tolerant interface, and it disappears exactly when a_τ = 1, e.g. under Hyp(K∞, T).

**Proof sketch.**

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

- `rubin-euler-systems-1999`, Ch. VII §1, Theorem 1.9, p. 101: The statement verbatim.
- `rubin-euler-systems-1999`, Ch. VII §1, Lemma 1.8, p. 101: The divisibility lemma of the proof.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Rubin's Iwasawa divisibility char(X∞) | ind_Λ(c) (Theorem II.3.3)

`EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility` — theorem

**Planet:** Rubin's Iwasawa divisibility.

**Statement.** Let K∞/K be admissible and c an Euler system for (T, K∞). If T satisfies Hyp(K∞, T) and Hyp(K∞/K), then char(X∞) divides ind_Λ(c), i.e. ind_Λ(c) ⊂ char(X∞).

**Hypotheses.**

- Rubin's convention: char(X∞) = 0 when X∞ is not torsion; if c_{K,∞} is torsion both sides are 0.
- Integral divisibility needs Hyp(K∞, T); under only Hyp(K∞, V) one gets rubin-rational-iwasawa-divisibility.
- Valid for every d ≥ 1 and also for p = 2 (Rubin, after Corollary III.2.4, as used in EulerSystemsCyclotomicMainConjecture); for d ≥ 2 divisibility of characteristic ideals ignores pseudo-null modules, which need not be finite.
- This is a divisibility only; equality needs the separately sourced primitivity or main-conjecture arguments of the consumers.

**Proof sketch.**

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

- `rubin-euler-systems-1999`, Ch. II §3, Theorem 3.3, p. 28 (published Theorem 2.3.3, p. 42): The statement verbatim.
- `rubin-euler-systems-1999`, Ch. VII §1, end, pp. 101–102: The deduction from Theorem VII.1.9.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Divisibility up to a power of p (Rubin, Theorem II.3.4)

`EulerSystemsAndKolyvaginSystems:ES.8/rubin-rational-iwasawa-divisibility` — theorem

**Statement.** Let K∞/K be admissible and c an Euler system for (T, K∞). If V satisfies Hyp(K∞, V) and Hyp(K∞/K), then there is an integer t ≥ 0 such that char(X∞) divides p^t ind_Λ(c).

**Hypotheses.**

- t is effective: t can be taken with p^t = a_τ^{5r} up to a unit (Theorem VII.1.9).
- At height-one primes 𝔓 ≠ ϖΛ (the only height-one prime containing p) this gives length_{Λ_𝔓}((X∞)_𝔓) ≤ ord_𝔓(ind_Λ(c)), the form in which KatoEulerSystems L4 states its imported bound.

**Proof sketch.**

1. a_τ is a finite positive integer by Lemma VII.1.3(i); apply characteristic-ideal-bound-with-error and take p^t the p-part of a_τ^{5r} (the prime-to-p part is a unit of Λ).

**Acceptance.**

- With Hyp(K∞, T), t = 0 recovers Theorem II.3.3.
- For T = O² with τ = (1 ϖ^m; 0 1), V irreducible over G_{K∞} and Hyp(K∞/K), the theorem applies although Hyp(K∞, T) fails.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/characteristic-ideal-bound-with-error`
- `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis`

**Sources.**

- `rubin-euler-systems-1999`, Ch. II §3, Theorem 3.4, p. 28 (published Theorem 2.3.4, p. 42): The statement verbatim.
- `rubin-euler-systems-1999`, Ch. VII §1, end, p. 102: The deduction.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### The Iwasawa Poitou–Tate sequence (Rubin, Proposition II.3.7)

`EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-poitou-tate-sequence` — theorem

**Statement.** With the data of true-iwasawa-selmer-and-singular-quotient there is an exact sequence of Λ-modules 0 → H¹_{∞,s}(K_p, T)/loc^s_{Σp}(H¹_∞(K, T)) → Hom_O(S(K∞, W*), D) → X∞ → 0.

**Hypotheses.**

- No hypothesis on T or on an Euler system is needed.
- It uses that H¹_∞(K, T) = lim_F S^{Σp}(F, T), which needs admissibility (every v ∤ p has infinite decomposition group).

**Proof sketch.**

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

- `rubin-euler-systems-2000`, Ch. 2 §3, Proposition 2.3.7 and proof, pp. 42–43: The proof in the published text (the 1999 draft cites Corollary B.3.4 here).
- `rubin-euler-systems-1999`, Ch. II §3, Proposition 3.7, p. 29: The statement verbatim.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Divisibility for the true Selmer group (Rubin, Theorem II.3.8)

`EulerSystemsAndKolyvaginSystems:ES.8/true-selmer-iwasawa-divisibility` — theorem

**Statement.** Let K∞/K be admissible, c an Euler system for (T, K∞), and suppose V satisfies Hyp(K∞, V) and Hyp(K∞/K), with local conditions at p as in true-iwasawa-selmer-and-singular-quotient. If loc^s_{Σp}(c_{K,∞}) ∉ H¹_{∞,s}(K_p, T)_{Λ-tors} and H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞}) is a torsion Λ-module, then Hom_O(S(K∞, W*), D) is a torsion Λ-module and (i) for some t ≥ 0, char(Hom_O(S(K∞, W*), D)) divides p^t char(H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞})); (ii) if T satisfies Hyp(K∞, T), char(Hom_O(S(K∞, W*), D)) divides char(H¹_{∞,s}(K_p, T)/Λ loc^s_{Σp}(c_{K,∞})).

**Hypotheses.**

- The right-hand side is principal, so the divisibility is between principal ideals.
- The torsion hypothesis on H¹_{∞,s}(K_p, T)/Λ loc^s(c_{K,∞}) is the rank-one condition at p; it is verified by each application (Coleman maps and explicit reciprocity in KatoEulerSystems and PadicHodgeRegulators).

**Proof sketch.**

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

- `rubin-euler-systems-2000`, Ch. 2 §3, Theorem 2.3.8, p. 43: The hypotheses and first conclusion, in the published text.
- `rubin-euler-systems-2000`, Ch. 2 §3, proof of Theorem 2.3.8, p. 43: The key step of the proof.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### Rubin's condition (*) at completely split primes

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

- `rubin-euler-systems-1999`, Ch. IX §2, p. 136: The condition verbatim.
- `rubin-euler-systems-1999`, Ch. IX §2, p. 136: The replacement argument.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### The Λ-adic representation 𝐓 = T ⊗ Λ and its Selmer structures

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

- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.2, p. 60: The canonical structure (a).
- `mazur-rubin-kolyvagin-systems`, §5.3, after Definition 5.3.2, p. 60: The propagation caveat.
- `howard-heegner-point-kolyvagin-system`, §2.2, Definition 2.2.6, p. 25: The ordinary structure (b).

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### Λ-adic Kolyvagin systems

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

- `mazur-rubin-kolyvagin-systems`, §3.1, Definition 3.1.3, p. 20: The definition, applied to R = Λ.
- `mazur-rubin-kolyvagin-systems`, §3.1, Definition 3.1.6, p. 21: The generalized module and the comparison map (the overline is lost in the text layer of the author copy).
- `buyukboduk-lambda-adic-kolyvagin-systems`, §3.2, Remark 3.24, p. 27: The terminology.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### From Euler systems to Λ-adic Kolyvagin systems (Mazur–Rubin, Theorem 5.3.3)

`EulerSystemsAndKolyvaginSystems:ES.8/euler-to-lambda-adic-kolyvagin` — theorem

**Statement.** Let K = Q, K∞ = Q∞, 𝐓 = T ⊗ Λ with the canonical structure F_Λ, P a set of primes ℓ ≠ p at which T is unramified, and 𝒦 an abelian extension of Q containing the maximal abelian p-extension of Q unramified outside p and P. Suppose (a) T/(Fr_ℓ − 1)T is a cyclic O-module for every ℓ ∈ P, and (b) Fr_ℓ^{p^k} − 1 is injective on T for every ℓ ∈ P and every k ≥ 0. Then there is a canonical homomorphism ES(T, 𝒦, P) → KS‾(𝐓, F_Λ, P) sending c to κ with κ_1 = {c_{Q_n}}_n ∈ lim_n H¹(Q_n, T) = H¹(Q, 𝐓).

**Hypotheses.**

- Mazur–Rubin's Euler systems use the factors P_ℓ(Fr_ℓ^{-1}) with P_ℓ(x) = det(1 − Fr_ℓ x | T) (their Definition 3.2.2), not Rubin's P(Fr_q^{-1}|T*; Fr_q^{-1}); ES.2's normalization dictionary transports between them (Mazur–Rubin, Remark 3.2.3; Rubin §IX.6).
- This is the rank-one map over the cyclotomic tower of Q; over other bases and for the anticyclotomic tower the Λ-adic Kolyvagin systems of the applications are constructed by their owners (HeegnerPointEulerSystems HE.8 for Heegner points).
- Mazur–Rubin state the theorem inside §5.3, whose standing assumptions are (H.0)–(H.4) and P = P_1; their proof (Appendix A, as for Theorem 3.2.4) uses only (a), (b) and the containment of the ray-class tower in 𝒦, so the statement here carries only those.

**Proof sketch.**

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

- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.3, p. 61: The hypotheses verbatim.
- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.3, p. 61: The conclusion (the target is the generalized module KS‾(𝐓); the overline and boldface are lost in the text layer).
- `mazur-rubin-kolyvagin-systems`, Appendix A, proof of Theorem 5.3.3, pp. 81–82: The proof route.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### The exceptional set Σ_Λ of height-one primes

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

- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.12, p. 62: The definition verbatim.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### Specialization of Λ-adic Kolyvagin systems at height-one primes

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

- `mazur-rubin-kolyvagin-systems`, §5.3, p. 62: The ring S_𝔓 and the specialized representation.
- `mazur-rubin-kolyvagin-systems`, §5.3, Corollary 5.3.15, p. 64: The specialization map.
- `mazur-rubin-kolyvagin-systems`, §5.3, proof of Theorem 5.3.10, p. 66: The perturbations.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### Control of Selmer groups at height-one specializations

`EulerSystemsAndKolyvaginSystems:ES.8/specialization-control` — theorem

**Statement.** (Mazur–Rubin, canonical structure, K = Q, K∞ = Q∞, T satisfying (H.0)–(H.4).) For every height-one prime 𝔓 of Λ and every place v, the inclusion 𝐓/𝔓𝐓 ↪ T ⊗ S_𝔓 induces H¹_{F_Λ}(Q_v, 𝐓/𝔓𝐓) → H¹_{F_can}(Q_v, T ⊗ S_𝔓) and H¹_{F_can*}(Q_v, (T ⊗ S_𝔓)*) → H¹_{F_Λ*}(Q_v, (𝐓/𝔓𝐓)*), whose kernels and cokernels, for 𝔓 ∉ Σ_Λ, are finite of order bounded by a constant depending only on T and [S_𝔓 : Λ/𝔓] (Lemma 5.3.13). Globally, π_𝔓: H¹(Q, 𝐓)/𝔓H¹(Q, 𝐓) ↪ H¹_{F_can}(Q, T ⊗ S_𝔓) is injective for every 𝔓, and π*_𝔓: H¹_{F_can*}(Q, (T ⊗ S_𝔓)*) → H¹_{F_Λ*}(Q, 𝐓*)[𝔓] is defined; for 𝔓 ∉ Σ_Λ, coker π_𝔓, ker π*_𝔓 and coker π*_𝔓 are finite of order bounded by a constant depending only on T and [S_𝔓 : Λ/𝔓] (Proposition 5.3.14). (Howard, ordinary structure, T = T_pE over the anticyclotomic tower.) The same holds for every height-one 𝔓 ≠ pΛ locally (Lemma 2.2.7, bounds depending only on [S_𝔓 : Λ/𝔓]) and, outside a finite set Σ_Λ, globally for H¹_{F_Λ}(K, 𝐓)/𝔓 → H¹_{F_𝔓}(K, 𝐓_𝔓) and H¹_{F_𝔓}(K, 𝐀_𝔓) → H¹_{F_Λ}(K, 𝐀)[𝔓] (Proposition 2.2.8).

**Hypotheses.**

- (H.3) of Mazur–Rubin §3.5 (ES.0) gives H⁰(Q_Σ/Q, T ⊗ (S_𝔓/(Λ/𝔓))) = 0 (their Lemma 3.5.2), used for injectivity.
- The uniformity of the bounds in [S_𝔓 : Λ/𝔓] is essential: along the perturbations 𝔓_N of height-one-specialization this index is constant, so the error is O(1) as N grows.
- Howard's local proof at v | p uses that the residue field points Ẽ(F_v)[p^∞] are finite and that K∞,v/K_v is totally ramified; the generic statement for another ordinary representation must re-verify these inputs.

**Proof sketch.**

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

- `mazur-rubin-kolyvagin-systems`, §5.3, Proposition 5.3.14, p. 64: The global control statement.
- `mazur-rubin-kolyvagin-systems`, §5.3, Lemma 5.3.13, p. 62: The local control statement.
- `howard-heegner-point-kolyvagin-system`, §2.2, Proposition 2.2.8, p. 26: Howard's ordinary version.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### The generic core rank χ(𝐓) (Mazur–Rubin, Lemma 5.3.16)

`EulerSystemsAndKolyvaginSystems:ES.8/generic-core-rank` — theorem

**Statement.** For K = Q, K∞ = Q∞ and every height-one prime 𝔓 ∉ Σ_Λ, the core Selmer rank of (T ⊗ S_𝔓, F_can) is χ(T ⊗ S_𝔓, F_can) = rank_{Z_p} T^-, where T^- is the (−1)-eigenspace of a complex conjugation. The common value χ(𝐓) := rank_{Z_p} T^- is the generic core rank of 𝐓.

**Hypotheses.**

- Core rank is ES.0's notion (Mazur–Rubin, Definition 4.1.11), with the formula χ(T ⊗ S) = rank (T ⊗ S)^- + corank H⁰(Q_p, (T ⊗ S)*) of their Theorem 5.2.15 for the canonical structure.
- By Perrin-Riou's Proposition 1.3.2, if the weak Leopoldt conjecture holds for T then rank_Λ H¹(Q, 𝐓) = χ(𝐓) (Mazur–Rubin, Remark 5.3.18).

**Proof sketch.**

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

- `mazur-rubin-kolyvagin-systems`, §5.3, Lemma 5.3.16, p. 65: The statement verbatim.
- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.17, p. 65: The definition of the generic core rank.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### The blind spot and Λ-primitive Kolyvagin systems

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

- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.9, p. 61: Λ-primitivity and its distinction from primitivity.
- `mazur-rubin-kolyvagin-systems`, §3.1, Definition 3.1.6, p. 21: The blind spot.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### Residual primitivity implies Λ-primitivity

`EulerSystemsAndKolyvaginSystems:ES.8/residual-primitivity-implies-lambda-primitivity` — lemma

**Statement.** If κ ∈ KS‾(𝐓) has nonzero image in KS‾(𝐓/𝔐𝐓) = KS‾(T̄) (equivalently, when χ(T̄) = 1, in KS(T̄)), then κ is Λ-primitive.

**Hypotheses.**

- The converse fails in general: Λ-primitivity concerns only height-one primes, primitivity the maximal ideal (Mazur–Rubin, Definition 5.3.9).

**Proof sketch.**

1. For every height-one 𝔓 ⊂ 𝔐 the reduction KS‾(𝐓) → KS‾(𝐓/𝔐𝐓) factors as KS‾(𝐓) → KS‾(𝐓/𝔓𝐓) → KS‾(𝐓/𝔐𝐓) (functoriality, lambda-adic-kolyvagin-systems); a nonzero image at the end forces a nonzero image at 𝔓, so 𝔓 is not in the blind spot (Büyükboduk, proof of Proposition 4.1).

**Acceptance.**

- Applied to the cyclotomic-unit system for O(1) ⊗ ρ^{-1}, ρ even of prime-to-p order, unramified at p, with ρ(p) ≠ 1, which is primitive by Mazur–Rubin's Remark 6.1.8, it gives Λ-primitivity.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/blind-spot-and-lambda-primitivity`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`

**Sources.**

- `buyukboduk-lambda-adic-kolyvagin-systems`, §4.1.1, proof of Proposition 4.1, pp. 28–29: The argument, in the cyclotomic-unit case.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### Mazur–Rubin's principal index Ind(c)

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

- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.8, p. 61: The definition as printed.
- `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.8, p. 61: The gcd description adopted here.
- `mazur-rubin-kolyvagin-systems`, §5.3, proof of Theorem 5.3.10, p. 66: The convention Ind(0) = 0 used by the authors.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### Weak Leopoldt from a Λ-adic Kolyvagin system (Mazur–Rubin, Theorem 5.3.6)

`EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-lambda-adic-kolyvagin` — theorem

**Statement.** Let K = Q, K∞ = Q∞, T satisfy (H.0)–(H.4) of Mazur–Rubin §3.5, and κ ∈ KS‾(𝐓, F_Λ, P) with κ_1 ≠ 0 (F_Λ canonical). Then for all but finitely many height-one primes 𝔓 the class κ^{(𝔓)}_1 ∈ H¹(Q, T ⊗ S_𝔓) is nonzero (Corollary 5.3.19), and H¹_{F_Λ*}(Q, 𝐓*) is a co-torsion Λ-module, i.e. X∞ is Λ-torsion (Theorem 5.3.6).

**Hypotheses.**

- Theorem 5.3.6 is stated for KS(𝐓) and holds with the same proof for KS‾(𝐓) (Remark 5.3.11).
- This is the Kolyvagin-system counterpart of weak-leopoldt-from-an-euler-system; for κ from an Euler system c, κ_1 = c_{Q,∞}.

**Proof sketch.**

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

- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.6, p. 61: Theorem 5.3.6 verbatim.
- `mazur-rubin-kolyvagin-systems`, §5.3, Corollary 5.3.19, p. 65: Corollary 5.3.19 verbatim.
- `mazur-rubin-kolyvagin-systems`, §5.3, proof of Theorem 5.3.6, pp. 65–66: The proof.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### The Λ-adic Kolyvagin-system bound and its equality criterion (Mazur–Rubin, Theorem 5.3.10)

`EulerSystemsAndKolyvaginSystems:ES.8/mazur-rubin-lambda-adic-main-theorem` — theorem

**Planet:** Mazur–Rubin Λ-adic Kolyvagin bound.

**Statement.** Let K = Q, K∞ = Q∞, T satisfy (H.0)–(H.4), F_Λ canonical, X∞ = Hom(H¹_{F_Λ*}(Q, 𝐓*), Q_p/Z_p), and κ ∈ KS‾(𝐓, F_Λ, P). (i) char(X∞) divides Ind(κ). (ii) If χ(𝐓) = 1, κ_1 ≠ 0 and 𝔓 is a height-one prime not in the blind spot of κ, then ord_𝔓 char(X∞) = ord_𝔓 Ind(κ). (iii) If χ(𝐓) = 1, κ_1 ≠ 0 and κ is Λ-primitive, then char(X∞) = Ind(κ).

**Hypotheses.**

- (i) is a divisibility only; equality needs all three conditions of (iii): generic core rank one, nonvanishing bottom class and Λ-primitivity. Nonvanishing alone does not give equality.
- With Ind(0) = 0 (lambda-adic-ind), (i) is trivial when κ_1 = 0.
- For κ coming from an Euler system c via euler-to-lambda-adic-kolyvagin, Ind(κ) = Ind(c_{Q,∞}) and (i) is consistent with rubin-iwasawa-divisibility.

**Proof sketch.**

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

- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.10, p. 62: Parts (i)–(ii) verbatim, including the printed repetition 'is is'.
- `mazur-rubin-kolyvagin-systems`, §5.3, Theorem 5.3.10(iii), p. 62: Part (iii) verbatim.
- `mazur-rubin-kolyvagin-systems`, §5.3, proof of Theorem 5.3.10, p. 67: The length comparison along the perturbations.

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### The self-dual Λ-adic Kolyvagin bound (Howard, Theorem 2.2.10)

`EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound` — theorem

**Planet:** Howard's self-dual Λ-adic bound.

**Statement.** Let K be imaginary quadratic, K∞/K its anticyclotomic Z_p-extension, Λ = O[[Γ]] with the involution ι, 𝐓 = T ⊗ Λ, 𝐀 = Hom(𝐓, μ_{p^∞}) with the perfect pairing e_Λ: 𝐓 × 𝐀 → μ_{p^∞}, e_Λ(λt, a) = e_Λ(t, λ^ι a), and F_Λ a Λ-adic Selmer structure whose local conditions on 𝐓 and 𝐀 are exact orthogonal complements; X = Hom(H¹_{F_Λ}(K, 𝐀), Q_p/Z_p). Assume: (A) H¹_{F_Λ}(K, 𝐓) is Λ-torsion-free; (B) specialization-control holds for (𝐓, F_Λ) with a finite exceptional set Σ_Λ; (C) for every height-one 𝔓 ≠ pΛ (and the perturbed 𝔔 = (g + p^m)) outside Σ_Λ, the specialized Selmer triple (T_𝔓, F_𝔓, L_s) satisfies Howard's hypotheses H.0–H.5, so that ES.5's self-dual DVR theorem (Howard, Theorem 1.6.1, Proposition 2.1.3) applies; (D) char(X_tors) = char(X_tors)^ι. If for some s there is κ ∈ KS(𝐓, F_Λ, L_s) with κ_1 ≠ 0, then (a) H¹_{F_Λ}(K, 𝐓) is torsion-free of rank one; (b) there is a torsion Λ-module M with char(M) = char(M)^ι and a pseudo-isomorphism X ∼ Λ ⊕ M ⊕ M; (c) char(M) divides char(H¹_{F_Λ}(K, 𝐓)/Λκ_1). For T = T_pE, E/Q ordinary at p with surjective ρ̄_{E,p} and Howard's standing hypotheses on (E, K, p), with the ordinary structure, (A)–(D) are verified by the consumer HeegnerPointEulerSystems HE.8 (Howard, Proposition 2.1.3, Lemma 2.2.7, Proposition 2.2.8, Lemma 2.2.9, and Nekovář's functional equation char(X_tors) = char(X_tors)^ι), and the theorem then is Howard's Theorem 2.2.10.

**Hypotheses.**

- The anticyclotomic tower is not admissible (inert primes split completely), so Rubin's Theorem II.3.3 does not apply; this theorem works directly with Kolyvagin systems.
- (c) is a divisibility, with the factor two of the self-dual structure built into X ∼ Λ ⊕ M ⊕ M; it is not a universal formula for every T.
- The nonvanishing κ_1 ≠ 0 is an input; for Heegner points it is the Cornut–Vatsal nonvanishing proved in HeegnerPointEulerSystems HE.8, never derived here.
- Howard writes the theorem for T_pE; the abstraction (A)–(D) lists exactly the inputs his proof uses.

**Proof sketch.**

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

- `howard-heegner-point-kolyvagin-system`, §2.2, Theorem 2.2.10, p. 26: The hypotheses and conclusion (a).
- `howard-heegner-point-kolyvagin-system`, §2.2, Theorem 2.2.10(b)–(c), p. 26: Conclusions (b)–(c).
- `howard-heegner-point-kolyvagin-system`, §2.2, proof of Theorem 2.2.10, p. 27: The method: Mazur–Rubin's perturbation argument (their Theorem 5.3.10).

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### Equality in Howard's Λ-adic bound for Λ-primitive self-dual systems *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-primitivity-equality` — theorem

**Statement.** Let E/ℚ have conductor N prime to D_K, p ∤ ND_K, p ≥ 5, good reduction at p and surjective residual representation, K∞/K the anticyclotomic ℤ_p-extension, Λ = ℤ_p[[Gal(K∞/K)]], 𝐓 = T_pE ⊗ Λ with the Selmer structure F_Λ of ES.8/self-dual-lambda-adic-kolyvagin-bound (ordinary or, in the supersingular case, the Castella–Wan structure), and X = Hom(H¹_{F_Λ}(K, 𝐀), ℚ_p/ℤ_p). A Λ-adic Kolyvagin system κ ∈ KS(𝐓, F_Λ, 𝓛) with 𝓛 ⊇ 𝓛_s is Λ-primitive if for every height-one prime 𝔓 there is k with nonzero image in KS(𝐓/(𝔓, m^k), F_Λ, 𝓛_j) for all j ≥ s, and primitive if its image in KS(𝐓/m, F_Λ, 𝓛) is nonzero; primitive implies Λ-primitive. If κ₁ ≠ 0 then (a) H¹_{F_Λ}(K, 𝐓) is torsion-free of Λ-rank one; (b) X ∼ Λ ⊕ M ⊕ M for a torsion Λ-module M with char(M) = char(M)^ι; (c) char(M) divides char(H¹_{F_Λ}(K, 𝐓)/Λκ₁), with equality if κ is Λ-primitive.

**Hypotheses.**

- E/ℚ, (N, D_K) = 1, p ∤ ND_K, p ≥ 5, good reduction at p, residual surjectivity
- κ ∈ KS(𝐓, F_Λ, 𝓛) with 𝓛 ⊇ 𝓛_s and κ₁ ≠ 0

**Proof sketch.**

1. (a), (b) and the divisibility in (c) are ES.8/self-dual-lambda-adic-kolyvagin-bound.
2. For the equality: for 𝔓 = (g) ≠ pΛ put 𝔔_m = (g + p^m) (and (p + T^m) for 𝔓 = pΛ); for m large Λ/𝔓 ≅ Λ/𝔔_m and 𝔔_m avoids the finite exceptional set, so the specialisation is controlled with bounded kernel and cokernel (ES.8/specialization-control). ES.5/self-dual-structure-theorem at 𝔔_m gives m·d·ord_𝔓 char(M) = m·d·ord_𝔓 char(H¹/Λκ₁) − d(κ^{(𝔔_m)}) + O(1), d = rank_{ℤ_p} Λ/𝔓.
3. Λ-primitivity gives κ^{(𝔓)} ≠ 0, hence d(κ^{(𝔓)}) < ∞; a core vertex n with κ^{(𝔓,k)}_n ≠ 0 remains a core vertex for 𝔔_m when m ≥ k because T_𝔓/m^k ≅ T_{𝔔_m}/m^k, so d(κ^{(𝔔_m)}) ≤ k is bounded and the orders agree.
4. Primitive implies Λ-primitive: a residually nonzero system has d = 0, so its image at every height-one prime 𝔓 (with (𝔓, m) = m) is nonzero with k(𝔓) = 1.

**Acceptance.**

- For the Heegner Kolyvagin system, primitivity (Kolyvagin's conjecture in its refined form) gives the anticyclotomic main conjecture equality char(M) = char(H¹/Λκ₁^{Hg}).
- A system that is Λ-primitive but has vanishing residual image is allowed: (c) still gives equality.
- Scaling κ by a non-unit of Λ destroys Λ-primitivity at the primes dividing it and strictly enlarges the right-hand side of (c).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`
- `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`
- `EulerSystemsAndKolyvaginSystems:ES.8/blind-spot-and-lambda-primitivity`
- `EulerSystemsAndKolyvaginSystems:ES.5/self-dual-structure-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.5/self-dual-divisibility-profile`

**Sources.**

- `zanarella`, §2.4, Proposition 2.4.1, Definitions 2.4.2–2.4.3 and Proposition 2.4.4, pp. 21–22 (arXiv v1): the specialised exact formula, Λ-primitivity and primitivity of Λ-adic systems, and primitive implies Λ-primitive.
- `zanarella`, §2.4, Theorem 2.4.5 and its proof, pp. 22–24 (arXiv v1): Howard's Λ-adic divisibility with equality for Λ-primitive systems, by deforming height-one primes.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


### The error-tolerant self-dual Λ-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1)

`EulerSystemsAndKolyvaginSystems:ES.8/error-tolerant-self-dual-lambda-adic-bound` — theorem

**Statement.** Generic form: in the setting of self-dual-lambda-adic-kolyvagin-bound, replace (C) and (D) by (C'): at the height-one primes 𝔔 ∉ Σ_Λ the finite-level error-tolerant theorem of ES.4 holds, H¹_{F_𝔔}(K, T_𝔔) free of rank one, H¹_{F_𝔔}(K, A_𝔔) ≅ D_𝔔 ⊕ M_𝔔 ⊕ M_𝔔 with M_𝔔 finite and length M_𝔔 ≤ length(H¹_{F_𝔔}(K, T_𝔔)/S_𝔔κ^{(𝔔)}_1) + E_𝔔, where for every height-one 𝔓 outside a finite set Σ' the errors E_𝔔 at 𝔔 = (g + p^m) are bounded as m varies. Then H¹_{F_Λ}(K, 𝐓) has rank one, X ∼ Λ ⊕ M ⊕ M with M torsion, and char(M) divides char(H¹_{F_Λ}(K, 𝐓)/Λκ_1) after inverting the primes of Σ', i.e. ord_𝔓 char(M) ≤ ord_𝔓 char(H¹_{F_Λ}(K, 𝐓)/Λκ_1) for every height-one 𝔓 ∉ Σ'. Instance (Castella–Grossi–Lee–Skinner): E/Q of conductor N, p ∤ 2N good ordinary, K imaginary quadratic with D_K prime to Np and E(K)[p] = 0 (residual irreducibility not assumed), 𝐓 = T_pE ⊗ Λ with the ordinary structure (relaxed away from p on 𝐓), L = L_E, 𝔓_0 = (γ − 1): if κ ∈ KS(𝐓, F_Λ, L_E) has κ_1 ≠ 0, then H¹_{F_Λ}(K, 𝐓) has Λ-rank one and X ∼ Λ ⊕ M ⊕ M with char_Λ(M) | char_Λ(H¹_{F_Λ}(K, 𝐓)/Λκ_1) in Λ[1/p, 1/(γ − 1)] (Theorem 3.4.1); if moreover H¹_F(K, E[p^∞]) has Z_p-corank one, the divisibility holds in Λ[1/p] (Corollary 3.4.2).

**Hypotheses.**

- The finite-level error-tolerant theorem (Castella et al., Theorem 3.2.1, with error E_α depending on C_α, T_pE and rank R) is owned by ES.4; this node owns only its Iwasawa variation.
- Near 𝔓_0 the constant C_α of the specializations is unbounded, hence the localization at γ − 1; Corollary 3.4.2 removes it using control at 𝔓_0, which the source does not prove: the node uses the control statement rank_{Z_p} X/𝔓_0X = corank_{Z_p} H¹_F(K, E[p^∞]) recorded as PAPER-CASTELLA-ETAL-22/E32 (from E(K∞)[p] = 0 and finiteness of the local terms); this control theorem is requested from SelmerIwasawaCohomology L3, which owns Iwasawa control.
- In Z_p-lengths the error at 𝔔 is f_𝔔·E_{α_𝔔}, f_𝔔 the residue degree of S_𝔔 (PAPER-CASTELLA-ETAL-22/E29); the character α_𝔓 is Ψ mod 𝔓 in the convention of lambda-adic-selmer-structure.
- Consumers: RankZeroOneBSD BSD.7a uses the instance for the Eisenstein branch with HE.8's Heegner classes; the divisibility away from p is all it provides.

**Proof sketch.**

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

- `castella-grossi-lee-skinner-eisenstein`, §3.4, Theorem 3.4.1, p. 26: Theorem 3.4.1 verbatim.
- `castella-grossi-lee-skinner-eisenstein`, §3.4, Corollary 3.4.2, p. 27: Corollary 3.4.2.
- `castella-grossi-lee-skinner-eisenstein`, §3.4, proof of Theorem 3.4.1, p. 27: The uniformity of the error, which is hypothesis (C').

**Suggested library placement:** `TauCeti/NumberTheory/KolyvaginSystems/Lambda`, namespace `TauCeti.KolyvaginSystem`. Implementation status: `unchecked`.


### Λ-adic divisibility including the augmentation prime *(added in the whole-roadmap pass)*

`EulerSystemsAndKolyvaginSystems:ES.8/augmentation-prime-divisibility` — theorem

**Statement.** Let E/ℚ, p ∤ 2N good ordinary, K imaginary quadratic with (D_K, Np) = 1 and E(K)[p] = 0, Λ the anticyclotomic Iwasawa algebra with augmentation ideal (γ − 1), 𝐓 = T_pE ⊗ Λ with the ordinary Selmer structure F_Λ, X = H¹_{F_Λ}(K, M_E)^∨ and S = H¹_{F_Λ}(K, 𝐓). If κ ∈ KS(𝐓, F_Λ, 𝓛_E) has κ₁ ≠ 0, then S has Λ-rank one and there is a finitely generated torsion Λ-module M with X ∼ Λ ⊕ M ⊕ M and char_Λ(M) dividing char_Λ(S/Λκ₁) in Λ[1/p]: unlike ES.8/error-tolerant-self-dual-lambda-adic-bound, the prime (γ − 1) is not inverted. For the Galois lattice of a weight-2r newform at an Eisenstein prime with a Kolyvagin system whose bottom class is non-torsion, the divisibility holds in Λ.

**Hypotheses.**

- E/ℚ, p ∤ 2N good ordinary, (D_K, Np) = 1, E(K)[p] = 0
- κ ∈ KS(𝐓, F_Λ, 𝓛_E) with κ₁ ≠ 0

**Proof sketch.**

1. At height-one primes 𝔓 ≠ (p), (γ − 1) the argument of ES.8/error-tolerant-self-dual-lambda-adic-bound applies: specialise at 𝔔_m = (g + p^m) and use ES.4/howard-descent-with-errors with error E_α bounded in m.
2. At 𝔓 = (γ − 1) the specialisations are characters α_m ≡ 1 mod p^m, where E_α grows with m; replace that input by ES.4/uniform-near-trivial-bound(a), whose error is independent of m, so ord_{(γ−1)} char(M) ≤ ord_{(γ−1)} char(S/Λκ₁).
3. For the weight-2r statement, Keller–Yin observe that the computation of Howard's Theorem 2.2.10 also works at the prime (p) once the uniform bounds are available.

**Acceptance.**

- If moreover H¹_F(K, E[p^∞]) has ℤ_p-corank one, the error-tolerant theorem already gave the divisibility at (γ − 1); this theorem removes that corank hypothesis.
- For the Heegner Kolyvagin system this gives one divisibility of the Heegner point main conjecture in Λ[1/p] at Eisenstein primes.

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8/error-tolerant-self-dual-lambda-adic-bound`
- `EulerSystemsAndKolyvaginSystems:ES.4/uniform-near-trivial-bound`
- `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-kolyvagin-systems`

**Sources.**

- `cgs`, §6.5, Theorem 6.5.1 and its proof, p. 28 (arXiv v2): the Λ-adic divisibility in Λ[1/p] including the augmentation prime, by using the uniform near-trivial bound at (γ − 1).
- `ky`, §3, Theorem 3.0.5 and its proof, pp. 36–37 (arXiv v2): the weight-2r version, with the remark that the divisibility holds without inverting p.

**Suggested library placement:** `TauCeti/NumberTheory/EulerSystems/Iwasawa`, namespace `TauCeti.EulerSystem`. Implementation status: `unchecked`.


**Open refinements of ES.8.**

- Lemma level: Rubin Chapter VII §§5–7 (Propositions 5.1–5.2, Lemmas 6.1–6.3, Lemma 7.1–Proposition 7.7).
- The comparison of Kato's H²(T)_0 with X_∞ (no public source found; carried from the ES.8 part).
- The rank-two conjugate-self-dual ordinary bound requested by RankZeroOneBSD BSD.0 is served by error-tolerant-self-dual-lambda-adic-bound and augmentation-prime-divisibility; the higher-weight image constants stay with BSD.6a.

## Supplier contracts

Each contract names the supplying layer, the exact statement needed and the targets that use it.

- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields.** Existence of the ray class field of K modulo a prime q, with Gal(K[q]/K) ≅ the ray class group Cl_q(K), and the description of its ramification; used to define K(q), K(1) and Γ_q. Used by `ES.1/ray-class-tower`, `ES.2/conductor-presentation`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.** The absolute local Artin map, normalized by arithmetic Frobenius, and its restriction to finite tame extensions, identifying the p-primary tame inertia quotient with residue-field units (or the relative residue-unit quotient at Howard’s inert primes). Local Tate duality is supplied separately by Layer 5. Used by `ES.1/finite-singular-decomposition`, `ES.1/transverse-duality`.
- **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev.** The Chebotarev density theorem for a finite Galois extension of number fields in Dirichlet-density form: the primes with a given Frobenius class have density |C|/|G|; in particular infinitely many, also after removing a finite set. Used by `ES.1/kolyvagin-primes`, `ES.1/chebotarev-nonvanishing`, `ES.1/rubin-prime-selection`, `ES.1/abundant-tuples`, `ES.5/howard-dvr-theorem`.
- **PadicMeasuresIwasawaAlgebras:L6.** Own the generic exterior bidual and ξ determinant map, projective comparison and integral lattice; for commutative noetherian self-injective artinian R and finitely generated modules, exact R-duality, reflexivity, kernel contractions, rank reduction and the free-ambient coefficient-change square of BSS II Proposition 2.4/Corollary 2.7. For finite abelian Γ→Γ/H and Gorenstein orders, supply group-ring change, invariants descent and the integral transfer map of BSS II §6.3 map (9): its normalization is i(N_H^{∧r}x)=N_H x, as Sano 2014 Remark 2.12, not ordinary functoriality of M^H→M. Supply compatible functional lifts along towers (Sano Lemma 2.10) and the modulo-M comparison used by BSS Lemma 6.9. Generic Fitting ideals are already in current Tau Ceti and are not a new L6 target. Include the larger-auxiliary-field to target-field projection of BSS Corollary 6.13 and its compatibility with reduction, augmentation factors, corestriction and Shapiro; identify the full rank-one corrected family with MR04 Appendix A after both Euler conventions are transported. The prototype tests raw rank-one base evaluation and generator independence, with the wider comparisons retained as supplier contracts. Used by `ES.6/bidual-functoriality`, `ES.6/stark-structure`, `ES.6/bss-hypotheses`, `ES.6/regulator-isomorphism`, `ES.7/higher-rank-euler-systems`, `ES.7/fitting-bounds`, `ES.6/exterior-bidual`, `ES.6/stark-systems`, `ES.7/higher-kolyvagin-derivative`.
- **SelmerIwasawaCohomology:L2.** General-coefficient extension of the existing O-adic Selmer layer: canonical continuous H¹ on TopRep over complete noetherian local R; quotient and discrete Cartier-dual carriers, local Tate pairings compatible with quotient/submodule propagation, unramified and transverse exact annihilators; MR04 Proposition 2.3.5 and Theorem 2.3.4 (finite global length formula and change-of-condition sequence); BSS II Theorem 3.1 over commutative noetherian self-injective local R, with finitely generated modules and dual Hom_R(−,R). The compact DVR case retains the discrete torsion dual. Each R-general consumer points to this requested stage rather than an O-only node. Also supply the actual cocycle formula for the induced integral local map: its image propagates the lattice canonical condition at p and infinity, rather than replacing that image by the full finite-coefficient local H¹. Retain the finite-level reflexivity and zero-conductor conditions in the rank-one bidual/ordinary Kolyvagin comparison. Supply the finite-localization criterion used in LTXZZ Proposition 2.4.6: purity of weight −1 and conjugate self-duality imply finite torsion local lattice conditions away from ℓ, uniformly annihilated before reduction modulo λ^m. The prototype states the resulting finite-torsion criterion and its uniform consequence explicitly. State these on the coefficient category the ES prototype uses: coefficient rings complete noetherian local with finite residue field of characteristic p in the m-adic topology; compact coefficients of finite type with the module topology and jointly continuous action; discrete m-power-torsion coefficients of cofinite type with open stabilisers; Selmer supports containing S_p ∪ S_∞ and the ramified primes, kept by duality, propagation and modification. Used by `ES.0/canonical-selmer-structure`, `ES.0/cartesian-condition`, `ES.0/core-rank-formula`, `ES.0/core-rank-independence-of-modulus`, `ES.0/quotient-category`, `ES.0/quotient-dual-propagation`, `ES.0/selmer-length-difference`, `ES.0/selmer-torsion-identification`, `ES.0/selmer-triple`, `ES.1/finite-singular-decomposition`, `ES.1/modified-selmer-structures`, `ES.1/reducibility-depth`, `ES.1/transverse-duality`, `ES.4/howard-descent-with-errors`, `ES.4/rubin-bound`, `ES.4/rubin-hypotheses`, `ES.4/vertex-step`, `ES.5/cassels-structure`, `ES.5/kolyvagin-dual-selmer`, `ES.6/bidual-functoriality`, `ES.6/stark-structure`, `ES.4/abundant-localization`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.** Perfect local Tate pairings for finite p-primary unramified coefficients at places of residue characteristic different from p, with the cup/invariant normalization, restriction-corestriction adjointness and the exact-annihilator statement used for the transverse condition. Mixed-characteristic p-adic lattice/discrete extensions are requested from SelmerIwasawaCohomology L1/L2. Used by `ES.1/finite-singular-decomposition`, `ES.1/transverse-duality`.
- **ClassicalArithmeticCompletion:CA.7.** Extend its existing noncommutative order/maximal-order interface by the exact algebraic lemma used in Nekovář Proposition 6.4.3: for an order Λ in a finite-dimensional semisimple Q_p-algebra, choose a maximal order containing Λ and a fixed conductor power; identify torsion-free lattices over the maximal order, compare Hom into the coefficient quotient with its maximal-order dual, and bound the pairing cokernel by that conductor power uniformly in the torsion exponent. Use characteristic zero. The commutative Gorenstein L6 theory cannot discharge this; no claim of reading Curtis–Reiner is made. Used by `ES.4/nekovar-all-prime-descent`.
- **HeegnerPointEulerSystems:HE.7.** For the all-prime CM-point application supply Nekovář §3.1 arithmetic data and §3.5 O_L-linear tensor-variety realization and §5.19 polarization: compactified quaternionic Shimura curve/Jacobian quotient of GL₂ type, CM points and their Hecke norm/congruence relations, the non-CM condition (*), polarization/complex-conjugation pairing, and the fixed uniform component-group, image-order and character-overlap constants of §§6.1–6.6. ES.4 owns the conditional bounded-error descent, not these geometric constructions or verification of their hypotheses. Supply the classical elliptic local Kummer-image/Weil-pairing realization used by MR04 §6.2, so its classical Selmer structure and canonical core-rank comparison have actual local-point dictionaries. Used by `ES.4/nekovar-all-prime-descent`, `ES.0/example-elliptic`.
- **HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients.** Howard §1.1 inert ring-class local dictionary: the conductor-ℓ ring class field, its maximal p-subextension and totally ramified local restriction subgroup at λ, normalized reciprocity k_λ×/k_ℓ× of order ℓ+1, and the rank-two finite/transverse comparison of Proposition 1.1.7. This is not the MR rank-one-coinvariant comparison. Generic CFT remains its supplier; HE owns the ring-class specialization. Used by `ES.5/howard-hypotheses`.
- **IntegralIwasawaTheory:I.7.** Part II for archimedean Rubin–Stark elements, distinct from the finite-place CM minus construction: ordered infinite places and chosen extensions, the determinant logarithmic regulator, rationality in the full S-unit exterior/bidual lattice, Conjecture B′ integrality at every LF/K, and the character/Kummer and norm transports into Tχ cohomology. Supply these as input to ES.7’s conditional class-group application. The DK finite-place ord_G isomorphism is not this archimedean regulator. Used by `ES.7/rubin-stark-class-group`, `ES.7/rubin-stark-minus-comparison`.
- **PadicMeasuresIwasawaAlgebras:L4.** Multivariable Iwasawa algebras Λ = O[[Γ]] ≅ O⟦T_1, …, T_d⟧ for Γ ≅ Z_p^d: noetherian, regular local of dimension d + 1, hence factorial; pseudo-null modules (annihilated by an ideal of height ≥ 2, not finite when d ≥ 2), pseudo-isomorphisms and characteristic ideals over them, with multiplicativity in exact sequences and pseudo-isomorphism invariance. Rubin's Theorems II.3.2–II.3.4 and II.3.8 are stated for every d ≥ 1 (the stage's own remaining item 'Multivariable algebras O⟦T₁, …, T_d⟧'). Used by `ES.8/restriction-control-over-the-tower`, `ES.8/kolyvagin-sequence-induction`, `ES.8/rubin-iwasawa-divisibility`, `ES.8/twisting-invariance-of-iwasawa-theorems`.
- **PadicMeasuresIwasawaAlgebras:L4.** Twisting of characteristic ideals and annihilators: for a character ρ: Γ → O^×, Tw_ρ: Λ → Λ the O-algebra automorphism γ ↦ ρ(γ)γ, and a finitely generated torsion Λ-module B, Tw_ρ(char(B ⊗ ρ)) = char(B) and Tw_ρ(Ann_Λ(B ⊗ ρ)) = Ann_Λ(B) (Rubin, Euler systems, Lemma VI.1.2); Tw_ρ preserves heights of ideals. Used by `ES.8/twisting-invariance-of-iwasawa-theorems`, `ES.8/rank-one-leopoldt-case`.
- **PadicMeasuresIwasawaAlgebras:L4.** Length asymptotics along Hensel perturbations: for Λ = O⟦X⟧, a height-one prime 𝔓 = (g) ≠ ϖΛ with g distinguished, 𝔓_N = (g + p^N) and a finitely generated torsion Λ-module X, length_{Z_p}(X/𝔓_N X) = N · rank_{Z_p}(Λ/𝔓) · ord_𝔓 char(X) + O(1) as N → ∞ (and the analogue for 𝔓 = ϖΛ with 𝔓_N = (X^N + p)); also, for N ≫ 0, 𝔓_N is a height-one prime with Λ/𝔓_N ≅ Λ/𝔓 as rings. This is the module-theoretic step of Mazur–Rubin's proof of Theorem 5.3.10, used again by Howard (Theorem 2.2.10) and Castella–Grossi–Lee–Skinner (Theorem 3.4.1). Used by `ES.8/mazur-rubin-lambda-adic-main-theorem`, `ES.8/self-dual-lambda-adic-kolyvagin-bound`, `ES.8/error-tolerant-self-dual-lambda-adic-bound`, `ES.8/height-one-specialization`.
- **PadicMeasuresIwasawaAlgebras:L5.** Topological Nakayama's lemma over Λ = O[[Γ]]: a compact Λ-module X with X/𝔐X (or X/JX, J the augmentation ideal) finitely generated over O is finitely generated over Λ. Used for the finite generation of X∞ (Rubin, Lemma VII.4.1). Used by `ES.8/x-infinity-finitely-generated`.
- **PadicMeasuresIwasawaAlgebras:L1.** The O-algebra automorphisms Tw_ρ of Λ = O[[Γ]] induced by γ ↦ ρ(γ)γ for continuous characters ρ: Γ → O^×, with Tw_ρ ∘ Tw_ρ' = Tw_{ρρ'}, and the involution ι (γ ↦ γ^{-1}); compatibility with the projections Λ → O[Gal(F/K)]. Used by `ES.8/twisting-by-characters-of-gamma`, `ES.8/admissible-zp-d-extension`.
- **SelmerIwasawaCohomology:L3.** For a Z_p-extension K∞/K, 𝐓 = T ⊗ Λ and Σ finite containing p, ∞ and the ramified primes: H^i(K_Σ/K, 𝐓) and H^i(K_v, 𝐓) (v | p) are finitely generated Λ-modules, H²(K_v, 𝐓) is Λ-torsion, and H¹(K_Σ/K, 𝐓) is Λ-torsion-free when T̄^{G_K} = 0 (Mazur–Rubin, Lemmas 5.3.4–5.3.5, after Greenberg and Perrin-Riou); and H²(K_v, 𝐓)/𝔓 ≅ H²(K_v, 𝐓/𝔓𝐓) (cohomological dimension two). Used by `ES.8/exceptional-height-one-primes`, `ES.8/specialization-control`, `ES.8/generic-core-rank`, `ES.8/weak-leopoldt-from-lambda-adic-kolyvagin`, `ES.8/lambda-adic-ind`.
- **SelmerIwasawaCohomology:L4.** Rubin's Corollary I.6.4 in the direction used here: if Leopoldt's conjecture holds for K then S_{Σp}(K, μ_{p^∞}) is finite (already routed to this layer by the review of PAPER-KOLYVAGIN-90, route 6). Used by `ES.8/rank-one-leopoldt-case`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.** Global class field theory in the form: the inertia subgroup at a finite prime v of the Galois group of an abelian pro-p extension of a number field is the image of the pro-p completion of O_v^×; hence Z_p^d-extensions are unramified outside p; and the maximal abelian p-extension unramified everywhere and split at the primes above p of a field corresponds to the p-part of its class group modulo those primes. Used by `ES.8/admissible-zp-d-extension`, `ES.8/rank-one-leopoldt-case`.
- **SelmerIwasawaCohomology:L3.** Control at the augmentation ideal for the anticyclotomic ordinary Selmer structure: for E/Q with good ordinary reduction at p ∤ 2N, K imaginary quadratic with D_K prime to Np, E(K)[p] = 0, K∞/K the anticyclotomic Z_p-extension, 𝐓 = T_pE ⊗ Λ with the ordinary condition at p (relaxed away from p on 𝐓, strict on M_E = T_pE ⊗ Λ^∨) and X = H¹_{F_Λ}(K, M_E)^∨: X/(γ − 1)X and the dual of H¹_{F_ord}(K, E[p^∞]) have the same Z_p-rank (kernel and cokernel of the restriction map finite, from E(K∞)[p] = 0 and the local terms). This is the input missing from Castella–Grossi–Lee–Skinner's proof of Corollary 3.4.2 (PAPER-CASTELLA-ETAL-22/E32). Used by `ES.8/error-tolerant-self-dual-lambda-adic-bound`.
- **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev.** The Chebotarev density theorem for a finite Galois extension of number fields in Dirichlet-density form: the unramified primes whose Frobenius lies in a given conjugacy class C of the Galois group G have density |C|/|G|, in particular infinitely many, also after removing a prescribed finite set. Used for primes with Frobenius τz in a finite extension cut out by Galois cohomology classes. Used by `ES.1/error-tolerant-chebotarev`, `ES.1/abundant-tuple-existence`, `ES.1/residual-two-class-detection`, `ES.5/self-dual-eigenspace-localisation`, `ES.4/rational-anticyclotomic-descent`.
- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension.** Ẑ (the Galois group of the maximal unramified extension of a local field) has cohomological dimension one, so H²(Ẑ, −) vanishes on discrete torsion modules and, by passage to the limit, on profinite ℤ_p-modules; hence H¹(Ẑ, X) → H¹(Ẑ, X/MX) is surjective for a profinite ℤ_p[[Ẑ]]-module X such as T^{I_Q}. Used by `ES.3/local-lifts`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields.** Ring class fields K_n of an imaginary quadratic K for conductors n prime to the discriminant: existence, Gal(K_n/K) ≅ Pic(O_K + nO_K), and for a prime ℓ inert in K with ℓ ∤ n the extension K_{nℓ}/K_n is cyclic of order ℓ + 1 (for n > 1), totally ramified at ℓ, with the primes above ℓ of K_n split completely in K_n/K. Used by `ES.2/ring-class-anticyclotomic-euler-system`.

## Open gaps

- **Kolyvagin's article was not read.** V. A. Kolyvagin, 'Euler systems', The Grothendieck Festschrift II (1990), is not publicly available. As in the reviewed extraction PAPER-KOLYVAGIN-90, Rubin's book is used as the public statement of the method; no claim is made about the wording of Kolyvagin's article. Affects `EulerSystemsAndKolyvaginSystems:ES.3/congruence`, `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`.
- **General coefficient Selmer duality is still only an open supplier request.** The cited SelmerIwasawaCohomology L1/L2 duality and Cartier-dual nodes use O-adic lattices/discrete modules. The abstract L2/selmer-data carrier alone does not prove MR04 artinian/global-length identities or BSS self-injective-ring duality. Fulfil the enlarged L2 request and link each generalized coefficient consumer to it; no O-only theorem may discharge a general-R hypothesis. The suggested file states the coefficient category these supplier statements must use: coefficient rings (complete noetherian local, finite residue field of characteristic p, m-adic topology), compact coefficients of finite type and discrete coefficients of cofinite type, with Σ ⊇ S_p ∪ S_∞ recorded in every Selmer structure. Evaluation, duality, length and core-rank signatures consume it; the supplier proofs at general R remain open. Affects `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`, `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`, `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer`, `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`.
- **Nekovář maximal-order input.** The owner is ClassicalArithmeticCompletion CA.7, whose maximal-order existence target is linked directly. Its exact request now specifies the missing uniform lattice-dual pairing-cokernel bound of Nekovář Proposition 6.4.3. Generic commutative L6 algebra is insufficient. Filling the supplier lemma remains prerequisite implementation work; the source proof and all-prime theorem are planned here. Affects `EulerSystemsAndKolyvaginSystems:ES.4/nekovar-all-prime-descent`.
- **L6 transfer implementation and coefficient dictionaries.** The source normalization is verified against Sano 2014 Lemmas 2.10–2.11 and Remark 2.12, pp.6–7: i(N_H^{∧r}x)=N_Hx. BSS II map (9), invariant descent and compatible-functional lifts now have an exact L6 request and arithmetic prototype maps. Their proofs and implementation in the supplier remain supplier implementation obligations. The displayed higherDerivative_indep checks generators at fixed E; Corollary 6.13 additionally requires the target-field projection and independence of larger auxiliary E. The rank-one prototype checks the raw base component; the full corrected MR comparison is retained as the exact dictionary below. Affects `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`, `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`.
- **Omitted geometric and archimedean prototype conditions.** PROTOCOL §13 permits leaving an unavailable condition out of a suggested signature and forbids opaque Prop substitutes. The Nekovář §3.1/§5.19 CM-point/quaternionic and non-CM condition (*) and the ordered archimedean regulator characterization of Rubin–Stark elements are left out of the prototype and retained in the mathematical statements and exact HE.7/I.7 requests. Do not infer source theorems from the displayed prototype data alone. These are supplier-carrier implementation boundaries, not omitted mathematical hypotheses. The classical elliptic Kummer/Weil-pairing realization and the purity/polarization realization of the local finite-torsion criterion are also supplier geometry. Their arithmetic consequences have typed interfaces, while the full geometric conditions remain in the packet and the HE.7/L2 requests. Affects `EulerSystemsAndKolyvaginSystems:ES.4/nekovar-all-prime-descent`, `EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-class-group`, `EulerSystemsAndKolyvaginSystems:ES.0/example-elliptic`, `EulerSystemsAndKolyvaginSystems:ES.4/abundant-localization`.
- **No public source identifies X∞ with the Iwasawa Ш² used by Kato's Theorem 13.4.** Kato states his imported bound for H²(T)_0 = ker(H²(T) → H²_loc(T)) with H^q(T) = lim H^q(Z[ζ_{p^n}, 1/p], T). ES.8 supplies Rubin's package: X∞ torsion (Theorem II.3.2 under Hyp(K∞, V) and c_{K,∞} non-torsion) and char(X∞) | p^t ind_Λ(c) (Theorem II.3.4), or char(X∞) | ind_Λ(c) under Hyp(K∞, T) (Theorem II.3.3), for X∞ built from restricted Selmer groups, Λ = O[[Gal(Q∞/Q)]] after decomposing Gal(Q(μ_{p^∞})/Q) = Δ × Γ by characters of Δ (twisting, Rubin II.4). The identification of X∞ with lim Ш²(O_{F,Σ}, T) by Poitou–Tate in the tower (local terms at v ∤ p vanish because H¹_ur(K_{∞,w}, W*) = 0 for infinitely decomposed v) and the comparison of Kato's étale H² with Galois H² over O_{F,Σ} were not found in a public text (Rubin's Remark II.3.5 and Mazur–Rubin's Theorem 5.3.6 only name the weak Leopoldt conjecture). Kato's hypotheses (iv)–(v) are irreducibility over G_Q and an element σ ∈ G_{Q(μ_{p^∞})} with dim ker(1 − σ) = 1; Rubin's Hyp(Q∞, V) needs irreducibility over G_{Q∞}. The KatoEulerSystems L4 adapter must prove the comparison and verify Rubin's hypotheses (Rubin's Proposition III.5.8 does so for elliptic curves). Affects `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`.
- **Mazur–Rubin's Λ-adic theory is written over Q and the cyclotomic Z_p-extension only.** Mazur–Rubin §5.3 fixes K = Q and K∞ = Q∞. The nodes state their results in that setting; the definitions (lambda-adic-selmer-structure, lambda-adic-kolyvagin-systems, height-one-specialization, blind-spot-and-lambda-primitivity) are written for a Z_p-extension of a number field because Howard and Castella et al. use them over imaginary quadratic fields. A version of Theorems 5.3.3 and 5.3.10 over a general number field, which Büyükboduk §4.3 sketches for totally real fields under Rubin–Stark hypotheses, has no read source and is not planned here. Affects `EulerSystemsAndKolyvaginSystems:ES.8/euler-to-lambda-adic-kolyvagin`, `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`, `EulerSystemsAndKolyvaginSystems:ES.8/mazur-rubin-lambda-adic-main-theorem`.
- **Kolyvagin's 1990 article was not read.** V. A. Kolyvagin, 'Euler systems', The Grothendieck Festschrift II (1990), is not publicly available. As in the reviewed extraction PAPER-KOLYVAGIN-90, Rubin's book is used as the public statement of the method; the new ES.3 nodes follow Rubin Chapter IV §§6–8. No claim is made about the wording of Kolyvagin's article. Affects `EulerSystemsAndKolyvaginSystems:ES.3/derivative-classes-unramified`, `EulerSystemsAndKolyvaginSystems:ES.3/local-lifts`, `EulerSystemsAndKolyvaginSystems:ES.3/key-relation`, `EulerSystemsAndKolyvaginSystems:ES.3/congruence-units-example`, `EulerSystemsAndKolyvaginSystems:ES.3/rigidity-variant-derivative-classes`.
- **Nekovář 1992 was not read; ring-class relations are taken as Castella–Hsieh state them.** The relations (K1)–(K3) of the ring-class derivative classes (Nekovář, 'Kolyvagin's method for Chow groups of Kuga–Sato varieties', Invent. Math. 107 (1992), Proposition 10.2), the existence of ν (Proposition 6.3, Corollary 6.4, Lemma 10.1) and the image lemmas (Lemma 12.3, Proposition 12.2) are recorded as Castella–Hsieh §7.2 and §7.5 state and use them. A lemma-level refinement must read Nekovář's proofs, which are not in the public sources read here. Affects `EulerSystemsAndKolyvaginSystems:ES.3/ring-class-derivative-classes`, `EulerSystemsAndKolyvaginSystems:ES.4/rational-anticyclotomic-descent`.
- **Kolyvagin's classical square-index theorem is not planned.** HeegnerPointEulerSystems requests from ES.4 Kolyvagin's Theorem A as quoted in Kolyvagin 1991 (#Ш(E/K) divides d_E·[E(K) : ℤy_K]² with d_E independent of K). Its original proof is not publicly available and was not read; Nekovář's uniform exponent bound (ES.4/nekovar-all-prime-descent) and the self-dual structure theorem (ES.5/self-dual-structure-theorem) do not give the length statement with the stated d_E at every prime. The request stays open. Affects `HeegnerPointEulerSystems:HE.7/classical-square-index-error-bound`.
- **Castella–Grossi–Skinner Theorem 6.1.1: induction read in outline.** The proof of Theorem 6.1.1 (§6.4, pp. 24–28) chooses primes n₀ = 1, n₁, … subject to conditions (a)–(g); the statement, the key Proposition 6.3.1 and the structure of the induction were read, but conditions (a)–(g) are not restated in ES.4/uniform-near-trivial-bound. A lemma-level refinement must restate them and check the constants; the analogous CGLS conditions carry recorded corrections (PAPER-CASTELLA-ETAL-22/E6, E9, E10, E12). Affects `EulerSystemsAndKolyvaginSystems:ES.4/uniform-near-trivial-bound`, `EulerSystemsAndKolyvaginSystems:ES.5/self-dual-structure-theorem`.

## Mistakes found in the sources

Targets use the corrected statements. Further mistakes in Liu–Tian–Xiao–Zhang–Zhu, Castella–Grossi–Lee–Skinner and Kolyvagin's method that these layers rely on are recorded with the paper extractions (PAPER-LIU-ETAL-22, PAPER-CASTELLA-ETAL-22, PAPER-KOLYVAGIN-90) and cited by number in the targets.

- **EulerSystemsAndKolyvaginSystems/E1** (misprint; `bss2`, Hypothesis 4.7(ii), p. 22 of arXiv:1805.08448v1). After adjoining the representation’s trivializing field K(T) to the auxiliary infinite tower, condition(ii) asks for a Galois element whose coinvariants on T are free of rank one over R. Correction: Take τ in G_{K_{p^∞}}, with K_{p^∞}=⋃_m K_{p^m} and K_{p^m}=K(μ_{p^m},(O_K^×)^{1/p^m})K(1), and require T/(τ−1)T≃R. The field fixed by τ must omit the additional trivializing extension K(T). Reason: K(T) is by definition the minimal Galois extension of K such that G_{K(T)} acts trivially on T, so every τ ∈ G_{K(T)_{p^∞}} ⊆ G_{K(T)} acts trivially on T and T/(τ − 1)T = T, which is isomorphic to R only when T has rank one. The finite-level Hypothesis 3.2(ii) takes τ ∈ G_{K_M}, and Remark 4.9 asserts that Hypothesis 4.7 gives Hypotheses 3.2(i) and (ii) for T/p^mT, which is true for τ ∈ G_{K_{p^∞}} ⊆ G_{K_{p^m}} and false in rank at least two for the printed group. Known: new. Review verdict: confirmed.
- **EulerSystemsAndKolyvaginSystems/E2** (misprint; `rubin-es`, 1999 course draft Chapter IX §1, p.133; also book-format author copy §9.1 p.175 (PDF p.181)). The source takes the largest abelian extension of K with ramification confined to N. Correction: For the isolated-initial-class example take the maximal abelian extension unramified at every prime dividing N. Reason: The printed extension contains the cyclotomic Z_p-extension because p divides N, contrary to the following parenthesis. For a nontrivial extension ramified only at N, the Euler-factor product is empty, hence is 1, and the family c_F=0 for F≠K requires c_K=0. With no ramification at N and class number one, every nontrivial finite abelian extension ramifies at a prime outside N, where the stipulated factor vanishes; the claimed arbitrary c_K family then works. Known: new. Review verdict: confirmed.
- **EulerSystemsAndKolyvaginSystems/E3** (error; `mr-ks`, Archived author copy, Proposition 3.4.4(ii), p.27 (PDF p.33)). The source asserts that Γ(S) admits an isomorphism, without a canonical choice, to an ideal of R. Correction: Evaluation identifies Γ(S) with a submodule of the cyclic hub stalk. It is isomorphic to an ideal if the hub stalk is free of rank one, or if R is principal artinian. The unrestricted complete noetherian local assertion needs such additional hypotheses. Reason: Let R=Z_p and take the graph with one vertex and no edges, with S(v)=R/pR. The sheaf is locally cyclic, its vertex is a hub and monodromy is trivial. Γ(S)=R/pR is nonzero torsion, whereas every ideal of the domain R is torsion-free. The proof’s injection into a cyclic module does not imply injection into R. Known: new. Review verdict: confirmed.
- **EulerSystemsAndKolyvaginSystems/E4** (error; `mr-ks`, Lemma 2.1.4, p.15; repeated use in Lemma 3.5.2, p.28, archived author copy). Residual invariant vanishing is asserted to imply invariant vanishing for every Galois-module quotient or subquotient of T. Correction: Restrict Lemma 2.1.4 to coefficient-ideal quotients T/IT. Use the repaired arbitrary-ideal annihilator argument of BSS II Proposition 3.5 and Corollary 3.8 at their finite self-injective coefficient scope; do not deduce the unrestricted Galois-subquotient claim from residual H⁰ alone. Reason: Over 𝔽₃ take the continuous G_ℚ-representation through S₃ from the splitting field of x³−2, generated on T=𝔽₃² by b=[[1,1],[0,1]] and a=diag(−1,1). These satisfy b³=a²=1 and aba=b⁻¹. Their common fixed space is zero, but 𝔽₃e₁ is stable and T/𝔽₃e₁ is a nonzero trivial representation. This quotient is not a coefficient-ideal quotient. Known: Mazur–Rubin, Controlling Selmer groups in the higher core rank case, arXiv:1312.4052v1 p.32; published JTNB28 (2016) p.182, Gomez erratum. BSS II arXiv:1805.08448v1 pp.15–17 gives the replacement annihilator proof.. Review verdict: confirmed.
- **EulerSystemsAndKolyvaginSystems/E5** (error; `mr-ks`, Proposition 3.4.4(iii), p.27, archived author copy). For a locally cyclic sheaf with a hub, a nonzero section component generating m^i times the stalk at any vertex is asserted to generate m^i times every stalk. Correction: Over a general local ring, require the starting vertex to be a hub. Generation of J times the hub stalk propagates along its surjective paths for every ideal J. The principal-artinian/DVR valuation situation used in the arithmetic applications supports the stronger arbitrary-vertex conclusion. Reason: Let R=𝔽₃[[x,y]], with hub stalk R, one other vertex and edge stalk R/(y), and maps quotient and identity. Every vertex-to-edge map is surjective; the hub reaches the other vertex through the edge isomorphism at the endpoint, and monodromy is trivial. The section (x,x mod y) is nonzero and generates mS(u) at the other vertex, but (x)≠m=(x,y) at the hub. Known: new. Review verdict: confirmed.
- **EulerSystemsAndKolyvaginSystems/E801** (misprint; `mazur-rubin-kolyvagin-systems`, §5.3, Definition 5.3.8, p. 61, in the authors' version of 20 October 2003 (the published Memoir was not available)). For c ∈ H¹(Q, T), the source defines the principal ideal Ind(c) of Λ by Ind(c) = char((H¹(Q, T)/Λc)tors). Correction: Ind(c) is the principal ideal generated by gcd(a_1, …, a_r) for ψ(c) = (a_1, …, a_r) under a pseudo-isomorphism ψ: H¹(Q, T) → Λ^r, as the next sentence says; in particular Ind(0) = 0. The char formula agrees with this only for c ≠ 0. Reason: For c = 0, (H¹(Q, T)/Λ·0)_tors = H¹(Q, T)_tors = 0 because H¹(Q, T) is torsion-free (Lemma 5.3.5), so the printed formula gives Ind(0) = char(0) = Λ, while the gcd description gives gcd(0, …, 0) = 0 and the proof of Theorem 5.3.10 states 'If κ1 = 0 then Ind(κ) = 0 and there is nothing to prove.' With the printed formula, Theorem 5.3.10(i) for κ_1 = 0 would assert char(X∞) = Λ, which is false in general (X∞ need not be torsion). Known: new. Review verdict: confirmed.
- **EulerSystemsAndKolyvaginSystems/E802** (misprint; `rubin-euler-systems-1999`, Ch. II §3, proof of Theorem 3.8, p. 29, in the 1999 draft). The source asserts the existence of ψ : loc^s_Σp(H¹_∞(K, T)) → Λ whose cokernel is pseudo-null. It also attributes the divisibility of φ ◦ loc^s_Σp(c_K,∞) by ind_Λ(c) to the definition. Correction: "ind_Λ(c) divides ψ ◦ loc^s_Σp(c_K,∞)": the functional is the ψ just chosen; φ is not defined in the proof. Reason: The proof needs a functional on H¹_∞(K, T) whose value at c_{K,∞} lies in ind_Λ(c); ψ ∘ loc^s is one. The published version (Theorem 2.3.8, p. 43) prints ψ. Known: Corrected in the published version, Annals of Mathematics Studies 147 (2000), proof of Theorem 2.3.8, p. 43 (read on the page image).. Review verdict: confirmed.
- **EulerSystemsAndKolyvaginSystems/E803** (misprint; `rubin-euler-systems-1999`, Ch. VI §2, proof of Proposition 2.1(ii), p. 91, in the 1999 draft (published: Proposition 6.2.1, p. 122)). The source chooses a place w of LK∞ away from p and calls I its decomposition group in G_L. It uses the absence of ramification outside p in K∞/K to assert ρ(I) = 1. For every n, it also describes I as the inertia subgroup at w in G_{L_n}. Correction: "let I denote an inertia group of w in G_L": the argument needs ρ(I) = 1, which holds for the inertia group because K∞/K is unramified outside p, but fails for a decomposition group, on which ρ is in general nontrivial. Reason: The next sentence uses only that ρ is trivial on I and calls I 'also an inertia group' of w in G_{L_n}; the article 'an' also points to the intended word. A decomposition group of w ∤ p in G_L surjects onto the infinite decomposition group of w in Gal(LK∞/L), on which a character ρ of infinite order is nontrivial. Known: Corrected in the published version, Annals of Mathematics Studies 147 (2000), proof of Proposition 6.2.1, p. 122 (read on the page image, PDF page 128 of the wstein.org copy): the passage is replaced by an argument through Lemmas B.3.3 and 1.3.5(i) showing that the colimits of the H¹_f(L_{n,w}, ·) at w ∤ p vanish.. Review verdict: confirmed.
- **EulerSystemsAndKolyvaginSystems/E901** (misprint; `rubin-es`, Chapter IV §8, Example 8.2, p. 78 (author's 1999 draft)). In the specialisation of Corollary IV.8.1 to T = ℤ_p(1) the draft divides N(q) − 1 by the degree [K(q) : K]. Correction: The denominator is [K(q) : K(1)], as in Corollary IV.8.1: the exponent is ((N(q) − 1)/[K(q) : K(1)])Fr_q^{-1}. Reason: Corollary IV.8.1 divides P_q(Fr_q^{-1}) − P_q(N(q)Fr_q^{-1}) by [K(q) : K(1)], and for T = ℤ_p(1) this difference is (N(q) − 1)Fr_q^{-1}; [K(q) : K] = [K(q) : K(1)][K(1) : K] differs whenever the p-part of the class number of K is nontrivial. The two agree for K = ℚ. Known: Corrected in the published version: Example 4.8.2 and (4.13), p. 103 of Annals of Mathematics Studies 147 (2000).. Awaiting independent review.

## Proposed restructuring

1. **split** (EulerSystemsAndKolyvaginSystems). Confirmed red-team finding RT-AREA-iwasawa-1/35: ES.8 requires ES.7, and through it ES.6, PadicMeasuresIwasawaAlgebras L6 and Gorenstein homological algebra, although every consumer of ES.8 (EulerSystemsCyclotomicMainConjecture L2, KatoEulerSystems L4, HeegnerPointEulerSystems HE.8, RankZeroOneBSD BSD.7a, GeneralizedHeegnerCycles GH.5) uses only rank-one Iwasawa theory. None of the 35 nodes of the ES.8 part, nor the two ES.8 nodes added here, has a prerequisite in ES.6 or ES.7. Proposal: ES.8 'Iwasawa variation and application handoffs' is the rank-one layer: it requires ES.5 and SelmerIwasawaCohomology:L3 (replace the stage edge ES.7 → ES.8 by ES.5 → ES.8) and keeps all its consumers. A new stage ES.8h 'Higher-rank Iwasawa variation' requires ES.7 and ES.8, has no consumers yet, and would hold the Iwasawa-theoretic forms of the higher-rank Euler, Stark and Kolyvagin systems of ES.6–ES.7. This consolidates the identical proposal of the ES.8 part packet.
2. **rescope** (EulerSystemsAndKolyvaginSystems, EulerSystemsCyclotomicMainConjecture, KatoEulerSystems). Confirmed red-team finding RT-AREA-iwasawa-1/36: the application adapters import this roadmap's carriers and bounds but have no stage edge from it, so ES's handoffs are routed through the cyclotomic-unit application. Proposal: Add the stage edges ES.2 → EulerSystemsCyclotomicMainConjecture:L0, ES.2 → KatoEulerSystems:L2, ES.4 → KatoEulerSystems:L4 and ES.8 → KatoEulerSystems:L4; drop EulerSystemsCyclotomicMainConjecture:L0 → KatoEulerSystems:L2 and EulerSystemsCyclotomicMainConjecture:L2 → KatoEulerSystems:L4 unless a KatoEulerSystems node cites a cyclotomic-unit statement. All added edges are acyclic. Consolidates the identical proposal of the ES.0 part.
3. **rescope** (EulerSystemsAndKolyvaginSystems, HeegnerPointEulerSystems, GeneralizedHeegnerCycles). Confirmed red-team finding RT-AREA-iwasawa-1/10: Howard's abstract self-dual Kolyvagin-system theory needs one owner. ES.5 owns the DVR theory (howard-hypotheses, cassels-structure, howard-stub, howard-dvr-theorem) and, with this pass, its refinements (self-dual-eigenspace-localisation, self-dual-core-vertex-rigidity, self-dual-divisibility-profile, self-dual-structure-theorem); ES.8 owns the Λ-adic theory (self-dual-lambda-adic-kolyvagin-bound, error-tolerant-self-dual-lambda-adic-bound, self-dual-lambda-primitivity-equality, augmentation-prime-divisibility). Proposal: HeegnerPointEulerSystems HE.6 keeps only the verification of H.0–H.5 for T_p(E) (Howard Theorem 1.6.5) and applies ES.5; add the stage edges ES.5 → GeneralizedHeegnerCycles:GH.5, ES.8 → GeneralizedHeegnerCycles:GH.5 and HeegnerPointEulerSystems:HE.6 → HE.8. The GH.0 request for Castella–Hsieh §7 descent is met by ES.4/rational-anticyclotomic-descent, already upstream of GH.5 through the edge ES.4 → GH.5.
4. **split** (EulerSystemsAndKolyvaginSystems). ES.4, ES.5 and ES.8 are each too broad to read as one star once the error-tolerant and self-dual theories are added. Proposal: Sub-layers for the atlas. ES.4: 'Selmer sheaf and core vertices' (selmer-sheaf, sheaf-monodromy, vertex-step, core-vertices, leading-vertices, stub-sheaf, kolyvagin-bound); 'Rubin's error-tolerant bound' (rubin-hypotheses, rubin-bound, variant-bounds); 'Bounded-error descent' (abundant-localization, weak-cassels-structure, howard-descent-with-errors, nekovar-all-prime-descent, self-dual-module-induction, rank-one-from-nonzero-class, uniform-near-trivial-bound, rational-anticyclotomic-descent). ES.5: 'Mazur–Rubin primitivity' (divisibility-invariants, rank-one-module-theorem, structure-theorem, kolyvagin-dual-selmer, sharpness-examples) and 'Self-dual systems' (howard-hypotheses, cassels-structure, howard-stub, howard-dvr-theorem and the four self-dual nodes added here). ES.8: 'Rubin's Iwasawa theory' and 'Λ-adic Kolyvagin systems', as the ES.8 part proposes, with the two new nodes in the second. The ES.6 split of the ES.0 part is unchanged.
5. **extend** (IntegralIwasawaTheory, EulerSystemsAndKolyvaginSystems). Integral Iwasawa theory, Part II: archimedean Rubin–Stark regulator inputs (carried from the ES.0 part unchanged). Proposal: Extend IntegralIwasawaTheory I.7 by the ordered archimedean regulator, rationality and all-level Conjecture B′ inputs, and add IntegralIwasawaTheory:I.7 → EulerSystemsAndKolyvaginSystems:ES.7 for the contract of rubin-stark-class-group and rubin-stark-minus-comparison.
6. **rescope** (EulerSystemsAndKolyvaginSystems, RankZeroOneBSD). RankZeroOneBSD BSD.7 asks ES.2 for the Kings–Loeffler–Zerbes Beilinson–Flach classes and their explicit reciprocity laws. ES plans the abstract Euler-system carrier; constructing distinguished arithmetic classes is outside its scope (the roadmap summary says so), as for cyclotomic, Kato and Heegner classes, which have their own roadmaps. Proposal: Route the Beilinson–Flach construction to a roadmap that owns it, as a Part II of the roadmap that owns Rankin–Selberg Euler systems if one exists, otherwise a new roadmap 'Beilinson–Flach Euler systems' with the edge ES.2 → it and it → RankZeroOneBSD:BSD.7a. ES.4 and ES.8 already supply the generic descent and Λ-adic divisibility that BSD.7a requests (uniform-near-trivial-bound, augmentation-prime-divisibility).

## Coverage of the added sources

The maintainer added Dasgupta–Kakde §1.2, Liu–Tian–Xiao–Zhang–Zhu §§2.3–2.6, Castella–Grossi–Lee–Skinner §3 and Kolyvagin's method in the form of Rubin's book to this roadmap. Each item their reviewed extractions route here is stated by the targets listed (110 items).

| Extraction item | Targets |
| --- | --- |
| `PAPER-DASGUPTA-KAKDE-23/27` | `ES.6/rubin-lattice` |
| `PAPER-DASGUPTA-KAKDE-23/28` | `ES.6/rubin-lattice` |
| `PAPER-DASGUPTA-KAKDE-23/29` | `ES.6/rubin-lattice` |
| `PAPER-DASGUPTA-KAKDE-23/31` | `ES.6/rubin-lattice` |
| `PAPER-DASGUPTA-KAKDE-23/32` | `ES.6/rubin-lattice` |
| `PAPER-DASGUPTA-KAKDE-23/30` | `ES.7/rubin-brumer-stark` |
| `PAPER-DASGUPTA-KAKDE-23/33` | `ES.7/rubin-brumer-stark` |
| `PAPER-LIU-ETAL-22/S05` | `ES.1/reducibility-depth` |
| `PAPER-LIU-ETAL-22/notation-2-3-1` | `ES.1/reducibility-depth`, `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/def-2-3-2` | `ES.1/reducibility-depth` |
| `PAPER-LIU-ETAL-22/S12` | `ES.1/reducibility-depth` |
| `PAPER-LIU-ETAL-22/restriction-map-res-rho` | `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/S11` | `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/kolyvagin-sequence-f` | `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/lemma-2-3-4` | `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/S13` | `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/S14` | `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/cited-gross-scalar` | `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/cited-guralnick-thmA` | `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/cited-serre-tensor-semisimple` | `ES.1/selmer-field-saturation` |
| `PAPER-LIU-ETAL-22/S18` | `ES.4/abundant-localization` |
| `PAPER-LIU-ETAL-22/notation-2-6-1` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/notation-2-6-2` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/S22` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/frobenius-set-G-S-gamma` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/S23` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/theta-r-S-gamma` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/def-2-6-5` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/S23-formula` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/S23-closure` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/S23-lift` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/S23-norm` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/S23-paired` | `ES.1/abundant-tuples` |
| `PAPER-LIU-ETAL-22/S24` | `ES.1/abundant-tuple-existence` |
| `PAPER-LIU-ETAL-22/S24-conditional` | `ES.1/abundant-tuple-existence` |
| `PAPER-LIU-ETAL-22/S24-rows` | `ES.1/abundant-tuple-existence` |
| `PAPER-LIU-ETAL-22/S23-obstruction` | `ES.1/abundant-tuple-existence` |
| `PAPER-LIU-ETAL-22/S23-defect` | `ES.1/abundant-tuple-existence` |
| `PAPER-LIU-ETAL-22/S23-error` | `ES.1/abundant-tuple-existence` |
| `PAPER-LIU-ETAL-22/S24-bounded` | `ES.1/abundant-tuple-existence` |
| `PAPER-LIU-ETAL-22/localization-selmer` | `ES.4/abundant-localization` |
| `PAPER-LIU-ETAL-22/prop-2-6-7-local` | `ES.4/abundant-localization` |
| `PAPER-LIU-ETAL-22/S25-onesided` | `ES.4/abundant-localization` |
| `PAPER-LIU-ETAL-22/S25-lift` | `ES.4/abundant-localization` |
| `PAPER-LIU-ETAL-22/S25-row` | `ES.4/abundant-localization` |
| `PAPER-CASTELLA-ETAL-22/18` | `ES.1/twist-error-constants` |
| `PAPER-CASTELLA-ETAL-22/19` | `ES.4/weak-cassels-structure` |
| `PAPER-CASTELLA-ETAL-22/20` | `ES.1/error-tolerant-chebotarev` |
| `PAPER-CASTELLA-ETAL-22/21` | `ES.4/rank-one-from-nonzero-class` |
| `PAPER-CASTELLA-ETAL-22/22` | `ES.4/self-dual-module-induction` |
| `PAPER-CASTELLA-ETAL-22/23` | `ES.4/howard-descent-with-errors` |
| `PAPER-CASTELLA-ETAL-22/24` | `ES.8/error-tolerant-self-dual-lambda-adic-bound` |
| `PAPER-KOLYVAGIN-90/r1-def-4.6-Mbar` | `ES.1/kolyvagin-primes` |
| `PAPER-KOLYVAGIN-90/r2-rem-1.5-congruence` | `ES.3/congruence-units-example`, `ES.3/congruence` |
| `PAPER-KOLYVAGIN-90/r2-rem-2.5-error-finite` | `ES.4/rubin-hypotheses` |
| `PAPER-KOLYVAGIN-90/r4-F-r-Galois-decomposition` | `ES.1/ray-class-tower` |
| `PAPER-KOLYVAGIN-90/r4-cor-3.2-Xinf-free` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-cor-6.2i-unramified-kappa` | `ES.3/derivative-classes-unramified` |
| `PAPER-KOLYVAGIN-90/r4-cor-6.2ii-finite-if-T-unramified` | `ES.3/derivative-classes-unramified` |
| `PAPER-KOLYVAGIN-90/r4-cor-6.5-weak-theorem-5.1` | `ES.3/derivative-classes-unramified` |
| `PAPER-KOLYVAGIN-90/r4-cor-8.1-congruence` | `ES.3/congruence` |
| `PAPER-KOLYVAGIN-90/r4-def-2.1-XFr` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-def-2.2-universal-euler-system` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-def-6.6-local-induced` | `ES.3/local-lifts` |
| `PAPER-KOLYVAGIN-90/r4-eq-9-lifted-telescoping` | `ES.3/key-relation` |
| `PAPER-KOLYVAGIN-90/r4-ex-8.2-Gm` | `ES.3/congruence-units-example` |
| `PAPER-KOLYVAGIN-90/r4-lem-1.2i-split-criterion` | `ES.1/kolyvagin-primes` |
| `PAPER-KOLYVAGIN-90/r4-lem-1.2ii-annihilates-T` | `ES.2/euler-polynomial` |
| `PAPER-KOLYVAGIN-90/r4-lem-1.2iii-mod-M` | `ES.2/euler-polynomial` |
| `PAPER-KOLYVAGIN-90/r4-lem-1.2iv-annihilates-WM` | `ES.2/euler-polynomial` |
| `PAPER-KOLYVAGIN-90/r4-lem-2.3-universal-property` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-lem-2.5i-invariants` | `ES.2/universal-euler-system`, `ES.3/rigidity-variant-derivative-classes` |
| `PAPER-KOLYVAGIN-90/r4-lem-2.5ii-descent-Hinf` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-lem-4.12-kappa-cocycle` | `ES.3/derivative-class` |
| `PAPER-KOLYVAGIN-90/r4-lem-4.6i-induced-invariants-free` | `ES.3/lifting-to-induced-module` |
| `PAPER-KOLYVAGIN-90/r4-lem-4.6ii-induced-limit-free` | `ES.3/lifting-to-induced-module` |
| `PAPER-KOLYVAGIN-90/r4-lem-6.3-archimedean` | `ES.3/derivative-classes-unramified` |
| `PAPER-KOLYVAGIN-90/r4-lem-6.7-local-diagram` | `ES.3/local-lifts` |
| `PAPER-KOLYVAGIN-90/r4-lem-7.1-local-commutation` | `ES.3/key-relation` |
| `PAPER-KOLYVAGIN-90/r4-lem-7.3-key-relation` | `ES.3/key-relation` |
| `PAPER-KOLYVAGIN-90/r4-prop-3.1i-XFr-structure` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-prop-3.1ii-XFr-structure` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-prop-3.1iii-XFr-structure` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-prop-3.1iv-XFr-structure` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-prop-3.1v-XFr-structure` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-prop-3.4i-ext-finite` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-prop-3.4ii-ext-iwasawa` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r4-prop-4.5i-delta-exact` | `ES.3/lifting-to-induced-module` |
| `PAPER-KOLYVAGIN-90/r4-prop-4.7-limit-sequence` | `ES.3/lifting-to-induced-module` |
| `PAPER-KOLYVAGIN-90/r4-prop-6.8-local-lifts` | `ES.3/local-lifts` |
| `PAPER-KOLYVAGIN-90/r4-rem-2.4-converse` | `ES.2/universal-euler-system` |
| `PAPER-KOLYVAGIN-90/r5-lem-3.2-finiteness-H1-Omega` | `ES.4/rubin-hypotheses` |
| `PAPER-KOLYVAGIN-90/r9-cond-star-split-primes` | `ES.8/unramified-at-split-primes-condition` |
| `PAPER-KOLYVAGIN-90/r9-construction-Kprime-chi-parts` | `ES.2/rigidity-variants`, `ES.3/anticyclotomic-derivative` |
| `PAPER-KOLYVAGIN-90/r9-def-3.1-finite-depth` | `ES.2/rigidity-variants` |
| `PAPER-KOLYVAGIN-90/r9-def-4.1-anticyclotomic-euler-system` | `ES.2/rigidity-variants` |
| `PAPER-KOLYVAGIN-90/r9-def-5.1-trivial-at-sigma` | `ES.2/rigidity-variants` |
| `PAPER-KOLYVAGIN-90/r9-def-Omega-prime-and-ind-chi-i` | `ES.4/variant-bounds` |
| `PAPER-KOLYVAGIN-90/r9-def-rigidity-conditions-ii-prime` | `ES.2/rigidity-variants` |
| `PAPER-KOLYVAGIN-90/r9-fact-rigidity-counterexample` | `ES.2/rigidity-variants` |
| `PAPER-KOLYVAGIN-90/r9-lem-analogue-IV.7.3-under-ii-b` | `ES.3/rigidity-variant-derivative-classes` |
| `PAPER-KOLYVAGIN-90/r9-rem-4.2-d1-recovers-euler-systems` | `ES.2/rigidity-variants` |
| `PAPER-KOLYVAGIN-90/r9-thm-3.3-finite-depth-bound` | `ES.4/variant-bounds` |
| `PAPER-KOLYVAGIN-90/r9-thm-4.3-anticyclotomic-exponent-bound` | `ES.4/variant-bounds` |
| `PAPER-KOLYVAGIN-90/r9-thm-5.2-derivative-classes-trivial-at-sigma` | `ES.3/derivative-local-properties` |
| `PAPER-KOLYVAGIN-90/r9-thm-5.3-bound-with-sigma` | `ES.4/rubin-bound` |
| `PAPER-KOLYVAGIN-90/r9-thm-main-theorems-under-ii-prime` | `ES.2/rigidity-variants`, `ES.3/rigidity-variant-derivative-classes` |
| `PAPER-KOLYVAGIN-90/r9-def-R-Kprime-M-and-derivative-classes` | `ES.3/anticyclotomic-derivative` |
| `PAPER-KOLYVAGIN-90/r9-rem-4.4-finite-singular-shifts-chi` | `ES.3/anticyclotomic-derivative` |
| `PAPER-KOLYVAGIN-90/rev-r-corollary-a-2-6-kernel-and-cokernel-of-q-on-w-m-are-bounded-` | `ES.4/rubin-bound` |

## Application handoffs

| Consumer | Uses | Imported targets |
| --- | --- | --- |
| EulerSystemsCyclotomicMainConjecture L0–L2 | Euler-system carrier, Rubin's bound, Rubin's Iwasawa divisibility | ES.2/euler-system-module, ES.2/conductor-presentation, ES.2/twisting, ES.4/rubin-bound, ES.8/rubin-iwasawa-divisibility, ES.8/iwasawa-poitou-tate-sequence |
| KatoEulerSystems L2, L4 | Euler-system carrier and generic bounds | ES.2/euler-system-module, ES.4/rubin-bound, ES.8/rubin-rational-iwasawa-divisibility |
| HeegnerPointEulerSystems HE.4–HE.8 | derivative classes, self-dual descent, primitivity, Λ-adic theory | ES.3/derivative-class, ES.5/howard-dvr-theorem, ES.5/self-dual-structure-theorem, ES.5/self-dual-divisibility-profile, ES.4/uniform-near-trivial-bound, ES.8/self-dual-lambda-adic-kolyvagin-bound, ES.8/self-dual-lambda-primitivity-equality |
| GeneralizedHeegnerCycles GH.5–GH.6 | ring-class Euler systems and rational descent, self-dual descent | ES.2/ring-class-anticyclotomic-euler-system, ES.3/ring-class-derivative-classes, ES.4/rational-anticyclotomic-descent, ES.5/howard-dvr-theorem |
| RankZeroOneBSD BSD.0, BSD.7a | error-tolerant and uniform bounds, Λ-adic divisibility at the augmentation prime | ES.4/howard-descent-with-errors, ES.4/uniform-near-trivial-bound, ES.8/error-tolerant-self-dual-lambda-adic-bound, ES.8/augmentation-prime-divisibility |
| IntegralIwasawaTheory I.7 | Rubin's lattice and conjecture | ES.6/rubin-lattice, ES.7/rubin-brumer-stark |
