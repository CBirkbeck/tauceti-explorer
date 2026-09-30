# REV-RT-RS-16 — verification of the Iwasawa restructuring red team

**Verdict: accepted as a completed red-team report with no findings.**
There are zero findings to confirm or reject and no confirmed finding to route
to a fix job. The empty review array matches the actual input; it is not a
blanket certification of the mathematical programme.

Verifier: Codex — `codex-rtOQ9t`, 30 September 2026. Refs #4403.
This session did none of RS-16 (`codex-c83e7a`), REV-RS-16 (`cc-442dc5`)
or RT-RS-16 (`codex-a71f92`).

Inspected checkout: `2579b36edbafd04fd192a67264e5314da02188c8`.
The restructuring result/report/review, four member READMEs and LAD decomposition
are unchanged from the red team's stated audit commit
`6b7b1d8e23032baa518ff5d4fe4ddfdba75959e8`.

## Independent checks

Read the complete red-team result and report, the prior restructuring review,
all 17 narrowed-layer records and the member roadmap contracts. Checked the
red team's preservation ledger against those contracts, with particular attention
to the action relocation, bounded/unbounded transforms, Coleman normalization,
local-versus-global unit quotients and the finite dyadic correction. Also read
the corresponding ownership and source-gap passages of the restructuring report.

Independently reran the restructuring application and graph checks:

| Check | Result |
| --- | --- |
| Exact native member stage coverage | 38 stages; 17 narrow, 21 keep |
| Ownership and links | 23 owner records; 136 unique links |
| Family overlap decisions | All 16 unordered pairs have a shared owner decision |
| Isolated application | 3,508 → 3,616 edges; 108 additions; no skipped links or hidden stage |
| Preservation | Every original stage ID, description and edge survives |
| Outside consumers | All 53 edges, serving 43 stages in 20 roadmaps, survive |
| Tau Ceti invariance | Title, owner, description and restructuring fields unchanged |
| Current conservative graph | 2,840 stages and 8,252 edges; no reverse path for any proposed edge |

The conservative graph unions the assembled atlas, its `requires`, and accepted
research links/restructurings without relying on the renderer to remove cycle
edges. Its edge count is larger than the red team's historical 7,460-edge graph
because it uses the current accepted union. This is a fresh cross-check, not a
claim to have recreated that older union exactly. It does not certify unrelated
atlas components acyclic.

The only absent concrete supplier-to-layer path is LAD L4 → PM L0a.
The only absent supplier-to-original-consumer edge is LAD L4 → LAD L3,
forwarded from PM L0a. Both are the prior review's explicit relocation exception:
PM L0a retains the scalar character; LAD L4 receives its coefficient-family
action. The three action consumers O0, PadicFamilies L2a and PG.7 all receive
L4 directly. LAD L3 already points to L4, so adding the nominal forwarding edge
would create a cycle. RT-RS-16 correctly describes this as an existing documented
exception rather than concealing it or reporting it as a new omission.

## Mathematical and library boundary checks

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, independently read
[Measure/AmiceTransform.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean),
including the surrounding assumptions of `amiceTransform`,
`injective_amiceTransform`, `invTransform` and `amiceTransformEquiv`.
The transform has general topological coefficients, injectivity has stronger
normed/ultrametric/completeness assumptions, and the displayed inverse and
bundled linear equivalence use Z_p coefficients. This supports the red team's
claim that general bounded coefficient/topology comparisons and the unbounded
transform remain separate work. It does not establish an exhaustive absence
claim about either library.

The report's elementary rejection examples also hold: in Z_p[[T]], p^n
converges in the (p,T)-adic topology but never enters (T); for p=3 the first
cyclotomic relation is 3T+3T²+T³. The finite module Z_p[[T]]/(p,T) vanishes
at height-one localizations but has Fitting ideal (p,T). Reduction of
[Z_p —p→ Z_p] modulo p has a zero differential and two nonzero cohomology
groups. A nonconstant locally constant function on Z_p has derivative zero.
These examples agree with the retained contracts; they are not findings against
RS-16.

Confirmed that LAD's decomposition is still explicitly partial, with 13 nodes,
19 links, five coverage rows and four gaps. The restructuring and red-team report
preserve its Fredholm, open-mapping and spectral-mapping obligations. The upstream
topology/compactness correction gate and the L0a relocation exception likewise
remain explicit.

No finding cites a source theorem for adjudication, so this verification did not
repeat the red team's complete selected-paper or declaration reads. In
particular it does not newly certify the Coleman, Kurihara, Colmez, Washington,
DKSW or Burns–Flach proof chains. The above direct file, mathematical and library
checks corroborate the submitted report's limited conclusion.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-16.result.json`
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-16.result.json`
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-16.review.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-RS-16.review.json research/blueprint/reviews/REV-RT-RS-16.md`
- Independent in-memory coverage, preservation, forwarding and graph assertions;
  `git diff --check`.

Only the two authorized verification files are changed. No Lean artifact is
required or produced; no Lean compilation, cache download or library build ran.
