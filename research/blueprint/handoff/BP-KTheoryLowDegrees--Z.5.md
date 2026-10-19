# BP-KTheoryLowDegrees--Z.5 — handoff

Issue #10819. Worker: Claude (claude-oZNc2X). Date: 2026-10-19.

**Deliverables**

- `research/blueprint/packets/KTheoryLowDegrees--Z.5.json` (part `Z.5`, scope `KTheoryLowDegrees:Z.5`, status `complete`)
- `research/blueprint/readmes/KTheoryLowDegrees--Z.5.md`
- `research/blueprint/suggested/KTheoryLowDegrees--Z.5.lean`

## What this job found

The issue text lists stages Z.5 and Z.6. The queue entry and the issue header give Z.5 alone, and Z.6
has its own job (`BP-KTheoryLowDegrees--Z.6`, #10820), so the scope is Z.5 only.

Z.5 was already planned. `KTheoryLowDegrees--Z.3.json` (accepted 2026-10-07, promoted) has 40 Z.5
nodes and leaves two items open:

1. the group structure of `Pic(X)`, requested from JacobianChallenge layer A;
2. the atlas edge decisions (S.6 → Z.5 and the proposed vector-bundle sub-layer).

Since that review, three upstream changes have landed:

- TauCetiRoadmap `main` (`34dcf0e`) merged **AlgebraicVectorBundles**:
  - L0B: finite locally free sheaves, rank, the affine equivalence;
  - L0C: exterior powers, `determinantObj`.
- TauCetiRoadmap `main` merged **SchemeAndStackFoundations** (14 October):
  - §5.7: `Chow.K0`, `Chow.G0`, `Chow.K0.det`, `Chow.K0.toG0`, `K0.toG0_bijective`,
    `Chow.HasResolutionProperty`, the `G₀` localisation sequence and `f_!`;
  - §3.3: degrees of vector bundles on curves;
  - §3.4: `lineBundleClass_spec_equiv_pic`.
- **Tau Ceti `main`** (`a91d3aa`, not at the pin `f790474`) added:
  - `CommGroup (LineBundleClass X)`;
  - `SchemeWeilDivisor.classGroupAddEquivLineBundleClass`, which is Cl ≅ Pic on exactly the
    regular-curve package;
  - `Scheme.skyscraperResidueField` and the residue sequence `residueShortComplex_shortExact`;
  - `FiniteLocallyFreeSheaf` with its rank;
  - `SheafOfModules.exteriorPower`.

Much of the accepted Z.5 plan now duplicates Tau Ceti roadmaps, which PROTOCOL §15 forbids. This
job may not edit `KTheoryLowDegrees--Z.3.json`. So the packet does three things:

- **A routing map.** It is restructure entry "Rebase Z.5 on the merged upstream suppliers": one row
  per earlier Z.5 node, with a carrier substitution table. The rows break down as follows:
  - 12 imports: `vector-bundle`, `vector-bundle-extension-closed`, `vector-bundle-essentially-small`,
    `vector-bundle-k-zero`, `sheaf-exterior-power`, `exterior-power-vector-bundle`,
    `determinant-bundle`, `vector-bundle-determinant`, `line-bundle-divisorial`, `point-ideal-sheaf`,
    `point-skyscraper-exact-sequence`, `point-divisor-line-inverse`;
  - 1 removal: `curve-ample-line-bundle`, which has no consumer;
  - 5 narrowed to their comparisons with this roadmap's ring-level objects:
    `vector-bundle-affine-comparison`, `vector-bundle-k-zero-pullback`, `vector-bundle-k-zero-ring`,
    `vector-bundle-rank`, `picard-affine-comparison`;
  - 13 rerouted: the statement is kept and the prerequisites change;
  - 9 unchanged.

  Each row names its replacement, the prerequisites to add or drop, and the Z.6 and EllipticKTheory
  consumers to rewire.
- **Two new nodes.**
  - `Z.5/regular-curve-ample-family` (lemma). On a noetherian integral scheme of dimension ≤ 1 with
    DVR codimension-one stalks, the complement of a nonempty open is a finite set of closed
    codimension-one points. The boundary divisors `D_U` with the section `1` give an ample family
    (Stacks 0FXR), with no separatedness. This replaces the route through Stacks 0F8A and
    `SchemeKTheoryOperations:S.1/resolution-property` for the resolution property. It also gives the
    doubled line an explicit ample family, although that scheme has no ample line bundle.
  - `Z.5/point-class-degree-comparison` (theorem, planet "Euler characteristic and degree on K₀ of a
    curve"). This is the "exact degree comparison" of the campaign document's handoff contract for
    Z.5, which no node planned. On a proper regular curve over `k`:
    - `χ_k = rank·χ(O_X) + deg_k ∘ det` on `K₀`;
    - `χ_k(cl D) = deg_k O(D) = Σ n_y [κ(y) : k]`;
    - `(rank, deg ∘ det)` has image `ℤ ⊕ δℤ`, with `δ` the index.

    The checks are ℙ¹, a degree-two point of ℙ¹_ℚ, the pointless real conic, an elliptic curve and
    `Spec K`.
- **The bookkeeping for what was left open.** The JacobianChallenge A request and the Z.3 packet's
  gap on Picard duality and pullback are recorded as fulfilled by Tau Ceti `main` in
  `resolvedRequests`. Picard pullback multiplicativity is AlgebraicVectorBundles L0A's.

After the map is applied, Z.5 consists of 29 nodes: 27 from the Z.3 packet and 2 from this one. It
has three planets and depends on no SchemeKTheoryOperations or GeneralAlgebraicKTheory layer. The
degree-zero K/G comparison, the resolution property and the localisation sequence all come from
SchemeAndStackFoundations §5.7.

## Red-team findings

- **RT-AREA-ktheory-1/31.** `Z.5/doubled-line-example` already gives the doubled line correctly:
  K₀ = G₀ = ℤ², against the doubled plane's K₀VB = ℤ and G₀ = ℤ². This job adds the explicit ample
  family (the example of Stacks Remark 0FXT) and the fact that the doubled line has no ample line
  bundle (Stacks 01PY). The false test
  sits in `GeneralAlgebraicKTheory:K.3/resolution-theorem`. Replacing it by the doubled plane is
  routed in the interface entry; that packet is not a deliverable here. The misprint is already
  recorded as `SchemeKTheoryOperations/E1`.
- **RT-AREA-ktheory-2/41.** The restructure entry "Stage edges of Z.5" proposes removing S.6 → Z.5
  now and S.2 → Z.5 once the map is applied. No Z.5 node cites S.6, and after routing none cites
  S.1–S.3. Z.3 → Z.5 is already supplied by the Z.3 packet's prerequisites. S.7 → Z.6 is left to the
  Z.6 job.

The Z.3 packet's proposal to split Z.5 into vector-bundle and curve sub-layers is withdrawn, since
those objects are upstream now. SchemeKTheoryOperations S.1, S.2, S.6 and S.7 should cite
AlgebraicVectorBundles and SchemeAndStackFoundations §5.7 directly.

## Requests

These are open until the upstream declarations reach the pin.

- `SchemeAndStackFoundations:SF.5`, for §5.7. The atlas packet `SchemeAndStackFoundations--SF.5` does
  not list the K₀/G₀ items; the merged README does.
- `SchemeAndStackFoundations:SF.3`, for §§3.3–3.4.
- JacobianChallenge layer A, for the Pic group and Cl ≅ Pic, now in Tau Ceti `main`.
- JacobianChallenge layer B, for finite coherent cohomology on proper curves.

AlgebraicVectorBundles is not an atlas stage. It is recorded in the nodes' `upstreamImports`, as the
earlier SF.5 and DrinfeldModules packets do.

## Checks

- **check_blueprint.** `python3 scripts/check_blueprint.py` on the new packet gives 0 errors and
  0 warnings, both with `TAUCETI_BASELINE` set to the pinned index (all 18 baseline declarations
  found) and without it. `KTheoryLowDegrees--Z.3.json` still passes.
- **Dry atlas assembly.** I patched `build.load_promoted` to add this packet. The result has 7 added
  stage edges: SF.3 → Z.5, SF.5 → Z.5, JacobianChallenge B → Z.5, and planet edges into the new
  planet. No edges are removed and `skippedLinks` is unchanged.
- **Latent cycle.** In the all-packets graph, promoted or not, Z.5 already reaches
  SchemeAndStackFoundations SF.0 through E.2 → … → DeformationAndDerivedPatchingAlgebra R03.3 → SF.0.
  The last step is the promoted `SchemeAndStackFoundations:SF.0/excellent-ring` citing
  `DeformationAndDerivedPatchingAlgebra:R03.3/catenary`, an upward citation that
  `upstream/CaraianiNewton.md` already lists as a move-down. Merged SchemeAndStackFoundations owns the
  catenary package itself. Without that one citation, Z.5 reaches none of SF.0, SF.3 and SF.5. The
  restructure entry "Latent cycle through SchemeAndStackFoundations SF.0" routes the fix to the SF
  owner. The promoted graph has no cycle today.
- **Lean.** `lean-check research/blueprint/suggested/KTheoryLowDegrees--Z.5.lean` elaborates in the
  shared build at the pins (Tau Ceti f790474, Mathlib 082e2d3), with `sorry` as its only warning.
  - It states parts (a) and (b) of the ample family, the rerouted resolution property with
    SchemeAndStackFoundations' predicate written out, and the divisor-level index statement
    `range_relativeDegree`.
  - It proves one example from a pinned lemma.
  - The K₀-level statements use carriers that are not at the pins, so they appear only as comments
    and are README targets.
- **Cross-check.** A Sonnet subagent checked the following:
  - every Stacks tag number and statement against the tag pages;
  - every K-book locator against the PDF;
  - every Tau Ceti `main` name against the `main` tree, and its absence from the pinned index;
  - every SchemeAndStackFoundations and AlgebraicVectorBundles name against their README and
    Suggested files;
  - the 18 baseline declarations;
  - reader/Lean agreement;
  - the 40 routing rows.

  It found one misattribution, which is fixed. The invertible sheaves on the doubled line are in
  Stacks Remark 0FXT, not Example 01JD, which only constructs the scheme. It also found smaller
  issues, all fixed:
  - the 0FDS sign is in the proof of Lemma 42.23.4;
  - the Proposition II.8.2.1 match now carries its separatedness hypothesis;
  - the Stacks source lists now hold exactly the tags cited;
  - Remark V.3.4.2 is in the K-book read sections;
  - the rerouted resolution property's Lean name is recorded in its routing row.

## What remains

1. **Apply the routing map** in the KTheoryLowDegrees package or a revision of
   `KTheoryLowDegrees--Z.3.json`, and rewire the consumers named in each row. The Z.6 job (#10820)
   should rewire its nodes at the same time:
   - `vector-bundle-k-zero-pi-zero`, `graded-det-pi-zero`, `cartan-map-comparison` (which takes over
     the π₀ part of `Z.5/regular-curve-cartan-iso`);
   - `pointless-conic-test`, `projective-line-regular-curve` (Cl ≅ Pic is now an import).
2. **EllipticKTheory E.2** should cite Z.5 node ids rather than the stage. It should take χ from
   SchemeAndStackFoundations §5.7's `kPushforward` and the K₀ degree formula from
   `Z.5/point-class-degree-comparison`, and drop its separatedness hypothesis.
3. **SchemeAndStackFoundations SF.0/excellent-ring** should cite the merged roadmap's own catenary
   package (latent cycle above).
4. **Formalisation** waits until the Tau Ceti pin moves past `a91d3aa` and the AlgebraicVectorBundles
   and SchemeAndStackFoundations §5.7 declarations exist.

## Sources

- **Read:**
  - Weibel, K-book (author draft, 29 August 2013): II.6.3, II.6.4.2, II.8.1–8.2.4, Ex. II.8.2 and II.8.5.
  - Stacks project tags, online on 19 October 2026: 01PW, 01PY, 0FXR, 0FXT, 0AXT, 0CC4, 0GML, 0AYR,
    0DJ5, 0AYY, 09NZ, 0F87, 0GMM, 0F8A, 01JD, 0BCI, 01CW, 0B38, 0FDS, 0AUW.
  - TauCetiRoadmap `main` 34dcf0e: SchemeAndStackFoundations, AlgebraicVectorBundles and
    JacobianChallenge READMEs and Suggested files.
  - Tau Ceti `main` a91d3aa: the files listed in the packet.
- **Missing:** none needed. Hartshorne is not used.
- **Source issues:** no new mistake found. The earlier packet's E19 (Weibel's affine complement) is
  what the rerouted `generic-rank-kernel` avoids.

Scratch (deleted at the end of the run) held the generator scripts; the packet, reader and Lean file
are self-contained.
