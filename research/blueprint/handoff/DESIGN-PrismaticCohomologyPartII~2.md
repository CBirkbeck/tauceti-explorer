# Prismatic Dieudonné theory — revision 2

Issue #11169; original design #3593. Agent: Codex, session codex-OUV8GU.
This is a complete target-level revision pass, not a checkpoint or an implementation.

## Result and review boundary

The packet has 93 nodes: 10 definitions, 12 constructions, 69 theorems and
2 lemmas. It has 144 API items, 83 discriminating unit tests, 27 planets and
19 pinned baseline declarations. PD.0 is closed at target level. PD.1, PD.2,
PD.3, PD.4, PD.5, PD.6 and PD.7 are planned. Eight explicit gaps and two
supplier requests remain; their consequences are propagated transitively into
each stage's coverage record. A completed planning pass does not establish
results whose proof routes still depend on these gaps.

All 83 input node IDs are retained. Ten targets are added. Every
implementationStatus remains unchecked. The previous independent review object
is preserved exactly, including its needs_changes verdict and its description
of the previous revision. This revision does not review or accept itself. The
fresh independent review should concentrate on the functor comparison below.

## Changes addressing the review

The unrestricted formal-group/display equivalence now uses Lau13, Theorems
5.1 and 5.3, pp. 23–27, directly. Its prerequisites are explicit targets:
the crystalline display functor, truncated displays, their smooth comparison
and finite flat infinitesimal isomorphism torsors. The proof follows stabilized
images of the finite-level automorphism kernels, the cotangent-complex
criterion for formal étaleness, and a uniform vanishing argument over reduced
finite-type presentation relations. Nilpotent-thickening deformation and
p-adic limits extend the reduced-stack result to arbitrary p-adic rings.
This argument has no noetherianity, excellence or residue-field restriction.

The inverse used here is an abstract quasi-inverse Ψ of Lau's actual
crystalline functor Φ. Identifying Ψ with Zink's explicit BT construction is
unnecessary for this endpoint. Consequently the excellent presentations and
Rapoport–Zink arguments in Lau13 §7 and Lemma 8.1 are not hidden prerequisites.
Lau08 remains historical attribution, explicitly unread, and is not a missing
proof input.

The new PD.7/prismatic-display-crystalline-comparison compares the particular
contravariant functor Z_R with Φ_R(G∨), equivalently Φ_R(G)^t. It uses:

1. AL23 Lemma 4.3.3, pp. 45–47, evaluated on the crystalline Witt prism with
   its Frobenius-induced structure map. The perfect-field Frobenius pullback
   in Proposition 4.3.9, pp. 50–51, is retained.
2. Compatibility of the actual Hodge maps, using the polynomial Čech–PD
   comparison, its augmentations and its Free_Z-linear extension to the
   Breen–Deligne resolution. The comparison square has the canonical maps
   to Ext¹(G,Ga)=Lie(G∨), with identity on that quotient. Equality of these
   maps identifies the Nygaard-plus-Witt-ideal filtration with the crystalline
   filtration; equality of their ranks would not suffice. This is a derived
   comparison argument in the packet, not a theorem attributed verbatim to Lau.
3. Uniqueness of V and F₁ on p-torsion-free Witt rings, followed by descent on
   the compatible full-BT presentation and its relation. Lau13 Proposition 2.4,
   pp. 9–10, supplies the p-torsion-free PD envelope of the diagonal used to
   retain compatibility on PD thickenings and nonreduced bases.

Thus the formal contravariant inverse is Ψ_R(P^t), with no additional Cartier
dual on the resulting formal group. The withdrawn AL23 Proposition 5.3.5
kernel-nilpotence argument is not used. No equivalence for all displays at
p=2 is asserted.

The regular-local endpoint retains every dimension and includes equal
characteristic. New PD.7/regular-prismatic-descent uses Ito25, Lemma 6.2.7,
Corollary 6.2.9 and Proposition 6.4.1, pp. 53–60: two auxiliary-ideal estimates
and successive parameter-adic and prism-adic limits produce unique descent on
the self- and triple prismatic coproducts. Proposition 7.1.1, p. 62, gives the
Breuil–Kisin evaluation equivalence. Remark 6.2.10, p. 54, explains why the
one-variable divided-Frobenius contraction cannot simply be extended.

The other new targets are compatible p-division covers, the compatible affine
full-BT presentation, p-adic crystalline evaluations and the integral
perfectoid v-site with α and generic-fibre j. The coefficient-completion
argument in PD.4/pdiv-locally-free is separate from the division-cover
argument: it uses compatible projectives, Stacks 0D4B, the replete-topos
limit spectral sequence and the vanishing of Hom(G,O/pⁿ).

These routes replace seven input gaps: multivariable Breuil–Kisin descent,
compatible infinite division covers, mixed-characteristic crystalline
coefficients, the characteristic-p connection obligation (bypassed by direct
prismatic descent), the compatible full-BT presentation, the unrestricted
display proof/comparison, and the integral v-site.

## Remaining obligations and where to resume

The packet's eight gap records give the consumers and full scope. They are:

- Fargues's rigid p-divisible-group algebraization input, Corollaire 9 and
  Théorème 15, for Scholze–Weinstein Theorem B.
- Scholze–Weinstein Theorem C on the image of the period morphism, needed to
  pass to a general algebraically closed C.
- Isotriviality over O_C/p and Oort's realization theorem for a symmetric
  Newton polygon, including the isogeny adjustment in the abelian cover.
