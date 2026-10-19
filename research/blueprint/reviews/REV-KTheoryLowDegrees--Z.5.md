# Independent review: KTheoryLowDegrees Z.5

Issue #10792 · Reviewer: Codex, session `codex-rmhqBP` · 2026-10-19.

**Verdict: accepted after corrections.** This is an independent review of Claude
`claude-oZNc2X`'s BP-KTheoryLowDegrees--Z.5 (#10819, PR #10939), together with the accepted Z.3
packet's inherited Z.5 targets. The operative scope is Z.5: the issue's Z.6 wording is older
boilerplate, and Z.6 has its own job (#10820). The maintained detail setting and WORKERS.md require
target granularity, so the proof steps are not split into extra lemma nodes.

The plan correctly imports the newer upstream carriers and retains the curve calculation. Its
degree theorem needed a dimension-zero correction, and its routing instructions needed two
dependency corrections. The revised pass is complete as a plan, with coverage still `planned`.
Applying the inherited-node map, updating consumers and library pins, and resolving the recorded
foundations ownership routes remain explicit follow-up work. This verdict does not certify those
future edits or claim formalisation.

## Counts and node verdicts

There are two new nodes, no new definitions or constructions, no nodes added by this review,
19 confirmed baseline entries, four supplier requests, and no new source-issue entries.

| Node | Verdict | Evidence |
| --- | --- | --- |
| `Z.5/regular-curve-ample-family` | Verified | The complement is finite and codimension one. The section 1 of the effective boundary divisor sheaf generates exactly on the chosen open. Finite affine covers therefore give an ample family, including on the doubled line. |
| `Z.5/point-class-degree-comparison` | Corrected | The Euler formula holds in dimension at most one. Point formulas index codimension-one points; the usual-index image formula requires dimension one. For `Spec K`, the image is `ℤ × {0}`. |

All 40 inherited Z.5 nodes have exactly one routing row: 12 imports, one removal, five narrowings,
13 reroutings and nine keeps. The resulting inventory is 27 retained targets plus the two new
ones. Imported planets retire; the remaining three are the Cartan isomorphism, the rank–determinant
equivalence and the Euler-characteristic/degree comparison. None is a test or bookkeeping item.

## Corrections made

1. Restricted the new degree theorem's point clause to closed codimension-one points and its
   usual-index clause to dimension one. For `X = Spec K`, the unique closed point has skyscraper
   `O_X` of rank one, `Pic(X) = 0`, and Euler characteristic `[K : k]`. The previous general image
   formula incorrectly predicted a nonzero second-coordinate subgroup. Packet, reader, proof,
   acceptance examples and Lean commentary now agree, with an elaborated empty-indexing example.
2. Applied the same codimension-one convention to the inherited generic-rank kernel and
   rank–determinant point formulas through explicit routing instructions. Qualified the reader's
   infinite-free and skyscraper non-examples by nonemptiness and codimension one respectively.
3. Made import substitution apply to every prerequisite, statement, API and test before row-specific
   changes. Imported API laws and tests become import checks; narrowed rows retain their extra
   operations and comparisons. Explanatory parentheses must not become identifier text.
4. Removed the doubled-line row's stale `SchemeKTheoryOperations:S.1/doubled-plane-counterexample`
   prerequisite and supplied the already-owned SchemeAndStackFoundations §5.7 Check. The new
   ample-family negative example now cites that owner too. A dry application leaves no higher
   K-theory prerequisite among the retained nodes.
5. Preserved the full affine-diagonal theorem, rather than describing only its doubled-line
   example; Stacks Lemma 33.38.2 (09N9) supplies the affine-open intersection argument. Corrected the
   unused ample-line-bundle removal rationale to use an ample sheaf and the resolution property
   directly (09NZ, 0F87), without identifying every such scheme as quasi-projective.
6. Corrected the extension-closedness attribution: Stacks 17.14.6 (0BCI) concerns direct summands.
   Locally splitting an extension instead lifts a finite local basis of the quotient, as in
   Weibel II.8, proof of Theorem 8.1 (PDF p. 153). The proof obligation remains with the existing
   upstream exact-category owner.
7. Registered the cited pinned irreducibility theorem as a nineteenth baseline entry and refined
   the hypotheses of the divisor-sheaf entries. Distinguished truncated Euler characteristic and
   `finrank` residue degree from the separate finiteness and vanishing results they need.
8. Corrected the latent-cycle claim. Removing the catenary citation alone does not remove every
   all-packets path to SF.0: the henselization import from PerfectoidSpaces P3 remains. The packet
   now gives both full witness paths, the exact offending nodes, and their merged upstream owners
   (SchemeAndStackFoundations §§0.12–0.13 and 0.16). Rechecking the future graph is mandatory;
   this review does not claim the two routes exhaust it.

## Sources, baselines and closure

I read the two nodes at all their locators and checked the retained proof routes against their
suppliers. Weibel's author-hosted 2013 combined draft has the recorded SHA-256; PDF pagination is
book pagination plus eight. Relevant readings were II.6, Theorem 6.3 and Application 6.4.2
(PDF pp. 125, 129); II.8, Theorems 8.1–8.2, Proposition 8.2.1 and Examples 8.2.2–8.2.4
(pp. 153–155); Exercises 8.2 and 8.5 (pp. 164–165); and V.3, Remark 3.4.2 (p. 395).
The packet retains the public URLs, exact Stacks tags and source-version information; no passages
are reproduced.

The ample-family argument uses Stacks 0FXR/0FXT and the pinned divisor dictionary; 01PW and 0GMM
give the resolution property on the noetherian, hence quasi-compact and quasi-separated, scheme.
The comparison with 0GML does not silently assume separatedness. Components of a noetherian regular
scheme are finitely many open and closed integral components; field components have the trivial
family. DVR stalks supply local principality and the required non-generation at boundary points.

For degree I checked Stacks 0AYR, 0DJ5 and 0AYY. The rank–determinant inverse expresses a virtual
class as `(n − 1)[O_X] + [L]`, so additive Euler characteristic gives the formula and additivity
of line-bundle degree. A codimension-one skyscraper has finite-dimensional global sections of
dimension `[κ(y) : k]` and no higher cohomology. Divisor classes exhaust the Picard group; only in
dimension one do these points exhaust all closed points used by the usual index.

The generic-rank proof needs only degree-zero localization, not a higher K-theory sequence. On an
arbitrary nonempty affine open the Dedekind/field computation and its point classes generate the
rank-zero subgroup; localization and dévissage add the finitely many complementary points. This
avoids the invalid one-point affine-complement assertion in the inherited source issue E19.

I read every baseline declaration and its hypotheses at Mathlib `082e2d37e8` and Tau Ceti
`f790474821`; each cited module also agrees byte for byte with the shared build source. No
baseline declaration was removed or replaced. The added
`irreducibleSpace_of_connected_of_isDomain_stalk` assumes local noetherianness, connectedness and
domain stalks; regularity supplies the latter, with reducedness handled separately. The pinned
divisor-sheaf operations require their integral/noetherian/DVR and dimension hypotheses. Neither
the truncated Euler sum nor residue `finrank` itself proves coherent-cohomology finiteness.

I checked the current upstream READMEs and Suggested files at TauCetiRoadmap `34dcf0e`, particularly
AlgebraicVectorBundles L0A–L0C, SchemeAndStackFoundations §§3.3, 3.4, 5.7 and JacobianChallenge A–B,
and the cited current-library modules at `a91d3aa`. These are imports, not implementations at the
pin. The four requests state the exact remaining interfaces. The reviewed library audit has no
newly duplicated target. The upstream notes honestly retain the determinant-extension and
exact-category proof obligations instead of inventing another carrier here.

## API, examples and supplied findings

Both new nodes are results, so neither needs a definition API. The inherited constructions retain
the following API/test inventories under substitution:

| Construction | API items | Tests |
| --- | ---: | ---: |
| K₀ pullback, narrowed to affine comparison | 6 | 4 |
| K₀ ring, narrowed to affine comparison | 5 | 4 |
| Rank, retaining the locally constant section | 8 | 4 |
| Locally constant Picard powers | 7 | 4 |
| Divisor point-class map | 8 | 4 |

The tests distinguish, among other failures, an injective generic-fibre pullback, product-ring
multiplication on `K₀(P¹)`, constant integer rank on disconnected schemes, unsigned negative
Picard powers, and the nonadditive map `D ↦ [O(D)]`. New result examples cover projective space,
Dedekind spectra, the doubled line versus plane, residue degree two, a pointless real conic,
elliptic curves and finite field extensions. These are meaningful boundary and normalization
checks, not only restatements of constructors.

RT-AREA-ktheory-1/31 is correctly handled: the doubled line has `K₀ = G₀ = ℤ²`; the doubled plane
has vector-bundle `K₀ = ℤ` and `G₀ = ℤ²`. The false GeneralAlgebraicKTheory test is routed to its
owner. The published misprint is already SchemeKTheoryOperations/E1. RT-AREA-ktheory-2/41 is also
correctly scoped: Z.5 never needs S.6, the routing removes its S.1–S.3 inputs, and Z.6 owns its
remaining spectrum comparisons. S.7 → Z.6 and the MotivicEtaleKTheory part are outside this pass.

`sourceIssues` is empty, so no new entry needs an entry-level verdict. I checked the cited inherited
E19 affine-complement problem, E27 sign problem (Stacks 42.23.4, proof), and the existing E1
doubled-line misprint; no duplicate erratum is introduced.

## Validation and remaining owner actions

- `check_blueprint.py` on the revised packet: zero errors and zero warnings with the pinned
  declaration index. The inherited Z.3 packet also passes.
- `lean-check` on the suggested file: exit zero at the pins, only five admitted-proof warnings.
  Both examples elaborate; no data definition is admitted and no auxiliary development is added.
- In-memory atlas assembly with this packet over the promoted packets succeeds, adding seven
  edges, removing none, preserving `skippedLinks`, and leaving an acyclic graph (5,055 vertices
  incident to edges). This overlay does not apply the future 40-row restructuring.
- Independent map checks confirm exact coverage of the 40 old IDs, 29 resulting targets, three
  planets, and no retired imported ID or higher K-theory prerequisite in the retained inventory.

The orchestrator should route application of the map and its codimension-one clarifications to
the KTheoryLowDegrees package/revision, consumer rewiring to Z.6 and EllipticKTheory, and both
stale SF.0 imports to the foundations owner. Recompute the combined graph after those edits.
No further mathematical clarification is needed to accept this planned pass.
