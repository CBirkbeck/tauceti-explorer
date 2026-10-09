# BP-SchemeAndStackFoundations--SF.0 handoff

Issue: #6325. Agent: Codex (GPT-6). Session: `codex-02xqUZ`. Branch: `codex-02xqUZ-sf0`.

This submission completes the target-level SF.0 plan begun in the inherited checkpoint.
The packet has `status: complete`; SF.0 coverage is `planned`, not `closed`. Its ten
precise supplier contracts must be satisfied or narrowed before closing the layer.
Every implementation status remains `unchecked`. No mathematical implementation is claimed.

## Deliverables and validation

- Packet: 139 targets (26 definitions, 26 constructions, 75 theorems, 6 comparisons,
  3 lemmas, 3 applications), 461 API items, 283 tests and 6 planets.
  The checker counts 383 API items and 226 tests for definitions/constructions;
  the other 78 API items and 57 tests serve comparisons, theorems and applications.
- Baseline: 492 declarations read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
  and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the imported contracts
  are individually recorded. No new node duplicates a pinned declaration.
- Sources: 278 source/version records with URLs, read locators and fingerprints;
  18 source issues, E101–E118, described in our own words for independent review.
- Reader: each target's statement, hypotheses, construction/proof, uses, API, tests,
  prerequisites and exact source locators, followed by supplier and consumer contracts,
  base proof supplements, source-route coverage and the baseline audit.
- Suggested Lean: all mathematical groups now have prototypes. Every planned API and
  test name occurs either in a declaration/example or in a comment naming the prepared
  carrier omitted under PROTOCOL §13. Conditions are stated using real carriers when
  available; omitted conditions are identified, not encoded as dummy propositions.
- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.0.json`
  with the pinned declaration index: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/SchemeAndStackFoundations--SF.0.lean`:
  **compiled at the pinned build, 0 errors; only declaration-uses-sorry warnings**.
  The final file has no unused-variable, overlapping-instance or reducibility warnings.
  A separate exact-name audit found 446 elaborating API names and 15 names explicitly
  deferred in carrier-omission comments, with no accidental namespace mismatch.
- Only this issue's packet, reader, suggested file and handoff are changed.

## Mathematical changes

1. Retained the inherited relative Spec/Proj, henselian, excellence, perfection and
   finite-type targets; restored twelve genuine dependency edges and checked the
   other alleged cuts against the actual proof flow. The part remains acyclic.
2. Finished coherent/Hartogs targets: regular-local maximal-depth freeness, low-dimensional
   reflexive freeness, vector-bundle pushforward, surface extension, regular-sequence
   Hartogs, sections on affine opens, closure of ideals and maximal-CM extension.
   Added the vector-scheme and actual-stalk Tor-independence contracts.
3. Finished the rational affine intersection model, multiplicative and monoid-sheaf
   perfection, arithmetic universal-homeomorphism pushout, perfect flatness descent,
   Kollár coherence criterion, Ferrand pushouts, schematic density, finite locally
   free trace and refined DVR valuative criterion. The intersection has an injective
   generic-fibre embedding; trace uses actual pushforward comparisons; completed
   point closures retain all associated primes.
4. Added reduction, the spectrum of products of fields via ultrafilters, length-two
   algebras with the nonsplit field case, binary-form maps with the actual Proj charts,
   elementary universal homeomorphisms and the positive-index binomial divisibility
   bound. The uniform binomial bound excludes index zero.
5. Added absolute Cohen rings and Cohen structure. Coefficient maps and finite complete
   regular subrings induce the actual residue isomorphism. Imperfect residue fields
   are allowed; Witt vectors supply only the perfect-residue example. Cohen structure
   closes the complete-local excellence proof rather than being an upward import.
6. Every one of 374 routed items has an explicit disposition: 178 planned here,
   90 imported from their owners, 106 excluded from unaccepted routes. All 52
   consumer requests have a response with its exact SF.0 or other-owner contract.

## Apply at base-packet assembly

The base packet itself was not edited. Apply `baseProofSupplements` and `movesDown`
from this part when assembling SF.0:

- Replace `SF.0/parallel-equalization`'s competing-scalar coequalizer argument by
  `B⊗_R C` with its single C-action. An actual étale-section selector produces
  an idempotent whose image in C reduces to 1; localization equalizes the maps.
- In the simple-root residue-selector step, localize the lifted selector at the
  explicitly chosen element g. It need not be an idempotent. This gives both
  the root map and the specified residue quotient.
- Attach the section-comparison proofs from Stacks 15.10.3–15.10.4 (0ELZ, 0EM0)
  and 15.11.5–15.11.6 (09XH, 09XI). Do not confuse these tags with 09XF/09XG.
