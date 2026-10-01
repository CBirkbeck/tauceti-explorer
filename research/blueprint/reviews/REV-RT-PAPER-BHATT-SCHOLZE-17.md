# REV-RT-PAPER-BHATT-SCHOLZE-17

Independent verification of the red team RT-PAPER-BHATT-SCHOLZE-17 (Codex, session `codex-rtOQ9t`, PR #5445) on the
extraction PAPER-BHATT-SCHOLZE-17 (Bhatt–Scholze, *Projectivity of the Witt vector affine Grassmannian*, Invent. Math. 209
(2017)), for issue #4175.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`codex-c83e7a` and `cc-442dc5`, PRs #1929 and #2124);
- its review REV-PAPER-BHATT-SCHOLZE-17 (`cc-2aeb03`, PR #2478);
- the red team.

Disclosure: this session's FIX-RT-AREA-ktheory-1 (PR #5221) edited the GeneralAlgebraicKTheory packets for K.1 and K.6.
Finding /3 cites only the atlas text of K.3 and K.4.

**Result: all three findings confirmed.**
- /1 is high.
- /2 and /3 are medium.

None touches the projectivity theorem.

## What I read

- **The paper.** arXiv 1507.06490v3 (<https://arxiv.org/pdf/1507.06490v3>), the version the extraction read; SHA-256
  prefix `b4d5a4e0…`, equal to the extraction's. I read Theorem 6.13 and its proof (pp. 25–26).
- **The pinned Mathlib** (082e2d3). I read:
  - `CategoryTheory/Monoidal/Functor.lean`;
  - `Monoidal/Braided/Basic.lean`;
  - `Monoidal/NaturalTransformation.lean`.
- **The atlas.** The stages GeneralAlgebraicKTheory K.3 and K.4, SchemeKTheoryOperations S.2 and S.3, and KTheoryLowDegrees
  Z.3, U.3 and U.6.
- **The extraction.** The six items involved and routes 9–12.

## The findings

- **/1 (high): the Raynaud–Gruson input.**
  - **What the item says.** A flat finitely presented scheme over a rank-one valuation ring has a structure sheaf that is
    locally free as a V-module. Spec V[1/t] refutes this.
  - **What the paper uses.** Only a proper, flat, reduced model X₀ over a henselian V, which is henselian because its
    fraction field has been made algebraically closed. It cites the pointed, local henselian Corollaire 3.3.13 of
    Raynaud–Gruson.
- **/2 (medium): symmetric monoidal functors.**
  - **The finding.** They are not missing. Mathlib has `Functor.Monoidal`, `Functor.Braided` (which extends `LaxBraided`
    and its braiding compatibility) and `NatTrans.IsMonoidal`.
- **/3 (medium): four general K-theory suppliers.** Additivity, support K-theory, K = G for regular schemes, and the
  localisation sequences are sent to the determinant stages Z.3, U.3 and U.6.
  - **The owners.** K.4 plans additivity; S.3 plans support K-theory and the localisation sequence; S.2 plans K, G and
    the Cartan map. The extraction's own routes 9 and 11 already name these stages.
