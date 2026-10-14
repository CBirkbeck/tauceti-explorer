# Independent package review: AutomorphicBundles, round 2

**Verdict: needs_changes.** This is a completed fixing review of issue #7917, by Codex,
session `codex-1LP8J1`, on 13–14 October 2026. The package now follows the binding 12 October
Lean shape and the convention errors found here are corrected. Two substantive prerequisite
families remain missing: the rational Hodge–Tate/VB and logarithmic/BGG comparison constructions,
and the boundary geometry of Diamond's ramified Hilbert splitting model. Neither can be supplied
by changing a citation or assuming the desired construction. The conditional conclusions remain
in the README, explicitly marked as gaps.

## Inputs and applicable standard

I read both accepted packets, `AutomorphicBundles--B0.json` and `AutomorphicBundles--B5.json`,
the previous review, and the round-2 package handoff. Their accepted target passes retain 24 gaps
and 50 supplier requests between them; acceptance of a target pass is not a certificate of closure.
I did neither package job being reviewed. The claim was confirmed by the bot in
[comment 6157474193](https://github.com/CBirkbeck/tauceti-explorer/issues/7917#issuecomment-6157474193).

The 12 October shape rule in PACKAGE_REVIEW.md supersedes the old requirement for all 154 API
names to be active Lean declarations. Heavy geometric carriers belong in the README; inventing
sorry'd carriers would violate the present rule. It also supersedes the old 200 KB limit. Thus
neither the old review's declaration-count objection nor the README's length is a remaining blocker.
The nine statement restorations made by that review are retained.

For the quality and duplication comparisons I read the current AlgebraicVectorBundles and
ReductiveGroups READMEs and their Suggested.lean files, and relevant ModularForms sections.
The current TauCetiRoadmap commit was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current
Tau Ceti library commit was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read relevant current
module-duality and affine-module implementations and searched the current roadmaps, Completed
roadmaps and library by the objects involved: torsors and associated bundles, dynamic parabolics,
finite locally free sheaves, boundary coefficients, trace, expansions, period torsors and BGG.
The pinned library audit and the actual pinned declarations were checked separately; current
library results were not silently treated as available at the pins.

## Corrections applied

- Deleted the old B3.9 `minimalHodgeLineComparison`: its semiampleness, finite-generation and
  minimal-model positivity conclusions are already ShimuraCompactifications C5
  `hodge-semiampleness`, `graded-section-finite-generation`, `minimal-hodge-ampleness`.
  The old B3.10 and B3.11 are now B3.9 and B3.10, and all uses were updated. The supplier is
  listed in boundaries and cited where consumed; there is no removed-target stub.
- Imported generic finite locally free sheaf operations from AlgebraicVectorBundles L0A–L0C,
  generic quotient representability from ReductiveGroups Layer 3 and dynamic parabolic
  representability from Layers 7–8. B0.1 keeps the specific ineffective central torus, B0.3 the
  Hodge/opposite identification, and B0.4 associated-torsor descent; none re-plans the generic API.
- Restricted the Lean Hopf-algebra pointwise specialization to commutative rings, matching its
  affine-group interpretation. The README separates this specialization from representability
  and from the Hodge structures on actual Shimura data.
- Made B1.general.3's proof obligations explicit: semisimple simply connected group with
  Q-simple adjoint group, restriction of scalars, continuous adjoint transport through second
  jets, algebraic type-A1 generation, special-torus generation of rational points and the
  locally isotropic auxiliary subgroup used to kill the central discrepancy. Algebraic
  generation and rational-point generation are distinct steps. This is Milne88 §9,
  Lemmas 9.1–9.5, pp.33–34, not the conjectural stronger assertion discussed in §8.1.
- Recorded the shifted scalar cocycle despite the unshifted formula printed in LanIntro p.49.
  At the modular inversion matrix S and z=2i, the denominator of S² is −1, while the unshifted
  product is −4. A proved Lean example pins this counterexample. The vector factor's order
  remains `(J h x).trans (J g (h • x))`.
- Corrected B4.15's parallel weight test: the product of the embedding Hodge lines is the
  determinant over the base ring, not the determinant of a rank-one module over `O_F ⊗ R`.
- Matched Hilbert integer-data generality to the Lean index type; actual arithmetic applications
  use the finite embedding set. Added an addition test giving determinant exponent −2 from two
  exponents −1. Required a prime in the numerical modular Hecke specialization, so ℓ=0 is
  excluded. Added a nonzero Siegel weight test which detects the central sign −w, invisible at w=0.
- Returned the 16 named theorem declarations to `by sorry` as the binding shape requires.
  Real bodies of light definitions, structure-law proofs and discriminating examples remain.
  Expanded the closing comment to name the README-only targets individually.
- Replaced the assertion that the three comparison inputs close upward citations by explicit
  missing-prerequisite contracts. Marked B4.21 and B5.20–B5.22 conditional, and added the direct
  Faltings–Chai locators for BGG degeneration and ordinary/compact-support comparison. Removed
  the unnecessary B5.20 dependency from the finite-level decompositions: their direct classical
  comparison route needs the logarithmic/BGG constructions, not the perfectoid VB functor.
- Added an explicit ramified Hilbert boundary contract and gap labels at B4.15, B5.16–B5.18
  and the Hilbert specialization of B5.19. The opening summary now records both limitations.

No packet, partner package, link map, atlas data or upstream checkout was changed.

## Remaining defects and repair contracts

### 1. Hodge–Tate and BGG closure

The package is in tier 15 with ShimuraCompactifications; HodgeTateAndCanonicalSubgroups is tier 16
and PerfectoidShimuraVarieties tier 17. `HodgeTateVBInput` needs a perfectoid tower, rational
Hodge–Tate M-torsor, the `VB` functor to smooth structure-sheaf modules, and finite-dimensional
finite-level descent. BCGP §4.5, pp.72–80 and §§4.6.1–4.6.2, pp.81–82 use the full period-tower
construction. B1's algebraic canonical principal torsor does not provide that tower or functor.

`LogHodgeTateInput` must separately construct the canonical pro-Kummer-étale local system and
supply the ordinary and compact-support logarithmic comparison, with the stated Galois and
prime-to-p Hecke equivariance. `DualBGGInput` needs the Kostant/dual BGG complex, identification of
its coherent graded pieces, degeneration and compatible comparison maps. The four numerical
weights alone prove none of those results. The finite-level B5.21–B5.22 comparisons can be built
directly by the Faltings–Chai route; the tower/VB gap belongs specifically to B4.21/B5.20. RepresentationTheory/LieHighestWeight's Verma modules
and Weyl character formula do not supply nilradical cohomology or a BGG resolution.

BCGP Theorem 4.8.2, pp.101–102 supports the displayed conclusions. In the cleared Faltings–Chai
book I read VI §5, Proposition 5.4 and Theorem 5.5, pp.233–234 and VI §6, Theorem 6.2(i), p.241.
The compact-support boundary ideal and degeneration are separate from the ordinary case.
Theorem 6.2(i)'s classical p-adic comparison does not impose p>2; the restriction in part (iii)
is for a different relative comparison. There is no reason to exclude p=2 from the classical
end theorem to conceal the missing construction.

Repair requires target-level constructions with APIs, tests and chains to actual lower-tier
suppliers, owned here or moved to an earlier supplier with coordinated dependency changes.
It cannot be fixed by renaming higher-tier imports as assumptions. A deliberate revision of
programme scope/ordering would also need maintainer coordination. No such ownership move was
performed in this review. Affected targets: B4.21, B5.20, B5.21, B5.22.

### 2. Ramified Hilbert boundary closure

The accepted C6 `hilbert-toroidal-model`, `hilbert-boundary-formal-comparison` and
`hilbert-minimal-formal-comparison` specify Dimitrov's model over `Z[1/N(n)]`, with n coprime to
the discriminant and the stated torsion-free level restrictions. They do not identify it with
Diamond's Pappas–Rapoport splitting model or extend its splitting-filtration coefficient lines.
C6's `hilbert-q-expansion-injective` is over `O′[1/Δ,ζ_e]`, so it cannot supply a statement at a
ramified residue prime. This objection concerns the exact model and coefficients; it does not
claim that all of C6's toroidal geometry inverts the discriminant.

H2 supplies the open splitting model and its filtration. What is additionally required is its
semi-abelian boundary extension, toroidal and minimal completed cusp charts, transport of the
embedding-filtration lines and unit character, and component detection in the relevant residue
fibres, including p=2. Diamond22 §§2.7–2.10, pp.6–8, §§6.1–6.2, pp.24–25 and Diamond21
Proposition 7.2.1, p.37 describe these actual objects. C6 may eventually export a precise variant;
otherwise that variant must be planned here using C6's generic machinery. The current model names
alone do not constitute that plan. Affected targets: B4.15, B5.16–B5.18 and Hilbert B5.19.

These repairs require substantial source-based prerequisite plans, rather than local convention
edits. They remain expressly unsupplied; the review is complete and does not certify readiness
for an upstream draft.

## Source checks

The random sample was selected before editing by `random.Random(7917).sample(range(95), 15)`.
All 15 original targets and all six newly introduced targets/three flagged inputs were checked
in the actual source. Printed page numbers are used. The source checks establish the cited
mathematics, not dependency closure. The following tables are my assessment, not source excerpts.

| Sample target | Locator opened | Assessment |
|---|---|---|
| B4.17 | HLTT Appendix B §B.8, pp.270–271; CS §2.3, pp.669–670 | Split coefficient factors retain embedding and similitude labels. |
| B3.3 | Milne90 V, Theorem 6.1, p.90 | Canonical boundary extension has a specified normalization. |
| B5.8 | LanPEL 7.1.2.14(2), pp.539–540 | Submodule recognition uses expansions of the quotient module. |
| B3.general.1 | Milne90 V, Theorems 6.1–6.2, pp.90–91; LanIntro pp.49–50 | General canonical extensions are sourced without a motivic-family assumption. |
| B5.6 | Stacks 00L0, Lemma 10.62.1; LanPEL 7.1.1.4 and 7.1.2.14 | Finite-module prime filtration followed by coefficient-extension induction. |
| B0.2 | Milne90 III §8, pp.63–64 | Infinite ineffective central units are distinct from finite tame stabilizers. |
| B2.general.1 | Milne90 III, Theorem 5.1, p.61 | The canonical torsor associates a general coefficient model. |
| B4.3 | LanIntro §4.2.7, pp.49–50 | Corrected the printed unshifted scalar cocycle by a witness. |
| B1.1 | Deligne §3, conditions (3.1)(a)–(c), pp.22–23; CS p.667 | Finite defining tensors require the similitude/Tate convention. |
| B1.general.1 | Milne88 Theorem 3.10 and Corollary 3.11, pp.18–20 | Connected conjugation includes the special-point and period-torsor normalization. |
| B5.5 | LanPEL proof of 7.1.2.14, p.539 | Only left exactness of the section rows is used. |
| B4.5 | LanIntro §4.2.7, p.49 | Adapter evaluation follows from its definition without cancelling a section. |
| B0.8 | HarrisBundles p.1, equation (1) | The equivariant-function description uses the specified fibre convention. |
| B5.11 | BCGP §1.8, pp.17–18; Diamond22 §6.1, p.24 | Right translation and coefficient pullback are sourced; convolution remains a target proved by Cartesian spans and trace, not a quoted theorem of these paragraphs. |
| B3.5 | HarrisLoc Theorem 1.4.2 and (1.4.3), pp.10–11 | Refinement cohomology concerns canonical/subcanonical coefficients; it does not make reduced boundary pullback equal. |

| Flagged/new target or input | Locator opened | Result |
|---|---|---|
| B0.4 associated torsor bundle | Milne90 III Lemma 3.1 and Proposition 3.5, p.58 | Correct contracted-product convention; general bases use the fpqc descent supplier. |
| Old B3.11, now B3.10 integral Levi coefficient | LanHigher §2 p.3, §3 p.5, Proposition 5.6 pp.11–13, Corollaries 5.8–5.9 p.13 | Good-prime PEL representation and chart normalization are retained. |
| B4.15 ramified Hilbert line | Diamond22 §§2.9–2.10, pp.7–8; Diamond21 §3.2, p.12 | Line and unit-action definitions are sourced; determinant Check corrected; boundary supplier gap remains. |
| B4.19 section colimits | Stacks 0GQZ, Lemma 103.13.5 | Exact finitely presented Hom statement; structure sheaf specialization gives sections. |
| B4.20 integral forms | LanPEL Definition 7.1.1.1, Remark 7.1.1.3, Lemma 7.1.1.4, pp.532–533 | Arbitrary module belongs inside the sheaf; left exactness and filtered colimits have their hypotheses. |
| B5.1 finite locally free trace | Stacks 0BVH, §49.3; pinned Algebra.trace and LinearMap.trace_baseChange statements | Ungraded trace is not averaging; descent from free affine charts is the new geometric target. |
| HodgeTateVBInput | BCGP §4.5, pp.72–80; §§4.6.1–4.6.2, pp.81–82 | Real period-tower construction required; no earlier supplier found. |
| LogHodgeTateInput | BCGP §4.8, pp.101–102; FC90 VI §6, Theorem 6.2(i), p.241 | Ordinary and compact-support comparisons are separate missing prerequisites. |
| DualBGGInput | BCGP p.101; FC90 VI §5, Proposition 5.4 and Theorem 5.5, pp.233–234 | Graded pieces, boundary ideal and degeneration are explicit; no supplier found. |

I additionally read Conrad's Theorem 4.1.7 and proof, pp.112–113, Milne88 §9 pp.33–34,
and the Diamond boundary passages identified above. HarrisLoc's formula was also inspected in
the rendered PDF. Public PDFs were obtained from the authors, journal or arXiv links already in
the package. The Faltings–Chai book and Conrad notes were read from the maintainer-cleared library.
No book file or passage was copied, and no source excerpt is included in the repository.

## Adversarial mathematical and ownership pass

Every original target, its API, conventions and supplied Checks was read. The table records
instances actually examined, including the deleted target. “Retained” means the instance is
consistent with the stated hypotheses and the ownership comparison found no duplicate; it is
not a proof of the general target. All 34 construction/definition subsections have at least three
Checks. Extra arithmetic sign, addition and cocycle controls were added where the earlier tests
could miss a plausible error. The theorem subsections are not held to a numerical Check count.
For absent geometric carriers these are mathematical/prose checks; they are not claimed to be
formal Lean tests.

| Target | Instances and convention challenge | Result/change |
|---|---|---|
| B0.1 | GL2 central split ranks equal; totally real restriction of scalars of degree d has ineffective torus dimension d−1; trivial coefficient. | Retained specific quotient; generic representability imported from RG3. |
| B0.2 | Neat Hilbert arithmetic group still contains infinite central units; finite stabilizer versus ineffective kernel. | Retained; neatness cannot replace the central condition. |
| B0.3 | Conjugation by diag(t,1) scales lower-left entry by t⁻¹; t=2 gives 1/2; trivial cocharacter gives full group and Levi. | Generic theory deferred; commutative-ring pointwise scope; numerical Lean witness added. |
| B0.4 | Trivial torsor; frame torsor of O(1), weight ±1; zero representation. | Weight +1 gives the line and −1 its dual; associated descent retained beyond AVB. |
| B0.5 | GL2 flag: weight a yields O(−1), inverse yields O(1); standard unipotent coefficient versus its graded inflation. | Retained; not full-flag Borel–Weil duplication. |
| B0.6 | Reference frame; two filtered frames differing by an upper shear have the same graded frame. | Retained actual P-torsor, not just Levi frames. |
| B0.7 | Trivial coefficient; surviving −1 on odd weight; rank-two coefficient. | Retained ineffective-kernel and coarse descent restrictions. |
| B0.8 | Two noncommuting shears; frame relation must evaluate the inverse fibre map. | Retained product order. |
| B0.9 | Identity field extension; equal real-quadratic exponents swapped twice; unequal exponents not fixed. | Retained actual semilinear descent datum. |
| B0.10 | Rank-one frame and inverse character; unfiltered smooth isomorphism alone insufficient. | Retained algebraic/holomorphic comparison. |
| B1.1 | Alternating form without a varying similitude line cuts out Sp, not GSp; zero extra tensor. | Retained defining tensor theorem, no generic reductive classification duplication. |
| B1.2 | CM elliptic endomorphism and polarization; connected family versus disconnected fibres. | Retained characteristic-zero and propagation hypotheses. |
| B1.3 | Zero tensor; endomorphism; polarization in its Tate line. | Retained all three realizations and homology dual. |
| B1.4 | Constant tensor bundle has identity frame; mismatched ranks have no isomorphism; omitted similitude line changes group. | Retained tensor frame torsor. |
| B1.5 | Zero coefficient filtration; standard Siegel Lagrangian; quaternion conic for (−1,3) has no Q-point. | Retained rational flag map without rational-point assertion. |
| B1.6 | Standard Siegel coefficient is dual H1 de Rham with Gauss–Manin; tensor unit. | Retained Hodge-type principal construction. |
| B1.7 | Add a second faithful representation and compare its associated module. | Retained torsor identity, not mere rank equality. |
| B1.8 | Inverting Artin reciprocity changes both base and fibre maps; identity automorphism. | Retained matched normalization. |
| B1.9 | Finite central kernel acting nontrivially on a coefficient prevents descent; trivial coefficient descends. | Retained effective abelian-type descent. |
| B1.10 | Identity span and two composable spans at a common smaller level. | Retained pullback direction and composition. |
| B1.general.1 | σ=id; transporting a special point changes the datum, not just the field label. | Retained period-torsor normalization. |
| B1.general.2 | First jet versus second jet of the tangent bundle; adjoint representation. | Retained order-two realization. |
| B1.general.3 | Type-A1 case; adjoint equality can leave a central character; non-isotropic rational quotient need not be simple. | Added exact group restrictions and the rational-generation/local-isotropy proof obligations. |
| B1.general.4 | Tensor unit; general characteristic-zero datum; attempted integral extension not asserted. | Retained effectivity/continuity, no motivic assumption. |
| B1.general.5 | Nonsplit quaternion flag; map from torsor is possible without Q-point of flag. | Retained descent of flag class. |
| B1.general.6 | Identity conjugation and two-step transport with coefficient fields changed. | Retained transported cocycle, not fixed-group composition. |
| B2.1 | Tensor unit; Hodge line; upper-Borel character a cannot be detⁿ on GL2. | Retained coherent functor without fictitious flat connection. |
| B2.2 | GL2 invariant differential line versus its dual. | Retained Hodge convention. |
| B2.3 | Standard Siegel P-module is nonsplit although two Levi weights are visible. | Retained coefficient convention; generic GLn highest weights imported. |
| B2.4 | Trivial Q coefficient; actual H1 homology; nonextending Levi character. | Retained full-group and rational-weight requirements. |
| B2.5 | Trivial Qℓ and Qℓ(1) agree geometrically but differ arithmetically; lattice rescaling disappears after inversion. | Retained arithmetic tower and lattice hypotheses. |
| B2.6 | Unit (O,d); H1 de Rham Hodge subbundle; Levi character a cannot be a full-group rank-one representation. | Retained connection/transversality only for full-group coefficients. |
| B2.7 | Standard degree-one family comparison and tensor projectors. | Retained realizations and purity conditions. |
| B2.8 | Hodge line and inverse line under duality; identity Hecke span. | Generic tensor/pullback APIs imported from AVB, specific coefficient coherence retained. |
| B2.9 | g=2 sequence L_(0,−1;1)→St→L_(1,0;1), without a claimed splitting. | Retained algebraic coefficient sequence; HT pullback needs actual torsor. |
| B2.general.1 | Unit coefficient of general datum; absence of abelian motive. | Retained canonical-torsor association. |
| B2.general.2 | Tensor unit; Levi-only character has no automatic Betti/étale coefficient. | Retained full-group restriction. |
| B2.general.3 | Same de Rham line admits different rational Betti data. | Retained rational-weight hypothesis, no inference from dR alone. |
| B3.1 | Tate invariant du/u versus base dq/q; tensor unit. | Retained semi-abelian chart coefficient. |
| B3.2 | Unit coefficient; twist by nonempty D has same open restriction and wrong boundary frame. | Retained normalized canonical extension. |
| B3.3 | Transition cocycle at two charts; arbitrary boundary twist. | Retained canonical gluing, not open restriction alone. |
| B3.4 | Empty D; crossing ideal (q1q2) versus (q1,q2); 2D versus reduced D. | Retained reduced boundary definition. |
| B3.5 | Blow-up of crossing: old boundary pullback has exceptional multiplicity 2, reduced new boundary 1. | Retained canonical pullback and subcanonical pushforward distinction. |
| B3.6 | Identity refinement; two fans and common refinement. | Retained comparison, no globally Hecke-stable fan assumed. |
| B3.7 | Unit residue 0; nodal rank-two elliptic coefficient has nonzero nilpotent residue; monodromy −1 is not unipotent. | Generic log extension imported; coefficient identification retained. |
| B3.8 | Identity proper map; nodal ideal (x,y) has generic rank 1 and fibre dimension 2. | Retained coherent pushforward without local-freeness claim. |
| Old B3.9 positivity | Hodge line and its positive minimal power. | Deleted duplicate of partner C5 positivity/finite generation. |
| New B3.9 rationality | Coefficient defined over L strictly larger than E. | Retained descent over L, no forced E-definition. |
| New B3.10 integral coefficients | Tensor unit; defining cotangent coefficient; boundary twist with same open restriction. | Retained good-prime PEL and formal normalization. |
| B3.general.1 | Unit and full-group coefficients on Hodge-type subdata. | Retained normalized general extension. |
| B3.general.2 | General coefficient without motivic family. | Retained log comparison identification, generic carrier imported. |
| B3.general.3 | Conjugation changes coefficient field and fan; identity transport. | Retained actual transported model. |
| B4.1 | Unit on proper connected model has constants; on Spec L[t], powers of t are independent; zero coefficient. | Retained properness for finite dimension. |
| B4.2 | Empty D; nonzero constant on nonempty D; crossing requires divisibility by q1q2. | Retained cusp ideal. |
| B4.3 | SxSy(1,0)=(2,1), SySx(1,0)=(1,1); C2 frame shift; modular S at 2i. | Corrected source's omitted shift; Lean counterexample added. |
| B4.4 | Constant (0,1) slashed by Sx gives (−1,1); inverse composite order; determinant-negative GL2 conjugates scalars. | Retained monoid/semiring generality and semilinear exclusion. |
| B4.5 | f=0; evaluation needs no nonvanishing. | Retained direct inverse-factor formula. |
| B4.6 | f=0 satisfies both sides; invertible fibre map cancels without cancelling f. | Retained equivalence without nowhere-zero hypothesis. |
| B4.7 | (gh)⁻¹=h⁻¹g⁻¹ for noncommuting factors. | Retained inverse-base right action, distinct from right slash. |
| B4.8 | C2 nonidentity factor 2 transforms zero but gives 4≠1; at nonzero scalar value cancellation is valid. | Retained field and pointwise nonzero requirement. |
| B4.9 | Arbitrary frame can change apparent growth; canonical boundary frame must be named. | Imported partner minimal Hodge positivity; retained coefficient comparison. |
| B4.10 | k=0 gives O; surviving −1 obstructs odd coarse weight. | Retained GL2 specialization beyond existing analytic ModularForms. |
| B4.11 | k=0,w=0 gives m=0; k=4,w=2 gives −1; k=3,w=2 fails parity; addition gives −2. | Matched arbitrary integer index type and added additive control. |
| B4.12 | F=Q; k=0,w=2 gives determinant; k=4,w=2 uses determinant inverse. | Retained split coefficient convention. |
| B4.13 | Scalar t acts with exponent k+2m=w; norm −1 and odd w obstruct some quotients. | Retained infinite-unit condition distinct from neatness. |
| B4.14 | Real-quadratic unequal weights swapped by Galois. | Retained descent datum instead of automatic Q-definition. |
| B4.15 | Unit; parallel product; real-quadratic exponents (1,3) give norm-one unit character θ1(u)⁻²; p=2. | Corrected base-ring determinant; ramified boundary gap marked. |
| B4.16 | g=1; λ=(−1,…,−1) gives determinant inverse; λ=(1,0,…) has rank g. | Retained coefficient specialization; generic Schur functor imported. |
| B4.17 | Unit; distinct τ and conjugate-τ factors; pure similitude coefficient. | Retained embedding and Tate labels. |
| B4.18 | Field extension is flat; mod-p reduction can acquire new forms. | Retained characteristic-zero field base change only. |
| B4.19 | Infinite direct sum on qcqs stack; disjoint non-qc copies have products of sections. | Retained finite-presentation/qcqs hypotheses, no product/colimit interchange. |
| B4.20 | M=0; field coefficient; multiplication by p and H1 p-torsion; fan refinement. | Retained tensor inside sheaf, no false right exactness. |
| B4.21 | κ=0; standard (1,0;−1) gives ω_A(−1); double Tate twist would change result. | Marked missing period/VB construction. |
| B5.1 | Identity trace; R[t]/(t²−a): Tr(1)=2, Tr(t)=0, Tr(t²)=2a; degree-p cover in characteristic p. | Retained actual trace, no averaging; affine algebra API imported. |
| B5.2 | Q=0; Z multiplication by 2; on Spec Fp, multiplication by p becomes zero. | Retained R-flat model requirement. |
| B5.3 | Trivial Cp action in characteristic p; shear Cp action on Fp² has invariants mapping to zero in second-coordinate quotient. | Retained only left exactness of invariants. |
| B5.4 | Two components with one untested; Spec R[1/p] misses residue fibre; completion at unit ideal is zero. | Retained fibrewise detection and proper-ideal requirements. |
| B5.5 | N=0; Q=0; nonsplit Z/4 extension by two Z/2 terms. | Retained left-exact induction, no last-row surjection needed. |
| B5.6 | Empty filtration of zero; Z/4 filtration; nonprincipal invertible ideal need not be free. | Retained prime quotient up to isomorphism and noetherian/finite hypotheses. |
| B5.7 | Untested component; M=R[1/p]/R; distinct basis vectors in product do not lie in any finite coefficient submodule. | Retained section colimits and family injections separately. |
| B5.8 | M1=M; M1=0; M/M1 torsion for M=R[1/p], M1=R. | Retained quotient-coefficient injectivity. |
| B5.9 | Local q divides iff constant vanishes; deeper scalar constant can miss a higher boundary coefficient. | Retained all boundary restrictions. |
| B5.10 | Identity; raw degree-d trace on 1 is d; weight-zero prime-2 normalized value 3/2. | Added prime requirement in numerical specialization. |
| B5.11 | Identity coset; additive Hecke element; coset-degree reciprocals need not be a character. | Retained multiplicative unit-valued normalization and Cartesian spans. |
| B5.12 | Trivial Cp invariants nonzero, group sum zero; shear quotient loses surjectivity; arbitrary level intersections need not be Cartesian. | Retained stack equalizer and AA4 product condition. |
| B5.13 | Tate(qⁿ) pulls du/u to n du/u; local qʳ has coefficient 1 only at r. | Retained relative invariant differential, imported analytic comparison. |
| B5.14 | W=0 or M=0; rank-two monomial; (1−q)⁻¹ infinite support; k[[x,y]] cannot map to k[y,y⁻¹][[x]] extending face chart since 1−y changes unit status. | Retained common completion, torsor sections and no averaging. |
| B5.15 | Scalar specialization; rank-two direct sum; Z/4; Iwahori component disjoint from cusps. | Retained explicit fibrewise detection hypothesis. |
| B5.16 | Zero ring; local monomial; a single moved positive degree is not unit-invariant. | Marked missing ramified coefficient boundary charts. |
| B5.17 | One cusp per determinant component; omitted component; U0(P) may have component without cusp. | Marked supplier mismatch, no extrapolation to Iwahori. |
| B5.18 | Positive local degree versus line-valued constant; nonparallel unit character over flat coefficients; torsion can change its annihilator. | Marked ramified boundary gap; retained all-cusp condition. |
| B5.19 | n=0 gives (1+χ(ℓ)ℓ^(k−1))a0; ℓ∤n removes second term; mod-p² at ℓ≠p. | Retained good-prime normalization; Hilbert specialization marked conditional. |
| B5.20 | (1,0;−1) gives ω_A(−1); κ=0; subcanonical finite-level ideal rather than open sections. | Marked missing VB/period and log constructions. |
| B5.21 | κ=0 gives four twists 0,−1,−2,−3; i=0 kills j>0; (0,0;1) fails parity; (0,−2;2) tests central sign. | Added nonzero weight test; full comparison/BGG remains a gap, including p=2. |
| B5.22 | Empty D recovers proper ordinary theory; nonempty D adds −D to all four terms. | Marked separate compact-support comparison/duality gap. |

## Lean statement agreement and validation

Ten signature checks against the README were made explicitly:

| Signature | Agreement checked |
|---|---|
| inverseCocharacter_inverseCocharacter | Inversion of Laurent exponent twice, commutative ring/Hopf carriers. |
| levi_inverseCocharacter | Same evaluation algebra and coordinate Hopf algebra; centralizer unchanged. |
| hodgeParabolic_inf_hodgeTateParabolic | Pointwise intersection, not scheme representability or a Hodge structure on arbitrary Hopf algebra. |
| AutomorphyFactor.changeFrame_comp | u first then v gives v∘u, matching LinearEquiv.trans order. |
| slashActionOfAutomorphyFactor | Monoid, left action, semiring module; hmul contains factor law, not slash conclusion. |
| slashActionOfAutomorphyFactor_map_apply | Inverse fibre coefficient evaluated at unchanged x, with f at g•x. |
| slashActionOfAutomorphyFactor_invariant_iff | No nowhere-zero condition, and zero section allowed. |
| inverse_base_action_cocycle | Group inverses reverse order and change the base action. |
| cocycle_at_of_automorphy_of_ne_zero | Field, actual transforming section and nonzero value at the chosen point. |
| HilbertArithmeticWeight.two_mul_detExponent | Integer parity guarantees exact division; arbitrary index type matches integer-data specification. |

The Siegel weight data and prime-dependent numerical Hecke definition were also checked. Each
kept light definition has a real body. Heavy constructions are named in the closing comment and
specified with hypotheses/APIs/Checks in the README. There are no `True` placeholders, sorry'd
data or auxiliary theorem chains. Elaborated examples are not a formal proof of the roadmap.

- Final `lean-check`: exit 0, exactly 16 warnings, all declaration-uses-sorry warnings; no errors
  or other warnings. One compile at a time in the shared pinned build, after checking memory.
- `scripts/check_sorry_data.py`: exit 0. Suggested.lean has 487 lines, below 5,000.
- `scripts/check_blueprint.py` on each unchanged input packet: exit 0, 0 errors and 0 warnings.
- `intake.py check-files` on the changed deliverables and handoff: 0 problems.
- `git diff --check`: clean. Metadata remains exactly `topic = "math.NT"`.

The repaired README contains 94 targets, each with Source, Needs, Lean and Checks clauses.
Own-word mathematical statements and bibliographic locators are retained. Remaining gaps are
recorded in review.json and in the durable handoff; the package is not yet ready for an upstream PR.