- Attach the full complete-local excellence chain: Cohen structure; detecting
  derivations and the unit-derivative hypersurface criterion; finite-domain J-0
  reduction for J-2; purely inseparable induction for formal fibres; G-ring ascent;
  the coefficient-subfield and denominator steps; and local-to-global transport.
  Stacks 15.49, 15.50 and 15.51 provide the exact locators. In characteristic zero
  the finite purely inseparable tests are trivial; an arbitrary transcendental
  extension is not asserted to satisfy Mathlib's algebraic separability predicate.
- Retain inherited image-ideal three-morphism/right-unit coherence and add this
  part's left unit. Longer towers follow by induction. Conductor identifications
  remain with the Néron Part II owner.

Foundational ownership moves:

- **Henselization of a pair (carrier, universal property and API)**: remove the import from `PerfectoidSpaces:P3/henselisation-of-pairs`; own it at `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/henselization-flat`, `SchemeAndStackFoundations:SF.0/henselization-recognition`. planned here; the perfectoid roadmap imports it.
- **Catenary rings**: remove the import from `DeformationAndDerivedPatchingAlgebra:R03.3/catenary`; own it at `SchemeAndStackFoundations:SF.0/catenary-ring`. planned here with universally catenary rings; R03.3 imports it.
- **Depth, Cohen–Macaulay modules and Serre's conditions**: remove the import from `DeformationAndDerivedPatchingAlgebra:R03.3 (module-level notions assigned there by the Česnavičius extraction)`; own it at `SchemeAndStackFoundations:SF.0/depth`, `SchemeAndStackFoundations:SF.0/cohen-macaulay`, `SchemeAndStackFoundations:SF.0/serre-condition-sn`. no lower-tier owner; planned here.
- **Maximal-depth freeness over arbitrary regular local rings and its dimension-two reflexive corollary**: remove the import from `DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local (also imported by Gille–Parimala item 134)`; own it at `SchemeAndStackFoundations:SF.0/free-maximal-depth-regular-local`, `SchemeAndStackFoundations:SF.0/reflexive-free-small-dimension`. The foundational SF.0 surface-extension theorem needs this input. Plan it here using induction on a regular parameter; the deformation roadmap imports this theorem. Auslander–Buchsbaum and projective dimension stay in their existing owner.
- **Absolute Cohen rings and the absolute Cohen structure theorem**: remove the import from `DeformationAndDerivedPatchingAlgebra:R03.1/strict-cohen-ring, strict-cohen-existence, cohen-truncated-smooth, cohen-compatible-tower, cohen-coefficient-map, cohen-series-presentation`; own it at `SchemeAndStackFoundations:SF.0/cohen-ring`, `SchemeAndStackFoundations:SF.0/cohen-structure`. Needed for complete Noetherian excellence at the foundational tier. Absolute carriers and compatible coefficient lifts move here; the relative theorem with prescribed p-basis representatives, deformation coefficient categories and specialized completion comparisons stay in R03.1.

The higher roadmaps must import these SF.0 targets. The deformation roadmap retains
relative coefficient constructions, Auslander–Buchsbaum and its specialized uses;
the perfectoid roadmap retains its specialized henselization uses. Base stages other
than SF.0 and unrelated reserved keys remain outside this job.

## Supplier contracts to carry forward

These are imports, not outstanding blueprint work in this part. The reader and packet
state the consumed target ids as well as the full contract:

