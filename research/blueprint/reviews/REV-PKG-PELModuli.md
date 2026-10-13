# Independent package review: Siegel and PEL moduli problems

**Verdict: accepted after corrections.** Reviewer: Codex, session `codex-vJbOha`,
2026-10-13, job `REV-PKG-PELModuli` (#9229). The package was written by a different
worker (Claude Opus 5.5, `claude-tXfFZE`, package job #9185); this reviewer did no
part of that job. The accepted verdict concerns the corrected package in this
submission. The packet is unchanged.

## Form, fidelity and ownership

Read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md §§5, 12–13, 15 and 20,
UPSTREAM_GUIDE.md and the accepted 91-node packet. Compared the presentation with
AdicSpaces and LocalGaloisGroups and the current roadmap form. The README has a
Summary, boundaries, conventions, exact supplier contracts, seven ordered layers,
APIs, discriminating Checks, examples and dependencies. It is mathematical prose
in the author's/reviewer's own words; it contains no source excerpts or
section-by-section source summaries. No job ids or review narrative remain in
the package. Metadata remains the single appropriate line `topic = "math.NT"`.

All packet targets are accounted for. The 94 README subsections have this mapping:

| Packet layer | Nodes | README mapping |
| --- | ---: | --- |
| M0 | 26 | M0.1–M0.8 map in order; M0.9 adds the nonabelian cohomology interface; remaining nodes map to M0.10–M0.27. |
| M1 | 14 | M1.1–M1.14, in order. |
| M2 | 14 | M2.1–M2.12, kernel-rank node M2.14, ordinariness node M2.16; M2.13 and M2.15 supply their necessary Dieudonne/display interfaces. |
| M3 | 8 | M3.1–M3.2, then M3.4–M3.9; M3.3 supplies the general PEL quotient adapter. |
| M4 | 9 | M4.1–M4.9, with twisting placed before canonical-model identification. |
| M5 | 7 | M5.1–M5.7, in order. |
| M6 | 13 | M6.1–M6.12; integral scheme/quasi-projective realization is expressly deferred to ShimuraCompactifications in the boundary contract. |

The scheme/quasi-projectivity deferral was already the package's ownership choice;
it does not erase representability or the characteristic-zero scheme theorem.
Generic abelian-scheme Hodge theory is now supplied by AbelianSchemesAndArithmeticModuli
A6; M6.9 keeps only descent to universal PEL stacks/fine spaces, inertia and the
PEL Kodaira–Spencer adapter. A false broad crystal-rank identity was replaced by
the perfect-field length statement and the precise special unitary kernel-rank
argument; the packet's kernel-rank target remains intact. Display lifting is now
stated within the hypotheses of the source, rather than an unsupported arbitrary
nilpotent-thickening theorem.

Checked the current upstream checkout at `0d144d044dacebca17b654695b6f1ad58f159b27`
and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, by mathematical
objects, hypotheses and operations, including the nine newer roadmaps
AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups,
OperatorTheory (all its component roadmaps), OrthogonalSpinGroups,
PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry, and Completed
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.
Also compared AdelicAlgebraicGroups, GlobalNumberFields and the relevant completed
Hodge-structure APIs. The new roadmaps do not already plan the PEL moduli,
CM-order forms or polarized displays here. IntegralLattices is explicitly
symmetric; M0.4 states the alternating/order-linear difference.

Removed the duplicated rational `IsNeatElement` and its Lean declarations, citing
AdelicAlgebraicGroups §4.3 instead. Kept the stronger adelic Pink predicate with an
explicit difference and counterexample. Replaced roadmap Hilbert-90 ownership by
current `TauCeti.hilbert90` and `TauCeti.subsingleton_H1_unitsCoeff`; cited the
current matrix-signature and compatible-pair hermitian APIs. M0.3 now distinguishes
noncommutative star-orders from GlobalNumberFields Layer 11. M0.9 keeps the
continuous nonabelian/disconnected/all-place interface beyond the existing
coordinate torsors. M3.3 imports general reduction theory and supplies only the
PEL effective-image adapter. No upward prerequisite or unresolved ownership move
remains. Prerequisite chains terminate in named pinned APIs, lower-tier roadmaps
or earlier package layers; no `FoundationsAndLibraryIntegration` or `UPSTREAM:`
placeholder survives.

## Source verification

Read the source statements themselves. Public primary sources used include
[Lan's thesis](https://www.kwlan.org/articles/cpt-PEL-type-thesis.pdf),
[its errata](https://www.kwlan.org/articles/cpt-PEL-type-thesis-errata.pdf),
[Lan's introduction](https://www.kwlan.org/articles/intro-sh-ex.pdf),
[Kottwitz](https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf),
[Milne](https://www.jmilne.org/math/xnotes/svi.pdf),
[Borel–Serre](https://www.college-de-france.fr/media/jean-pierre-serre/UPL6720771035987925133_Borel_Serre_Theoremes_de_finitude.pdf),
[Wedhorn](https://www.numdam.org/item/10.1016/s0012-9593%2801%2980001-x.pdf),
[BPS](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf)
and [Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf).
Read the maintainer-cleared Faltings–Chai and Liu–Tian–Xiao–Zhang–Zhu copies in
place. No files or passages from those copies enter this submission.

The author flagged Kottwitz's locators, Borel–Serre's unnamed finiteness result,
Faltings–Chai I.1.6/I.4.11 and an indirect BBM 4.3.1 claim. Checked Kottwitz §1
p. 374, §4 Lemmas 4.1–4.3 pp. 386–389, §§5–6 pp. 389–392, §7 pp. 393–397
(including Lemmas 7.1–7.2 and Corollary 7.3), and §8 pp. 398–400; these support
the specified classification, group, cohomology and twist claims. Borel–Serre
Theorem 7.1 p. 158 supplies finite localization fibres even for disconnected
linear algebraic groups; §§1.6–1.10 pp. 116–118 and §2.2 pp. 127–128 supply the
twisting comparison. Faltings–Chai I Definition 1.6 p. 4 and surrounding pp. 3–5
supply the Pic0 issue; I §4.11 pp. 23–24 is a principal-polarization presentation,
not a direct citation for all fixed degrees. The extension is explained using the
named ample-bundle/Hilbert suppliers. BBM was not read: removed the unsupported
general-base assertion and direct BBM reference. The exact locally-free input
needed for M2.14 is instead explicitly attributed to the directly read proof of
LTXZZ Lemma 3.4.12 pp. 153–155. No unverified BBM theorem is claimed.

The random sample was selected before correction with Python `Random(9229)`:

| Sample subsection | Primary locator read | Result |
| --- | --- | --- |
| M2.1 rigidity | Lan Lemma 1.4.1.10 p. 152 and Remark 1.4.1.9 p. 152 | Correct polarized rigidity; exclude the positive-rank -1 test in genus zero. |
| M0.22 hermitian spaces | LTXZZ §3.1 pp. 140–141 | First-variable linearity fixes the sharp pairing order. |
| M3.3 PEL quotients | Lan introduction §5.1.3 pp. 54–56; Milne §3 pp. 34, 38–39 and §4 p. 46 | Add the effective-image/SV3 adapter; no rational quotient deleting arbitrary compact real factors. |
| M6.12 nonempty examples | Lan §1.2.1 pp. 46–47; M5 construction, polarization product supplier | The product calculation gives type (1,d); require prime-to-d neat full level for the stated construction. |
| M2.8 representability | Lan Theorem 1.4.1.12 p. 153, Remark 1.4.1.14 p. 154, §2.3.3 pp. 265–268, B.3.10/B.3.12 pp. 1023–1026 | Correct the Dedekind base and Krull-dimension use in the Artin argument. |
| M6.3 stack over Z | Faltings–Chai I §4.11 pp. 23–24 | Principal Hilbert presentation supports the stack; keep arbitrary-characteristic stack scope. |
| M3.9 fine Siegel uniformization | Milne Theorem 6.11 p. 74 and full-level discussion p. 75; Tsimerman §6.1 p. 387 | phi(n) components at full level; Tsimerman only supplies the level-one case. |
| M2.2 neatness | Lan Definition 1.4.1.8 p. 152 | Pink's adelic condition is stronger than rational-intersection neatness. |
| M2.13 Dieudonne interface | LTXZZ proof of Lemma 3.4.12 pp. 153–155, plus lower-tier Dieudonne contract | The original rank-height generalization is false; replaced as described above. |
| M0.17 reflex comparison | Lan Definition 1.2.5.4 pp. 90–91, Corollaries 1.2.5.6–1.2.5.7 p. 91; Kottwitz §5 pp. 389–390 | Same weight representation fixes both stabilizers; do not use the retracted Lan Lemma 1.2.5.10. |
| M6.8 bounded field | Tsimerman Lemma 4.1 and proof p. 384 | State the polarized marking argument and Silverberg supplier; add g=0 and unpolarized controls. |
| M0.3 discriminant | Lan Definition 1.1.1.6 p. 4, Proposition 1.1.1.17 pp. 7–8 | Reduced-trace Gram discriminant and good-prime consequences agree. |
| M0.8 group structure | Kottwitz §5 p. 391, §7 pp. 393–396 | Correct connected identity component versus disconnected full group language. |
| M4.6 normalized model | Stacks 03GR and 0539; Lan Remark 1.4.1.14 p. 154 | Nagata plus reduced finite-type cover gives finiteness; torsion-free over DVR gives flatness. |
| M4.5 normalization | Stacks 03GR and normalization universal properties | Preserve the two opposite extension directions and generic-fibre-only p-level. |

Read [Stacks 03GR](https://stacks.math.columbia.edu/tag/03GR),
[0539](https://stacks.math.columbia.edu/tag/0539) and
[02GU](https://stacks.math.columbia.edu/tag/02GU) directly for finiteness,
valuation-ring flatness and flat-plus-unramified etaleness. Additional source
checks fixed M2.12's actual-polarization scope (LTXZZ Proposition 3.4.8 p. 151)
and M2.14's odd, unramified, distinguished-inert hypotheses (Lemma 3.4.12
pp. 153–155). Wedhorn §3.1 pp. 591–594 and §3.2.3–§3.2.9 pp. 595–598
support the precise display construction and intertwining/duality statements,
not the original arbitrary-thickening claim. BPS Lemme 1.1.4 p. 981 was checked
with Hypothese 1.1.1. These are locators and results in our own words.

## Adversarial mathematics ledger

Each row records the manual instance/generality audit of the subsection's
definitions, identities, APIs and convention choices; these are mathematical
checks, not claims that its future construction is already formalized. Read all
subsections, including the Checks and dependency contracts. Denominators are
nonzero in the stated fields; localized integers are inverted only outside the
chosen good-prime set; trace/form degeneracy over nonflat rings is never silently
excluded. Definitions retain at least three discriminating prose Checks. Heavy
objects stay in the README with named API and tests.

| Subsection | Instances and boundary cases checked | Correction or retained restriction |
| --- | --- | --- |
| M0.1 Positive involutions | Identity on Q; transpose; adjugate at diag(1,-1); integer/nonmaximal orders | Distinguished reduced/regular traces factorwise; gave the density/radical argument and three order controls. |
| M0.2 The Albert types A, C and D | CM centre; real quaternion factor; SO2 and SO4 | Tensor over the fixed real centre; record small-rank exceptions. |
| M0.3 Orders, discriminant and unramified primes | Z[i] discriminant -4; Z[2i] -16; matrix units; ramified quaternion prime 2 | Confirmed reduced-trace discriminants and maximal/unramified consequences; separate noncommutative scope from NumberFieldOrder. |
| M0.4 Symplectic O-lattices and their duals | Rank zero; block diag(J,2J); reduction modulo 2 | Use congruence for alternating normal form, Smith only for the index; preserve nonflat warning. |
| M0.5 Integral PEL data | Principal Siegel; zero lattice; J replaced by -J | Wrong-sign exclusion requires positive rank; name the lighter linear carrier separately. |
| M0.6 Rational and p-integral PEL data | Zero versus faithful rational representation; localization at p | Keep nonzero faithful rational data separate from possibly zero integral data. |
| M0.7 The similitude group | GL2 determinant multiplier; zero pairing over F5; zero module | Multiplier stays data; flat/nonzero hypotheses belong to uniqueness, not construction. |
| M0.8 Structure of the similitude group | GSp; GU3; quaternion type D; rank-one orthogonal factor | State reductivity of the identity component and geometric component count. |
| M0.9 Galois cohomology of the similitude group and ker¹ | Gm; mu2; norm-one torus; Hamilton norm -1 | All places include infinity; add direct Borel–Serre theorem and current Hilbert-90 supplier. |
| M0.10 Bad primes and the good-prime base | Composite 4; discriminant 0; type (1,6); quaternion at 2 | Good-prime predicate now requires primality; each bad factor remains independent. |
| M0.11 The polarized Hodge structure of a datum | e,f with psi(e,f)=1 and Je=f; reverse J | Preserve the homological convention and strict positivity on nonzero vectors. |
| M0.12 The Shimura datum of a PEL datum | Siegel; definite rank >=2; definite rank one | SV3 is explicit; no Shimura datum asserted for an ineffective adjoint factor. |
| M0.13 Signatures | Siegel complex simple module; balanced and Picard unitary signatures | Correct the complex simple module to C, and keep factorwise multiplicities. |
| M0.14 The determinant polynomial | Zero rank; scalar family; matrix family; characteristic 3 | Polynomial identity retains all coefficients, not just trace. |
| M0.15 The determinant polynomial classifies modules | Split matrix simple module; characteristic p multiplicities | Generic matrix determinant replaces a false product of linear forms. |
| M0.16 The reflex field | Siegel Q; balanced unitary Q; unbalanced imaginary quadratic K | Keep the Galois stabilizer and the actual embedded reflex field. |
| M0.17 The PEL reflex field is the Shimura reflex field | Same h and weight submodule; Picard; Siegel | Align both reflex-field definitions and give Lan corollary locators. |
| M0.18 The Kottwitz determinant condition | Rank zero versus one; characteristic-3 +/-i; nonreduced base | Keep equality in the universal polynomial ring; no trace substitute. |
| M0.19 The determinant condition over a splitting field | Split and inert primes; two opposite rank-one characters | Decomposition uses geometric algebra representations, not characteristic-zero trace tests. |
| M0.20 Self-dual lattices at good primes | Symplectic self-dual at p=2; type (1,p); type D at 2 | Retain good-prime exclusion and isometry, not arbitrary linear equivalence. |
| M0.21 Signature constancy above a prime | Balanced/inert and unbalanced/split signatures | Keep the BPS splitting hypothesis explicit; no unrestricted constancy claim. |
| M0.22 Hermitian spaces over CM orders | First-variable scalar; ordered sharp pairing; dual twice | Correct the pairing order defining sharp; identify the CM-order variant of existing hermitian APIs. |
| M0.23 Skew-hermitian spaces, GU and the norm-similitude torus | Anti-invariant unit; rational scalar; delta=1 | Separate the rational trace construction from the finite-etale coefficient version. |
| M0.24 Rank-one skew-hermitian spaces and ker¹ of the CM torus | Q(i); norm rescaling; sign at infinity | Use everywhere-local similarity and positivity, not finite-place-only classes. |
| M0.25 Generalized CM types and their reflex fields | Rank zero; empty rank-one type; opposite embeddings | Lean now requires a CM field; conjugate-pair multiplicity condition is retained. |
| M0.26 The reflexive closure of a CM field | Imaginary quadratic; intersection of reflex fields | Retain the reflexive-closure intersection construction, not a compositum replacement. |
| M0.27 τ-parts at an unramified prime | Unramified residue degrees 2 and 3; zero type; p=2 | Distinguish tauField, diamondField and psiField; ramified primes stay outside the claim. |
| M1.1 Prime-to-□ quasi-isogenies and quasi-polarizations | Multiplication by n; n divisible by p; zero abelian scheme | Quasi-isogenies are invertible localized morphisms; the zero-dimensional multiplication exception is explicit. |
| M1.2 PEL-type abelian schemes | Siegel trivial order; positive-rank Rosati; zero family | Retain actual polarization, action, determinant polynomial and specified morphisms. |
| M1.3 Unitary O_F-abelian schemes and signature type | Opposite CM characters; N=1; balanced pair | Correct the claim that opposite Lie characters coincide. |
| M1.4 The sheaf of symplectic Tate trivializations | Finite level; compatible inverse system; forgetting pairing | Keep paired equations at every level of the pro-etale trivialization sheaf. |
| M1.5 Principal level structures | Principal pairing; nonprincipal degenerate reduction; zero rank | Multiplier and higher-level liftability are part of the level data. |
| M1.6 Integral and rational level structures | Integral versus rational lattice; level one; base change | Keep orbit sheaves and the correct automorphism/isogeny categories. |
| M1.7 The PEL moduli problem M_H | Level-free quadratic twists; neat full level; empty base | The class presheaf warning applies to automorphisms, not every full-level problem. |
| M1.8 The rational quasi-isogeny problem M_H^rat | Changing lattice by a prime-to-box isogeny; identity | Keep quasi-isogeny equivalence and transported integral structures. |
| M1.9 The characteristic-zero adelic problem M_K^ad | All finite places; characteristic zero; zero integral datum | Adelic rational datum retains nonzero faithful representation. |
| M1.10 The integral and rational problems agree | Identity; prime-to-box multiplication; altered lattice | Comparison reconstructs actual polarization and lattice, not just an unstructured isogeny class. |
| M1.11 Changes of order, lattice and good primes | Star-stable suborder; enlarge bad set; unchanged form | Record the precise transported data and required finite-index hypotheses. |
| M1.12 Effective descent | Poincare diagonal; projective descent; doubled polarization | Use the canonical ample bundle inducing 2 lambda, not lambda. |
| M1.13 Level change and the Hecke action | Two right translations; central scalar; forgetful map | Right precomposition and subgroup direction are retained. |
| M1.14 Functoriality in the datum and the forgetful map to Siegel moduli | Identity datum; forget action; reflex fields differ | Common reflex-base extension is stated; finiteness applies to the specified forgetful morphism. |
| M2.1 Rigidity of polarized automorphisms | n=2 and -1; n=3; unpolarized shear on E squared | Polarized finite-order rigidity is the input; positive-rank exceptions are explicit. |
| M2.2 Neat open compact subgroups | diag(2,-2); principal U(n); entangled local characters in Gm | Remove duplicated rational predicate; Pink adelic neatness is stronger than arithmetic-intersection neatness. |
| M2.3 No automorphisms at neat level | g=0; -1 in g>0; neat full level | Zero family has no automorphisms; do not claim -1 survives in rank zero. |
| M2.4 Isom schemes are finite and unramified | Identity family; absent Isom; deformation base; zero group | Zero abelian scheme is the base identity group, not the empty scheme; finite unramified need not be flat over a general base. |
| M2.5 Prorepresentability of deformations | W(k) elliptic deformation; Frobenius over Fp; markings | Specify perfect positive-characteristic field and special-fibre marking. |
| M2.6 Formal smoothness at good primes | Good unramified p; p=2 type C; ramified p; p-principal filtration | Only good-prime liftings are asserted; keep structures and determinant condition. |
| M2.7 Effectivity of formal deformations | Elliptic formal family; ample polarization; incomplete base | Retain polarized algebraization and its completeness hypotheses. |
| M2.8 Representability and smoothness | Field versus Dedekind base; closed dimension d+1 versus generic d; semilocal base | Spread to an open Dedekind base with infinitely many closed points before applying Lan B.3.12; apply field and integral versions separately. |
| M2.9 The universal family at neat level | Fine full level; nonneat -1; zero universal group | Correct the zero family; universality keeps actual data. |
| M2.10 The Kodaira–Spencer map and isomorphism | g=1; g=0; unitary r*s; definite signature | Maintain cotangent direction and zero-dimensional determinant convention. |
| M2.11 Properness when End_B(V) is a division algebra | Indefinite division quaternion; split M2(Q); Siegel g>0 | Quaternion example now requires division; split cases are nonproper. |
| M2.12 Deformations of unitary O_F-abelian schemes | N=1; signature N-1,1; nonperfect polarization; p=2 | Dimension check requires p-principal polarization; sourced unitary statement uses odd unramified p. |
| M2.13 Dieudonné modules of isogenies: cokernel length and kernel height | [p] versus [p squared]; isomorphism; height h | Replace false general-base crystal-rank identity by perfect-field W(k)-cokernel length; [p squared] gives length 2h. |
| M2.14 Kernel ranks of isogenies of unitary abelian schemes | alpha beta=uniformizer; r=0 and r=N; inert distinguished place | Use exactly the unitary special factorization; add odd/unramified p and distinguished inert-place hypotheses. |
| M2.15 Displays and polarized O-displays | N=0; square-zero skew rank-two N; nonskew N; nilpotent versus k[[t]] | State linearized surjectivity; Wedhorn deformation uses O-linear square-zero skew N and 3n-displays over k[[t]], with duality constructed separately. |
| M2.16 Wedhorn's ordinariness criterion | Siegel; split ordinary unitary; inert unbalanced; type D p=2 | Ordinary versus mu-ordinary is distinguished; good-prime and Frobenius-signature conditions remain. |
| M3.1 Forms of the skew-hermitian module and ker¹(ℚ, G) | Semisimple coefficient factors; same dimension/different multirank; neutral class | Fix geometric module-and-form class, not dimension alone. |
| M3.2 When the Hasse principle holds | Even unitary rank; GU3 over imaginary quadratic; Hamilton at infinity | GU3 quotient torus is Res Gm and ker1 is trivial; retain possible failures over more general CM fields. |
| M3.3 Arithmetic quotients of PEL groups | Siegel; compact domain point; mixed-real Q-simple quaternion; full type D | Add effective-image adapter, compact kernel and Q-simple SV3 quotient; no deletion of arbitrary compact real factors. |
| M3.4 Complex points of PEL moduli | Neutral class; nonneutral ker1; left rational/right adelic cosets | Retain all ker1 pieces and compatible multiplier identification. |
| M3.5 The complex uniformization morphism | e,f Riemann form; family over a domain; level precomposition | Universal analytic family carries order, polarization and level; moduli map uses these structures. |
| M3.6 Algebraization of the uniformization | Connected SV3; non-SV3 PEL; disconnected finite extension | Use the M3.3 adapter before algebraization; scheme statement stays characteristic zero. |
| M3.7 The full-group comparison in type D | Two group components acting on one orbit; arithmetic double cosets | Geometric component count is not a moduli component count. |
| M3.8 The hermitian space of homomorphisms from a CM object | CM coefficient scalar; sharp dual; endomorphisms commuting with F | Replace unrestricted End by coefficient-linear End in the hermitian construction. |
| M3.9 Siegel moduli at full level over ℂ | g=1; phi(3)=2 components; g=0 excluded | Full level has phi(n) components; Tsimerman level-one locator is scoped accordingly. |
| M4.1 Reciprocity on CM points | CM elliptic point; inverse Artin convention; inner form | Special torus belongs to the corresponding inner form; reciprocity normalization is fixed. |
| M4.2 Twisting automorphisms between ker¹-pieces | a=1; a=-1; all-place versus away-from-p beta | Keep positivity; supply separate full-adelic twist for arbitrary characteristic-zero level. |
| M4.3 PEL generic fibres are canonical models | Neutral and nonneutral pieces; connected SV3 | Canonical-model claim uses dense special points and twist compatibility with level. |
| M4.4 Functoriality of canonical models | Hecke; forget level; two reflex fields | Datum-changing maps are over a common reflex extension. |
| M4.5 Normal integral models at higher p-level | Identity generic cover; integral factor; normal flat source | Keep both universal-property directions distinct; no universal special-fibre p-level claimed. |
| M4.6 Finiteness, normality and flatness of the normalized models | Good level; Gamma0(p) with p>=5 and neat auxiliary level; vertical component | Finiteness and torsion-free-over-DVR flatness checked; singular controls include rigidifying level. |
| M4.7 The rank-one CM moduli schemes | CM rank one; neutral clopen component; finite level | Keep finite-etale CM moduli and the precise level torsor. |
| M4.8 Galois structure of the CM moduli schemes | Trivial subgroup; Galois action; reflex reciprocity | The neutral component is the minimal clopen subscheme required by the source. |
| M4.9 Torus-invariant cohomology and its trace | Finite torsor orbit; trace of identity; character invariants | Finite groupoid trace retains the specified action and normalization. |
| M5.1 Siegel PEL data of every genus and type | g=0; d=(1,2); Je=f; -J | Allow zero integral genus, but rationalization requires positive genus; explicit Gram determinant and sign controls. |
| M5.2 Siegel moduli A_{g,D,n} | g=0; g=1; n=1,2,3; degenerate reduced nonprincipal pairing | Separate genus-zero root-of-unity scheme and retain liftability in positive genus. |
| M5.3 Genus one: comparison with the modular curves | n=1,2,3; phi(n) components; determinant multiplier | Use full-level modular curve, not a single fixed-Weil-pairing component. |
| M5.4 The principal Hilbert datum | F=Q; inverse different; nontrivial trace discriminant | Trace-dual lattice is self-dual; degree-one witness pins psi(e,f)=1. |
| M5.5 Unitary PEL data with prescribed signatures | delta=1; anti-invariant delta; balanced r=s; p=2 | Scope Lean trace form to rank one; distinguish level m from hermitian rank n. |
| M5.6 Unitary examples | Picard 2,1; balanced 1,1 and 2,2; Q(i) psi(1,i) | Fix inverse-different embedding/sign and the imaginary-quadratic ker1 claim. |
| M5.7 A nonprincipal polarization type | Type (1,p); kernel p squared; unscaled Hilbert sublattice | Kernel is geometrically constant, not automatically constant over the ground field. |
| M6.1 Level-forgetting and Hecke maps are finite étale | Y(nm) to Y(n); stack degree 48 at level 3; coarse degree 24 | Invert nm for the modular-curve cover; distinguish stack and coarse degrees. |
| M6.2 The moduli stack at arbitrary level | Level one; neat cover; quotient descent | Keep finite-etale presentations and inertia; no sheaf-of-classes replacement. |
| M6.3 The stack 𝔄_g over ℤ | g=0; principal g=1; characteristics 2 and 3 | Stack over Z includes bad characteristics; no global fine scheme claim. |
| M6.4 The stack of polarized abelian schemes of degree d² is of finite type | d=1; d divisible by p; Pic0-torsor versus line-bundle automorphisms | Correct Faltings–Chai locators and distinguish its principal presentation from the derived fixed-degree extension. |
| M6.5 Coarse moduli spaces | Fine level; level-free j-line; arbitrary characteristic | Coarse universal property and geometric points remain separate from rational families. |
| M6.6 Field of moduli | Quadratic twist; trivial object; automorphisms | Field fixed by isomorphism class is not automatically a field of definition. |
| M6.7 Forms and the descent gerbe | Neutral versus nonneutral gerbe; no automorphisms; field Isom | Finite unramified Isom is etale over a field; no false general-base etaleness assertion. |
| M6.8 Models over a bounded extension of the field of moduli | g=0 bound 2; g=1 bound 96; unpolarized shear | Keep polarized marking in descent and all-endomorphism supplier; add rank-zero control. |
| M6.9 The Hodge bundle and the Hodge line | g=0; genus-one KS; inertia i at j=1728; level pullback | Remove duplicate generic Hodge theory; keep universal PEL descent/inertia and KS adapter. |
| M6.10 The arithmetic moduli interface | Family versus coarse point; pullback line; nontrivial gerbe | Classifying map exports the actual family, polarization and Hodge line. |
| M6.11 Finiteness over a finite field | Fixed g,d,q; infinitely many unbounded degrees; twists | Keep degree bounded and actual polarized forms; finite automorphism cohomology supplies the twist bound. |
| M6.12 Explicit nonempty examples | d=1 and d>1 products; unitary opposite CM; n prime to d | Geometric kernel constancy and prime-to-type full level are explicit. |


The worked examples were also checked: type (1,2) lies in `𝔄_{2,2}` (degree 4),
not `𝔄_{2,4}`; the isomorphism-class presheaf failure belongs to level-free
elliptic moduli, not neat full level; the Picard inverse-different sign is fixed
by `psi(1,i)=2`, and its imaginary-quadratic `ker1` is trivial. The Pink negative
control uses a compact Gm subgroup coupling the mod-3 and mod-5 quadratic
characters; its rational intersection is trivial while its adelic local
root-of-unity intersection is not. The Hamilton norm example shows exactly why
infinity is essential in the Hasse assertion.

## Lean signatures and validation

Suggested.lean is 448 lines, with `import Mathlib`, its one actually used Tau Ceti
module, one module docstring and `namespace TauCetiRoadmap.PELModuli`. It contains
only real-bodied light carriers/predicates, theorem signatures and representative
examples; no sorry'd data definitions, True placeholders, carrier constructions
or auxiliary theory chains. The full integral PEL datum remains a README target;
`IntegralPELLinearDatum` is explicitly only its linear part. Removed the unused
over-field OrderAction wrapper and import. The closing comment records the
README-only heavy definitions, including the added supplier adapters.

Spot-checked signatures against prose for `IsPositiveInvolution`, `StarOrder`,
`SymplecticOLattice`, `dualIndex`, `realForm`, `realAction`,
`IntegralPELLinearDatum`, `IsSimilitude`, `IsGoodPrime`, `detPoly`,
`SatisfiesDetCondition`, `IsGeneralizedCMType`, `IsCMType`, `siegelGram`,
`siegelJ`, `hilbertPairing` and the explicitly rank-one `unitaryTraceForm`.
The retained unit tests now include integer-order exclusion of 1/2, rank-zero
dual index, scalar extension, -1 action, rank-zero linear PEL data, wrong-sign J,
identity multiplier, composite good-prime exclusion, rank-zero determinant,
empty CM types, empty Gram determinant, the Je=f witness, Hilbert psi(e,f)=1
and the anti-invariant unitary trace. They supplement the existing characteristic-3
trace negative control and nonflat F5 multiplier control.

Read the pinned source declarations rather than relying on name-search hits,
including Mathlib's polynomial-characteristic evaluation, bilinear dual submodule,
finite-free base change and fractional-ideal dual APIs, and Tau Ceti's symplectic
multiplier statement. The shared lean-check environment uses Tau Ceti f790474
and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Current-only suppliers are documented but not imported into this pinned file.

`lean-check research/blueprint/packages/PELModuli/Suggested.lean` exited 0;
all warnings are declaration-uses-sorry warnings. This checks elaboration only;
the mathematical audit is recorded above. `scripts/check_blueprint.py` passed
for the unchanged packet (91 nodes, 338 API entries, 159 tests, 34 planets,
zero errors/warnings). `intake.py check-files` for the five allowed deliverable
paths and `git diff --check` passed.

## Handoff

The independent review is complete and accepted with these fixes. No unresolved
source gap, mathematical defect or upward dependency is being handed back.
Nothing outside the five permitted deliverable paths was edited; metadata is
unchanged. No upstream checkout was changed, and no lake command was run there.
The packet and its accepted review remain unchanged. When upstream work begins,
use the corrected package README/Suggested.lean and this report together; do not
restore the broad crystal-rank identity, arbitrary display-lifting claim,
rational/adelic neatness equivalence, generic Hodge duplication or finite-place-only
Hasse assertion from the older packet language. The next action is the manager's
draft upstream PR, with its independent manager gate. This report is the handoff
because PACKAGE_REVIEW.md permits no separate handoff-file edit for this job.
