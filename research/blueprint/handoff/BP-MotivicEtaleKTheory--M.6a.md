# Handoff — BP-MotivicEtaleKTheory--M.6a

Issue #10822. Agent: Codex, session codex-IvZaYn. This is a complete planning
submission for independent review, not a checkpoint and not an implementation.
The bot confirmed the claim on 19 October 2026 at 14:09:54 UTC.

## Scope and deliverables

The current issue header and queue assign **MotivicEtaleKTheory:M.6a only**.
The older embedded brief also lists M.6b, M.7 and M.8; their separate follow-up
jobs supersede that wider scope. This submission changes exactly the assigned
packet, reader, suggested file and this handoff. It claims no second job.

The packet contains **21 nodes**: 2 definitions, 5 constructions, 11 theorems
and 3 comparisons. Its 7 definition/construction nodes have **59 API items**
and **26 named unit tests**, with at least three tests each. There are **5
planets**, **4 checked baseline declarations**, **3 supplier requests**, and
**0 internal gaps**. Every M.6a target is planned. Coverage is **planned**, not
closed; packet status is **complete** and implementation statuses remain
**unchecked**.

The reader specifies the support categories through the existing perfect-complex
owner, the actual support homotopy colimits and realised tower, moving with
constraints, localisation/descent, coherent pullbacks, the semilocal coefficient
calculation, purity and idempotence, the pointwise rank map and its Tor-compatible
simplex maps, and the layer equivalence. The final comparisons identify the whole
Levine coherent tower and Friedlander–Suslin support tower, then the global cycle
layer. The latter uses the entire Ω-prespectrum and the shift [2p]. It does not
claim a filtered equivalence with an unspecified auxiliary quasi-finite model.

## Closure contracts and next work

The independent reviewer should inspect these exact requests before treating
the stage as closed:

1. **StableHomotopyKTheory:H.5:spectra:** small filtered support homotopy
   colimits, simplicial realisation, finite stable exactness, Fubini, the
   Eilenberg–MacLane comparison, coherent tower/presheaf replacements, finite
   homotopy-fixed-point averaging after inversion, face-cube fibres, and
   compatibility with the Ω-prespectrum presentations. Its existing sequential
   telescope does not supply all of this.
2. **SchemeKTheoryOperations:S.5:** KH closed descent and the low-degree
   K→KH comparison for the vertex-semilocal normal-crossing boundary, yielding
   the exact sequence used in the multirelative K₀ calculation. Ordinary K
   closed descent on a singular union is not assumed.
3. **SchemeAndStackFoundations:SF.5:** extend its algebraically closed-base Tor
   intersection statement to the perfect-field regular ambient setting, with
   Serre vanishing and compatibility with successive faces and flat
   degeneracies.

The supplier nodes and their exact statements were read, not inferred from
their names. The requests and their consuming node IDs are in both packet and
reader. No foreign packet was edited. There is no forward dependency on M.6b.
At assembly, M.6b imports the adjacent stable triangles and the homological
normalisation πₘLᵖK=CHᵖ(X,m)=H²ᵖ⁻ᵐ(X,ℤ(p)). It must supply its own exact
couple, connectivity/convergence and operations. The degreewise bound p>dim X+n
must not become an eventual vanishing assertion for the realised tower.

Incoming requests addressed to the parent M.6 concern rational characters,
Adams weights, multiplicativity, low-degree exact sequences, or finite/divisible
coefficient convergence. They come from Polylogarithms, K3BlochGroups,
EllipticKTheory and KTheoryFiniteLocalFields. M.6b and M.8 must route those
requests at assembly. M.6a supplies their underlying tower and layer calculation,
not their stronger outputs. No incoming request names M.6a itself.

## Ownership and existing work

The accepted RS-08 proposal/review, relevant links, audit AUDIT-30, prior M.1
packet and M.5d packet were read. RS-08 does not narrow M.6a. The existing M.4,
M.5a, MC.4, S.1–S.5, K.3 and H.5 nodes are imported by exact IDs. The S.4
ordinary coniveau filtration is recovered in simplex degree zero; the simplex
realisation is the additional M.6a construction. Relative cycles, higher Chow
groups, ordinary spectra, K-models and normal deformations are not rebuilt here.