1. `tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem`: Strict henselization of a local ring and of a scheme at a geometric point (separably closed residue field), its ind-etale presentation over the ordinary henselization planned here, and the strictly henselian clause of Clausen-Mathew item 111. This group cites it only as a contrast (the ordinary henselization keeps the residue field). strict henselisation and finite algebras over strictly henselian local rings (Stacks 04DR property (B)) Regular local rings and regular schemes, in the generality: (i) every local ring of a scheme smooth over a field is regular (Stacks 056S); (ii) a regular local ring is a normal domain, and a regular local ring of dimension one is a discrete valuation ring (Stacks 00PD); (iii) consequently a regular Noetherian scheme has integral connected components. Openness of the regular locus for schemes of finite type over Z (an excellent base), used to find a regular connected arithmetic base with given function field. Strict henselisation of a local ring, used for the characterisation: a local ring is geometrically unibranch iff its strict henselisation has a unique minimal prime (Stacks 06DM).
2. `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`: The equivalence between etale algebras over a field k and finite continuous Gal(k^sep/k)-sets, used to restate the finite etale equivalence over a henselian local ring in Galois-set form (Clausen-Mathew Construction 4.33).
3. `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`: effective fpqc descent for affine morphisms and descent of etaleness
4. `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`: On locally Noetherian schemes: coherent = finitely presented = finite-type quasi-coherent (Stacks 01XZ); kernels, cokernels, quasi-coherent submodules of coherent modules are coherent (01Y0, 01Y1); coherent modules on affine Noetherian schemes are tildes of finite modules.
5. `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`: Relative Proj of a finitely generated graded quasi-coherent algebra over an arbitrary base, with its affine charts over affine opens identified with Mathlib's Proj of the sections, and its base-change isomorphism. SF.0 builds the general (not necessarily finitely generated) relative Proj from the same charts and proves the two constructions canonically isomorphic on finitely generated algebras; it does not construct the finitely generated case a second time.
6. `SchemeAndStackFoundations:SF.4`: Chow modification for a finite-type morphism over a Noetherian affine scheme: a proper surjective birational X′→X and an immersion X′→P^n_S. Also the DVR dominating a local Noetherian domain with identical fraction field (Stacks 28.5.10), with the generic point identification needed by the refined criterion.
7. `SchemeAndStackFoundations:SF.3`: Picard classification for the projective line over a field: every invertible sheaf is O(d); global units are field units; a generating pair for O(d) forces d≥0. Reuse Stable reduction Layer 2 projective-space and twist carriers.
8. `SchemeAndStackFoundations:SF.5`: Complete-intersection parameter schemes: for positive multidegrees (d1,...,dr), r≤N, over Z[1/ell], the open parameter scheme in the product of form projective spaces, smooth with nonempty geometrically integral fibres over Z[1/ell], with its smooth proper universal complete-intersection family. The geometrically integral fibre assertion concerns the parameter scheme; a zero-dimensional complete intersection (r=N) need not be geometrically connected. Also parameter/rank/contact-incidence geometry for generic double-point interpolation over a perfect field, with the characteristic hypotheses needed for generic smoothness; quantitative saturation/projective-closure generator and exceptional-pencil degree bounds in terms of (N,r,delta), beyond qualitative finite generation.
9. `SchemeAndStackFoundations:SF.4`: Regular-local horizontal-parameter lemma used by Neron Part II: after the specified henselian/excellent-DVR localization, choose an actual nonzerodivisor parameter whose Cartier divisor has the prescribed finite schematic fibre length, with model-preservation and generic Proj hypersurface chart comparisons. Do not infer it from finite-component splitting. Include regular-immersion blow-up normal-bundle geometry with its actual maps and twist restriction.
10. `SchemeAndStackFoundations:SF.2`: QCoh/coherent finite-presentation limit descent and H0 continuity for qcqs models and directed coefficient modules. Proper flat finitely presented f with geometrically connected reduced fibres has O_S≃f_*O_X with coherent base-change comparisons, including boundary-ideal left exactness on prime-power thickenings. Relative Serre generation/vanishing on a single quasi-compact family gives one common degree with flat fibre ideals and arbitrary-base-change pluricanonical comparisons. Generic tilt hearts and coherent regular-curve Ext2 vanishing remain here, not SF.0.

## Confirmed finding and upstream notes

RT-AREA-algebraicgeometry/11 is handled without adding a Weil-restriction node.
Tau Ceti Modular curves 0F owns the affine finite-presentation representing scheme
and base change; RG2.0a extends it to the affine finite-type/finite-separable case;
AlgebraicModuli R09.3 extends those constructions to algebraic spaces and imports
both. Route Lawrence–Sawin item 82 to RG2.0a for its affine finite étale case.

Nagata compactification already belongs to the pinned Cohomological point counting,
Compact support Layer 1 roadmap. Retarget the consumer RD.3 request away from
AdicCoefficients L2; no second compactification is planned here. The packet also
records the relative-Spec and general-relative-Proj upstream notes.

## Signature limitations and review focus

The reader is definitive. Some concrete test rings/localizations and some imported
carriers are identified in comments rather than instantiated in the prototype:
strict henselization; the finite-subextension absolute-closure diagram; the
normalization/branch and Galois descent diagrams; over-Z_(p) rational monoid-sheaf
squares; arithmetic-pushout rational/affine comparisons; finite-affine trace
base-change/composition comparisons; and the imported projective-line point carrier.
The Ferrand flat-base-change square, structure map and finite-type assertion now
have actual arrows. The Cohen coefficient maps have actual residue comparisons.
An elaborated statement is a signature check, not a proof of its mathematical truth.

Independent review should check the restored proof edges, the four base supplements,
all five ownership moves, the new consumer contracts and source issues E117/E118.
E117 concerns the ultrafilter polarity in the exposition used for products of fields.
E118 concerns the zero-index term in the cited Witaszek preprint binomial argument;
the recorded positive-index correction gives the required bound. No published
correction was located for that preprint issue. Inherited E101–E116 remain observations
for independent source checking, rather than assertions that upstream has corrected them.

## Source access and next step

All cited passages needed for the new claims were read in public sources, including
the original Colliot-Thélène–Sansuc scan for its Hartogs statements. No uncleared book
or source copy is in the repository, and no source passage has been copied into it.
The source/version records are sufficient to reproduce the citation checks; scratch
files are disposable and no next worker needs them.

Next step: independent blueprint review, then assembly/package once accepted and the
bundle/lower-tier supplier contracts are met. Do not mark SF.0 closed merely because
this blueprint is complete. This run claims no second issue.
