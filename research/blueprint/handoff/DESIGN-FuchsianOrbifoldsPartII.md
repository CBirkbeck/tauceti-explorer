# DESIGN-FuchsianOrbifoldsPartII — complete planning pass

Issue #3414. Agent: Codex (GPT-6), session `codex-dCzvVM`. This is one job; no second claim was taken. The bot confirmed claim comment 6243991919 on 2026-10-18. All five deliverables belong to this issue.

The complete target-level packet has 30 nodes: seven definitions, six constructions, sixteen theorems and one worked application; 61 API items, 39 discriminating tests and 29 planets. N.0, N.1, N.2, N.3, N.4 and N.5 are all **planned**, with no remaining target inventory or recorded mathematical gap. They are not closed or implemented. Every implementation status is unchecked. All 27 DIT source-route items are mapped in `extractionCoverage`.

## Scope and ownership

The original issue combines two paper routes. `HyperbolicCurveVolumesAndGonality` already owns the Bakker–Tsimerman volume/gonality direction through design #1697 and review #1726. This job does not duplicate its 76-node plan. The packet records the rescope proposal preserving that owner. The new roadmap owns Nielsen cores, their arithmetic quadratic-class specializations, conformal recovery, multiplicity-preserving measures and truncated Stokes.

The parent FuchsianOrbifolds owns actions, ordinary quotient and cone charts, polygons, cusps, cofinite signatures and the level-one area. GN.3 owns the minus cycles, narrow-class dictionary and Pell units; three bottom GN.4 nodes supply the oriented geodesic, its length and form-reversal. **Do not import the whole GN.4 distribution endpoint here**: it consumes the N.4 measures. N.2 records these node imports separately to avoid a false circular stage dependency. No target was moved out of a higher-tier roadmap.

The current upstream checkout was inspected at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, with Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current DifferentialGeometry Layer 5.3/5.5 owns ordinary and corners Stokes; it is an `upstreamRequests` import because that roadmap postdates the atlas snapshot. ConformalMapping L2/L4, UniversalCovers Stage 2 and AlgebraicTopology Stages 1/7 are also suppliers. Nothing in those roadmaps or the library was edited.

## Proof repairs and mathematical checks

Four source issues are recorded in our own words against the final Annals PDF, without self-review verdicts: the full-boundary/supporting-half-plane convention (extraction E17); the finite-arc crossing gap (E19); selected lift distances versus quotient invariants (E20); and the p.961 Laplacian exponent misprint (E1).

The finite-arc repair proves descending endpoint membership in the disjoint unit discs, including a one-digit period whose last crossing is its endpoint. The conformal repair doubles the bordered orbifold, lifts using preserved cone-meridian orders, normalizes the unique cusp, proves that maximal elliptic height is one, and recovers the cyclic digits from the height-one gaps. It never treats chosen lift distances as quotient distances.

Complementarity uses proper local isometries and finite local sheet counts; opposite parametrized boundary currents cancel all density jumps. Comparing masses determines the integer covering multiplicity. The Stokes proof fixes orientation and the factor λ/2, separates improper height limits from L¹ integrals, and proves the harmonic λ=0 branch without division. The spectral specialization handles the completed Eisenstein value at s=1/2 by cancellation of its constant-term poles.

The explicit examples cover D=12 and D=28, the all-2 parabolic rejection, one-cone lift-distance failure, half-open modular boundary ties and a local top-edge sign check. Integer matrix multiplication independently checked all four example words and their traces 4,4,16,16; the D=28 transformed endpoint was also checked numerically. These computations are supporting checks, not formal proofs.

## Import contracts and review work

There are 13 atlas-stage requests, with exact statements and consuming nodes in the packet:

- Parent F.1, F.2, F.3, F.4, F.6: use their quotient/chart, polygon, full cusp-stabilizer, capped-genus and modular-area interfaces. F.0’s already-built proper action and finite cyclic stabilizers are direct baseline imports, not requests to implement them again.
- ConformalMapping L2/L4: automorphisms of ℍ, analytic reflection and removable singularities.
- UniversalCovers Stage 2: connected-cover lifting criterion and deck equivariance.
- AlgebraicTopology Stages 1/7: van Kampen presentations for finite-type exhaustion, finite-CW Euler characteristic and circle gluing.
- GN.3: export the exact norm-form sign identities (DIT (2.3)–(2.5), p.952), particularly −Q corresponding to JA⁻¹. Its existing reduced-cycle/Pell nodes use that dictionary but do not state the needed sign identities. This combines with the bottom GN.4 form-reversal node.
- AS.2/AS.4: differentiated critical-line Eisenstein cusp estimates, including t=0, and the smooth zero-constant-term cusp eigenfunction export. Existing E/E* definitions, completion, Fourier series and continuation are imported through their exact nodes.

The current-upstream Stokes request is additional to these 13. MultiquadraticPartII’s precise J-square/sum-of-two-squares node is imported, and narrow class-group finiteness and principal-class squaring are already pinned baseline declarations. Do not create replacement genus objects or another arithmetic sign theory.

The next action is the independent design review. In particular inspect geometric finiteness with torsion, the reflected-polygon/covering lift, finite-arc endpoint induction, multiplicity cancellation and the λ=0 Stokes argument. Fulfill the recorded supplier interfaces when implementing those roadmaps. No part of this handoff requires a new planning pass over unvisited stages.

## Sources and validation

Read the version-of-record Duke–Imamoḡlu–Tóth, *Geometric invariants for real quadratic fields*, Annals 184 (2016), 949–990: pp.949–960 and pp.961–962, plus Lemmas 1–2 and (7.9)–(7.11) on p.972. Rendered pp.958, 959 and 972 were checked against the text. Read Lu, *Geodesic cover of Fuchsian groups*, §3.1 pp.194–195 and the cusp/funnel discussions pp.196–198, retaining the torsion-free restrictions where they occur; our general cone adapters use the parent charts. Read Series, *A Crash Course on Kleinian Groups*, the convex-core discussion pp.32–33. URLs, edition information and PDF hashes are in the packet. The journal and author pages and correction searches yielded no published erratum. No uncleared or private book copy was used; no required source is missing.

The reviewed parent library audit and actual baseline declarations were read before citation. Validation completed on 2026-10-18:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FuchsianOrbifoldsPartII.json`: zero errors and zero warnings against the installed pinned declaration index; 20 baseline declarations.
- `lean-check research/blueprint/suggested/FuchsianOrbifoldsPartII.lean`: **elaborates**, with only the intended placeholder-proof warnings, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Memory was checked before compiling. No Lean process remains running.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/FuchsianOrbifoldsPartII.lean`: passes. The file is 258 lines, has only light real-bodied definitions, and develops no replacement carriers. The full heavy targets, API and tests are in the reader under the newer WORKERS.md shape rule.

The job scratch files contain no unique continuation information; this handoff, the packet and the reader retain everything the reviewer or next worker needs. Scratch is removed after opening the pull request.