- Relative ringed-site size/instance comparisons and derived internal Hom/Ext,
  with their base-change and pushforward compatibilities. Ordinary internal
  Hom and the generic pullback adjunction already exist and must be reused.
- Witt-vector v-descent for finite projectives and the corresponding BT
  descent over W(S)/ξ, including the complete inverse-limit step.
- Unpolarized infinitesimal abelian lifting over A/I² for the integral
  Hodge–Tate splitting at p=2.
- Formal Serre–Tate effectivity over nonnoetherian O_C. The supplier's
  complete noetherian local clause does not cover this base.
- A direct proof of Hodge–Tate exactness beyond the explicit dlog maps.
  SW20 recalls Fargues's theorem without supplying its complete proof there.

The two requests are to PerfectoidQuotients:Q0:integral-algebra for the
additional W(S)/ξ perfectoid algebra used in descent, and to
AbelianSchemesAndArithmeticModuli:A4/serre-tate-equivalence for the levelwise
application and nonnoetherian formal effectivity. The affine nilpotent-base
Serre–Tate node was read and is reused. The generic v-site now cites the exact
DiamondsAndVStacks D2 and D6 nodes; the former broad D3 request is removed.

The next independent review should check the Hodge-map comparison and its
PD descent, the variance of Ψ(P^t), the finite-level-to-full-stack argument,
and the Ito estimates. Subsequent closure work should address the eight
recorded obligations rather than replan existing library constructions.

## Ownership and current-upstream audit

The existing split into Dieudonné theory, crystalline local systems,
F-smoothness and integral Riemann–Hilbert is retained. The parent PR.7 owns
the coefficient vector-bundle comparison. AInfCohomology supplies BKF linear
algebra, while this roadmap owns its admissible prismatic interpretation.
The Hodge–Tate group map/sequence stays in PD.3, supplying the higher
HodgeTateAndCanonicalSubgroups roadmap; general displays stay in PD.7,
supplying PELModuli. No higher-tier supplier is imported, and no other
roadmap is edited. The packet retains the associated ownership proposals
and upstreamNotes for the maintainer.

The reviewed library-coverage file has no direct PrismaticCohomologyPartII
entry; this absence was not treated as evidence of missing mathematics.
The 19 Mathlib baseline declarations were checked at 082e2d3. The suggested
file was elaborated by the shared build at Mathlib 082e2d3 and Tau Ceti
f790474.

Current read-only TauCetiRoadmap main was also inspected at
0d144d044dacebca17b654695b6f1ad58f159b27, and current Tau Ceti at
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The nine roadmaps newer than the
atlas snapshot were searched for relevant targets. AlgebraicVectorBundles
contains the relevant ordinary internal-Hom specialization; it does not
supply Witt-vector v-descent. The two upstream reader documents read for
style and scope were AlgebraicVectorBundles and AdicSpaces.

Current Tau Ceti's SheafOfModules.ihomObjEquiv and ihomCompForgetIso were read
in the internal-Hom source, including its small-site, commutative-ring and
sheafification assumptions. Mathlib's pullbackPushforwardAdjunction and
pullbackIso were read at the pin with their continuity and right-adjoint
assumptions. Tau Ceti's current projective quotient-lifting theorem assumes
principal-adic completeness of an endomorphism ring; it is not the general
henselian-pair result planned in PD.0. These existing constructions are
cited, not planned again.

## Sources and source issues

Direct reading for this revision focused on AL23 §§4.2–4.3, 4.6 and 5.2–5.4;
the AL erratum; Lau13 Lemma 1.6, §§2–5, §7 and §§8.1–8.2; Ito25 §§6–7;
Lau18 §10; and Stacks 0D4A/0D4B. The retained packet records the earlier
independent review's reading of the other public sources and its verified
locators. The current revision does not claim a new cover-to-cover reading
of every retained source. Exact public versions and PDF hashes are in the
packet and reader.

Lau08 could not be read directly from a public or cleared copy. The directly
read Lau13 proof replaces that dependency. The publisher copy of Lau13 was
inaccessible with HTTP 403, so all new Lau13 locators and the two newly
recorded misprints concern arXiv:1006.2723v1 only. The arXiv history lists
only v1; the author's publication page listed no separate correction. No
claim is made about those misprints in the journal version.

Source issues E1–E5 are retained, with E1 updated to the Ito resolution.
E6 records the known Lau08 admissible-cover composition error and its repair
in Lau13 §8.2, p. 37. E7 corrects W(k) to W_n(k) in the level-n module
definition before Lemma 3.5, p. 14. E8 corrects the order of the two rank-one
F,F₁ components after Remark 4.8, p. 23; the PDF image was checked, and the
generation condition detects the error already at n=1. All descriptions
are in our own words; no source excerpts or copied source files are included.
No suspicious instructions were encountered in untrusted material.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomologyPartII.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/PrismaticCohomologyPartII.lean`:
  exit 0 at the pinned build. The only warnings are the two admitted
  henselian-projective milestone proofs. Both rank-one height examples are
  proved. No admitted data definitions, new theory development or Lean code
  in the packet/reader are introduced.
- Integrity checks: all retained IDs and the independent review object are
  preserved; the local dependency graph is acyclic; APIs, unit tests and
  stage coverage agree with the reader; source IDs resolve; every node is
  unchecked; every layer has at most six planets; only the five authorized
  deliverables are changed. `git diff --check` passes.

The README is the full mathematical specification, including every API,
unit check and heavy carrier. The 134-line suggested file states only what
can be expressed with existing carriers at the pins. It does not claim to
formalize prismatic Dieudonné theory.
