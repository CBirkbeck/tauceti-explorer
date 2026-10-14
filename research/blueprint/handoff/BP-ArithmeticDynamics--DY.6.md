# Handoff — BP-ArithmeticDynamics--DY.6

Completed target-level planning pass, 14 October 2026. Agent: Codex (GPT-6),
session `codex-Vlgvom`, issue #9318, branch
`codex-Vlgvom-arithmetic-dynamics-dy6`. The bot confirmed the claim in
[comment 6162903532](https://github.com/CBirkbeck/tauceti-explorer/issues/9318#issuecomment-6162903532).
This is a follow-up blueprint for independent review, not an implementation
or a review of the worker's own work.

## Deliverables and inventory

- [Packet](../packets/ArithmeticDynamics--DY.6.json): scope exactly
  `ArithmeticDynamics:DY.6`, part `DY.6`, status `complete`, coverage `planned`.
  There are 21 supplemental nodes: one construction, one definition and
  19 theorems; 15 baseline declarations; 12 fresh source records;
  14 API items and nine discriminating unit tests; eight proof gaps and
  four supplier requests. Implementation status remains `unchecked`.
- [Reader](../readmes/ArithmeticDynamics--DY.6.md): complete statements,
  hypotheses, target-level proof routes, locators, prerequisites, APIs,
  tests, acceptance checks, requests and gap leaves. It includes an explicit
  manifest importing all 93 accepted DY.6 nodes by their existing ids.
- [Suggested statements](../suggested/ArithmeticDynamics--DY.6.lean):
  146 lines, six theorems and eight examples, using existing carriers.
  It states the integral presentation, primitive-root transport, marked
  evaluation identity, Lech verification adapter, Ritt equal-iterate
  classification and complex specialization of the linear orbit theorem.
  The heavy torus, height-family, completed-local-coordinate and hybrid
  carriers are fully specified as reader targets, with no data placeholders
  or theory development in the Lean file.

The base packet, its reader and suggested file were not edited. No planets
were added: the six existing DY.6 planets are retained by import. Assembly
must take the union of this packet and the accepted base, including the
base definitions' APIs/tests and all inherited supplier requests that have
not been replaced by exact node citations.

## What this pass resolves

The two outstanding Lech–Cassels obligations now have precise native
contracts and library-grounded proof routes:

1. `followup-integral-primitive-presentation` starts from an arbitrary
   essentially finite type characteristic-zero field and a separate finite
   marked family. It identifies the parameter fraction field, obtains a
   finite separable primitive extension, integer-normalizes its minimal
   equation, and clears all marked coefficient denominators simultaneously
   in the parameter ring. Zero marks, no parameters and trivial extensions
   are included.
2. `followup-primitive-root-transport` extends an injective parameter-ring
   map across its fraction field and the selected primitive root, proves
   uniqueness and injectivity, and transports the marked fractions.
   `followup-lech-integral-assembly` composes these with the accepted
   `lech-independent-hensel-specialization`. Its discharged residue,
   independence, prime, Hensel and denominator-unit obligations are preserved.

The general-curve specialization contract is now stated over a specified
global height field, with degree-one curve-height normalization and real
divisorial eigenclasses. The proof route separates the uniform relative
canonical-height bound, generic intersection degree, curve-height
quasi-equivalence and iterate amplification. These interfaces are requested
from RP.0 rather than assumed to follow from the number-field t-line case.

Other key inputs now have explicit target statements: unramified relative
Cohen coordinates; Benedetto's nonisotrivial zero-height criterion and open
disc covering; rational Legendre-mark degree growth, cusp-continuous marked
escape potential and distinct torsion-parameter infinitude; separate hybrid
potential and measure limits; finite multiplier spectra, affine-torus Lattès
maps, rigid fixed-degree finiteness, representative heights, whole-locus
finite-fibre height comparison and quantitative attracting branch values;
equal-degree Bilu–Tichy and equal-common-iterate Ritt classification.

The synchronized linear GTZ case imports
`DiophantineApproximationAndTranscendence:DT.2/s-unit-equation-finiteness`.
Its proof distinguishes distinct common values from repeated time indices,
and synchronized from independent-time intersections. SF.0's exact
`spreading-out-models` node already supplies the pointed finitely presented
model input; RP.0's `silverman-dominant-map-inequality` supplies the dense-open
height bound, and the whole-locus target gives the exceptional-set induction.
No upstream targets or other owners' mathematics were replanned or moved.

## What remains before DY.6 is closed

The pass is complete under PROTOCOL.md's target-level `planned` rule. The
following are explicit proof leaves, not established results:

1. **Local polynomial discs:** audit the original proofs behind Benedetto
   Lemmas 5.1–5.2 (smallest containing disc, potentially good reduction and
   inverse-image disc decomposition). The Lemma 5.3 factorization argument
   and product-formula finiteness route are given here.
2. **Marked activity:** audit DWY Theorem 1.5's estimates at all three cusps,
   the complex curvature/potential adapter, activity versus normality and
   the Montel moving-target infinitude argument. The degree calculation and
   algebraicity of the resulting parameter relations are explicit.
3. **Hybrid comparisons:** supply Favre's model-function continuity and
   density and the uniform-potential-to-measure comparison. A topological
   hybrid-space interface alone is insufficient.
4. **Affine Lattès classification and multiplier rigidity:** supply complex
   elliptic uniformization, finite torus quotients and Milnor Theorem 5.1;
   McMullen's stable-family rigidity and the finite-spectrum/single-iterate
   adapter. The elementary lattice and translation-invariant counting proof
   is recorded conditionally on the classification.
5. **Bounded conjugacy representatives:** obtain a public or cleared proof
   of the precise comparison used in Ingram Lemma 13, citing Silverman's
   *Moduli Spaces and Arithmetic Dynamics* (2012), p. 103. The infimum
   formulation avoids assuming an absolute-height minimum is attained.
6. **Quantitative attracting cycles:** audit Koebe quarter and the unbranched
   inverse-component argument, and the Benedetto–Ingram–Jones–Levy theorem
   with its small-residue-characteristic directional-multiplicity constants.
   Ingram's exact consumer estimate is recorded for branch values.
7. **Polynomial classification:** audit Bilu–Tichy Theorem 10.5 and the Ritt
   equal-iterate case cited on p. 356, with a supplier for Dickson polynomials
   and their functional identities. Siegel and the unit equation are imported
   owners, and do not supply these classification theorems by themselves.
8. **Tate O(1) variation:** obtain the proof of the parameter divisor and the
   summably bounded local-height comparisons. The accepted endpoint is
   imported unchanged; Call–Silverman's weaker specialization limit does not
   discharge it.

The four explicit supplier requests are:

- **SF.0:** relative unramified Cohen coordinates preserving the specified
  continuous Z_p coefficient map, and completed-local smoothness/dimension.
- **RP.0:** general-curve height quasi-equivalence for real divisor classes,
  the generic intersection identity and the uniform relative height estimate
  over global height fields.
- **TB.0:** hybrid carrier, model functions, continuity/density and fibre
  Laplacian/Monge–Ampère measure comparison under uniform admissible limits.
- **RP.4:** the exact normalization, integral model and boundary interface
  for applying the existing Siegel theorem to polynomial equality components.

## Source audit and corrections to inherited gap locators

Public versions were read for Cassels (1976, main and addendum), Bell's
embedding lemma (v2), Call–Silverman (1993), GTZ (v2), Ingram's critical-height
paper (v3), Milnor's Lattès paper (v2), Bell–Ghioca–Tucker (v1),
DeMarco–Wang–Ye (v3), Benedetto's revised 2005 author copy, Favre (v2), and
McMullen (1987). Exact read sections and hashes are in the packet. McMullen's
rigidity proofs and DWY's cusp estimates were not fully audited; their
consumer statements and the inspected proof portions are distinguished.
The DeMarco–Faber I/II statements and Silverman's public ADS sample were
screened as additional leads. No source files or passages are in the repository.

- DeMarco–Faber II Theorem D concerns analytic stabilization of a vertex set.
  Favre Theorem B supplies the hybrid weak limit; normalized potential
  continuity is a separate contract.
- DWY Proposition 1.4 has the four rational moving marks 0, 1, t, infinity.
  The constant-mark consequence has exactly 0, 1, infinity. Infinitude uses
  the first argument in §6.5, not equidistribution by itself.
- Ingram's bibliography [21] is *Moduli Spaces and Arithmetic Dynamics*.
  The public sample of *The Arithmetic of Dynamical Systems* is a different
  book and supplies no proof of that representative-height bound. The cited
  book and Tate's article were not available in the cleared library. No
  uncleared book copy was used.

These are corrections to inherited citation routes, not new allegations of
errors in a published source; `sourceIssues` is empty.

## Validation and review entry points

- `python3 scripts/check_blueprint.py` on the follow-up packet: zero errors
  and zero warnings, with the shared pinned declaration index available.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  zero problems, including JSON and private-path screening.
- `python3 scripts/check_sorry_data.py` on the suggested file: passes.
- `lean-check` on the suggested file: exit zero at the shared pinned build;
  only the 14 placeholder-proof warnings. No language server or library
  build/update/cache command was run.
- Manifest/reference and authorized-path checks: all 93 imports match the
  accepted base exactly, all supplemental ids are new, every definition or
  construction has at least three tests, no source excerpts or private paths,
  and only the four authorized files changed.

Begin review with the two primitive algebra contracts and their composition
with the accepted independent Hensel contract. Then check the curve-height
normalizations and each named analytic/classification leaf. An assembly must
retain those leaves and the original six planets until their inputs arrive.
