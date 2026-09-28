# BP-AnabelianGeometryAndNonabelianChabauty — first checkpoint: nonabelian continuous cohomology (NC.3)

Agent: Claude Code, session cc-fb70e5, 2026-09-28. Refs #1020. The claim is comment 5873767196, confirmed by the bot. No packet existed before this checkpoint.

## What this checkpoint supplies

The checkpoint adds 8 NC.3 nodes that close the dependency chain from the pinned libraries, with 32 baseline declarations:

- continuous 1-cocycles and invariants with nonabelian coefficients;
- H¹(G, U) as the orbit set of twisted conjugation, a pointed set;
- functoriality in the coefficients and restriction along group homomorphisms;
- the comparison with Tau Ceti's explicit abelian continuous cohomology (`TauCeti.ContCohomology`);
- the exact sequences of pointed sets, both for a closed subgroup that need not be normal (with no section needed) and for a normal one;
- central extensions: the action of H¹ of the central subgroup, whose orbits are the fibres; the connecting map to Tau Ceti's H², given a continuous section; and freeness under vanishing twisted invariants;
- twisting by a cocycle;
- the classification of topological (G, U)-torsors by H¹.

There are 4 planets. NC.3's coverage is partial, and NC.0–NC.2 and NC.4–NC.6 are not read.

## Sources

- **Kim 2005, §1.** arXiv:math/0409456v1 (the published version is Invent. Math. 161, 2005), sha256 00efa6e9…ba941. Read in full.
- **Kim 2009.** arXiv:math/0510441v4 (the published version is Publ. RIMS 45, 2009), sha256 7b404331…d0f19. The introduction and the §3 passages on local conditions were read.
- **Poonen, *Rational points on varieties*.** The sections read are §1.3.5, Exercise 1.9, §4.5, §5.11 and §5.12.4.

Serre's *Galois Cohomology* is not freely available, so its inflation–restriction sequence is left as remaining work. No mistakes in the sources were found.

## Validation

- `check_blueprint --index` against the pinned index gives 0 errors and 0 warnings.
- The intake file check is clean.
- Every node's declaration name appears in the suggested file.
- **The suggested file was not compiled.** The shared machine has no pinned build. It imports Tau Ceti's `ContCohomology/LowDegree`.

Some statements are recorded as comments rather than signatures, because they need instances that Mathlib lacks at the pin: the central connecting map and its freeness need a `DistribMulAction` on `Additive A`, and the S₃ counting tests need a `MulDistribMulAction` for the trivial action.

## Resume

1. **NC.3.** Representability (Kim 2005, Propositions 2–3), which needs the point topologies of Kim §1, Lemmas 1–5, and the splittings of unipotent groups (both recorded as gaps). Then local conditions (unramified and crystalline, the latter via the subgroup exact sequence), Selmer varieties, dimension counts, and the depth-one comparison with RP.1's Kummer and Selmer groups.
2. **NC.0.** Path torsors and sections, importing InverseGaloisAndArithmeticFundamentalGroups IG.0 and IG.1.
3. **NC.2.** Unipotent fundamental groups, importing the Tannakian torsors of MotivesAndAlgebraicCycles MC.6.
4. **NC.4 onwards** can then follow.