The current read-only TauCetiRoadmap checkout was checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including AlgebraicVectorBundles
and AlgebraicTopology README/Suggested files. The current Tau Ceti library was
checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing K₀ and
vector-bundle material does not supply this higher spectrum tower. No current
roadmap target is replanned, and no upward-tier notion was moved. Searches of
open Mathlib PRs for the exact phrases “algebraic K-theory” and “homotopy
coniveau” returned no matches; a Zulip web search located no relevant design
discussion. These searches supplement the pinned-source checks, rather than
prove absence of library material.

## Attached findings and papers outside this stage

- **RT-AREA-ktheory-1/2:** M.5d/M.7 must own the Beilinson–Lichtenbaum form and
  the number-ring reduction. M.6b's finite-coefficient comparison must import
  that theorem. M.6a constructs an integral cycle layer without an étale
  identification and does not infer Beilinson–Lichtenbaum from a Milnor-K
  statement.
- **RT-AREA-ktheory-1/3:** real KO/BO, real Bott periodicity and Suslin's real
  comparison are inputs to M.7/ArithmeticKTheory:N.5, not the integral support
  tower. No claim about real-place differentials is made here.
- **RT-AREA-ktheory-2/18:** the common Soulé Chern-class and product construction
  must be placed once in the M.7-dependent portion of M.8 and imported by
  HB.1/HB.2/D.2. This stage introduces no Chern-class construction.
- The attached Calmès et al. duality-action lemma and Feng–Galatius–Venkatesh
  Thomason input belong to M.7. The Li–Liu/Gillet supported Chern-class input
  belongs to M.8. Their proofs are not dependencies of the M.6a targets and
  have not been extracted again in this submission.

## Sources and corrections

Four public source texts were read: Levine's homotopy-coniveau and moving
manuscripts (specified 2005 arXiv v1), Levine's global K-theory manuscript, and
the published 2002 Friedlander–Suslin article. URLs, exact versions, hashes,
access date, theorem numbers and page locators are in the packet and reader.
The source register lists the sections actually used; the targets are arranged
by mathematical dependency rather than as section summaries. All descriptions
are our own words. No book or restricted source was needed and no source text
or source file is committed.

Two source observations await independent confirmation, both scoped to the
specified homotopy-coniveau manuscript:

- **E-HCT-boundary-rank**, Theorem 6.4.1 proof, p. 36: in degree one the boundary
  ring is F×F, so its K₀ is ℤ². The required map from K₀ of the semilocal ring
  is injective by rank at any vertex, which suffices for the proof.
- **E-HCT-normal-frame**, Corollary 4.2.4 proof, p. 26: one nonzero vector
  supplies a line, not a frame of a rank-d bundle. This packet uses only purity
  with a specified normal trivialisation; the K-specific generic coefficient
  is independent of coordinates by regular-support dévissage and rank. It
  does not import the problematic general canonical-trivialisation step.

Neither observation asserts that the published theorem is false or claims a
collation with the version of record. The sourceIssues records include searches
for existing corrections and distinguish a missing proof step from a changed
conclusion.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.6a.json`:
  **0 errors, 0 warnings**, including baseline declaration-index resolution.
- The **93-line** compact suggested file was elaborated using `lean-check` at
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`: exit **0**, exactly **8 warnings**,
  all declaration-uses-`sorry` warnings. Memory was checked before compilation.
  No build, update, cache download or language server was started.
- The file has two real-bodied light definitions, four theorem statements and
  four examples on existing ideal/quotient/height carriers. The full heavy API
  and tests are in the reader, as the fixed compact shape in WORKERS.md
  requires. Elaboration does not establish the spectrum mathematics.
- `check_sorry_data.py` passed; intake accepted all four deliverable paths.
  Cross-artifact checks confirmed every target statement, API name, test and
  prerequisite appears in the reader, source hashes match the texts read, and
  the deliverables contain no local source paths or Lean code in the reader.
- Recursive exact-node dependency traversal reached 434 nodes, with no cycles
  and no return from a foreign prerequisite to a new M.6a node.

The next worker resumes from the committed deliverables and supplier contracts;
no scratch file or local source path is needed.
